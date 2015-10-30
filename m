From: mans@mansr.com (=?iso-8859-1?Q?M=E5ns_Rullg=E5rd?=)
Date: Fri, 30 Oct 2015 17:45:20 +0000
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <alpine.LFD.2.20.1510301253140.630@knanqh.ubzr> (Nicolas Pitre's
 message of "Fri, 30 Oct 2015 12:55:38 -0400 (EDT)")
References: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
 <alpine.LFD.2.20.1510281907170.630@knanqh.ubzr>
 <alpine.LFD.2.20.1510292112590.630@knanqh.ubzr>
 <yw1xa8r0cyx8.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1510301113530.630@knanqh.ubzr>
 <1446220442.4394.42.camel@synopsys.com>
 <alpine.LFD.2.20.1510301253140.630@knanqh.ubzr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <yw1xy4ekb68f.fsf@unicorn.mansr.com>
To: linux-snps-arc@lists.infradead.org

Nicolas Pitre <nicolas.pitre at linaro.org> writes:

> On Fri, 30 Oct 2015, Alexey Brodkin wrote:
>
>> Hi Nicolas,
>> 
>> On Fri, 2015-10-30@11:17 -0400, Nicolas Pitre wrote:
>> > On Fri, 30 Oct 2015, M?ns Rullg?rd wrote:
>> > 
>> > > Nicolas Pitre <nicolas.pitre at linaro.org> writes:
>> > > 
>> > > > OK... I was intrigued, so I adapted my ARM code to the generic case, 
>> > > > including the overflow avoidance optimizations.  Please have look and 
>> > > > tell me how this works for you.
>> > > > 
>> > > > If this patch is accepted upstream, then it could be possible to 
>> > > > abstract only the actual multiplication part with some architecture 
>> > > > specific assembly.
>> > > 
>> > > Good idea.
>> > 
>> > Could you please provide a reviewed-by or acked-by tag?
>> 
>> Sure!
>> 
>> Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
>> 
>> BTW I thought about that optimization a bit more and now I think
>> we may even skip addition of arch-specific assembly insertions.
>
> I'm going to do it anyway given that I already have it for ARM.  It'll 
> be opt-in, so if your arch doesn't provide it then the current C 
> implementation will be used by default.

Great.  I'll try it out on MIPS once you've posted the patch.

-- 
M?ns Rullg?rd
mans at mansr.com
