From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 1 Feb 2017 17:14:08 +0000
Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
In-Reply-To: <8b857bc4-71f0-9b3b-0cd5-19b49edb2910@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
 <1485967373-15273-2-git-send-email-abrodkin@synopsys.com>
 <8b857bc4-71f0-9b3b-0cd5-19b49edb2910@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485969247.5515.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-02-01@08:52 -0800, Vineet Gupta wrote:
> On 02/01/2017 08:42 AM, Alexey Brodkin wrote:
> > 
> > In recent VDKs ARC cores are configured as "run on reset"
> > which made existing kernel configuration outdated to effect that
> > slave cores never start execution of the code keeping only master
> > online.
> > 
> > With that fix we're again in sync with VDK platform.
> > 
> > And while at it we regenerate defconfig via savedefconfig so default
> > options are now excluded.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > ---
> > ?arch/arc/configs/vdk_hs38_smp_defconfig | 4 +---
> > ?1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
> > index 573028f19de7..f6361de41eec 100644
> > --- a/arch/arc/configs/vdk_hs38_smp_defconfig
> > +++ b/arch/arc/configs/vdk_hs38_smp_defconfig
> > @@ -15,7 +15,7 @@ CONFIG_ARC_PLAT_AXS10X=y
> > ?CONFIG_AXS103=y
> > ?CONFIG_ISA_ARCV2=y
> > ?CONFIG_SMP=y
> > -# CONFIG_ARC_TIMERS_64BIT is not set
> 
> Are you sure abut this part. Ater the timers driver rework, this would enable GFRC
> for SMP builds and AFAIKR there were some issues with time with GFRC + nSIM etc..

Not anymore :)

Probably I missed something in discussions.
As a matter of fact I did run-test resulting vmlinux and it worked very nice.
More over?ARC_TIMERS_64BIT is selected automatically by?ISA_ARCV2, see
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Kconfig#n119

That said even if "# CONFIG_ARC_TIMERS_64BIT is not set" is left in place the option will be
effectively enabled, no?

-Alexey
