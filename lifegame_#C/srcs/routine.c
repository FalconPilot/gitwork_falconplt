#include <main.h>

void    routine(lifegrid grid)
{
    int     i;

    for (i = 0; grid.grid[i]; i++)
    {
        printf("%c", grid.grid[i]);
    }
    printf("x = %d; y = %d\n", grid.x, grid.y);
}
