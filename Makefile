.PHONY: all build install binary test doc delete

# Make all will do all the job of building and installing then make the library test
all: build install binary

# build the library from the source files .cpp & .h
build:
	mkdir -p build
	cd build && cmake ..
	$(MAKE) -C build

# do the installing job for the library and header files to build/Release
install:
	sudo $(MAKE) -C build install
	@echo "Library Installed Successfully!"

# Make the Test binray file and link the library
binary:
	mkdir -p tests/test
	cd tests/test && cmake ..
	$(MAKE) -C tests/test

# make the test by running the ctest
test:
	cd tests/test && ctest

# make and create the library documents files with doxygen
doc:
	doxygen dconfig
	cd lib_docs/latex && make pdf

# make help, instructions to users
help:
	@echo "Use: (  make all     )------>> to build the library then installed it to build/Release and compile and build the test binary"
	@echo "Use: (  make test    )------>> to run the google test and check the result"
	@echo "Use: (  make doc     )------>> to run the doxygen and build the documents file in lib_docs/html/index.html"
	@echo "Use: (  make clean   )------>> to run the clean of the built files"
  @echo "Use: (  make delete  )------>> to remove all the building directoies"
	@echo "Use: (  make help    )------>> to run this help instruction"

# do the clean job for the installation directories
clean:
	$(MAKE) -C build clean
	$(MAKE) -C tests/test clean
	@echo "Cleaned Build Files"

delete:
	@echo "Delete all building directories"
	rm -rf tests/test
	sudo rm -rf build
	rm -rf lib_docs/html lib_docs/latex
	@echo "All done...!"
