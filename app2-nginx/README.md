
** Build docker image **

docker build -t app2-nginx .

** Run docker locally for testing **

docker run -dit --name app2-nginx -p 8082:80 app2-nginx

** Test local deployment **

http://localhost:8082/
