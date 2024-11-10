**Build Docker image**

```
docker build -t app1-httpd .
```

**Run Docker container**

```
docker run -dit --name app1-httpd -p 8081:80 app1-httpd
```

**Test local deployment**

```
http://localhost:8081/
```
