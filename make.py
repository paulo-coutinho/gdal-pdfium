#! /usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Make tool

Usage:
  make.py <task-name>
  make.py [options]
  make.py -h | --help  

Options:
  -h --help                         Show this screen.
  -d --debug                        Enable debug mode.
  --version                         Show version.
  
Examples:
  python make.py -h

Tasks:
  - format
  - clean

  - ios-build
  - android-build
"""

from docopt import docopt

import modules.tasks.common as common
import modules.tasks.ios as ios
import modules.tasks.android as android
import modules.log as log
import modules.config as c


def main(options):
    # show all params for debug
    if ("--debug" in options and options["--debug"]) or (
        "-d" in options and options["-d"]
    ):
        c.make_debug = True

    if c.make_debug:
        log.normal("You have executed with options:")
        log.normal(str(options))
        log.normal("")

    # bind options
    if "<task-name>" in options:
        make_task = options["<task-name>"]

    # validate data
    log.info("Validating data...")

    # validate task
    if not make_task:
        log.error("Task is invalid")

    # format
    if make_task == "format":
        common.run_task_format()

    # clean
    elif make_task == "clean":
        common.run_task_clean()

    #######################
    # ios
    #######################

    # ios - build
    elif make_task == "ios-build":
        ios.run_task_build()

    #######################
    # android
    #######################

    # android - build
    elif make_task == "android-build":
        android.run_task_build()

    #######################
    # Invalid
    #######################

    # invalid
    else:
        log.error("Task is invalid")


if __name__ == "__main__":
    # main CLI entrypoint
    args = docopt(__doc__, version="1.0.0")
    main(args)
