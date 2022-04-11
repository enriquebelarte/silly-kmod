obj-m += silly.o

ifndef KVER
KVER=$(shell uname -r)
endif

ifndef KMODVER
KMODVER=$(shell git describe HEAD 2>/dev/null || git rev-parse --short HEAD)
endif

buildprep:
	yum install -y gcc kernel-{core,devel,modules}-$(KVER) elfutils-libelf-devel
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) EXTRA_CFLAGS=-DKMODVER=\\\"$(KMODVER)\\\" modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
install:
	install -v -m 755 -d /lib/modules/$(KVER)/
	install -v -m 644 silly.ko        /lib/modules/$(KVER)/silly.ko
	depmod -a

