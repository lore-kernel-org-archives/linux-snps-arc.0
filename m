From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 23 Nov 2016 19:40:15 +0000
Subject: [PATCH 3/6] arc: Use full path in KBUILD_IMAGE definition
In-Reply-To: <20161122213434.14788-3-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com>
 <20161122213434.14788-3-mmarek@suse.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479929955.3931.28.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michal,

On Tue, 2016-11-22@22:34 +0100, Michal Marek wrote:
> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
> expect it to point to the image file in the build directory. The
> builddeb script has a workaround for architectures which only provide
> the basename, but let's provide a clean interface for packaging tools.
> 
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Michal Marek <mmarek at suse.com>
> ---
> ?arch/arc/Makefile | 4 ++--
> ?1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 19cce226d1a8..44ef35d33956 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -123,9 +123,9 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
> ?boot		:= arch/arc/boot
> ?
> ?#default target for make without any arguments.
> -KBUILD_IMAGE	:= bootpImage
> +KBUILD_IMAGE	:= $(boot)/bootpImage
> ?
> -all:	$(KBUILD_IMAGE)
> +all:	bootpImage
> ?bootpImage: vmlinux
> ?
> ?boot_targets += uImage uImage.bin uImage.gz

I tried to find any examples on how that?KBUILD_IMAGE thingy is used
but to no avail. It looks like for ARC "bootpImage" makes not much
sense and if you really want to get something useful in .deb/.rpm
most probably something like below may work much better:
------------------------>8--------------------------
KBUILD_IMAGE	:= $(boot)/uImage
------------------------>8--------------------------

And I don't know context of KBUILD_IMAGE usage but in
case of ARC our default target is "vmlinux" so I'm not sure then if
KBUILD_IMAGE may point to non-default target.

For example in "arch/avr32/Makefile" I see more complicated construction:
------------------------>8--------------------------
? ? ? ? ? ? ?KBUILD_IMAGE := $(boot)/uImage
vmlinux.elf: KBUILD_IMAGE := $(boot)/vmlinux.elf
vmlinux.cso: KBUILD_IMAGE := $(boot)/vmlinux.cso
uImage.srec: KBUILD_IMAGE := $(boot)/uImage.srec
uImage:??????KBUILD_IMAGE := $(boot)/uImage
------------------------>8--------------------------
and may imagine that we need something similar for ARC obviously with
default being "$(boot)/vmlinux".

-Alexey
