CFLAGS := -Wall -Wextra
LINKFLAGS := -no-pie
CC := gcc
target := final
objs := main.o hello.o

#PHONY se utiliza para nombrar a los objetivos que no producen archivos
.PHONY = all clean say_hello fortune

all: $(target)

deps := $(patsubst %.o,%.d,$(objs))
-include $(deps)
DEPFLAGS = -MMD -MF $(@:.o=.d)

$(target): $(objs)
	@echo "Linking and producing the ${target} application"
	@$(CC) $(LINKFLAGS) -o $@ $^

%.o: %.c
	@echo "Compiling the ${<} file"
	@$(CC) $(CFLAGS) -c $< $(DEPFLAGS)

clean:
	@echo "Removing everything but the source files"
	@rm -f $(target) $(objs) $(deps)

say_hello:
	@echo "Hello World"

fortune:
	@fortune