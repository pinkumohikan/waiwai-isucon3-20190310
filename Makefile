all:
	./env.sh $(MAKE) -C go setup
	sudo service mysql restart
