From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 8 Feb 2019 15:29:31 +0000
Subject: [linux-yocto] [PATCH] ARC: Add nsimhs- and hsdk-standard configs
In-Reply-To: <CADkTA4Ny7Q5-+68HS8bwDfa3sx86YA3kMZMmLwoDDNMNk2Gq0A@mail.gmail.com>
References: <20190208142940.12691-1-abrodkin@synopsys.com>
 <CADkTA4Ny7Q5-+68HS8bwDfa3sx86YA3kMZMmLwoDDNMNk2Gq0A@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64681D6925@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bruce,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> On Behalf Of Bruce Ashfield
> Sent: Friday, February 8, 2019 6:16 PM
> To: Alexey Brodkin <alexey.brodkin at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org; Development list for the linux-yocto repositories <linux-
> yocto at yoctoproject.org>; Khem Raj <raj.khem at gmail.com>
> Subject: Re: [linux-yocto] [PATCH] ARC: Add nsimhs- and hsdk-standard configs
> 
> On Fri, Feb 8, 2019 at 9:29 AM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> >
> > With ARC support ramping-up in upstream OE we're ready to
> > build more complicated distributions and linux-yocto is
> > a nice and configurable base for that.
> >
> > This commit adds support of 1 simulated board (nSIM) and
> > the mast affordable and powerful to date development board (HSDK).
> >
> > Once Qemu port for ARC is functional (it's being actively developed now)
> > we'll switch from nSIM to Qemu.
> >
> > Still it would be really good to keep nSIM support in linux-yocto for now
> > as it allows for simpler testing as compared to real HW.
> 
> Looks good to me, the configs make sense and are clean.
> 
> I'd put this on master so it would be available for the 5.x -dev
> kernel (and then any
> future versions I release). If you want to test it on other versions
> (i.e. 4.19), let me
> know and I can put it there as well.

Well I prepared those based on 4.19 branch so I know it works there.

Now given 4.19 is the most recent LTS kernel is there a sense in adding these
configs in 4.19 or OE/Yocto-wise 4.19 is no different than any other version?

Given linux-yocto might be a base for many different projects I'd like to make
sure ARC boards are available there so there will be an easy way to build and
run basic stuff.

-Alexey
