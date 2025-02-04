targets := clocks selectors ram.drv util textcolors

.PHONY: all $(targets) package

all: $(targets)

# Build all targets
$(targets):
	@tput setaf 3 && echo "Building: $@" && tput sgr0
	@$(MAKE) -C $@ \
	  && (tput setaf 2 && echo "make $@ good" && tput sgr0) \
          || (tput blink && tput setaf 1 && echo "MAKE $@ BAD" && tput sgr0 && false)

# Clean all temporary/target files
clean:
	@for dir in $(targets); do \
	  tput setaf 2 && echo "cleaning $$dir" && tput sgr0; \
	  $(MAKE) -C $$dir clean; \
	done

package:
	./package.sh
