

# Glob all the json files from the source directory
SOURCE_FILES = $(wildcard source/*.json)

# Remap the json files to *.data files into the data directory
DATA_FILES = $(SOURCE_FILES:source/%.json=data/%.data)

# Build everythihng
.PHONY: all
all: $(DATA_FILES)
	
# A target for each *.json file, output an equivalant *.data file
$(DATA_FILES): data/%.data: source/%.json
	@if not exist data mkdir data
	python generator.py $< $@
	
# Delete the data folder
.PHONY: debug
clean:
	@if exist data rmdir /s /q data

# Echo the file list
.PHONY: debug
debug:
	@echo $(SOURCE_FILES)
	@echo $(DATA_FILES)

