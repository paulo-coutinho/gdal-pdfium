import os
import subprocess

import modules.file as file
import modules.log as log
import modules.runner as runner


def run_task_build():
    if check_cmake():
        # structure
        root_dir = file.root_dir()
        build_dir = os.path.join(root_dir, "build", "android")
        conan_dir = os.path.join(root_dir, "conan")
        conan_file = os.path.join(conan_dir, "conanfile.py")
        profile_dir = os.path.join(root_dir, "profile")
        profile_host = os.path.join(profile_dir, "android-profile")
        profile_build = os.path.join(profile_dir, "macos-profile")

        # build for all archs
        archs = {}

        archs["armv8"] = {
            "name": "armv8",
            "conan_arch": "armv8",
            "profile": "android-profile",
            "api_level": "21",
        }

        for arch in archs:
            arch = archs[arch]

            log.info("Building for {0}...".format(arch["name"]))

            # dependency
            dist_dir = os.path.join(
                build_dir,
                arch["name"],
            )

            file.create_dir(dist_dir)

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
                "--build=missing",
                "--update",
            ]
            runner.run(run_args, dist_dir)


def check_cmake():
    """Checks if invoking supplied CMake binary works."""
    try:
        subprocess.check_output(["cmake", "--version"])
        return True
    except OSError:
        log.error("CMake is not installed, check: https://www.cmake.org/")
        return False
