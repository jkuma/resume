.PHONY: resume

UID:=$(shell id -u)
GID:=$(shell id -u)

IMAGE:=resume-xelatex
DIR:=/resume
OUTPUT_DIRNAME:=output
TARGET_FR:=JonathanKumaCvFR.tex
TARGET_EN:=JonathanKumaCvEN.tex

init:
	[[ -d $(OUTPUT_DIRNAME) ]] || mkdir $(OUTPUT_DIRNAME)

resumes: clean init
	docker build . -t $(IMAGE)
	docker run --rm -u $(UID):$(GID) -v $(shell pwd)/.:$(DIR)/.:rw $(IMAGE) xelatex -output-directory=$(DIR)/$(OUTPUT_DIRNAME) $(TARGET_FR)
	docker run --rm -u $(UID):$(GID) -v $(shell pwd)/.:$(DIR)/.:rw $(IMAGE) xelatex -output-directory=$(DIR)/$(OUTPUT_DIRNAME) $(TARGET_EN)

clean:
	rm -rf $(OUTPUT_DIRNAME)
