import os
import subprocess
import re
import tarfile

import modules.file as file
import modules.log as log
import modules.runner as runner
import modules.net as net
import modules.pack as pack


def run_task_build():
    check_cmake()

    # structure
    root_dir = file.root_dir()
    target_name = "android"
    build_dir = os.path.join(root_dir, "build", target_name)
    conan_dir = os.path.join(root_dir, "conan")
    conan_file = os.path.join(conan_dir, "conanfile.py")
    pdfium_dir = os.path.join(root_dir, "build", "pdfium", "release")
    profile_dir = os.path.join(root_dir, "profile")
    profile_host = os.path.join(profile_dir, "{0}-profile".format(target_name))
    profile_build = os.path.join(profile_dir, "macos-profile")
    out_dir = os.path.join(build_dir, "out")
    lib_merge_list = []
    lib_merge_include_dir = ""

    # get pdfium
    get_pdfium()

    # build for all archs
    archs = {}

    archs["x86_64"] = {
        "name": "x86_64",
        "conan_arch": "x86_64",
        "api_level": "21",
        "conan_os": "Android",
        "pdfium_arch": "x86_64",
    }

    archs["x86"] = {
        "name": "x86",
        "conan_arch": "x86",
        "api_level": "16",
        "conan_os": "Android",
        "pdfium_arch": "x86",
    }

    archs["armv8"] = {
        "name": "arm64-v8a",
        "conan_arch": "armv8",
        "api_level": "21",
        "conan_os": "Android",
        "pdfium_arch": "arm64-v8a",
    }

    archs["armv7"] = {
        "name": "armeabi-v7a",
        "conan_arch": "armv7",
        "api_level": "16",
        "conan_os": "Android",
        "pdfium_arch": "armeabi-v7a",
    }

    for arch in archs:
        arch = archs[arch]

        log.info("Building for {0}...".format(arch["name"]))

        dist_dir = os.path.join(
            build_dir,
            arch["name"],
        )

        # dependency
        log.info("Building dependencies for {0}...".format(arch["name"]))

        conan_dir = os.path.join(
            dist_dir,
            "conan",
        )

        pdfium_arch_dir = os.path.join(
            pdfium_dir,
            arch["pdfium_arch"],
        )

        file.create_dir(conan_dir)

        run_args = [
            "conan",
            "create",
            conan_file,
            "-pr:b",
            profile_build,
            "-pr:h",
            profile_host,
            "-s:h",
            "arch={0}".format(arch["conan_arch"]),
            "-s:h",
            "build_type={0}".format("Release"),
            "-s:h",
            "os.api_level={0}".format(arch["api_level"]),
            "-o",
            "gdal:with_pdfium={0}".format(pdfium_arch_dir),
            "--build=missing",
            "--test-folder=None",
        ]
        runner.run(run_args, conan_dir)

        # get dependency info
        log.info("Searching compiled library for {0}...".format(arch["name"]))

        run_args = [
            "conan",
            "search",
            "gdal/3.3.1@",
            "-q",
            "(arch={0}) AND (os={1})".format(
                arch["conan_arch"],
                arch["conan_os"],
            ),
        ]

        result = subprocess.run(run_args, stdout=subprocess.PIPE)
        output = result.stdout.decode()

        package_data = re.findall("(Package_ID:\s)(\w*)", output)
        package_id = package_data[0][1]

        package_dir = os.path.join(
            file.home_dir(),
            ".conan",
            "data",
            "gdal",
            "3.3.1",
            "_",
            "_",
            "package",
            package_id,
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
            os.path.join(package_dir, "lib"),
            os.path.join(out_arch_dir, "lib"),
        )

        file.copy_dir(
            os.path.join(package_dir, "include"),
            os.path.join(out_arch_dir, "include"),
        )

        lib_merge_list.append(
            os.path.join(
                package_dir,
                "lib",
                "libgdal.a",
            )
        )

        lib_merge_include_dir = os.path.join(package_dir, "include")

    # copy headers
    out_final_dir = os.path.join(out_dir, "gdal-{0}".format(target_name))
    lib_final_dir = os.path.join(out_final_dir, "lib")
    include_final_dir = os.path.join(out_final_dir, "include")

    file.remove_dir(out_final_dir)
    file.create_dir(out_final_dir)

    file.create_dir(lib_final_dir)

    log.info("Copying headers...")
    file.copy_dir(lib_merge_include_dir, include_final_dir)

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


def get_pdfium():
    log.info("Downloading PDFium...")

    root_dir = file.root_dir()
    build_dir = os.path.join(root_dir, "build")
    pdfium_dir = os.path.join(build_dir, "pdfium")
    pdfium_file = os.path.join(build_dir, "android.tgz")
    pdfium_url = "https://github.com/paulo-coutinho/pdfium-lib/releases/download/4584-gdal/android.tgz"

    file.create_dir(build_dir)

    if file.file_exists(pdfium_file):
        log.info("PDFium file already downloaded")
    else:
        net.download(pdfium_url, pdfium_file)
        log.info("PDFium downloaded")

    log.info("Extracting PDFium...")

    if file.dir_exists(pdfium_dir):
        log.info("PDFium already extracted")
    else:
        pack.unpack(pdfium_file, pdfium_dir)
        log.info("PDFium extracted")
