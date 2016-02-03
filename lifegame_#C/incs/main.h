#ifndef MAIN_H
# define MAIN_H
# include <sys/types.h>
# include <sys/uio.h>
# include <fcntl.h>
# include <unistd.h>
# include <stdlib.h>
# include <stdio.h>

typedef struct      s_grid
{
    int             x;
    int             y;
    int             valid;
    char            *grid;
    char            *next;
}                   lifegrid;

lifegrid            grid_verif(int fd, char *filename);
void                routine(lifegrid grid);

#endif
