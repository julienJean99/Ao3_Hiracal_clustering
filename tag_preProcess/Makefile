BINNAME = tag-preProcess

NAME = tag-preProcess

BUILDDIR = dist-newstyle

all: $(NAME)

$(NAME):
	cabal build
	cp $$(find . -name $(BINNAME) | tail -n1) $(NAME)

clean:
	$(RM) -r $(BUILDDIR)
	$(RM) $(NAME)

.PHONY: all $(NAME)
