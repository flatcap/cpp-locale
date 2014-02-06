#include <libintl.h>
#include <locale.h>
#include <iostream>

#define gettext_noop(String) String

int main()
{
	setlocale (LC_ALL, "");
	bindtextdomain ("hellogt", ".");
	textdomain ("hellogt");

	const char *messages[] = {
		gettext_noop ("hello, world!"),
		gettext_noop ("wibble"),
		NULL
	};

	for (int i = 0; messages[i]; i++) {
		std::cout << gettext(messages[i]) << std::endl;
	}
}
