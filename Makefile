
all: clean build restart

clean:
	sudo truncate --size 0 /var/lib/mysql/mysql-slow.log
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log

build:
	./env.sh $(MAKE) -C go setup

restart:
	sudo service mysql restart
	sudo service nginx restart
