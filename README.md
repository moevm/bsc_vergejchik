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
- путь до модуля проверки

Скрипт для переданного id задания запускает тестовый модуль из папки с данным id 
для пользовательского решения. Тестовый модуль выводит 'ASSERTION FAILED',  
если какой-то тест не был пройден или 'SUCCESS', если все тесты пройдены.  

Пример запуска скрипта:  
 ```bash check.sh 1 1s 1s ./solutions/1/solution.v tasks```
 
 ## Запуск Xqueue  
```
cd xqueue/xqueue
pip3 install -r requirements.txt
python3 manage.py migrate
python3 manage.py runserver
```
## Запуск Xqueue-watcher  
```
python -m xqueue_watcher -d conf.d/
```
 ## Docker image:
Создать docker image:  
 ```docker image build -t xqueue-watcher:1.0 .```  
 Запустить docker:  
 ```docker run -v /path --network host -it xqueue-watcher:1.0```  
path - абсолютный путь до директории, в которой xqueue сохраняет решения
