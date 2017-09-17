
ARCH = 386-Win32-GCC
VPATH = ./include/$(ARCH)

OBJ = .o
# When on windows
#EXE = .exe
INCLUDES = -I. -I./include/$(ARCH)
CFLAGS = $(INCLUDES) -O2 -Wall -Werror
COMPILE_C = gcc -c -o $@ $(INCLUDES) $(CFLAGS)
LINK = gcc -o $@

ALL: softfloat$(OBJ) timesoftfloat$(EXE)

softfloat$(OBJ): milieu.h softfloat.h softfloat-specialize softfloat-macros softfloat.c
	$(COMPILE_C) softfloat.c

timesoftfloat$(OBJ): milieu.h softfloat.h timesoftfloat.c
	$(COMPILE_C) timesoftfloat.c

timesoftfloat$(EXE): softfloat$(OBJ) timesoftfloat$(OBJ)
	$(LINK) softfloat$(OBJ) timesoftfloat$(OBJ)

clean:
	rm -f *$(OBJ) timesoftfloat$(EXE)
