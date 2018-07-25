From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 25 Jul 2018 20:54:20 +0000
Subject: [PATCH] Fix the ld flags not be applied to tst-execstack-mod.so
References: <1532081682-25895-1-git-send-email-zong@andestech.com>
 <469dcf75-d652-62ee-8310-ea59ec878a0a@synopsys.com>
 <alpine.DEB.2.20.1807252021030.4746@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B083DE0@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/25/2018 01:22 PM, Joseph Myers wrote:
> On Wed, 25 Jul 2018, Vineet Gupta wrote:
>
>> Chiming in as I'm looking into these things myself in context of testing 
>> for ARC port submission. Do we really need to fix this part - in this 
>> way. I'd vote to not force the execstack through linker and rely on gcc 
>> generating this itself when it knows it doing something for trampolines. 
>> And only if target gcc doesn't support it (detected via configure test) 
>> should this be done.
> The whole point of this test is to verify executable stack changes on 
> dlopen of a module requiring an executable stack.

I'm not contesting that at all. For this exact test, I recently had to fix a
kernel bug for allowing mprotect(PROT_EXEC) stack mappings on ARC.

>   Thus, for this test to 
> work correctly, this module must be forced to have a marking as needing an 
> executable stack.

But given the dso code has nested function, a well equipped gcc when generating
trampoline code would also generate the GNU_STACK segment for the dso
automatically, without need to force the same via the linker flags as is done in
the Makefile currently. Only when a port's gcc doesn't support this (ARC gcc
didn't until recently), should we need ld assist, and this could be detected using
a configure test - No ?
