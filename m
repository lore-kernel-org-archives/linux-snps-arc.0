From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 14 Jan 2019 16:40:36 -0800
Subject: [PATCH 06/21] ARC: Atomics and Locking primitives
In-Reply-To: <alpine.DEB.2.21.1812182312080.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-7-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182312080.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fab937d7-d492-040d-8075-bede05c9c766@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:15 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> +#define USE_ATOMIC_COMPILER_BUILTINS 0
> 
> There is a strong preference for new ports to use 1 for this rather than 0 
> (and not to have any asms in their atomic-machine.h unless there's some 
> reason use of built-in functions is unsuitable) - see the recently posted 
> C-Sky version, for example.  If you can't use 1, there should be a good 
> reason, documented in a comment, for using asms instead of compiler 
> built-in functions (e.g. if the compiler built-in functions would result 
> in libatomic dependencies, which are unsuitable for glibc, rather than 
> being expanded inline).

I tried switching to builtins and see the resulting differences in generated code:
there's one snafu to begin with: gcc seems to be generating a DMB 0 for the
barriers, which is a no-op, it needs to be DMB {1,2,3} for read, write, control...
so that needs fixing there.
