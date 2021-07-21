import os
import subprocess

import modules.file as file
import modules.log as log
import modules.runner as runner


def run_task_clean():
    root_dir = file.root_dir()
    build_dir = os.path.join(root_dir, "build")

    file.remove_dir(build_dir)


def run_task_format():
    root_dir = file.root_dir()

    # format c++ files
    has_tool = check_cpp_formatter()

    if has_tool:
        path_list = [
            # {
            #     "path": os.path.join(root_dir),
            #     "patterns": ["*.cpp", "*.hpp", "*.h", "*.cc", "*.m", "*.mm"],
            # },
        ]

        if path_list:
            log.info("Formating C++ files...")

            for path_list_item in path_list:
                patterns = path_list_item["patterns"]

                for pattern_item in patterns:
                    files = file.find_files(path_list_item["path"], pattern_item)

                    for file_item in files:
                        log.info(
                            "Formatting file: {0}...".format(os.path.relpath(file_item))
                        )

                        run_args = ["clang-format", "-style", "file", "-i", file_item]

                        runner.run(run_args, root_dir)

            log.info("OK")
        else:
            log.info("No C++ files found to format")

    # format python files
    has_tool = check_python_formatter()

    if has_tool:
        path_list = [
            {
                "path": os.path.join(root_dir, "make.py"),
            },
            {
                "path": os.path.join(root_dir, "modules"),
                "patterns": ["*.py"],
            },
        ]

        if path_list:
            log.info("Formating Python files...")

            for path_list_item in path_list:
                patterns = (
                    path_list_item["patterns"] if "patterns" in path_list_item else None
                )

                if patterns:
                    for pattern_item in patterns:
                        files = file.find_files(path_list_item["path"], pattern_item)

                        for file_item in files:
                            log.info(
                                "Formatting file: {0}...".format(
                                    os.path.relpath(file_item)
                                )
                            )

                            run_args = ["black", "-q", file_item]

                            runner.run(run_args, root_dir)
                else:
                    file_item = (
                        path_list_item["path"] if "path" in path_list_item else None
                    )

                    if file_item:
                        log.info(
                            "Formatting file: {0}...".format(os.path.relpath(file_item))
                        )

                        run_args = ["black", "-q", file_item]

                        runner.run(run_args, root_dir)

            log.ok()
        else:
            log.info("No Python files found to format")


def check_cpp_formatter():
    """Checks if invoking supplied clang-format binary works."""
    try:
        subprocess.check_output(["clang-format", "--version"])
        return True
    except OSError:
        log.error(
            "Clang-format is not installed, check: https://clang.llvm.org/docs/ClangFormat.html"
        )
        return False


def check_python_formatter():
    """Checks if invoking supplied black binary works."""
    try:
        subprocess.check_output(["black", "--version"])
        return True
    except OSError:
        log.error("Black is not installed, check: https://github.com/psf/black")
        return False
