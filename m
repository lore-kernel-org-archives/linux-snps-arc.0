From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Thu, 20 Dec 2018 00:15:22 +0900
Subject: [PATCH] arc: remove redundant kernel-space generic-y
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075014641FC6F@US01WEMBX2.internal.synopsys.com>
References: <1544969781-14506-1-git-send-email-yamada.masahiro@socionext.com>
 <C2D7FE5348E1B147BCA15975FBA23075014641FC6F@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK7LNATJVGVJi_S99zfEpKe+HYWpk+TkfT4gCFZVVTibyP=ThA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Mon, Dec 17, 2018@2:07 PM Vineet Gupta <vineet.gupta1@synopsys.com> wrote:
>
> On 12/16/18 6:17 AM, Masahiro Yamada wrote:
> > This commit removes redundant generic-y defines in
> > arch/arc/include/asm/Kbuild.
> >
> > It is redundant to define generic-y when arch-specific implementation
> > exists in arch/$(ARCH)/include/asm/*.h
> >
> > Remove the following generic-y:
> >
> >     dma-mapping.h
> >     fb.h
> >     kmap_types.h
> >     pci.h
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>


Could you pick this up to your arc tree?


-- 
Best Regards
Masahiro Yamada
