From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 13:58:03 -0800
Subject: [PATCH 13/21] ARC: Build Infrastructure
In-Reply-To: <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-14-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182340110.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <23aece37-8497-8b48-dadb-3e73667ff3e4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:44 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> +libc {
>> +  GLIBC_2.29 {
>> +    __adddf3; __addsf3; __divdf3; __divsf3; __eqdf2; __eqsf2; __extendsfdf2;
>> +    __fixdfdi; __fixdfsi; __fixsfdi; __fixsfsi;
>> +    __fixunsdfdi; __fixunsdfsi; __fixunssfdi; __fixunssfsi;
>> +    __floatdidf; __floatdisf; __floatsidf; __floatsisf;
>> +    __floatundidf; __floatundisf; __floatunsidf; __floatunsisf;
>> +    __gedf2; __gesf2; __gtdf2; __gtsf2; __ledf2; __lesf2; __ltdf2; __ltsf2;
>> +    __muldf3; __mulsf3; __nedf2; __nesf2; __negdf2; __negsf2;
>> +    __subdf3; __subsf3; __truncdfsf2; __unorddf2; __unordsf2;
>
> Exporting soft-fp symbols from glibc is only appropriate if you are also 
> building soft-fp in glibc (as opposed to building it in libgcc) - which 
> might be done with a view to possibly enabling support for exceptions and 
> rounding modes for soft-float, as on powerpc soft-float, for example.  I 
> don't see a Subdirs files containing "soft-fp" in this patch series.  If 
> you're just linking with libgcc, you should not be re-exporting these 
> functions from libc.so (and indeed I don't see them in your ABI baselines 
> - libgcc.a has them as hidden symbols to prevent such re-exporting).

Removed now !

>> +libc_cv_fpie=no
> Why? 

This likely goes back to my original work on glibc (started somewhere in 2015),
and at the time binutils support for PIE was really shaky (to speak mildly). It
was only in ARC GNU 2016.09 release did we have serious pie fixes due to essential
rewrite of binutils backend by Cuper and Claudiu.

> I'd expect -fpie to be working for all glibc architectures with any 
> modern GCC version (I wouldn't expect it to need extra GCC back-end 
> support beyond -fpic).

Well at the time there were multiple PIE related issues in binutils rather than gcc.

Indeed with current glibc port, we do build/test/run a bunch of packages relying
on PIE (dumpcap, openssh come to mind) successfully. So yes PIE should work in
general for ARC now. FWIW this could also explain the following current results.

PASS: gmon/tst-gmon-gprof
FAIL: gmon/tst-gmon-pie-gprof
