NAME = app-focus
PREFIX ?= /usr/bin

$(NAME): $(NAME).m
	clang -fobjc-arc \
		-framework Foundation \
		-framework AppKit \
		$< \
		-o $@

clean:
	rm -f $(NAME)

install: $(NAME)
	cp $(NAME) $(PREFIX)/$(NAME)

uninstall:
	rm -f $(PREFIX)/$(NAME)

.PHONY: clean install uninstall
