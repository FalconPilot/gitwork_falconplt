# Colors

# Variables

NAME =      lifegame

IDIR =      ./incs

FLAG =      -Wall -Wextra -Werror -I$(IDIR)

SRCS =      main.c      \
            verif.c     \
            routine.c
SDIR =      srcs/

OBJS =      $(SRCS:.c=.o)
ODIR =      objs/
OBCC =      $(addprefix $(ODIR),$(OBJS))

# Rules

$(NAME): header program

program: $(OBCC)
	@gcc $(FLAG) $(OBCC) -o $(NAME)
	@echo "Compilation terminée !"

$(ODIR)%.o: $(SDIR)%.c
	@gcc -c $(FLAG) $^ -o $@

header:
	@echo "\nCompilation"
