/*
** Code par FalconPilot pour l'Atelier-prog
*/

#include <main.h>

/* Affichage des erreurs */
void        d_errors(int code)
{
    switch (code)
    {
        case (1) : d_string("#Err[00] : Wrong argument count (2 required)\n", 2); break;
        case (2) : d_string("#Err[01] : Bad syntax (./brainfuck filename/instructions)\n", 2); break;
    }
}

/* Reconnaissance de caractère */
t_cursor    cursor_update(t_cursor cursor, char *op)
{
    cursor.loop = 0;
    switch (op[cursor.i])
    {
        case ('>') : cursor.pos++; break;
        case ('<') : cursor.pos--; break;
        case ('+') : cursor.mem[cursor.pos]++; break;
        case ('-') : cursor.mem[cursor.pos]--; break;
        case ('.') : d_char((char)cursor.mem[cursor.pos], 1); break;
        case ('[') :
            if (cursor.mem[cursor.pos] == '\0')
            {
                while (op[cursor.i] != ']')
                    cursor.i++;
                break;
            }
            cursor.i++;
            cursor.loop = 1;
            break;
        case (']') :
            cursor.loop = 2;
            break;
        case (',') : cursor.mem[cursor.pos] = getchar(); break;
    }
    return (cursor);
}

/* Boucle principale */
t_cursor    instructions(char *inst, t_cursor cursor)
{
    int     i;

    while (inst[cursor.i])
    {
        cursor = cursor_update(cursor, inst);
        if (cursor.pos < 0)
            cursor.pos = MEMORY - 1;
        else if (cursor.pos >= MEMORY)
            cursor.pos = 0;
		if (cursor.mem[cursor.pos] > 127)
			cursor.mem[cursor.pos] = 0;
		else if (cursor.mem[cursor.pos] < 0)
			cursor.mem[cursor.pos] = 127;
        switch (cursor.loop)
        {
            case (1) :
                i = cursor.i;
                while (cursor.mem[cursor.pos])
                {
                    cursor = instructions(inst, cursor);
                    if (cursor.mem[cursor.pos])
                        cursor.i = i;
                }
                break;
            case (2) :
                return (cursor);
                break;
        }
        cursor.i++;
    }
    return (cursor);
}

/* Ouverture de fichier */
void        open_file(int fd, t_cursor cursor)
{
    int     i;
    char    buf;

    for (i = 0; read(fd, &buf, 1); i++)
        cursor.inst[i] = buf;
    cursor.inst[i] = '\0';
    instructions(cursor.inst, cursor);
    close(fd);
}

/* Programme */
int         main(int argc, char **argv)
{
    int         fd;
    t_cursor    cursor;

    cursor.pos = 0;
    for (cursor.i = 0; cursor.i <= MEMORY; cursor.i++)
        cursor.mem[cursor.i] = '\0';
    cursor.i = 0;
    if (argc != 2)
    {
        d_errors(1);
        return (1);
    }
    fd = open(argv[1], O_RDONLY);
    if (fd != -1)
        open_file(fd, cursor);
    else
        instructions(argv[1], cursor);
    /* Newline de debuf
    d_char('\n', 1);*/
    return (0);
}
