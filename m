From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 1 Mar 2017 18:25:35 +0000
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488392734.4659.54.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-03-01@10:00 -0800, Vineet Gupta wrote:
> On 03/01/2017 07:25 AM, Thomas Petazzoni wrote:
> > 
> > Hello,
> > 
> > On Tue, 28 Feb 2017 22:02:27 +0300, Vlad Zakharov wrote:
> > > 
> > > This commit enables getpt() support in ARC defconfigs as some packages
> > > need it. E.g. we need this to be able to build xterm package as it uses
> > > getpt().
> > > 
> > > As an example I can refer to buildroot autobuilds where xterm build is
> > > failing when using prebuilt ARC toolchain (which in its turn uses uClibc
> > > without getpt() support):
> > > https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_28a_28a92049a6ceef005787c5779f77ecf3fe8ad642_build-2Dend.log
> > > &d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=ziY-j5w_cIfohygKzr-OKfk6T_9nr9g3b-
> > > kimHZMkxg&s=Bi2mbuDCVZlzqIZy-ahLFXcNKXbqMMobAcwsnHR99yA&e=?
> > > 
> > > Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> > > ---
> > > ?extra/Configs/defconfigs/arc/arcv2_defconfig | 1 +
> > > ?extra/Configs/defconfigs/arc/defconfig???????| 1 +
> > > ?2 files changed, 2 insertions(+)
> > That's more of a question for Waldemar: does it really makes sense to
> > have defconfigs for each architecture? I mean how do they differ
> > between each other?
> > 
> > For example, the ARC arcv2_defconfig and defconfig only differ by the
> > option CONFIG_ARC_CPU_HS, whose only purpose is to pass -mcpu=archs.
> > Shouldn't be the solution used on ARM (removing all options to select
> > the compiler flags, and leave it to the user to pass the appropriate
> > options) be used as well ?
> 
> Yeah that would work fine I guess !

That means for building of our toolchain we'll need to have
separately stored "defconfigs" in some form. Let's see what Anton says on that :)

And regardless of what mr Anton says having off-the-tree defconfigs is not the best idea
because with time options will go in and out and occasionally we'll have outdated
defconfigs.

> > 
> > So, are they really useful? Shouldn't uclibc-ng instead come with just
> > one or two defconfigs, like a "minimal" one and "full-featured" one?
> 
> totally agree and I've historically been pushing back on patches from Alexey et
> all where we wanted to enable toggles to get buildroot packages building.

Those changes I made to make sure our prebuilt toolchain is useful for building
more packages. I.e. to be in one camp with Mentor's (AKA CodeSourcery) prebuilt
tools that are really capable.

> That was
> a fair requirement on their part but it kept bloating uClibc for our typical
> embedded use. But this idea of minimal vs. full featured is exactly what we need.
> @Alexey / @vlad can we take this up please !

Probably Waldemar's opinion might be useful here.
@Waldemar are there any plans for busting arch-specific defconfigs in favor
to generic defconfigs like those "minimal" and "full" mentioned above?

-Alexey
