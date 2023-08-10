#include "sbi.h"

void sbi_puts(char *s)
{
	while (*s) {
		sbi_console_putchar(*s++);
	}
	sbi_console_putchar('\n');
}

int main(int argc, char** argv)
{
	sbi_puts("Hello from SBI");
	return 0;
}
