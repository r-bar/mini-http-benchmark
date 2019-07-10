# Mini HTTP Benchmark

## Requirements
- docker
- jq

## Running
```shell
./test.sh
```

## Latest Results
```
####################################
Starting test for falcon_app
####################################
Cmd: /bin/sh -c gunicorn --worker-connections 1000 --bind 0.0.0.0:80 main:app
This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking falcon_app (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
apr_socket_recv: Connection reset by peer (104)
Total of 9788 requests completed
Test failed...
[2019-07-10 05:45:00 +0000] [1] [INFO] Starting gunicorn 19.9.0
[2019-07-10 05:45:00 +0000] [1] [INFO] Listening at: http://0.0.0.0:80 (1)
[2019-07-10 05:45:00 +0000] [1] [INFO] Using worker: sync
[2019-07-10 05:45:00 +0000] [7] [INFO] Booting worker with pid: 7
####################################
Starting test for falcon_gevent_app
####################################
Cmd: /bin/sh -c gunicorn --worker-class eventlet --worker-connections 1000 --bind 0.0.0.0:80 main:app
This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking falcon_gevent_app (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:        gunicorn/19.9.0
Server Hostname:        falcon_gevent_app
Server Port:            80

Document Path:          /
Document Length:        27 bytes

Concurrency Level:      1000
Time taken for tests:   3.516 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1790000 bytes
HTML transferred:       270000 bytes
Requests per second:    2843.90 [#/sec] (mean)
Time per request:       351.629 [ms] (mean)
Time per request:       0.352 [ms] (mean, across all concurrent requests)
Transfer rate:          497.13 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  208 508.0      0    3048
Processing:    10   79 162.9     44    1723
Waiting:        1   79 162.9     43    1723
Total:         21  287 568.3     45    3275

Percentage of the requests served within a certain time (ms)
  50%     45
  66%     55
  75%     86
  80%    240
  90%   1075
  95%   1103
  98%   2717
  99%   3095
 100%   3275 (longest request)
####################################
Starting test for fastapi_app
####################################
Cmd: /bin/sh -c gunicorn --worker-connections 1000 --worker-class uvicorn.workers.UvicornWorker --bind 0.0.0.0:80 main:app
This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking fastapi_app (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:        uvicorn
Server Hostname:        fastapi_app
Server Port:            80

Document Path:          /
Document Length:        26 bytes

Concurrency Level:      1000
Time taken for tests:   14.914 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1510000 bytes
HTML transferred:       260000 bytes
Requests per second:    670.52 [#/sec] (mean)
Time per request:       1491.377 [ms] (mean)
Time per request:       1.491 [ms] (mean, across all concurrent requests)
Transfer rate:          98.88 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0   99 302.3      2    1059
Processing:    22  375 1306.2    147   13857
Waiting:        2  359 1308.0    128   13856
Total:         22  475 1502.8    149   14895

Percentage of the requests served within a certain time (ms)
  50%    149
  66%    165
  75%    180
  80%    183
  90%    258
  95%   2071
  98%   4597
  99%   7994
 100%  14895 (longest request)
```
