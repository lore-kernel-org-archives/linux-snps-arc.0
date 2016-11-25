From: mmarek@suse.com (Michal Marek)
Date: Fri, 25 Nov 2016 15:21:26 +0100
Subject: [PATCH 3/6] arc: Use full path in KBUILD_IMAGE definition
In-Reply-To: <1479929955.3931.28.camel@synopsys.com>
References: <20161122213434.14788-1-mmarek@suse.com>
 <20161122213434.14788-3-mmarek@suse.com>
 <1479929955.3931.28.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f6370f48-238a-523d-fc06-d44e7a15bcad@suse.com>
To: linux-snps-arc@lists.infradead.org

Dne 23.11.2016 v 20:40 Alexey Brodkin napsal(a):
>> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
>> index 19cce226d1a8..44ef35d33956 100644
>> --- a/arch/arc/Makefile
>> +++ b/arch/arc/Makefile
>> @@ -123,9 +123,9 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
>>  boot		:= arch/arc/boot
>>  
>>  #default target for make without any arguments.
>> -KBUILD_IMAGE	:= bootpImage
>> +KBUILD_IMAGE	:= $(boot)/bootpImage
>>  
>> -all:	$(KBUILD_IMAGE)
>> +all:	bootpImage
>>  bootpImage: vmlinux
>>  
>>  boot_targets += uImage uImage.bin uImage.gz
> 
> I tried to find any examples on how that KBUILD_IMAGE thingy is used
> but to no avail.

Ho Alexey,

see scripts/pacakge/{builddeb,buildtar,mkspec}. mkspec calls make
image_name, which in turn outputs $KBUILD_IMAGE.


> It looks like for ARC "bootpImage" makes not much
> sense and if you really want to get something useful in .deb/.rpm
> most probably something like below may work much better:
> ------------------------>8--------------------------
> KBUILD_IMAGE	:= $(boot)/uImage
> ------------------------>8--------------------------
> 
> And I don't know context of KBUILD_IMAGE usage but in
> case of ARC our default target is "vmlinux" so I'm not sure then if
> KBUILD_IMAGE may point to non-default target.

Right, this will not work for make rpm-pkg, since it calls make with no
explicit target and expects the file pointed to by KBUILD_IMAGE to exist
afterward. This will work if you also change the 'all' target to depend
on uImage.


> For example in "arch/avr32/Makefile" I see more complicated construction:
> ------------------------>8--------------------------
>              KBUILD_IMAGE := $(boot)/uImage
> vmlinux.elf: KBUILD_IMAGE := $(boot)/vmlinux.elf
> vmlinux.cso: KBUILD_IMAGE := $(boot)/vmlinux.cso
> uImage.srec: KBUILD_IMAGE := $(boot)/uImage.srec
> uImage:      KBUILD_IMAGE := $(boot)/uImage
> ------------------------>8--------------------------

Right, but the packaging targets will only build and package uImage. The
other redefinitions are there only for the avr32 install rule:

install: vmlinux
	$(Q)$(MAKE) $(build)=$(boot) BOOTIMAGE=$(KBUILD_IMAGE) $@


> and may imagine that we need something similar for ARC obviously with
> default being "$(boot)/vmlinux".

What some other architectures do is that the image format is selected
via Kconfig and not on the make command line. E.g. arm and sh do this.

Michal
