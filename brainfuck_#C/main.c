/*
** Code par FalconPilot pour l'Atelier-prog
*/

#include <main.h>

void	d_errors(int code)
{
	switch (code)
	{
		case (1) : d_string("#Err[00] : Wrong argument count (2 required)\n", 2); break;
		case (2) : d_string("#Err[01] : Incorrect call (./brainfuck filename/instructions)\n", 2);
	}
}

t_cursor	cursor_update(t_cursor cursor, char op)
{
	cursor.loop = 0;

	switch (op)
	{
		case ('>') : cursor.pos++; break;
		case ('<') : cursor.pos--; break;
		case ('+') : cursor.mem[cursor.pos]++; break;
		case ('-') : cursor.mem[cursor.pos]--; break;
		case ('.') : d_char((char)cursor.mem[cursor.pos], 1); break;
		case ('[') : cursor.loop = 1;
		case (']') : cursor.loop = 2;
	}
	return (cursor);
}

void	instructions(char *inst)
{
	int			i;
	t_cursor	cursor;

	cursor.pos = 0;
	for (i = 0; i <= MEMORY; i++)
		cursor.mem[i] = '\0';
	for (i = 0; inst[i]; i++)
	{
		cursor = cursor_update(cursor, inst[i]);
		while (cursor.loop == 1 && inst[i] != ']' && cursor.mem[cursor.pos] == '\0')
			i++;
		while (cursor.loop == 2 && inst[i] != '[' && cursor.mem[cursor.pos])
			i--;
		if (inst[i] == ',')
		{
			i++;
			if (inst[i] == 92)
				i++;
			cursor.mem[cursor.pos] = inst[i];
		}
	}
	d_string("\n", 1);
}

void	open_file(int fd)
{
	int		i;
	char	buf;
	char	inst[MEMORY];

	for (i = 0; read(fd, &buf, 1); i++)
		inst[i] = buf;
	inst[i] = '\0';
	instructions(inst);
	close(fd);
}

int		main(int argc, char **argv)
{
	int		fd;

	if (argc != 2)
	{
		d_errors(1);
		return (1);
	}
	fd = open(argv[1], O_RDONLY);
	if (fd != -1)
		open_file(fd);
	else
		instructions(argv[1]);
	return (0);
}
