/*
** Code par FalconPilot pour GitWork
*/

#include <main.h>

void	d_int(int num)
{
	char	c;

	if (num > 9)
	{
		d_int(num / 10);
		d_int(num % 10);
	}
	else
	{
		c = num + 48;
		write(1, &c, 1);
	}
}
