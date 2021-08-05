import os
import subprocess
import re
import tarfile

import modules.file as file
import modules.log as log
import modules.runner as runner
import modules.net as net
import modules.pack as pack
import modules.deps as deps
import modules.config as config


def run_task_build():
    check_cmake()

    # structure
    root_dir = file.root_dir()
    target_name = "ios"
    build_dir = os.path.join(root_dir, "build", target_name)
    conan_dir = os.path.join(root_dir, "conan")
    conan_gdal_file = os.path.join(conan_dir, "gdal", "conanfile.py")
    conan_project_file = os.path.join(conan_dir, "project", "conanfile.py")
    pdfium_dir = os.path.join(root_dir, "build", "pdfium", "release")
    profile_dir = os.path.join(root_dir, "profile")
    profile_host = os.path.join(profile_dir, "{0}-profile".format(target_name))
    profile_build = os.path.join(profile_dir, "macos-profile")
    out_dir = os.path.join(build_dir, "out")
    lib_merge_list = []
    lib_merge_include_dir = ""

    # get pdfium
    deps.get_pdfium("ios")

    # build for all archs
    archs = {}

    archs["armv7"] = {
        "name": "armv7",
        "conan_arch": "armv7",
        "os_version": "9.0",
        "pdfium_arch": "arm",
        "conan_os": "iOS",
        "bitcode": True,
    }

    archs["armv8"] = {
        "name": "armv8",
        "conan_arch": "armv8",
        "os_version": "9.0",
        "pdfium_arch": "arm64",
        "conan_os": "iOS",
        "bitcode": True,
    }

    archs["x86_64"] = {
        "name": "x86_64",
        "conan_arch": "x86_64",
        "os_version": "9.0",
        "pdfium_arch": "x64",
        "conan_os": "iOS",
        "bitcode": False,
    }

    for arch_item in archs:
        arch = archs[arch_item]

        log.info("Building for {0}...".format(arch["name"]))

        dist_dir = os.path.join(
            build_dir,
            arch["name"],
        )

        # conan - dependencies
        log.info("Building dependencies for {0}...".format(arch["name"]))

        conan_build_dir = os.path.join(
            dist_dir,
            "conan",
        )

        file.remove_dir(conan_build_dir)
        file.create_dir(conan_build_dir)

        pdfium_arch_dir = os.path.join(
            pdfium_dir,
            arch["pdfium_arch"],
        )

        run_args = [
            "conan",
            "create",
            conan_gdal_file,
            "-pr:b",
            profile_build,
            "-pr:h",
            profile_host,
            "-s:h",
            "arch={0}".format(arch["conan_arch"]),
            "-s:h",
            "build_type={0}".format("Release"),
            "-s:h",
            "os.version={0}".format(arch["os_version"]),
            "-o",
            "darwin-toolchain:enable_bitcode={0}".format(arch["bitcode"]),
            "-o",
            "darwin-toolchain:enable_arc={0}".format(True),
            "-o",
            "darwin-toolchain:enable_visibility={0}".format(True),
            "-o",
            "gdal:with_pdfium={0}".format(pdfium_arch_dir),
            "--build=missing",
            "--test-folder=None",
        ]
        runner.run(run_args, conan_build_dir)

        # conan - project
        log.info("Building project files for {0}...".format(arch["name"]))

        run_args = [
            "conan",
            "install",
            conan_project_file,
            "-pr:b",
            profile_build,
            "-pr:h",
            profile_host,
            "-s:h",
            "arch={0}".format(arch["conan_arch"]),
            "-s:h",
            "build_type={0}".format("Release"),
            "-s:h",
            "os.version={0}".format(arch["os_version"]),
            "-o",
            "darwin-toolchain:enable_bitcode={0}".format(arch["bitcode"]),
            "-o",
            "darwin-toolchain:enable_arc={0}".format(True),
            "-o",
            "darwin-toolchain:enable_visibility={0}".format(True),
            "-o",
            "project_config_arch={0}".format(arch["conan_arch"]),
            "-o",
            "project_config_target={0}".format(target_name),
            "-o",
            "project_config_pdfium={0}".format(pdfium_arch_dir),
            "--build=missing",
            "--update",
        ]
        runner.run(run_args, conan_build_dir)

        # build
        log.info("Building library for {0}...".format(arch["name"]))

        cmake_dir = os.path.join(
            root_dir,
            "cmake",
        )

        target_dir = os.path.join(
            dist_dir,
            "target",
        )

        file.remove_dir(target_dir)
        file.create_dir(target_dir)

        run_args = [
            "conan",
            "build",
            conan_project_file,
            "--source-folder",
            cmake_dir,
            "--build-folder",
            target_dir,
            "--install-folder",
            conan_build_dir,
        ]
        runner.run(run_args, target_dir)

        # get dependency info
        log.info("Searching compiled library for {0}...".format(arch["name"]))

        conan_gdal_dir = deps.get_conan_dep_dir(
            "gdal", "3.3.1", arch["conan_arch"], arch["conan_os"]
        )

        # copy data
        log.info("Copying library data for {0}...".format(arch["name"]))

        out_arch_dir = os.path.join(
            out_dir,
            arch["name"],
        )

        file.remove_dir(out_arch_dir)
        file.create_dir(out_arch_dir)

        file.copy_dir(
            os.path.join(target_dir, "lib"),
            os.path.join(out_arch_dir, "lib"),
        )

        # file.copy_dir(
        #     os.path.join(conan_gdal_dir, "include"),
        #     os.path.join(out_arch_dir, "include"),
        # )

        lib_merge_list.append(
            os.path.join(
                out_arch_dir,
                "lib",
                "gdalpdf.framework",
                "gdalpdf",
            )
        )

        lib_merge_lib_dir = os.path.join(out_arch_dir, "lib", "gdalpdf.framework")
        lib_merge_include_dir = os.path.join(conan_gdal_dir, "include")

    # merge libraries
    log.info("Merging libraries (xcframework)...")

    out_final_dir = os.path.join(out_dir, "gdal-{0}".format(target_name))
    lib_final_dir = os.path.join(out_final_dir, "lib", "gdalpdf.xcframework")
    include_final_dir = os.path.join(out_final_dir, "include")
    lib_final_path = os.path.join(lib_final_dir, "gdalpdf")

    file.remove_dir(out_final_dir)
    file.create_dir(out_final_dir)

    file.remove_dir(lib_final_dir)
    file.create_dir(lib_final_dir)

    file.copy_dir(lib_merge_lib_dir, lib_final_dir)

    run_args = ["lipo", "-create"]
    run_args += lib_merge_list
    run_args += ["-o", lib_final_path]
    runner.run(run_args, root_dir)

    # copy data
    # log.info("Copying headers...")
    # file.remove_dir(include_final_dir)
    # file.create_dir(include_final_dir)

    # file.copy_dir(lib_merge_include_dir, include_final_dir)

    # archive
    log.info("Archiving...")

    archive_path = os.path.join(out_dir, "gdal-{0}.tar.gz".format(target_name))
    tar = tarfile.open(archive_path, "w:gz")

    tar.add(
        name=out_final_dir,
        arcname=os.path.basename(out_final_dir),
        filter=lambda x: (None if "_" in x.name and not x.name.endswith(".h") else x),
    )

    tar.close()


def check_cmake():
    """Checks if invoking supplied CMake binary works."""
    try:
        subprocess.check_output(["cmake", "--version"])
        return True
    except OSError:
        log.error("CMake is not installed, check: https://www.cmake.org/")
        return False
