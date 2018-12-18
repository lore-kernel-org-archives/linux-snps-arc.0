From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:44:28 +0000
Subject: [PATCH 13/21] ARC: Build Infrastructure
In-Reply-To: <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> +libc {
> +  GLIBC_2.29 {
> +    __adddf3; __addsf3; __divdf3; __divsf3; __eqdf2; __eqsf2; __extendsfdf2;
> +    __fixdfdi; __fixdfsi; __fixsfdi; __fixsfsi;
> +    __fixunsdfdi; __fixunsdfsi; __fixunssfdi; __fixunssfsi;
> +    __floatdidf; __floatdisf; __floatsidf; __floatsisf;
> +    __floatundidf; __floatundisf; __floatunsidf; __floatunsisf;
> +    __gedf2; __gesf2; __gtdf2; __gtsf2; __ledf2; __lesf2; __ltdf2; __ltsf2;
> +    __muldf3; __mulsf3; __nedf2; __nesf2; __negdf2; __negsf2;
> +    __subdf3; __subsf3; __truncdfsf2; __unorddf2; __unordsf2;

Exporting soft-fp symbols from glibc is only appropriate if you are also 
building soft-fp in glibc (as opposed to building it in libgcc) - which 
might be done with a view to possibly enabling support for exceptions and 
rounding modes for soft-float, as on powerpc soft-float, for example.  I 
don't see a Subdirs files containing "soft-fp" in this patch series.  If 
you're just linking with libgcc, you should not be re-exporting these 
functions from libc.so (and indeed I don't see them in your ABI baselines 
- libgcc.a has them as hidden symbols to prevent such re-exporting).

> +libc_cv_fpie=no

Why?  I'd expect -fpie to be working for all glibc architectures with any 
modern GCC version (I wouldn't expect it to need extra GCC back-end 
support beyond -fpic).

-- 
Joseph S. Myers
joseph at codesourcery.com
