#!/usr/bin/python -tt

"""
cat.py -- just a little example python program
showing some common syntax. This program works.

-tt flag above detects space/tab indent problems
"""

#sys is one of many available modules of library code, import to use.
#sys.argv is the list of command line arguments.
import sys

#defines a global variable
a = 123 

# define a 'cat' function which takes a filename
def cat(filename):
    """Given filename, print its text contents."""
    print(filename, '=======')
    f = open(filename, 'r')
    for line in f:      # goes through a text file line by line
        print(line, end="")     # trailing comma inhibits the ending print-newline
    # alternative, read the whole file into a single string:
    # text = f.read()
    f.close()
    
def main():
    # sys.argv contains command line arguments.
    # This assigns a list of all but the first arg into a local 'args' var.
    args = sys.argv[1:]
    
    # important syntax -- loop of variable 'filename' over the args list.
    for filename in args:
        if filename == 'voldermort' or filename == 'vader':
            print('the file is very woryying')
            cat(filename, 123, bad_variable)
            # important point: errors in above line only caught if it is run
        else:
            #regular case
            cat(filename)
    print('all done') # this print is outside the loop, due to its indentation
    
# Standard boilerplate at end of file to call main() function.
if __name__ == '__main__':
    main()

    