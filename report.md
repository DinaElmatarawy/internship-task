1.  A breakdown of how your script handles arguments and options.

>> Ans: It uses getopts to handle -n and -v options and checks that both search term and filename are provided.Also it reads the file line by line and applies style matching, including line numbers or inverted results that based on the flags.


2.  A short paragraph: If you were to support regex or -i/-c/-l options, how would your structure change?

>> Ans: To support things like regex (-E), case-sensitive search (-i), counting matches (-c), or listing matching files only (-l), We can use getopt for parsing options to handle flags, Also we can add internal flags to track what was done, and finally we can break the code into smaller functions like match_line() to make it easier to manage all its behavior.

3.  What part of the script was hardest to implement and why?

>> Ans: The hardest part was handling both -n and -v options together without making the code messy. Also i had to make sure the script handles errors properly.