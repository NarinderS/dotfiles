#!/bin/python3

import argparse
from utils import make_primary

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("desktop", type=int)
    args = parser.parse_args()
    target_desktop = str(args.desktop)
    make_primary(target_desktop)
