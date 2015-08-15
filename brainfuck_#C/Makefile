# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpallies <rpallies@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/07/25 12:15:42 by rpallies          #+#    #+#              #
#    Updated: 2015/07/30 18:45:32 by rpallies         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors

END =		\x1b[0m
RED =		\x1b[31m
GRE =		\x1b[32m
YEL =		\x1b[33m
BLU =		\x1b[34m
PIN =		\x1b[35m
CYA =		\x1b[36m

# Variables

NAME =		brainfuck
PROG =		main.c

LIB =		libfuck.a
LIB2 =		-L. -lfuck

DIR =		./srcs/
SRC =		d_string.c		\
			r_strcmp.c

MAC =		$(SRC:.c=.o)

FLAGS =		-I./incs -Wall -Wextra -Werror

# Compilation rules

all: $(NAME) header

$(NAME): header
	@echo ""
	@echo "  ${RED}Compilation du programme${END}"
	@echo "      -->Librairie...${YEL}"
	@make $(MAC)
	@make $(LIB)
	@echo "${END}      -->Programme..."
	@gcc $(FLAGS) $(PROG) -o $@ $(LIB2)
	@echo "   ${GRE}-----------------------"
	@echo "   *Compilation terminee !*"
	@echo "   -----------------------${END}"

%.o: $(DIR)%.c
	@gcc $^ $(FLAGS) -c

$(LIB): $(MAC)
	@ar rc $(LIB) $(MAC)
	@ranlib $(LIB)

header:
	@clear
	@echo "  ${BLU}*=======================*"
	@echo "  ${GRE}       *${PIN}COMPILATOR${GRE}*"
	@echo "  ${BLU}*=======================*"
	@echo "  ${GRE}      ___    ${YEL}   ___"
	@echo "  ${GRE}      \\  \\     ${YEL}/  /"
	@echo "  ${GRE}       \\  \\   ${YEL}/  /"
	@echo "  ${GRE}        \\  \\_${YEL}/  /"
	@echo "  ${PIN}         |  _${CYA}  |"
	@echo "  ${PIN}        /  /${CYA} \\  \\"
	@echo "  ${PIN}       /  /  ${CYA} \\  \\"
	@echo "  ${PIN}      /__/    ${CYA} \\__\\"
	@echo ""
	@echo "  ${BLU}*=======================*"
	@echo "          ${RED}PEGI ${END}(+${PIN}18${END})"
	@echo "  ${BLU}*=======================*${END}"

clean: header
	@echo ""
	@echo "  ${RED}Nettoyage des fichiers .o${END}"
	@echo "      -->Nettoyage..."
	@rm -f $(MAC)
	@echo "  ${GRE} -----------------------"
	@echo "   * Nettoyage termine ! *"
	@echo "   -----------------------${END}"
	
fclean: clean
	@echo ""
	@echo "  ${RED}Nettoyage executable/lib.${END}"
	@echo "      -->Nettoyage..."
	@rm -f $(LIB)
	@rm -f $(NAME)
	@echo "  ${GRE} -----------------------"
	@echo "   * Nettoyage termine ! *"
	@echo "   -----------------------${END}"

re: fclean all
