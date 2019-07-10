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
Starting test for falcon_gevent_app
1abb6521008b43c0ee6db5d256f8c02174bcd7d78473728e6c2bbbf9e8b21ae8
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
Time taken for tests:   3.538 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1790000 bytes
HTML transferred:       270000 bytes
Requests per second:    2826.38 [#/sec] (mean)
Time per request:       353.809 [ms] (mean)
Time per request:       0.354 [ms] (mean, across all concurrent requests)
Transfer rate:          494.07 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  198 425.3      0    3048
Processing:     9   88 170.6     48    1727
Waiting:        1   88 170.6     48    1727
Total:         37  286 505.4     50    3103

Percentage of the requests served within a certain time (ms)
  50%     50
  66%     64
  75%    111
  80%    249
  90%   1075
  95%   1272
  98%   1890
  99%   2707
 100%   3103 (longest request)
88a30c0222731544e7198fea816c468ba0359607fad71aed760a3fe2f25b3cd3
falcon_gevent_app
Starting test for fastapi_app
e02aeacf4aa236d3c03c78bbff8df87241d8ca4fa739bb04d5baa6edcc184b81
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
Time taken for tests:   3.699 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1510000 bytes
HTML transferred:       260000 bytes
Requests per second:    2703.37 [#/sec] (mean)
Time per request:       369.909 [ms] (mean)
Time per request:       0.370 [ms] (mean, across all concurrent requests)
Transfer rate:          398.64 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0  154 362.9      2    1042
Processing:    26  162 179.9    131    1905
Waiting:        2  147 177.7    118    1884
Total:         26  316 488.1    135    2947

Percentage of the requests served within a certain time (ms)
  50%    135
  66%    164
  75%    186
  80%    211
  90%   1239
  95%   1379
  98%   1639
  99%   2098
 100%   2947 (longest request)
dc2605e3a9d8f71e5335525a7d2951496f1435806da0acbf1dfa9ccb64b809f7
fastapi_app
```
