#!/usr/bin/python

from os import walk, makedirs 
from os.path import splitext, join, basename, isdir, realpath
from shutil import copyfile
from subprocess import check_call

from logging import getLogger, basicConfig, DEBUG, INFO, ERROR
from argparse import ArgumentParser
from sys import stdout


logger = getLogger("make")

EXTENSION_MAP = {
	".cls": "tex/latex",
	".clo": "tex/latex",
	".sty": "tex/latex",
	".bst": "bibtex/bst",
}


def process(base_path, target_path):
	for dirpath, dirnames, filenames in walk(base_path):
		for subdir in dirnames:
			if subdir.startswith('.'):
				dirnames.remove(subdir)
		for filename in filenames:
			base_name, extension = splitext(filename)
			if base_name.startswith('.'):
				continue
			if extension not in EXTENSION_MAP:
				continue
			target_dir = join(target_path, 
					EXTENSION_MAP[extension], 
					"edpsciences", basename(dirpath))
			if not isdir(target_dir):
				logger.debug("creating directory %s", 
						target_dir)
				makedirs(target_dir)
			src_filename = join(dirpath, filename)
			dst_filename = join(target_dir, filename)
			logger.info("copying %s to %s", src_filename, 
					dst_filename)
			copyfile(src_filename, dst_filename)
	check_call('mktexlsr "%s"' % target_path, shell=True)


def main():
	default_base_path = realpath('src')
	default_target_path = realpath('texmf')
	parser = ArgumentParser(description="Make target texmf subfolder")
	parser.add_argument('--base-path', '-b', dest='base', type=str, 
			help='base path', default=default_base_path)
	parser.add_argument('--target-path', '-t', dest='target', type=str,
			help='target path', default=default_target_path)
	parser.add_argument('--verbose', '-v', dest='verbose', 
			action='store_const', default=INFO, const=DEBUG,
			help='verbose mode')
	parser.add_argument('--quiet', '-q', dest='verbose',
			action='store_const', const=ERROR, 
			help='quiet mode')
	args = parser.parse_args()
	basicConfig(stream=stdout, level=args.verbose)
	process(args.base, args.target)

if __name__ == '__main__':
	main()
