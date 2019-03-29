From: marc.glisse@inria.fr (Marc Glisse)
Date: Fri, 29 Mar 2019 01:07:02 +0100 (CET)
Subject: [PATCH] [ARC] PR 88409: miscompilation due to missing cc clobber
 in longlong.h macros
In-Reply-To: <1553814161-3750-1-git-send-email-vgupta@synopsys.com>
References: <1553814161-3750-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1903290103230.15092@stedding.saclay.inria.fr>
To: linux-snps-arc@lists.infradead.org

On Thu, 28 Mar 2019, Vineet Gupta wrote:

> simple test such as below was failing.
>
> | void main(int argc, char *argv[])
> | {
> |    size_t total_time = 115424;                       // expected 115.424
> |    double secs = (double)total_time/(double)1000;
> |    printf("%s %d %lf\n", "secs", total_time, secs);  // prints 113.504
> |    printf("%d\n", (size_t)secs);
> | }
>
> The printf eventually called into glibc stdlib/divrem.c:__mpn_divrem()
> which uses the __arc__ specific inline asm macros from longlong.h which
> were causing miscompilation.

Hello,

do you intend to post similar patches for glibc and gmp, which both have a 
similar longlong.h?

-- 
Marc Glisse
