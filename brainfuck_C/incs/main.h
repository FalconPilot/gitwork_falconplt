#ifndef MAIN_H
# define MAIN_H
# define MEMORY 30000
# include <fcntl.h>
# include <sys/types.h>
# include <sys/uio.h>
# include <unistd.h>
# include <stdio.h>

typedef struct	s_cursor
{
	char        inst[MEMORY];
	int         i;
    int         mem[MEMORY];
    int         pos;
    int         loop;
}               t_cursor;

int             r_strcmp(char *str, char *mod);
void            d_char(char c, int fd);
void            d_string(char *str, int fd);

#endif
