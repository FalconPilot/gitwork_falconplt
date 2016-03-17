/*
** Code par FalconPilot pour Gitwork
*/

#include <main.h>

void    charcount(char *str)
{
    int         count[ASCII];
    int         i;
    t_disp      display;

    d_string("*====================================*", display, 1, true);
    d_string("* Caractères présents dans la chaîne *", display, 1, true);
    d_string("*====================================*", display, 1, true);
    for (i = 0; i <= ASCII; i++)
        count[i] = 0;
    for (i = 0; str[i]; i++)
        count[(int)str[i]]++;
    for (i = 0; i <= ASCII; i++)
    {
        if (count[i] != 0)
        {
            display.dchar = i;
            display.dint = count[i];
            d_string("[%c] = %d fois", display, 1, true);
        }
    }
    d_string("*====================================*", display, 1, true);
    d_string("*          Fin de la chaîne          *", display, 1, true);
    d_string("*====================================*", display, 1, true);
}

int     main(int argc, char **argv)
{
    t_disp      display;

    if (argc != 2)
    {
        d_string("#Err[00] : Wrong argument count (2 required)", display, 2, true);
        return (1);
    }
    charcount(argv[1]);
    return (0);
}
