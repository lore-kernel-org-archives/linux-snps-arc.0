From: mark.rutland@arm.com (Mark Rutland)
Date: Mon, 9 Jul 2018 16:29:58 +0100
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <20180709144925.GU2476@hirez.programming.kicks-ass.net>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
 <20180709140717.GR2476@hirez.programming.kicks-ass.net>
 <20180709141056.GR2512@hirez.programming.kicks-ass.net>
 <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
 <20180709144925.GU2476@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709152958.565weccfaktqauef@lakrids.cambridge.arm.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@04:49:25PM +0200, Peter Zijlstra wrote:
> On Mon, Jul 09, 2018@02:33:26PM +0000, Alexey Brodkin wrote:
> > > In fact, since alloc_dr() uses kmalloc() to allocate the entire thing,
> > > it is impossible to guarantee a larger alignment than kmalloc does.
> > 
> > Well but 4-bytes [which is critical for atomic64_t] should be much less
> > than a sane cache line length so above should work.
> 
> AFAICT ARCH_KMALLOC_MINALIGN ends up being 4 on x86_32 (it doesn't
> define ARCH_DMA_MINALIGN and doesn't seem to otherwise override the
> thing).

Shouldn't that be 8? AFAICT, __alignof__(unsigned long long) is 8 on
x86_32:

----
[mark at lakrids:~]% cat test.c     
#include <stdio.h>

#define PRINT_TYPE_INFO(t) \
        printf("%10s %5d %5d\n", #t, sizeof(t), __alignof__(t))

int main(int argc, char *argv[])
{
        printf("%10s %5s %5s\n", "TYPE", "SIZE", "ALIGN");
        PRINT_TYPE_INFO(int);
        PRINT_TYPE_INFO(long);
        PRINT_TYPE_INFO(long long);

        return 0;
}
[mark at lakrids:~]% gcc -m32 test.c -o test
[mark at lakrids:~]% ./test 
      TYPE  SIZE ALIGN
       int     4     4
      long     4     4
 long long     8     8
----

Mark.
