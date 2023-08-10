extern char __bss_start[];
extern char _end[];
extern int main(int argc, char** argv);

int _start(int argc, char** argv)
{
	char *p = __bss_start;

        /* Clear BSS */
        while (p < _end) {
                *p++ = 0;
	}
	return main(argc, argv);
}
