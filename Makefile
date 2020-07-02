.PHONY: resume

CC = xelatex
DIR = output
TARGET = JonathanKumaCV.tex

init:
	[[ -d $(DIR) ]] || mkdir $(DIR)

resume: clean init
	$(CC) -output-directory=$(DIR) $(TARGET)

clean:
	rm -rf $(DIR)
