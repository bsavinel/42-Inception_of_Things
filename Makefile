p1:
	make -C ./p1 $(MAKECMDGOALS)

p2:
	make -C ./p2 $(MAKECMDGOALS)

p3:
	make -C ./p3 $(MAKECMDGOALS)

bonus:
	make -C ./bonus $(MAKECMDGOALS)

all:
	echo -n

clean:
	echo -n

fclean:
	echo -n

re:
	echo -n

.SILENT:
.PHONY: p1 p2 p3 bonus all clean fclean re