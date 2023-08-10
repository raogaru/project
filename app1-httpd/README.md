** Build docker image **

```
docker build -t app1-httpd .
```

** Build docker image **

```
docker run -dit --name app1-httpd -p 8081:80 app1-httpd
```

** Test local deployment **

```
http://localhost:8081/
```
