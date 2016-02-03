#include <main.h>

lifegrid    swap_grid(lifegrid grid)
{
    int     i;

    for (i = 0; grid.next[i]; i++)
        grid.grid[i] = grid.next[i];
    return (grid);
}

int         calc_cell(lifegrid grid, int i, int line)
{
    int     next;

    next = 0;
    if (i > 0 && grid.grid[i - 1] == 'x')
        next++;
    if (grid.grid[i + 1] == 'x')
        next++;
    if (line < grid.y && grid.grid[i + grid.x + 1] == 'x')
        next++;
    if (line > 0 && grid.grid[i - grid.x - 1] == 'x')
        next++;
    return (next);
}

void        routine(lifegrid grid)
{
    int     i;
    int     count;
    int     next;
    int     line;

    line = 0;
    count = 0;
    for (i = 0; grid.grid[i]; i++)
    {
        printf("%c", grid.grid[i]);
        next = 0;
        if (grid.grid[i] == '.')
        {
            next = calc_cell(grid, i, line);
            if (next == 3)
                grid.next[i] = 'x';
        }
        else if (grid.grid[i] == 'x')
        {
            count++;
            next = calc_cell(grid, i, line);
            if (next != 2 && next != 3)
                grid.next[i] = '.';
        }
        else if (grid.grid[i] == '\n')
            line++;
    }
    sleep(1);
    grid = swap_grid(grid);
    printf("\n");
    if (count == 0)
    {
        printf("There are only dead cells left !\n");
        exit(EXIT_SUCCESS);
    }
    routine(grid);
}
