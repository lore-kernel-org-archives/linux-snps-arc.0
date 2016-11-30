From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Nov 2016 08:55:02 -0800
Subject: [RFC] ARC: mm: Restrict definition of pfn_valid() macro for
 CONFIG_FLATMEM
In-Reply-To: <3ABF60118B9B784CA5BF7C841D2F00EC01025AC2@de02wembxa.internal.synopsys.com>
References: <1480433346-18054-1-git-send-email-yuriy.kolerov@synopsys.com>
 <20161130091637.GC18437@dhcp22.suse.cz>
 <3ABF60118B9B784CA5BF7C841D2F00EC01025AC2@de02wembxa.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0f309613-82dc-90c3-a01a-ecfcbe7201ce@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/30/2016 06:21 AM, Yuriy Kolerov wrote:
>> On Tue 29-11-16 18:29:06, Yuriy Kolerov wrote:
>>> > > Despite the fact that subtraction of unsigned integers is a defined
>>> > > behaviour however such operations can lead to unexpected results. Thus
>>> > > it is better to check both left and right boundaries to avoid
>>> > > potential bugs as it done in the generic page.h.
>> > 
>> > Why and which code would use an out of range pfn? Why other arches do
>> > not need to care?
> Actually some arches do care about checking of both left and right boundaries (e.g. avr32, sparc, etc). The problem is that a value of pfn may be calculated incorrectly in some places of the kernel. E.g. not long ago I sent a patch which fixes truncation of the most significant byte in pfn/pte in some cases (in the kernel with PAE40, however it is not a FLATMEM case). So such situations can happens in the most unexpected places.
> 

So the point is - is this a preventive fix (desired thing) or it being there would
have helped find the PAE40 bug earlier / easier. Woudl it have prevented the
kernel crash. If so then this is a nobrainer fix.

BTW did you try to gauge the code gen impact - this function gets pulled all over
the place in mm code. So build kernel with and w/o change and do a
scripts/bloat-o-meter

-Vineet
