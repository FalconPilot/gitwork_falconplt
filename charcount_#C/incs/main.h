#ifndef MAIN_H
# define MAIN_H
# define ASCII  128
# define true   1
# define false  0
# include <unistd.h>

typedef int     bool;

typedef struct  s_disp
{
    char        dchar;
    int         dint;
}               t_disp;

void            d_string(char *str, t_disp display, int fd, bool newline);
void            d_int(int num);

#endif
