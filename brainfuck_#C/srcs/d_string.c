#include <unistd.h>

void	d_char(char c, int fd)
{
	write(fd, &c, 1);
}

void	d_string(char *str, int fd)
{
	int		i;

	for (i = 0; str[i]; i++)
		write(fd, &str[i], 1);
}
