From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 3 Dec 2018 17:31:25 +0000
Subject: [PATCH v2] ARC: io.h: Implement reads{x}()/writes{x}()
References: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
 <ff1e11923e92405d883474d715008c0a@AcuMS.aculab.com>
 <89122bd8-bca2-2ae1-0dd0-160abbebcace@synopsys.com>
 <d2d133e5-267c-c42a-7329-22892bbbdee4@synopsys.com>
 <CAK8P3a2U3ft3crF2SiAuc=PQdDooEUaVAN9gQDyxsxvBn5+xRw@mail.gmail.com>
 <57437493-31bb-eced-032c-1f54470b030e@synopsys.com>
 <CAK8P3a2mqEb4_F4wB1DvL5jJJobLhOg6-bW3ZDNGhvbv-_qW3A@mail.gmail.com>
 <3afe0e1bbf2d42d3bb178ec789553c28@AcuMS.aculab.com>
 <C2D7FE5348E1B147BCA15975FBA23075014641A413@US01WEMBX2.internal.synopsys.com>
 <a668562bf3cb410e90484eb0d4a436a7@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641A923@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/3/18 2:10 AM, David Laight wrote:
> From: Vineet Gupta
> ...
>>> It also seems to have used a different type of loop to the
>>> other example, probably less efficient.
>>> (Not that I'm an expert on ARC opcodes.)
>> The difference is due to ISA and ensuing ARC gcc backends. ARCompact based cores
>> don't support unaligned access and the loop there was ZOL (Zero delay loop). In
>> ARCv2 based cores, the gcc backend has been tweaked to generate fewer ZOLs hence
>> you see the more canonical tst and branch style loop.
> Is this another case of the hardware implementing 'hardware' loop
> instructions that execute slower than ones made of simple instructions?

Not really. ZOL allow for hardware loops with no instruction/cycle overhead in
general. However as micro-arches get more complicated there are newer "gizmos"
added to the machinery which sometimes make it harder for the compliers to
optimize for all the cases. ARCv2 ISA has a new DBNZ instruction (similar to x86
you refer below) to implement loops and that is preferred over the ZOL.

> The worst example has to be the x86 'loop' (dec cx and jump nz)
> instruction which is microcoded on intel cpus.
> That makes it very difficult to use the new addx instruction to
> get two dependency chains through a loop.
