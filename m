From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 10 Oct 2019 09:29:52 +0200
Subject: [PATCH 0/3] eldie generated code for folded p4d/pud
In-Reply-To: <20191009222658.961-1-vgupta@synopsys.com>
References: <20191009222658.961-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191010072952.GM2311@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Oct 09, 2019@03:26:55PM -0700, Vineet Gupta wrote:
> Hi,
> 
> This series elides extraneous generate code for folded p4d/pud.
> This came up when trying to remove __ARCH_USE_5LEVEL_HACK from ARC port.
> The code saving are not a while lot, but still worthwhile IMHO.
> 
> bloat-o-meter2 vmlinux-A-baseline vmlinux-E-elide-p?d_clear_bad
> add/remove: 0/2 grow/shrink: 0/1 up/down: 0/-146 (-146)
> function                                     old     new   delta
> p4d_clear_bad                                  2       -      -2
> pud_clear_bad                                 20       -     -20
> free_pgd_range                               546     422    -124
> Total: Before=4137148, After=4137002, chg -1.000000%
> 

Works for me, thanks!
