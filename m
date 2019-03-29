From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 29 Mar 2019 00:20:48 +0000
Subject: [PATCH] [ARC] PR 88409: miscompilation due to missing cc
 clobber in longlong.h macros
References: <1553814161-3750-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1903290103230.15092@stedding.saclay.inria.fr>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643F0DA@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 3/28/19 5:07 PM, Marc Glisse wrote:
> On Thu, 28 Mar 2019, Vineet Gupta wrote:
>
>> simple test such as below was failing.
>>
>> | void main(int argc, char *argv[])
>> | {
>> |    size_t total_time = 115424;                       // expected 115.424
>> |    double secs = (double)total_time/(double)1000;
>> |    printf("%s %d %lf\n", "secs", total_time, secs);  // prints 113.504
>> |    printf("%d\n", (size_t)secs);
>> | }
>>
>> The printf eventually called into glibc stdlib/divrem.c:__mpn_divrem()
>> which uses the __arc__ specific inline asm macros from longlong.h which
>> were causing miscompilation.
> Hello,
>
> do you intend to post similar patches for glibc and gmp, which both have a 
> similar longlong.h?

Yeah, glibc typically "syncs" longlong.h from gcc so once gcc patch is merged,
I'll post a sync patch to glibc.
Good tip about gmp, I wasn't aware of that. I suppose I could post there too once
dust settles on gcc side.

Thx,
-Vinet
