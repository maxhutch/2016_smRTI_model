#!/usr/bin/python3

from sys import argv
from string import Template

subs = globals()

class MyTemplate(Template):
    delimiter = '&'

with open(argv[1],'r') as file_opened:
  lines = file_opened.read()

newlines = MyTemplate(lines).safe_substitute(globals())

with open(argv[2],'w') as file_opened:
  file_opened.write(newlines)

