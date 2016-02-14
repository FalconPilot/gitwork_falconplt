#include <main.h>

int
sync_grid(lifegrid *grid) {
    int i;
    int diff;

    diff = 0;
    for (i = 0; i < grid->size; i++) {
        if (grid->current[i] != grid->next[i]) {
            diff++;
        }
        grid->current[i] = grid->next[i];
    }
    return (diff);
}

int
calc_cell(lifegrid grid, int i, int line) {
    int next;

    next = 0;
    // Top-left
    if (line > 1 && i % grid.x != 0 && grid.current[i - grid.x - 1] == CELL_LIVE) {
        next++;
    }
    // Top-middle
    if (line > 1 && grid.current[i - grid.x] == CELL_LIVE) {
        next++;
    }
    // Top-right
    if (line > 1 && i % grid.x != grid.x && grid.current[i - grid.x + 1] == CELL_LIVE) {
        next++;
    }
    // Middle-left
    if (i % grid.x != 0 && grid.current[i - 1] == CELL_LIVE) {
        next++;
    }
    // Middle-right
    if (i % grid.x != grid.x && grid.current[i + 1] == CELL_LIVE) {
        next++;
    }
    // Bottom-left
    if (line < grid.y && i % grid.x != 0 && grid.current[i + grid.x - 1] == CELL_LIVE) {
        next++;
    }
    // Bottom-middle
    if (line < grid.y && grid.current[i + grid.x] == CELL_LIVE) {
        next++;
    }
    // Bottom-right
    if (line < grid.y && i % grid.x != grid.x && grid.current[i + grid.x + 1] == CELL_LIVE) {
        next++;
    }
    if (next == 2) {
        return (grid.current[i]);
    }
    else if (next == 3) {
        return (CELL_LIVE);
    }
    else {
        return (CELL_DEAD);
    }
}

void
display_grid(lifegrid grid) {
    int i;

    for (i = 0; i < grid.size; i++) {
        if (i % grid.x == 0) {
            printf("\n");
        }
        if (grid.current[i] == CELL_DEAD) {
            printf(".");
        }
        else {
            printf("x");
        }
    }
    printf("\n");
}

void
terminate_routine(void) {
    printf("\nNo more moves possible !\n\n");
    exit(EXIT_SUCCESS);
}

void
routine(lifegrid grid) {
    int i;
    int line;

    line = 0;
    for (i = 0; i < grid.size; i++) {
        if (i % grid.x == 0) {
            line++;
        }
        grid.next[i] = calc_cell(grid, i, line);
    }
    display_grid(grid);
    if (sync_grid(&grid) == 0) {
        terminate_routine();
    }
    sleep(1);
    routine(grid);
}
