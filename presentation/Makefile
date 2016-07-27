# orig: http://lincolnmullen.com/blog/make-and-pandoc/

# List files to be made by finding all *.md files and appending .pdf
SLIDES := $(patsubst %.md,%.md.html,$(wildcard *.md))

# The all rule makes all the html files listed
all: $(SLIDES)

%.md.html : %.md
	#pandoc --self-contained -c custom.css -t dzslides $< -o $@
	pandoc --self-contained --smart -t dzslides $< -o $@

# Remove all outputs
clean :
	rm $(SLIDES)

# Remove all PDF outputs then build them again
rebuild : clean all
