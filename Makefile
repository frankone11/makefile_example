CFLAGS := -MMD -Wall -Wextra
LINKFLAGS := -no-pie
CC := gcc
RM := rm -f
TARGET := final
OBJS := main.o \
	hello.o

#PHONY se utiliza para nombrar a los objetivos para que no se confundan con archivos
.PHONY: all clean say_hello fortune

all: $(TARGET)


$(TARGET): $(OBJS)
	@echo "Linking and producing the ${target} application"
	@$(CC) $(LINKFLAGS) -o $@ $^

%.o: %.c
	@echo "Compiling the ${<} file"
	@$(CC) -c $(CFLAGS) $<

-include *.d

clean:
	@echo "Removing everything but the source files"
	@${RM} $(TARGET) $(OBJS) *.d

say_hello:
	@echo "Hello World"

fortune:
	@fortune