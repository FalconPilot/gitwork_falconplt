#include <main.h>

lifegrid
fill_grid(char *filename, lifegrid grid) {
    int i;
    int fd;
    char buf;

    grid.current = (int*)malloc(sizeof(int) * grid.size);
    grid.next = (int*)malloc(sizeof(int) * grid.size);
    fd = open(filename, O_RDONLY);
    if (fd == -1) {
        exit(EXIT_FAILURE);
    }
    for (i = 0; read(fd, &buf, 1); i++) {
        if (buf != '\n') {
            grid.current[i] = (int)buf - (int)'0';
            grid.next[i] = (int)buf - (int)'0';
        }
        else {
            i--;
        }
    }
    close(fd);
    return (grid);
}

lifegrid
grid_verif(int fd, char *filename) {
    int x;
    char buf;
    lifegrid grid;

    grid.size = 0;
    for (x = 0; read(fd, &buf, 1); x++) {
        grid.size++;
        if (buf == '\n') {
            grid.x = x;
            grid.y = 1;
            break;
        }
    }
    for (x = 0; read(fd, &buf, 1); x++) {
        grid.size++;
        if (buf != '1' && buf != '0' && buf != '\n') {
            grid.size = -1;
            return (grid);
        }
        if (buf == '\n') {
            if (x == grid.x) {
                x = -1;
                grid.y++;
            }
            else {
                grid.size = -1;
                return (grid);
            }
        }
    }
    close(fd);
    grid.size -= grid.y;
    grid = fill_grid(filename, grid);
    return (grid);
}
