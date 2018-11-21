From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 21 Nov 2018 19:01:01 +0000
Subject: [PATCH] arc: [devboards] Add support of NFSv3 ACL
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501464156CB@US01WEMBX2.internal.synopsys.com>
References: <20181120103019.12852-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501464156CB@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE6468198C3B@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta
> Sent: Wednesday, November 21, 2018 8:40 PM
> To: Alexey Brodkin <abrodkin at synopsys.com>; linux-snps-arc at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org; Cupertino Miranda <cmiranda at synopsys.com>; stable at vger.kernel.org
> Subject: Re: [PATCH] arc: [devboards] Add support of NFSv3 ACL
> 
> On 11/20/18 2:30 AM, Alexey Brodkin wrote:
> > By default NFSv3 doesn't support ACL (Access Control Lists)
> > which might be quite convenient to have so that
> > mounted NFS behaves exactly as any other local file-system.
> >
> > In particular missing support of ACL makes umask useless.
> > This among other thigs fixes Glibc's "nptl/tst-umask1".
> >
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Cupertino Miranda <cmiranda at synopsys.com>
> > Cc: stable at vger.kernel.org
> 
> What is this fixing in the kernel, for this to be stable backported  ?

It fixing not kernel problem indeed but user-space providing
complete ACL-enabled NFS share support. IMHO we should have had
that enabled with basic NFS support back in the day.

Part of the problem is ACL is not an essential part of NFSv3 spec and so
it is implemented as an option though I don't see a lot of sense in having
incomplete UNIX file-system even though for most of cases it works OK.

> > ---
> >  arch/arc/configs/axs101_defconfig          | 1 +
> >  arch/arc/configs/axs103_defconfig          | 1 +
> >  arch/arc/configs/axs103_smp_defconfig      | 1 +
> >  arch/arc/configs/hsdk_defconfig            | 1 +
> >  arch/arc/configs/nps_defconfig             | 1 +
> >  arch/arc/configs/nsimosci_defconfig        | 1 +
> >  arch/arc/configs/nsimosci_hs_defconfig     | 1 +
> >  arch/arc/configs/nsimosci_hs_smp_defconfig | 1 +
> >  arch/arc/configs/vdk_hs38_defconfig        | 1 +
> >  arch/arc/configs/vdk_hs38_smp_defconfig    | 1 +
> 
> I understand a sweeping change is easy, more consistent so a good guiding
> principel in general. But really all these defconfigs need NFS ? We keep on
> increasing the bloat with this. IMHO we should update only relevant defconfigs.

Well my point is in having similarly equipped platforms so that we may rely on
results we're getting on all of them. Thus all platforms supporting networking
got that update.

Maybe NPS is not that important as we most probably not going to use it
for verification of anything so this one could be dropped.

Speaking about bloat...
------------------------------------->8-----------------------------------
# git grep NFS torvalds/master arch/arc/configs/ | grep nsim_
torvalds/master:arch/arc/configs/nsim_700_defconfig:57:CONFIG_NFS_FS=y
torvalds/master:arch/arc/configs/nsim_hs_defconfig:58:CONFIG_NFS_FS=y
torvalds/master:arch/arc/configs/nsim_hs_smp_defconfig:57:CONFIG_NFS_FS=y
------------------------------------->8-----------------------------------

It's a nonsense I guess as obviously there's no way to have networking on
pure nSIM platforms, right? And that I'm going to clean-up in a separate patch.

As for other boards I realize that we add more config options over time
but that's how we make them more useful and capable.
Moreover since we're talking about _defconfigs_ here I guess there're
many other options we don't touch but they still change so over time
we still cannot compare the same defconfigs as apples vs apples.

-Alexey
