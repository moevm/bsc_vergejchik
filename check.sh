#!/bin/bash

#check that task with given id exists
id=$1;
test=$5
if [[ ! -d "$test"/"$id" ]] 
then
	echo Task with id=$id doesn\'t exist
	exit 0
fi

#check that file with user solution exists
solution=$4
if [[ ! -f $solution ]]
then
	echo Couldn\'t find file $solution
	exit 0
fi

#compile user solution
compilation_timeout=$2
{
	error=$(timeout "$compilation_timeout" iverilog -o test $solution 2>&1 && rm test)
} || {
	if [[ $? -eq 124 ]]
	then	
		echo Compilation failed by timeout in $compilation_timeout
	else
		echo Compilation failed with error: 
		echo $error
	fi
	exit 0
}

#test user solution
test_timeout=$3
{
	timeout "$test_timeout" iverilog -o test $solution "$test"/"$id"/test.v &>/dev/null && vvp test && rm test
} || {
	if [[ $? -eq 124 ]]
	then	 
		echo Test failed by timeout in $test_timeout
	else
		echo Test failed
	fi
	exit 0
}
