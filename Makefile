.PHONY: resume

CC = xelatex
DIR = output
TARGET = JonathanKumaCV.tex

resume:
	$(CC) -output-directory=$(DIR) $(TARGET)

clean:
	rm -rf $(DIR)/*
