From: raj.khem@gmail.com (Khem Raj)
Date: Sat, 22 Sep 2018 10:13:10 -0700
Subject: [OE-core] [PATCH v3 5/9] libgpg-error: Add ARC support
In-Reply-To: <cf9d1a3f0b8e3b7d69c61212daa029f290975fc1.camel@linuxfoundation.org>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
 <20180921142608.36203-6-abrodkin@synopsys.com>
 <cf9d1a3f0b8e3b7d69c61212daa029f290975fc1.camel@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1srdkv7OApx7uY9sQoDWs-AyjizonObUFDHVm0BKdptavA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sat, Sep 22, 2018 at 8:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-09-21@17:26 +0300, Alexey Brodkin wrote:
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Ross Burton <ross.burton at intel.com>
> > Cc: Werner Koch <wk at gnupg.org>
> > ---
> >
> > Changes v2 -> v3:
> >  * Use proper [recently upstreamed] fix for ARC Glibc toolchain
> >  * Fix compilation for x86_64 due to renamed header
> >
> > Changes v1 -> v2:
> >
> >  * Added upstream status
>
> Its still breaking on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/21/builds/72/st
> eps/7/logs/step1b
>
> I think its for i586 which needs fixing similarly to x86_64.
>
> I did pull the simpler less risky pieces in for 2.6 but this experience
> is making me nervous about the remaining patches which should perhaps
> wait until 2.7.

I think this should be fine. Lets take the ones we have going for now


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core at lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
