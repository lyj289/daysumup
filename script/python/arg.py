#!/usr/bin/python 
#-*- coding:utf-8 -*-

import argparse

def _main():
    parser = argparse.ArgumentParser(description='script desc.')
    parser.add_argument('directory', type=str, help='目标目录路径')
    parser.add_argument('-t', '--type', type=str, default='ext', choices=['ext', 'mtime', 'word', 'back'], help='分类方式')

    args       = parser.parse_args()
    target_dir = args.directory
    op         = args.type

    print (op, target_dir)

if __name__ == '__main__':
    _main()