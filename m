From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Oct 2016 10:48:57 -0700
Subject: [PATCH] ARC: Adjust cpuinfo for non-continuous cpu ids
In-Reply-To: <1476798435-8357-1-git-send-email-noamca@mellanox.com>
References: <1476798435-8357-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d6f85fd9-cb45-8962-709d-9f287bb587ab@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/18/2016 06:47 AM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> num_possible_cpus() returns how many CPUs may be present on system.
> However we want the highest possible CPU number.

Highest possible number "Detected" at boot ? Can you explain a bit more !

> This may be differ in a sparsed possible CPUs map.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/kernel/setup.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index f52a0d0..d13ce84 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -506,7 +506,7 @@ static void *c_start(struct seq_file *m, loff_t *pos)
>  	 * way to pass it w/o having to kmalloc/free a 2 byte string.
>  	 * Encode cpu-id as 0xFFcccc, which is decoded by show routine.
>  	 */
> -	return *pos < num_possible_cpus() ? cpu_to_ptr(*pos) : NULL;
> +	return *pos < nr_cpu_ids ? cpu_to_ptr(*pos) : NULL;

My only concern is that for smaller systems - say if I build with NR_CPUS = 4, and
there are only 2 cpus present, then /proc/cpuinfo needs to print the fact. And a
quick test with ur patch says that is the case - so how does this help you. Do u
use nr_cpus cmdline toggle ?

[ARCLinux]# cat /proc/cpuinfo

IDENTITY    : ARCVER [0x51] ARCNUM [0x0] CHIPID [ 0x0]
processor [0]    : ARC HS38 R2.0 (ARCv2 ISA)
...
...
processor [2]    : Offline

processor [3]    : Offline


-Vineet

>  }
>  
>  static void *c_next(struct seq_file *m, void *v, loff_t *pos)
