From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 9 Nov 2017 11:09:05 -0800
Subject: arc patch from glibc repo
In-Reply-To: <EB86EB452ADE4B44B294F7149B8A2777028A761F@DE02WEMBXB.internal.synopsys.com>
References: <20171105100054.GU1829@waldemar-brodkorb.de>
 <EB86EB452ADE4B44B294F7149B8A2777028A622F@DE02WEMBXB.internal.synopsys.com>
 <20171109071725.GA1829@waldemar-brodkorb.de>
 <EB86EB452ADE4B44B294F7149B8A2777028A761F@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a674833e-affb-b5b6-1b3d-f66bd3611d45@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/09/2017 05:18 AM, Cupertino Miranda wrote:
> Hi Waldemar,
>
> I personally made this tst-cancel test start to pass in the past,
> related to unwinding issues we had in our tools.
> However, I have noticed that some of the tst-cancel tests would have
> some non-deterministic behavior.
>
> This was related to some pipes not blocking, when writing some data, but
> not blocking.
> If I increased the written elements to the pipe, those would block
> always, and the test would pass.
>
> It is possible that there was some change in the kernel that might have
> fixed this.
> Vineet: Do you know anything about this ?

Not in ARC port per se.

> Regarding your patch I would advise not to apply it until we find the
> real reason for blink not to be restored.

Right. Although in SNPS github uclibc repo we carry an equivalent patch (from 
Cuper) for fixing some of the cancelation tests. That is the only out of tree 
patch we have in uClibc just because we (I) didn't have time to analyze things 
fully. However I'm planning to clean this up and prove that we need that patch 
(and submit it for merge) or prove it is useless - which is quite unlikely - since 
Cuper is generally NOT smoking pot when coding ;-)

OTOH, while we do need this analysis, the change itself seemed relatively benign, 
but was kept on hold due to reasons needing a historic detour (read below if 
interested)

In 2010 ? I rewrote the uClibc syscall generators. To reduce generated code bloat 
and stack spills for prologue/epilogue etc ernro handling was moved into an 
out-of-line function. For fast path case of a simpler successful syscalls (no 
errno), no stack operations were needed.

    0000c244 <__libc_nanosleep>:
     ??? c244:??? mov?????? r8,162
     ??? c248:??? swi
     ??? c24c:??? brge?????? r0,0,c25c
     ??? c250:??? st.a??????? blink, [sp,-4]???? # this blink save is from inline
    asm - not gcc
     ??? c254:??? bl?????????? ad5c??? ??? ???????? # this is errno setter
     ??? c258:??? ld.ab????? blink, [sp,4]
     ??? c25c:??? j_s ??? ?? [blink]
     ??? c25e:??? nop_s


The proposed change adds blink to clobber list, making BLINK saved twice now (once 
by gcc and other due to above) and also undoes all the hand crafted beauty above.

-Vineet
