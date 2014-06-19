Fibonacci with a network of Dockers

# Build

	docker build -t dgageot/fiboweb .

# Run

	docker kill fibo0 fibo1 fibo2 fibo3 fibo4 fibo5 fibo6 2>/dev/null
	docker rm fibo0 fibo1 fibo2 fibo3 fibo4 fibo5 fibo6 2>/dev/null
	
	docker run --name fibo0 -d dgageot/fiboweb 0
	docker run --name fibo1 -d dgageot/fiboweb 1
	docker run --name fibo2 --link fibo0:fibo0 --link fibo1:fibo1 -d dgageot/fiboweb 2
	docker run --name fibo3 --link fibo1:fibo1 --link fibo2:fibo2 -d dgageot/fiboweb 3
	docker run --name fibo4 --link fibo2:fibo2 --link fibo3:fibo3 -d dgageot/fiboweb 4
	docker run --name fibo5 --link fibo3:fibo3 --link fibo4:fibo4 -d dgageot/fiboweb 5
	docker run --name fibo6 --link fibo4:fibo4 --link fibo5:fibo5 -d -p 8000:8000 dgageot/fiboweb 6
	
or with the helper script:

	./startNetwork.sh 6

# Test

on Linux:

	wget -q -O - http://localhost:8000/

on OSX:

	wget -q -O - http://$(boot2docker ip):8000/

# Cleanup

	docker kill fibo0 fibo1 fibo2 fibo3 fibo4 fibo5 fibo6 2>/dev/null
	docker rm fibo0 fibo1 fibo2 fibo3 fibo4 fibo5 fibo6 2>/dev/null

or with the helper script:

	./cleanup.sh 6

