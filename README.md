# bsc_vergejchik

Создать исполняемый файл:
	iverilog -o <exec_filename> <filename>.v
Создать исполняемый тестовый файл:
	iverilog -o <exec_test_filename> <code_filename>.v <test_filename>.v
Запустить тестовый файл:
	vvp <exec_test_filename>

