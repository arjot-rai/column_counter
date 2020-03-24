#!/bin/sh

# Name: Arjot Singh Rai
# NSID: arr455
# Student Number: 11258421

# counts the number of columns in a file
# output is produced on the stanard output
# If no file argument is passed, the data is read from standard input
# invoke with -h option to display usage
# invoke -d option to specify the delimiter for the columns

d_arg="\t"

while getopts ":hd:" option
do
	case ${option} in
	h)
	echo Usage: count_cols.sh [-h] [-d delimiter] [file]
	if [ $# -eq 1 ]
	then
		exit 0
	fi
	;;
	d)
	d_arg="$OPTARG"
	;;
	*)
	echo invalid option \"-$OPTARG\"
	echo Usage: count_cols.sh [-h] [-d delimiter] [file]
	exit 1
	;;	
	esac
done

shift $(($OPTIND - 1))

if [ $# -gt 1 ]
then
	echo extraneous input on command line
	echo Usage: count_cols.sh [-h] [-d delimiter] [file]
	exit 1
fi


if [ $# -eq 1 ]
then
	if [ -d $1 ]
	then
		echo $1 is a directory
		exit 1
	fi

	if [ -e $1 ]
	then
		expr `head -1 $1 | tr -dc $d_arg | wc -c` + 1
	else
		echo file $1 does not exist or is unreadable
		exit 1
	fi
else
	expr `head -1 | tr -dc $d_arg | wc -c` + 1
fi


