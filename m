From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 7 Jun 2017 16:35:50 +0000
Subject: [PATCH] arc: Remove sometimes misleading toolchain check
In-Reply-To: <09e88740-9aa5-0526-abc3-9374fc9af5e9@synopsys.com>
References: <1495733045-18736-1-git-send-email-abrodkin@synopsys.com>
 <09e88740-9aa5-0526-abc3-9374fc9af5e9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496853349.18628.35.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-06-07@09:33 -0700, Vineet Gupta wrote:
> On 05/25/2017 10:24 AM, Alexey Brodkin wrote:
> > 
> > Thinking of a toolchains for ARCompact and ARCv2 ISAs we implicitly
> > think about libgcc.a build for one of those ISAs which we're linking
> > with. And given there's no multiarch uClibc toolchain for ARC
> > (as probably for any other architecture) the assumption is the only way
> > to get libgcc.a for desired ISA is from a toolchain built right for that
> > same ISA.
> > 
> > So what we do we check what's GCC's default architecture ARC700 or not.
> > But generally speaking default arch makes not a lot of sense if explicit
> > command line option exist like "-mcpu=archs". In other words exactly the
> > same GCC might build executables for both ARC700 and ARC HS38.
> > 
> > But in real life libgcc could be easily built on a separate step
> > independently of the compiler and friends. And that really happens.
> > 
> > For example OpenEmbedded prefers to reuse the same toolchain for both
> > arches having libgcc built separately.
> 
> So this is a goodness of OE. But unfortunately those of living with simpler build?
> systems: Synopsys toolchain scripts or even Buildroot don't have this - right ?
> 
> So how will it help other developers avoid errors in the work flow when doing?
> kernel builds for ARCompact and ARCv2.
> 
> The right solution is to kill off the libgcc dependency altogether form kernel.?
> Just import math emulation code that we think is needed and build it in kernel !

Right and that's on my todo list as I'm suffering the most from this issue now :)

-Alexey
