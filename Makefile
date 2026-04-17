CC := gcc
RM := rm -f
INC_DIR := ./inc
SRC_DIR := ./src
OBJ_DIR := ./obj
BIN_DIR := ./bin
TARGET := final
OBJS := $(OBJ_DIR)/main.o \
	$(OBJ_DIR)/hello.o
	
CFLAGS := -MMD -Wall -Wextra -I$(INC_DIR)
LINKFLAGS := -no-pie

#PHONY se utiliza para nombrar a los objetivos para que no se confundan con archivos
.PHONY: all clean say_hello fortune fullclean run

all: $(BIN_DIR)/$(TARGET)


$(BIN_DIR)/$(TARGET): $(OBJS)
#	@echo "Linking and producing the ${TARGET} application"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LINKFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
#	@echo "Compiling the ${<} file"
	@mkdir -p $(OBJ_DIR)
	$(CC) -c $(CFLAGS) $< -o $@

-include $(OBJ_DIR)/*.d

clean:
	@echo "Removing bin files and object files."
	@$(RM) $(BIN_DIR)/* $(OBJ_DIR)/*
	
fullclean:
	@echo "Removing files and folders."
	@$(RM) -r $(BIN_DIR) $(OBJ_DIR)
	
run: all
	$(BIN_DIR)/$(TARGET)

say_hello:
	@echo "Hello World"

fortune:
	@fortune