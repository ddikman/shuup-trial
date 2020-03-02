# Shuup deployment test

To try and containerise and run Shuup.

```shell script
docker build -t shuup .
docker run -p 8008:8000 shuup
```