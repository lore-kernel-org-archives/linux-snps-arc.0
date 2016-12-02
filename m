From: Yuriy.Kolerov@synopsys.com (Yuriy Kolerov)
Date: Fri, 2 Dec 2016 14:14:30 +0000
Subject: [RFC] ARC: mm: Restrict definition of pfn_valid() macro for
 CONFIG_FLATMEM
In-Reply-To: <0f309613-82dc-90c3-a01a-ecfcbe7201ce@synopsys.com>
References: <1480433346-18054-1-git-send-email-yuriy.kolerov@synopsys.com>
 <20161130091637.GC18437@dhcp22.suse.cz>
 <3ABF60118B9B784CA5BF7C841D2F00EC01025AC2@de02wembxa.internal.synopsys.com>
 <0f309613-82dc-90c3-a01a-ecfcbe7201ce@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3ABF60118B9B784CA5BF7C841D2F00EC01026E96@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Wednesday, November 30, 2016 7:55 PM
> To: Yuriy Kolerov <Yuriy.Kolerov at synopsys.com>; Michal Hocko
> <mhocko at kernel.org>
> Cc: linux-snps-arc at lists.infradead.org; Alexey.Brodkin at synopsys.com; linux-
> kernel at vger.kernel.org
> Subject: Re: [RFC] ARC: mm: Restrict definition of pfn_valid() macro for
> CONFIG_FLATMEM
> 
> On 11/30/2016 06:21 AM, Yuriy Kolerov wrote:
> >> On Tue 29-11-16 18:29:06, Yuriy Kolerov wrote:
> >>> > > Despite the fact that subtraction of unsigned integers is a
> >>> > > defined behaviour however such operations can lead to unexpected
> >>> > > results. Thus it is better to check both left and right
> >>> > > boundaries to avoid potential bugs as it done in the generic page.h.
> >> >
> >> > Why and which code would use an out of range pfn? Why other arches
> >> > do not need to care?
> > Actually some arches do care about checking of both left and right
> boundaries (e.g. avr32, sparc, etc). The problem is that a value of pfn may be
> calculated incorrectly in some places of the kernel. E.g. not long ago I sent a
> patch which fixes truncation of the most significant byte in pfn/pte in some
> cases (in the kernel with PAE40, however it is not a FLATMEM case). So such
> situations can happens in the most unexpected places.
> >
> 
> So the point is - is this a preventive fix (desired thing) or it being there would
> have helped find the PAE40 bug earlier / easier. Woudl it have prevented the
> kernel crash. If so then this is a nobrainer fix.

This fix can help to find bugs which are related to wrong pfn values and only for FLATMEM case (usually when PAE40 is turned off). However I have just figured out that it is impossible to pass such bad unsigned pfn value which passes pfn_valid() check (usually the kernel passes a value from unsigned long variable)... This fix may help in cases when the kernel accidently passes a signed long value as pfn to the macro. Frankly speaking there are low chances that such thing can ever happen so I'm a little paranoid about it.

> BTW did you try to gauge the code gen impact - this function gets pulled all
> over the place in mm code. So build kernel with and w/o change and do a
> scripts/bloat-o-meter

Report from that script (extra 112 bytes):

add/remove: 0/0 grow/shrink: 9/1 up/down: 122/-10 (112)
function                                     old     new   delta
set_zone_contiguous                          212     248     +36
__pageblock_pfn_to_page                      120     136     +16
vm_insert_pfn_prot                           432     444     +12
vm_insert_pfn                                436     448     +12
kpagecount_read                              360     372     +12
reserve_bootmem_region                       110     120     +10
memremap                                     248     256      +8
kpageflags_read                              840     848      +8
devm_memremap                                356     364      +8
pagetypeinfo_show                            752     742     -10
Total: Before=3785631, After=3785743, chg +0.00%

> -Vineet
