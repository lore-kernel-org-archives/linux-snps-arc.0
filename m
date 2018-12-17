From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 17 Dec 2018 05:00:37 +0000
Subject: [PATCH] arc: remove redundant kernel-space generic-y
References: <1544969781-14506-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641FC6F@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/16/18 6:17 AM, Masahiro Yamada wrote:
> This commit removes redundant generic-y defines in
> arch/arc/include/asm/Kbuild.
>
> It is redundant to define generic-y when arch-specific implementation
> exists in arch/$(ARCH)/include/asm/*.h
>
> Remove the following generic-y:
>
>     dma-mapping.h
>     fb.h
>     kmap_types.h
>     pci.h
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>

Acked-by: Vineet Gupta <vgupta at synopsys.com>
