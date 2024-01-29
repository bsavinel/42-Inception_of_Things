all:
	./scripts/setup-env.sh
	./scripts/setup.sh

p3:
	echo -n

clean:
	k3d cluster delete p3

fclean: clean
	docker stop $(docker ps -a -q) || true
	docker system prune -af || true
	docker volume prune -f || true

re: fclean
	$(MAKE) all

.SILENT: