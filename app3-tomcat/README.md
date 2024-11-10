
**Build Docker image**

```
docker build -t app3-tomcat .
```

**Run Docker locally for testing**

```
docker run -dit --name app3-tomcat -p 8083:8080 app3-tomcat
```

**Test local deployment**

```
http://localhost:8083/

```

**Test local deployment for sample app**

```
http://localhost:8083/sample
```
