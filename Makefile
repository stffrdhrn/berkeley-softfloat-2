
ARCH = 386-Win32-GCC
VPATH = ./include/$(ARCH)

OBJ = .o
# When on windows
#EXE = .exe
INCLUDES = -I. -I./include/$(ARCH)
COMPILE_C = gcc -c -o $@ $(INCLUDES) -O2
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
