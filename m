From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 2 Sep 2019 12:19:26 +0000
Subject: [PATCH] arc: libgcc: Import __udivdi3 & __udivmoddi4 to allow
 64-bit division
In-Reply-To: <20190902094244.486-1-abrodkin@synopsys.com>
References: <20190902094244.486-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120181BC11EC8754DCDE5F2A1BE0@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi,

> -----Original Message-----
> From: Alexey Brodkin <abrodkin at synopsys.com>
> Sent: Monday, September 2, 2019 12:43 PM
> To: u-boot at lists.denx.de
> Cc: uboot-snps-arc at synopsys.com; linux-snps-arc at lists.infradead.org; Alexey Brodkin
> <abrodkin at synopsys.com>; Kever Yang <kever.yang at rock-chips.com>
> Subject: [PATCH] arc: libgcc: Import __udivdi3 & __udivmoddi4 to allow 64-bit division
> 
> As reported by Kever here [1] we were unable to compile 64-bit division
> code due to missing definition of __udivdi3().
> 
> Import its implementation and __udivmoddi4() as its direct dependency
> from today's libgcc [2].
> 
> [1] https://patchwork.ozlabs.org/patch/1146845/
> [2] https://github.com/gcc-mirror/gcc/commit/5d8723600bc0eed41226b5a6785bc02a053b45d5
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Kever Yang <kever.yang at rock-chips.com>

For the record for EM SDP (emsdp_defconfig) building still
fails this way:
----------------------------->8-------------------------
arc-linux-ld.bfd: arch/arc/lib/lib.a(libgcc2.o): in function `__udivmoddi4':
.../arch/arc/lib/libgcc2.c:195: undefined reference to `__clzdi2'
arc-linux-ld.bfd: .../arch/arc/lib/libgcc2.c:195: undefined reference to `__clzdi2'
arc-linux-ld.bfd: .../arch/arc/lib/libgcc2.c:196: undefined reference to `__clzdi2'
arc-linux-ld.bfd: .../arch/arc/lib/libgcc2.c:196: undefined reference to `__clzdi2'
----------------------------->8-------------------------

That happens because we use a very simple -mcpu=arcem which doesn't use
HW normalizer unit. I'm preparing a patch that will improve EM SDP's compiler
options.

-Alexey
