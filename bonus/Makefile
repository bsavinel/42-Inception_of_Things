all: base
	${MAKE} start

start:
	sh ./scripts/setup/setup.sh
	sh ./scripts/setup/setup-gitlab.sh

base:
	sh ./scripts/setup/setup-aliases.sh
	sh ./scripts/setup/setup-env.sh

clean:
	k3d cluster delete p4

re: clean
	${MAKE} start



