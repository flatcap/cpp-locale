#include <libintl.h>
#include <locale.h>
#include <iostream>

int main()
{
	setlocale (LC_ALL, "");
	bindtextdomain ("hellogt", ".");
	textdomain ("hellogt");

	std::cout << gettext("hello, world!") << std::endl;
}
