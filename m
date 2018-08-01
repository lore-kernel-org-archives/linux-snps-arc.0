From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Aug 2018 18:42:34 +0000
Subject: ARC show_regs() triggers preempt debug splat, lockdep
References: <5c3cfd4d-46d2-d817-a29a-1890d84c1fbb@synopsys.com>
 <20180801075317.GZ2494@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B088811@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/01/2018 12:53 AM, Peter Zijlstra wrote:
> On Tue, Jul 31, 2018@02:26:32PM -0700, Vineet Gupta wrote:
>> Hi Peter, Al,
>>
>> Reaching out about a problem I understand, but not quite sure how to fix it.
>> Its the weird feeling of how was this working all along, if at all.
>>
>> With print-fatal-signals enabled, there's CONFIG_DEBUG_PREEMPT splat all over,
>> even with a simple single threaded segv inducing program (console log below). This
>> originally came to light with a glibc test suite tst-tls3-malloc which is a
>> multi-threaded monster.
>>
>> ARC show_regs() is a bit more fancy as it tries to print the executable path,
>> faulting vma name (in case it was a shared lib etc). This involves taking a bunch
>> of customary locks which seems to be tripping the debug infra.
> Right, so I think that that is a fairly dodgy thing to do. As shown in
> your subsequent email, if a pagefault generates a signal we might
> already be holding the mmap_sem.
>
> The thing you could do is maybe use down_read_trylock() there.
>
> diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
> index 783b20354f8b..bb7bde11d2c8 100644
> --- a/arch/arc/kernel/troubleshoot.c
> +++ b/arch/arc/kernel/troubleshoot.c
> @@ -92,7 +92,10 @@ static void show_faulting_vma(unsigned long address, char *buf)
>  	/* can't use print_vma_addr() yet as it doesn't check for
>  	 * non-inclusive vma
>  	 */
> -	down_read(&active_mm->mmap_sem);
> +	if (!down_read_trylock(&active_mm->mmap_sem)) {
> +		pr_info("    @Trylock failed\n");
> +		return;
> +	}
>  	vma = find_vma(active_mm, address);
>  
>  	/* check against the find_vma( ) behaviour which returns the next VMA

That's not the only issue here. We also call page allocator in show_regs code path
and that barfs as well with __might_sleep.

I think for us, it would make sense to re-enable preemption inside ARC show_regs()
- undoing the generic disable from get_signal()
The rationale for that in first place, per commit 3a9f84d354ce1 was some arch
(x86?) show_regs() calling smp_processor_id(). Arguable that could call the
raw_smp variant, but we don't want to needlessly bother rest of the world.

Do you see any pitfall with my proposal ?

-Vineet
