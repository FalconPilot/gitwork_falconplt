/*
** Code par FalconPilot pour Gitwork
*/

#include <main.h>

int		r_strlen(char *str)
{
	int		count;

	count = 0;
	while (str[count])
		count++;
	return (count);
}

void	d_string(char *str, t_disp display, int fd, bool newline)
{
	int		i;

	for (i = 0; i < r_strlen(str); i++)
	{
		if (str[i] == '%' && str[i + 1] == 'd')
		{
			d_int(display.dint);
			i += 2;
		}
		if (str[i] == '%' && str[i + 1] == 'c')
		{
			write(fd, &display.dchar, 1);
			i += 2;
		}
		write(fd, &str[i], 1);
	}
	if (newline)
		write(fd, "\n", 1);
}
