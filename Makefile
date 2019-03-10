
all: clean build restart bench

clean:
	sudo truncate --size 0 /var/lib/mysql/mysql-slow.log
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/nginx/error.log
	sudo truncate --size 0 /tmp/isucon.go.log

build:
	./env.sh $(MAKE) -C go setup

restart:
	sudo service mysql restart
	sudo service nginx restart

bench:
	time sudo isucon3 benchmark -init="/home/isucon/waiwai-isucon3-20190310/init.sh" --workload 1
