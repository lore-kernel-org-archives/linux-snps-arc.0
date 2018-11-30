From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 30 Nov 2018 19:00:05 +0000
Subject: [PATCH v2] ARC: io.h: Implement reads{x}()/writes{x}()
References: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
 <ff1e11923e92405d883474d715008c0a@AcuMS.aculab.com>
 <89122bd8-bca2-2ae1-0dd0-160abbebcace@synopsys.com>
 <d2d133e5-267c-c42a-7329-22892bbbdee4@synopsys.com>
 <CAK8P3a2U3ft3crF2SiAuc=PQdDooEUaVAN9gQDyxsxvBn5+xRw@mail.gmail.com>
 <57437493-31bb-eced-032c-1f54470b030e@synopsys.com>
 <CAK8P3a2mqEb4_F4wB1DvL5jJJobLhOg6-bW3ZDNGhvbv-_qW3A@mail.gmail.com>
 <3afe0e1bbf2d42d3bb178ec789553c28@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641A413@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/30/18 5:57 AM, David Laight wrote:
> There're even identical opcodes...
> The barrier() (etc) in the asm output probably stopped the optimisation.
>
> It also seems to have used a different type of loop to the
> other example, probably less efficient.
> (Not that I'm an expert on ARC opcodes.)

The difference is due to ISA and ensuing ARC gcc backends. ARCompact based cores
don't support unaligned access and the loop there was ZOL (Zero delay loop). In
ARCv2 based cores, the gcc backend has been tweaked to generate fewer ZOLs hence
you see the more canonical tst and branch style loop.

-Vineet
