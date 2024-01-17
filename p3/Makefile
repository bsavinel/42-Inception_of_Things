clean:
	docker stop $(docker ps -a -q) || true
	docker system prune -af || true

fclean: clean
	docker volume prune -f || true
