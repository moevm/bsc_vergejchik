# bsc_vergejchik

## Работа с кодовыми файлами .v
Создать исполняемый файл:  
	```iverilog -o <exec_filename> <filename>.v```  
Создать исполняемый тестовый файл:  
	```iverilog -o <exec_test_filename> <code_filename>.v <test_filename>.v```  
Запустить тестовый файл:  
	```vvp <exec_test_filename>```  
## Как работает bash-скрипт:  
В папке для каждого задания есть файл test.v, в котором лежит тестовый модуль.  
Скрипт принимает на вход аргументы:
- id задания
- таймаут для компиляции пользовательского решения
- таймаут для проверки пользовательского решения
- путь к файлу с пользовательским решением  

Скрипт для переданного id задания запускает тестовый модуль из папки с данным id 
для пользовательского решения. Тестовый модуль выводит 'ASSERTION FAILED',  
если какой-то тест не был пройден или 'SUCCESS', если все тесты пройдены.  

Пример запуска скрипта:  
 ```bash check.sh 1 1s 1s ./solutions/1/solution.v```
 
 ## Docker image:
Создать docker image:  
 ```docker image build -t iverilog-check:1.0 .```  
 Запустить docker:  
 ```docker run --memory 50m --memory-swap 50m -it iverilogcheck:1.0```
