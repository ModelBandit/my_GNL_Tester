TestDir = ../my_get_next_line/
GNLfiles = get_next_line.c get_next_line_utils.c
NORM_TARGET = get_next_line.c get_next_line_utils.c get_next_line.h

GNL = $(addprefix $(TestDir), $(GNLfiles))

FilesDir = files/
TextFiles = $(shell ls $(FilesDir))
TestFiles = $(addprefix $(FilesDir), $(TextFiles))

outputName = test.test


testAll: build test1 test42 test1M

build:
	clear
	norminette $(addprefix $(TestDir), $(NORM_TARGET))
	cc -Wall -Wextra -Werror $(GNL) main.c -o $(outputName)

test1:
	./$(outputName) -D BUFFER_SIZE 1 $(TestFiles)
test42:
	./$(outputName) -D BUFFER_SIZE 42 $(TestFiles)
test1M:
	./$(outputName) -D BUFFER_SIZE 1000000 $(TestFiles)


.PHONY = testAll build