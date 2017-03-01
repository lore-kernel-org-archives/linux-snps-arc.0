From: Anton.Kolesov@synopsys.com (Anton Kolesov)
Date: Wed, 1 Mar 2017 18:57:15 +0000
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <1488392734.4659.54.camel@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B135829452A@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi everyone,

> > > That's more of a question for Waldemar: does it really makes sense
> > > to have defconfigs for each architecture? I mean how do they differ
> > > between each other?
> > >
> > > For example, the ARC arcv2_defconfig and defconfig only differ by
> > > the option CONFIG_ARC_CPU_HS, whose only purpose is to pass -
> mcpu=archs.
> > > Shouldn't be the solution used on ARM (removing all options to
> > > select the compiler flags, and leave it to the user to pass the
> > > appropriate
> > > options) be used as well ?
> >
> > Yeah that would work fine I guess !
> 
> That means for building of our toolchain we'll need to have separately stored
> "defconfigs" in some form. Let's see what Anton says on that :)
> 
> And regardless of what mr Anton says having off-the-tree defconfigs is not
> the best idea because with time options will go in and out and occasionally
> we'll have outdated defconfigs.

[AK] Not specifying architecture via uClibc config file is good for me - I
wanted this long ago, since I never understood why current approach was used in
the first place.

Out-of-tree defconfigs are not good, because it is not clear who would update
them in time. In addition that would create an additional coupling between
toolchain build scripts and uClibc - they now should be always synchronized,
which is a bad design.  Defconfigs should be part of uClibc, toolchain build
scripts (and other uClibc builders) would just select one by its name - less
coupling, easier maintenance.

IMHO it should be OK to increase capabilities of prebuilt toolchain, that
Synopsys provides, to it would do more out of the box, at the expense of extra
bloat - it is not possible to please everyone, anyway. Those users, who are not
happy with "bloated" tools, can build tools themselves with configuration they
need. That said, I think there should be some common sense in what are the
features being enabled. I'd suggest that "full" feature configuration should
enable those features which are required by at least one package in Buildroot
or there is some another clearly defined user of it. If we don't know where
feature is used - why enable it?

Anton

> 
> > >
> > > So, are they really useful? Shouldn't uclibc-ng instead come with
> > > just one or two defconfigs, like a "minimal" one and "full-featured" one?
> >
> > totally agree and I've historically been pushing back on patches from
> > Alexey et all where we wanted to enable toggles to get buildroot packages
> building.
> 
> Those changes I made to make sure our prebuilt toolchain is useful for
> building more packages. I.e. to be in one camp with Mentor's (AKA
> CodeSourcery) prebuilt tools that are really capable.
> 
> > That was
> > a fair requirement on their part but it kept bloating uClibc for our
> > typical embedded use. But this idea of minimal vs. full featured is exactly
> what we need.
> > @Alexey / @vlad can we take this up please !
> 
> Probably Waldemar's opinion might be useful here.
> @Waldemar are there any plans for busting arch-specific defconfigs in favor
> to generic defconfigs like those "minimal" and "full" mentioned above?
> 
> -Alexey
