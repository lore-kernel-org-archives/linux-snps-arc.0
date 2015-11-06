From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 6 Nov 2015 10:21:39 +0000
Subject: [PATCH] mm: optimize PageHighMem() check
References: <1443513260-14598-1-git-send-email-vgupta@synopsys.com>
 <20151001162528.32c5338efdff2bdea838befd@linux-foundation.org>
 <560E2F29.5070807@synopsys.com>
 <20151002135315.7ae22edce0bf54e38f69b1b0@linux-foundation.org>
 <C2D7FE5348E1B147BCA15975FBA23075D781A2B7@IN01WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D0EE2@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 03 October 2015 03:49 PM, Vineet Gupta wrote:
> On Saturday 03 October 2015 02:23 AM, Andrew Morton wrote:
>> > On Fri, 2 Oct 2015 12:45:53 +0530 Vineet Gupta <vgupta@synopsys.com> wrote:
>> >
>>> >> On Friday 02 October 2015 04:55 AM, Andrew Morton wrote:
>>>> >>> On Tue, 29 Sep 2015 13:24:20 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>>>> >>>
>>>>>> >>>>> This came up when implementing HIHGMEM/PAE40 for ARC.
>>>>>> >>>>> The kmap() / kmap_atomic() generated code seemed needlessly bloated due
>>>>>> >>>>> to the way PageHighMem() macro is implemented.
>>>>>> >>>>> It derives the exact zone for page and then does pointer subtraction
>>>>>> >>>>> with first zone to infer the zone_type.
>>>>>> >>>>> The pointer arithmatic in turn generates the code bloat.
>>>>>> >>>>>
>>>>>> >>>>> PageHighMem(page)
>>>>>> >>>>>   is_highmem(page_zone(page))
>>>>>> >>>>>      zone_off = (char *)zone - (char *)zone->zone_pgdat->node_zones
>>>>>> >>>>>
>>>>>> >>>>> Instead use is_highmem_idx() to work on zone_type available in page flags
>>>>>> >>>>>
>>>>>> >>>>>    ----- Before -----
>>>>>> >>>>> 80756348:	mov_s      r13,r0
>>>>>> >>>>> 8075634a:	ld_s       r2,[r13,0]
>>>>>> >>>>> 8075634c:	lsr_s      r2,r2,30
>>>>>> >>>>> 8075634e:	mpy        r2,r2,0x2a4
>>>>>> >>>>> 80756352:	add_s      r2,r2,0x80aef880
>>>>>> >>>>> 80756358:	ld_s       r3,[r2,28]
>>>>>> >>>>> 8075635a:	sub_s      r2,r2,r3
>>>>>> >>>>> 8075635c:	breq       r2,0x2a4,80756378 <kmap+0x48>
>>>>>> >>>>> 80756364:	breq       r2,0x548,80756378 <kmap+0x48>
>>>>>> >>>>>
>>>>>> >>>>>    ----- After  -----
>>>>>> >>>>> 80756330:	mov_s      r13,r0
>>>>>> >>>>> 80756332:	ld_s       r2,[r13,0]
>>>>>> >>>>> 80756334:	lsr_s      r2,r2,30
>>>>>> >>>>> 80756336:	sub_s      r2,r2,1
>>>>>> >>>>> 80756338:	brlo       r2,2,80756348 <kmap+0x30>
>>>>>> >>>>>
>>>>>> >>>>> For x86 defconfig build (32 bit only) it saves around 900 bytes.
>>>>>> >>>>> For ARC defconfig with HIGHMEM, it saved around 2K bytes.
>>>>>> >>>>>
>>>>>> >>>>>    ---->8-------
>>>>>> >>>>> ./scripts/bloat-o-meter x86/vmlinux-defconfig-pre x86/vmlinux-defconfig-post
>>>>>> >>>>> add/remove: 0/0 grow/shrink: 0/36 up/down: 0/-934 (-934)
>>>>>> >>>>> function                                     old     new   delta
>>>>>> >>>>> saveable_page                                162     154      -8
>>>>>> >>>>> saveable_highmem_page                        154     146      -8
>>>>>> >>>>> skb_gro_reset_offset                         147     131     -16
>>>>>> >>>>> ...
>>>>>> >>>>> ...
>>>>>> >>>>> __change_page_attr_set_clr                  1715    1678     -37
>>>>>> >>>>> setup_data_read                              434     394     -40
>>>>>> >>>>> mon_bin_event                               1967    1927     -40
>>>>>> >>>>> swsusp_save                                 1148    1105     -43
>>>>>> >>>>> _set_pages_array                             549     493     -56
>>>>>> >>>>>    ---->8-------
>>>>>> >>>>>
>>>>>> >>>>> e.g. For ARC kmap()
>>>>>> >>>>>
>>>> >>> is_highmem() is deranged.  Can't we use a bit in zone->flags or
>>>> >>> something?
>>> >> It won't be "a" bit since zone_type is an enum.
>> > Yes it will!
>> >
>> > static inline int is_highmem(struct zone *zone)
>> > {
>> > 	return test_bit(ZONE_HIGHMEM, &zone->flags);
>> > }
> Point is do we want to fix this specific case, or do we want to improve zone_idx()
> in general.
>
> #define zone_idx(zone)        ((zone) - (zone)->zone_pgdat->node_zones
>
> If former, I can split up zone->flags into 31:1 bit-field. Otherwise I will split
> it into 24:8 to hold both zone_flags and zone_type


Andrew, what do u think. Do we need to shoehorn type (idx) and flags into same
placeholder or simply add a new zone_idx field.
There will be slight complications with former to avoid any possible collisions
when someone calls set_bit() for flags holder bitfield.

IMHO zone struct is already so bloated, adding another word would be OK specially
when number of zone structures is not too many !

-Vineet
