.PHONY: resume

UID:=$(shell id -u)
GID:=$(shell id -u)

IMAGE:=resume-xelatex
DIR:=/resume
OUTPUT_DIRNAME:=output
TARGET:=JonathanKumaCV.tex

init:
	[[ -d $(OUTPUT_DIRNAME) ]] || mkdir $(OUTPUT_DIRNAME)

resume: clean init
	docker build . -t $(IMAGE)
	docker run -u $(UID):$(GID) -v $(shell pwd)/.:$(DIR)/.:rw $(IMAGE) xelatex -output-directory=$(DIR)/$(OUTPUT_DIRNAME) $(TARGET)

clean:
	rm -rf $(OUTPUT_DIRNAME)
