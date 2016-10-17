From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Mon, 17 Oct 2016 19:39:41 +0200
Subject: ARC-setup: Use seq_putc() in show_cpuinfo()
In-Reply-To: <10542905-ebe1-49f5-190b-3783137e7854@synopsys.com>
References: <164a402a-de20-645d-00af-9a414cf745c4@users.sourceforge.net>
 <579aaf85-c22d-b680-5ce8-3c0e23ab6d7e@synopsys.com>
 <d8738585-21f3-8691-4c53-bfbafef925be@users.sourceforge.net>
 <10542905-ebe1-49f5-190b-3783137e7854@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <418ba237-d501-c8d1-cf2b-3ec4b6d46785@users.sourceforge.net>
To: linux-snps-arc@lists.infradead.org

>>> Perhaps reword the changelog to say that seqc_putc is more efficient than
>>> seqc_printf to output a single char.
>>> I mean _printf is not wrong but not as efficient ?
>> I came along source files for a few other software modules with similar
>> change possibilities.
>> Unfortunately, the corresponding developers are not convinced yet
>> to replace a call of the function "seq_printf" at the end by
>> a "seq_putc" because of software efficiency reasons.
> 
> I was ambivalent so far - but not anymore :-)

Interesting ?


> what is the objection - can you point me to a few links where people don't think
> this is not a good idea.

Yes, of course. - Does the double negation in this wording indicate another
special software development concern?

How do you think about another update suggestion like "[PATCH] MD-RAID: Use seq_putc()
in three status functions" (from 2016-10-16)?
https://patchwork.kernel.org/patch/9378055/
https://lkml.kernel.org/r/<77fb6fdc-7480-8607-0af1-42f73c125b9d at users.sourceforge.net>


>> Do you find this update suggestion acceptable to some degree
>> for the function "setup"?

I am curious what your opinions will be for further development of the
function "show_cpuinfo" in the source file "arch/arc/kernel/setup.c".

Regards,
Markus
