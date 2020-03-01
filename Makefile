##
## EPITECH PROJECT, 2019
## cpp_rush3_2019
## File description:
## automated desc ftw
##

SRC = $(shell find . -name "*.asm")

NAME = libasm.so
LDFLAGS = -shared
CPL = gcc
CFLAGS = -Wextra -Wall -I. -fPIC
DFLAGS = -Wextra -Wall -I. -fPIC -g
ASM = nasm
ASFLAGS = -f elf64

OBJ = $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CPL) -o $(NAME) $(OBJ) $(LDFLAGS) -g

debug: $(SRC)
	$(CPL) -o $(NAME) $(OBJ) $(DFLAGS) $(LDFLAGS)

clean:
	$(foreach var, $(OBJ), if [ -e $(var) ] ; then rm -f $(var) ; fi;)
	rm -f vgcore.*

fclean: clean
	rm -f $(NAME)

re:
	$(MAKE) fclean
	$(MAKE) all

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

.PHONY: all clean fclean re
