#include <main.h>

char        *fill_grid(int size, char *filename)
{
    int     i;
    int     fd;
    char    buf;
    char    *ret;

    ret = (char*)malloc(sizeof(char) * (size + 1));
    ret[size] = '\0';
    fd = open(filename, O_RDONLY);
    if (fd == -1)
        exit(EXIT_FAILURE);
    for (i = 0; read(fd, &buf, 1); i++)
    {
        ret[i] = buf;
    }
    return (ret);
}

lifegrid    grid_verif(int fd, char *filename)
{
    int         x;
    char        buf;
    int         size;
    lifegrid    grid;

    size = 0;
    for (x = 0; read(fd, &buf, 1); x++)
    {
        size++;
        if (buf == '\n')
        {
            grid.x = x;
            grid.y = 1;
            break ;
        }
    }
    for (x = 0; read(fd, &buf, 1); x++)
    {
        size++;
        if (buf != '.' && buf != 'x' && buf != '\n')
        {
            grid.valid = 1;
            return (grid);
        }
        if (buf == '\n')
        {
            if (x == grid.x)
            {
                x = -1;
                grid.y++;
            }
            else
            {
                grid.valid = 1;
                return (grid);
            }
        }
    }
    close (fd);
    grid.grid = fill_grid(size, filename);
    grid.next = fill_grid(size, filename);
    grid.valid = 0;
    return (grid);
}
