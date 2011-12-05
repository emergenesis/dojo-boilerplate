MAIN_DIR = $(shell pwd)
BUILD_DIR = $(MAIN_DIR)/dist
SOURCE_DIR = $(MAIN_DIR)/src
TOOLS_DIR= $(SOURCE_DIR)/js/util/buildscripts
PROFILE = $(MAIN_DIR)/profiles/main.profile.js

all: clean build

clean:
	rm -rf $(BUILD_DIR)

build:
	cd $(TOOLS_DIR); java -Xms256m -Xmx256m  \
    		-cp ../shrinksafe/js.jar:../closureCompiler/compiler.jar:../shrinksafe/shrinksafe.jar \
    		org.mozilla.javascript.tools.shell.Main  ../../dojo/dojo.js baseUrl=../../dojo \
    		load=build "profile=$(PROFILE)" "releaseDir=$(BUILD_DIR)"
	
	# copy static files
	cp "$(SOURCE_DIR)/js/boot.js" "$(BUILD_DIR)/js/boot.js"
	cp "$(SOURCE_DIR)/index.html" "$(BUILD_DIR)/index.html"

	# change debug to no
	sed -i "s/, *isDebug: *1//" "$(BUILD_DIR)/index.html"

# will create a package from the dist, using minified files
package:
	echo "Not yet implemented."
