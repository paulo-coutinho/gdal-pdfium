import os
import subprocess

import modules.file as file
import modules.log as log
import modules.runner as runner


def run_task_build():
    check_cmake()

    # structure
    root_dir = file.root_dir()
    target_name = "android"
    build_dir = os.path.join(root_dir, "build", target_name)
    conan_dir = os.path.join(root_dir, "conan")
    conan_file = os.path.join(conan_dir, "conanfile.py")
    profile_dir = os.path.join(root_dir, "profile")
    profile_host = os.path.join(profile_dir, "{0}-profile".format(target_name))
    profile_build = os.path.join(profile_dir, "macos-profile")

    # build for all archs
    archs = {}

    archs["armv8"] = {
        "name": "armv8",
        "conan_arch": "armv8",
        "api_level": "21",
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

        file.create_dir(conan_dir)

        run_args = [
            "conan",
            "install",
            conan_file,
            "-pr:b",
            profile_build,
            "-pr:h",
            profile_host,
            "-s:h",
            "arch={0}".format(arch["conan_arch"]),
            "-s:h",
            "os.api_level={0}".format(arch["api_level"]),
            "-s:h",
            "build_type={0}".format("Release"),
            "-o",
            "proj:with_curl={0}".format(False),
            "-o",
            "proj:build_executables={0}".format(False),
            "--build=missing",
            "--update",
        ]
        runner.run(run_args, conan_dir)

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
            "cmake",
            "-S",
            cmake_dir,
            "-B",
            ".",
            "-DCMAKE_BUILD_TYPE={0}".format("Release"),
            "-DTARGET_NAME={0}".format(target_name),
            "-DTARGET_ARCH={0}".format(arch["name"]),
            "-G",
            "Ninja",
        ]
        runner.run(run_args, target_dir)

        run_args = [
            "cmake",
            "--build",
            ".",
            "--target",
            "gdal",
            "--config",
            "Release",
            "-v",
        ]
        runner.run(run_args, target_dir)


def check_cmake():
    """Checks if invoking supplied CMake binary works."""
    try:
        subprocess.check_output(["cmake", "--version"])
        return True
    except OSError:
        log.error("CMake is not installed, check: https://www.cmake.org/")
        return False
