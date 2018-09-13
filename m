From: robh@kernel.org (Rob Herring)
Date: Thu, 13 Sep 2018 16:04:00 -0500
Subject: [PATCH] ARC: Get rid of toolchain check
In-Reply-To: <20180913202428.7284-1-abrodkin@synopsys.com>
References: <20180913202428.7284-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CABGGisxY5yLxT1QDQYOOQYJEJ+Wx8uK3ZmSvPEqvYyfAHbhScQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Sep 13, 2018 at 3:24 PM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> This check is very naive: we simply test if GCC invoked without
> "-mcpu=XXX" has ARC700 define set. In that case we think that GCC
> was built with "--with-cpu=arc700" and has libgcc built for ARC700.
>
> Otherwise if ARC700 is not defined we think that everythng was built
> for ARCv2.
>
> But in reality our life is much more interesting.
>
> 1. Regardless of GCC configuration (i.e. what we pass in "--with-cpu"
>    it may generate code for any ARC core).
>
> 2. libgcc might be built with explicitly specified "--mcpu=YYY"
>
> That's exactly what happens in case of multilibbed toolchains:
>  - GCC is configured with default settings
>  - All the libs built for many different CPU flavors
>
> I.e. that check gets in the way of usage of multilibbed
> toolchains. And even non-multilibbed toolchains are affected.
> OpenEmbedded also builds GCC without "--with-cpu" because
> each and every target component later is compiled with explicitly
> set "-mcpu=ZZZ".
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/Makefile | 14 --------------
>  1 file changed, 14 deletions(-)

+1 for this. Removing it also helps with my work to be able to build
all the .dts files with only a host compiler. That also needs the hunk
setting CROSS_COMPILE removed and not having a built-in dtb by
default, but this is a step in the right direction.

Acked-by: Rob Herring <robh at kernel.org>

Rob
