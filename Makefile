VERSION := $(shell jq -r .version src/info.json)
BUILD := ./build

all: zip

zip:
	rm -rf $(BUILD)
	mkdir -p $(BUILD)
	rsync -av ./src/ $(BUILD)/k-shortcuts_$(VERSION) --exclude __debug
	cd $(BUILD) && zip -r ./k-shortcuts_$(VERSION).zip ./k-shortcuts_$(VERSION) && cd ..
	rm -r $(BUILD)/k-shortcuts_$(VERSION)
