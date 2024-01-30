all: base
	${MAKE} start

bonus:
	echo -n

start:
	sh ./scripts/setup.sh
	sh ./scripts/setup-gitlab.sh

start-argocd:
	sh ./scripts/setup-argocd.sh

base:
	sh ./scripts/setup-aliases.sh
	sh ./scripts/setup-env.sh

clean:
	k3d cluster delete bonus

fclean: clean
	docker stop $(docker ps -a -q) || true
	docker system prune -af || true
	docker volume prune -f || true

re: fclean
	${MAKE} start

.SILENT:
