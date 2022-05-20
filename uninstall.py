#!/usr/bin/env python

from __future__ import print_function
import yaml
import os


def main():
    CONFIG = "install.conf.yaml"

    stream = open(CONFIG, "r")
    conf = yaml.load(stream)

    for section in conf:
        if 'link' in section:
            for target in section['link']:
                realpath = os.path.expanduser(target)
                if os.path.islink(realpath):
                    print("Removing ", realpath)


if __name__ == "__main__":
    exit(main())
