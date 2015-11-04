From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 4 Nov 2015 17:26:28 +0530
Subject: [PATCH] Arc: fix entry point calculation for locales other than
 english
In-Reply-To: <1446572099-2450-1-git-send-email-ltrimas@synopsys.com>
References: <1446572099-2450-1-git-send-email-ltrimas@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5639F26C.90007@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 03 November 2015 11:04 PM, Lada Trimasova wrote:
> The problem was detected while making uImage.
> To find the line with entry point address in the result
> of the "readelf -h vmlinux" command "grep ENTRY POINT" is used.
> 
> But if the operating system locale is not english,
> command readelf returns lines in local language.
> 
> Grep cannot find the line which contains "ENTRY POINT" in english.
> Our decision uses readelf key which displays the symbol table.
> Using grep _stext it finds the line with entry point in this table.
> 
> Signed-off-by: Lada Trimasova <ltrimas at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/boot/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arc/boot/Makefile b/arch/arc/boot/Makefile
> index e597cb34..fa89a47 100644
> --- a/arch/arc/boot/Makefile
> +++ b/arch/arc/boot/Makefile
> @@ -6,8 +6,7 @@ targets := vmlinux.bin vmlinux.bin.gz uImage
>  
>  OBJCOPYFLAGS= -O binary -R .note -R .note.gnu.build-id -R .comment -S
>  
> -LINUX_START_TEXT = $$(readelf -h vmlinux | \
> -			grep "Entry point address" | grep -o 0x.*)
> +LINUX_START_TEXT = $$(readelf -s vmlinux | grep _stext | awk '{print $$2}')


This seems too fragile. You are assuming _stext will be the entry point which I
recently changed and merged in Linux tree for 4.4-rc1.

See commit 3971cdc202f638f252e39316d42492ace04cc1b1
"ARC: boot: Support Halt-on-reset and Run-on-reset SMP booting modes"

And even if we change ur patch to use re_Service, it is still not future proof. We
need to somehow rely on elf header for this !

I do see your problem but lets us see how other arches do it !

>  
>  UIMAGE_LOADADDR    = $(CONFIG_LINUX_LINK_BASE)
>  UIMAGE_ENTRYADDR   = $(LINUX_START_TEXT)
> 
