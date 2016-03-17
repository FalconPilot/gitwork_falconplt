int      r_strcmp(char *str, char *mod)
{
    int     i;
    int     ret;

    ret = 0;
    for (i = 0; str[i] && mod[i]; i++)
        ret += str[i] - mod[i];
    for (; str[i] && mod[i] == '\0'; i++)
        ret += str[i];
    for (; mod[i] && str[i] == '\0'; i++)
        ret -= mod[i];
    return (ret);
}
