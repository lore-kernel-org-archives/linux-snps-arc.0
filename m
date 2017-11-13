From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 13 Nov 2017 13:30:36 -0800
Subject: [PATCH 0/4] ARC perf updates
In-Reply-To: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c37fc717-3215-8db9-c893-b057d17cd05e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/07/2017 02:13 PM, Vineet Gupta wrote:
> Hi,
> 
> Found these when cleaning up some old branches. The only controversial one
> could be the last one.
> 
> Thx,
> -Vineet
> 
> Vineet Gupta (4):
>    ARCv2: perf: tweak overflow interrupt
>    ARCv2: perf: optimize given that num counters <= 32
>    ARC: perf: avoid vmalloc backed mmap
>    ARCv2: entry: Reduce perf intr return path
> 
>   arch/arc/Kconfig                   |  2 +-
>   arch/arc/include/asm/entry-arcv2.h |  2 ++
>   arch/arc/kernel/entry-arcv2.S      | 23 +++++++++++++++++++++-
>   arch/arc/kernel/perf_event.c       | 40 ++++++++++++++++++++------------------
>   4 files changed, 46 insertions(+), 21 deletions(-)
> 

Peter, any specific likes/dislikes for this series !

-Vineet
