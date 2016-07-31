OBJECTS := cache.o calling.o calling_wrapper.o context.o env.o function.o kplugs.o memory.o stack.o vm.o


ifneq ($(KERNELRELEASE),)
    obj-m := kplugs_$(MODE).o
    kplugs_$(MODE)-objs := $(OBJECTS)
else
    KDIR := /lib/modules/`uname -r`/build


MAKECMD := make -C $(KDIR) M=$$PWD
CPPFLAGS := -Wall -x assembler-with-cpp

all:
ifeq ($(MODE),release)
	$(MAKECMD)
	$(MAKECMD) modules_install
else
	$(MAKECMD) EXTRA_CFLAGS="-DDEBUG"
	$(MAKECMD) EXTRA_CFLAGS="-DDEBUG" modules_install
endif

clean:
	$(MAKECMD) clean

endif
