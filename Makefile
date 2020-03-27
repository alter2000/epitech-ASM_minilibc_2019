##
## EPITECH PROJECT, 2019
## cpp_rush3_2019
## File description:
## automated desc ftw
##

SRC = $(shell find . -name "*.asm")

NAME = libasm.so
LDFLAGS = -shared -fPIC
CPL = gcc
CFLAGS = -Wextra -Wall -I. -fPIC
DFLAGS = -Wextra -Wall -I. -fPIC -g
ASM = nasm
ASFLAGS = -felf64 -F dwarf -g

OBJ = $(SRC:.asm=.o)

all: $(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

$(NAME): $(OBJ)
	ld -o $(NAME) $(LDFLAGS) -g $(OBJ)

debug: $(SRC)
	$(CPL) -o $(NAME) $(OBJ) $(DFLAGS) $(LDFLAGS)

clean:
	find . -name "*.o" -delete
	rm -f vgcore.*

fclean: clean
	rm -f $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all clean fclean re
