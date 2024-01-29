all:
	./scripts/setup-env.sh
	./scripts/setup.sh

p2:
	echo -n

clean:
	docker stop $(docker ps -a -q) || true
	docker system prune -af || true

fclean: clean
	docker volume prune -f || true

.SILENT: