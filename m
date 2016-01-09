From: CARLOS.PALMINHA@synopsys.com (Carlos Palminha)
Date: Sat, 9 Jan 2016 00:25:07 +0000
Subject: [PATCH] arc: Removed local initramfs source file from axs101
 configuration.
In-Reply-To: <1452208821.18725.9.camel@synopsys.com>
References: <1451919315-18115-1-git-send-email-palminha@synopsys.com>
 <1452208821.18725.9.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56905363.3020703@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

Probably my e-mail comments before the patch mislead you...
If you download the kernel source and try to compile it, it won't work because of the INITRAMFS pointing to a non-existing directory. (check log below)

That's why that option should be removed from the standard kernel.

Regards,
C.Palminha

palminha at palminha-vm:~/src/kernels/linux-mainline-next$ make axs101_defconfig
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
palminha at palminha-vm:~/src/kernels/linux-mainline-next$ make
scripts/kconfig/conf  --silentoldconfig Kconfig
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CC      kernel/bounds.s
  CHK     include/generated/bounds.h
  CHK     include/generated/timeconst.h
  CC      arch/arc/kernel/asm-offsets.s
  CHK     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  GEN     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/sortextable
  CC      init/main.o
  CHK     include/generated/compile.h
  CC      init/version.o
  CC      init/do_mounts.o
  CC      init/do_mounts_initrd.o
  LD      init/mounts.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  LD      init/built-in.o
  HOSTCC  usr/gen_init_cpio
  ./scripts/gen_initramfs_list.sh: Cannot open '../arc_initramfs/'
usr/Makefile:73: recipe for target 'usr/initramfs_data.cpio.gz' failed
make[1]: *** [usr/initramfs_data.cpio.gz] Error 1
Makefile:943: recipe for target 'usr' failed
make: *** [usr] Error 2
palminha at palminha-vm:~/src/kernels/linux-mainline-next$ 


On 07-01-2016 23:20, Alexey Brodkin wrote:
> Hi Carlos,
> 
> On Mon, 2016-01-04@14:55 +0000, palminha@synopsys.com wrote:
>> From: Carlos Palminha <palminha at synopsys.com>
>>
>> Cannot compile kernel with INITRAMFS SOURCE option.
>> Please move this option to a buildroot patch.
> 
> First of all if your problem is only related to Buildroot then
> there's not much sense in adding linux-snps-arc at lists.infradead.org
> which is used for pure Linux kernel discussions.
> 
> Then even in case of Buildroot CONFIG_INITRAMFS_SOURCE could be a problem
> only if you don't set Buildroot's BR2_TARGET_ROOTFS_INITRAMFS=y, see
> how it is done in snps_axs101_defconfig here
> https://git.busybox.net/buildroot/tree/configs/snps_axs101_defconfig#n7
> 
> What happens if BR2_TARGET_ROOTFS_INITRAMFS=y then existing in kernel's
> defconfig CONFIG_INITRAMFS_SOURCE gets overridden with new value, see
> https://git.busybox.net/buildroot/tree/linux/linux.mk#n217
> 
> Now if you really want to not use built-in kernel initramfs then simplest
> thing to do is to run "make linux-menuconfig" from your Buildroot's folder
> and disable or set with nothing CONFIG_INITRAMFS_SOURCE.
> 
> -Alexey
> 
