CC = gcc
CFLAGS = -Wall -Wextra
BUILD_DIR = build

C_SRCS = $(shell find . -type f -name '*.c' )
C_OBJS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(C_SRCS))

$(BUILD_DIR)/%.o: %.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/test.bin: $(C_OBJS)
	$(CC) $^ -o $@

.PHONY: all clean

clean:
	rm -rf $(BUILD_DIR)

all: $(BUILD_DIR)/test.bin
	echo $(C_OBJS)
