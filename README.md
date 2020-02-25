# bsc_vergejchik

## Работа с кодовыми файлами .v
Создать исполняемый файл:  
	```iverilog -o <exec_filename> <filename>.v```  
Создать исполняемый тестовый файл:  
	```iverilog -o <exec_test_filename> <code_filename>.v <test_filename>.v```  
Запустить тестовый файл:  
	```vvp <exec_test_filename>```  
## Как работает bash-скрипт:  
В папке для каждого задания есть файлы response.v и test.v, 
в которых лежат верное решение и тестовый модуль соответсвенно.  
Скрипт принимает на вход аргументы:
- id задания
- таймаут для компиляции пользовательского решения
- таймаут для проверки пользовательского решения
- путь к файлу с пользовательским решением  

Скрипт для переданного id задания запускает тестовый модуль из папки с данным id для файла response.v,   
результат работы кладет в файл response, затем запускает тестовый модуль для пользовательского решения,   
результат работы кладет в файл result.  
Для проверки правильности решения файлы response и result сравниваются, если они идентичны,   
то будет выведено 'SUCCESS', иначе 'FAILURE'.  

Пример запуска скрипта:  
 ```bash check.sh 1 1s 1s ./solutions/1/solution.v```
