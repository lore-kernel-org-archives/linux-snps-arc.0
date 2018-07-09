From: mark.rutland@arm.com (Mark Rutland)
Date: Mon, 9 Jul 2018 16:48:45 +0100
Subject: [PATCH v3] devres: Explicitly align datai[] to 64-bit
In-Reply-To: <20180709154521.GS2512@hirez.programming.kicks-ass.net>
References: <20180709134550.29541-1-abrodkin@synopsys.com>
 <20180709140717.GR2476@hirez.programming.kicks-ass.net>
 <20180709141056.GR2512@hirez.programming.kicks-ass.net>
 <44727d3cebda7bee5b68fb388bd2fecfc6dc7b89.camel@synopsys.com>
 <20180709144925.GU2476@hirez.programming.kicks-ass.net>
 <20180709152958.565weccfaktqauef@lakrids.cambridge.arm.com>
 <20180709153427.GY2476@hirez.programming.kicks-ass.net>
 <20180709154521.GS2512@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180709154844.5p5yk34ezw2gbt3y@lakrids.cambridge.arm.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 09, 2018@05:45:21PM +0200, Peter Zijlstra wrote:
> On Mon, Jul 09, 2018@05:34:27PM +0200, Peter Zijlstra wrote:
> > On Mon, Jul 09, 2018@04:29:58PM +0100, Mark Rutland wrote:
> > > Shouldn't that be 8? AFAICT, __alignof__(unsigned long long) is 8 on
> > > x86_32:
> > 
> > Curious, I wonder why we put that align in atomic64_32 then.
> 
> Shiny, look at this: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54188
> 

Ouch.

[mark at lakrids:~]% cat test.c
#include <stdio.h>

#define PRINT_TYPE_INFO(t) \
        printf("%10s %5d %5d\n", #t, sizeof(t), __alignof__(t))

struct ull {
        unsigned long long v;
};

int main(int argc, char *argv[])
{
        printf("%10s %5s %5s\n", "TYPE", "SIZE", "ALIGN");
        PRINT_TYPE_INFO(int);
        PRINT_TYPE_INFO(long);
        PRINT_TYPE_INFO(long long);
        PRINT_TYPE_INFO(struct ull);

        return 0;
}
[mark at lakrids:~]% gcc -m32 test.c -o test
[mark at lakrids:~]% ./test 
      TYPE  SIZE ALIGN
       int     4     4
      long     4     4
 long long     8     8
struct ull     8     4

Mark.
