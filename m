From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 2 Aug 2017 08:03:57 +0000
Subject: [PATCH] arc: arcv2: cache: Explicitly set MSB counterpart of
 region ops addresses
In-Reply-To: <2f6ba6bb-ae07-0ff9-c2ff-0f162eab2ef0@synopsys.com>
References: <20170801095847.6425-1-abrodkin@synopsys.com>
 <2f6ba6bb-ae07-0ff9-c2ff-0f162eab2ef0@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1501661036.6345.15.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-08-02@09:09 +0530, Vineet Gupta wrote:
> On 08/01/2017 03:29 PM, Alexey Brodkin wrote:
> > 
> > It is necessary to explicitly set both SLC_AUX_RGN_START1 and SLC_AUX_RGN_END1
> > which hold MSB bits of the physical address correspondingly of region start
> > and end otherwise SLC region operation is executed in unpredictable manner,
> > for example on HSDK platform where PAE40 support exists in hardware
> > we saw each and every SLC region op to take seconds (sic!).
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Reported-by: Vladimir Kondratiev <vladimir.kondratiev at intel.com>
> > ---
> > ? arch/arc/include/asm/cache.h | 2 ++
> > ? arch/arc/mm/cache.c??????????| 8 ++++++--
> > ? 2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
> > index 35127ad95124..1f3c2f967471 100644
> > --- a/arch/arc/include/asm/cache.h
> > +++ b/arch/arc/include/asm/cache.h
> > @@ -91,7 +91,9 @@ extern unsigned long perip_base, perip_end;
> > ? #define ARC_REG_SLC_FLUSH	0x904
> > ? #define ARC_REG_SLC_INVALIDATE	0x905
> > ? #define ARC_REG_SLC_RGN_START	0x914
> > +#define ARC_REG_SLC_RGN_START1	0x915
> > ? #define ARC_REG_SLC_RGN_END	0x916
> > +#define ARC_REG_SLC_RGN_END1	0x917
> > ??
> > ? /* Bit val in SLC_CONTROL */
> > ? #define SLC_CTRL_DIS		0x001
> > diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> > index b7a1face1584..0b4e2650c5de 100644
> > --- a/arch/arc/mm/cache.c
> > +++ b/arch/arc/mm/cache.c
> > @@ -580,6 +580,7 @@ noinline void slc_op(phys_addr_t paddr, unsigned long sz, const int op)
> > ??	static DEFINE_SPINLOCK(lock);
> > ??	unsigned long flags;
> > ??	unsigned int ctrl;
> > +	phys_addr_t end;
> > ??
> > ??	spin_lock_irqsave(&lock, flags);
> > ??
> > @@ -609,8 +610,11 @@ noinline void slc_op(phys_addr_t paddr, unsigned long sz, const int op)
> > ??	?* END needs to be setup before START (latter triggers the operation)
> > ??	?* END can't be same as START, so add (l2_line_sz - 1) to sz
> > ??	?*/
> > -	write_aux_reg(ARC_REG_SLC_RGN_END, (paddr + sz + l2_line_sz - 1));
> > -	write_aux_reg(ARC_REG_SLC_RGN_START, paddr);
> > +	end = paddr + sz + l2_line_sz - 1;
> > +	write_aux_reg(ARC_REG_SLC_RGN_END1, upper_32_bits(end));
> > +	write_aux_reg(ARC_REG_SLC_RGN_END, lower_32_bits(end));
> > +	write_aux_reg(ARC_REG_SLC_RGN_START1, upper_32_bits(paddr));
> > +	write_aux_reg(ARC_REG_SLC_RGN_START, lower_32_bits(paddr));
> 
> Are these registers present even if PAE is not configured in hardware ?

Apparently no :(

I did test it on AXS103 but just now realized its latest firmware has PAE40.
Retested on older firmware (still with HS 2.1) without PAE and indeed those
AUX registers are not implemented:
----------------------->8----------------------
ehci-platform e0040000.ehci: new USB bus registered, assigned bus number 1
Path: (null)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.13.0-rc1-next-20170718-00001-g6f0be43cd25b-dirty #1
task: 9f02ba80 task.stack: 9f02c000

[ECR???]: 0x00020000 => Illegal Insn
[EFA???]: 0x8020bba2
[BLINK ]: slc_op+0x1a/0xac
[ERET??]: slc_op+0x4a/0xac
[STAT32]: 0x00080802 :???K?????
BTA: 0x8020bb80??SP: 0x9f02dd88??FP: 0x00000000
LPS: 0x80670da4 LPE: 0x80670db8 LPC: 0x00000000
r00: 0x00000031 r01: 0x00002000 r02: 0x9f38403f
r03: 0x00000917 r04: 0x00000031 r05: 0x9f38a5c0
r06: 0x9f0baf0d r07: 0x9f0baf0c r08: 0x00000000
r09: 0x00000000 r10: 0x00000000 r11: 0x80808080
r12: 0x8020bb72

Stack Trace:
? slc_op+0x4a/0xac
? arc_dma_alloc+0x7c/0xd8
? dma_pool_alloc+0x186/0x1d0
? ehci_qh_alloc+0x34/0xd4
? ehci_setup+0x15c/0x420
? ehci_platform_reset+0x48/0x68
? usb_add_hcd+0x186/0x624
? ehci_platform_probe+0x210/0x514
? platform_drv_probe+0x26/0x64
? really_probe+0x284/0x348
? __driver_attach+0xac/0xd4
? bus_for_each_dev+0x38/0x70
? bus_add_driver+0xc0/0x180
? driver_register+0x50/0xec
? do_one_initcall+0x32/0x118
? kernel_init_freeable+0x108/0x198
----------------------->8----------------------

So I'll respin this patch with conditional setup of those regs
depending on PAE40 presence.

-Alexey
