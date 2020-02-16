#check that task with given id exists
id=$1;
if [[ ! -d ./tasks/"$id" ]] 
then
	echo Task with id=$id doesn\'t exist
	exit 1
fi

#check that file with user solution exists
solution=$4
if [[ ! -f $solution ]]
then
	echo Couldn\'t find file $solution
	exit 1
fi

#compile and test right solution
{
	iverilog -o test ./tasks/"$id"/response.v ./tasks/"$id"/test.v &>/dev/null && vvp test > response && rm test
} || {
	echo Couldn\'t check solution
	exit 1
}

#compile user solution
compilation_timeout=$2
{
	timeout "$compilation_timeout" iverilog -o test $solution && rm test
} || {
	if [[ $? -eq 124 ]]
	then	
		echo Compilation failed by timeout in $compilation_timeout
	else
		echo Compilation failed
	fi
	exit 1
}

#test user solution
test_timeout=$3
{
	timeout "$test_timeout" iverilog -o test $solution ./tasks/"$id"/test.v &>/dev/null && vvp test > result && rm test
} || {
	if [[ $? -eq 124 ]]
	then	
		echo Test failed by timeout in $test_timeout
	else
		echo Test failed
	fi
	exit 1
}

#check files equality
cmp --silent result response && echo 'SUCCESS' || echo 'FAILURE'
rm result
rm response