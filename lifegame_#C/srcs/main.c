#include <main.h>

void    handle_error(int id)
{
    if (id == 1)
        printf("Error : Invalid file name\n");
    else if (id == 2)
        printf("Error : Invalid file format\n");
    else
        printf("Usage : ./program filename\n");
    exit(EXIT_FAILURE);
}

int     main(int argc, char **argv)
{
    int         fd;
    lifegrid    grid;

    if (argc != 2)
        handle_error(0);
    fd = open(argv[1], O_RDONLY);
    if (fd == -1)
        handle_error(1);
    grid = grid_verif(fd, argv[1]);
    if (grid.valid == 0)
        routine(grid);
    else
        handle_error(2);
    return (EXIT_SUCCESS);
}
