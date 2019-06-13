From: akpm@linux-foundation.org (Andrew Morton)
Date: Thu, 13 Jun 2019 13:04:08 -0700
Subject: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
In-Reply-To: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190613130408.3091869d8e50d0524157523f@linux-foundation.org>
To: linux-snps-arc@lists.infradead.org

On Thu, 13 Jun 2019 15:37:24 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Architectures which support kprobes have very similar boilerplate around
> calling kprobe_fault_handler(). Use a helper function in kprobes.h to unify
> them, based on the x86 code.
> 
> This changes the behaviour for other architectures when preemption is
> enabled. Previously, they would have disabled preemption while calling the
> kprobe handler. However, preemption would be disabled if this fault was
> due to a kprobe, so we know the fault was not due to a kprobe handler and
> can simply return failure.
> 
> This behaviour was introduced in the commit a980c0ef9f6d ("x86/kprobes:
> Refactor kprobes_fault() like kprobe_exceptions_notify()")
> 
> ...
>
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -30,28 +30,6 @@
>  
>  #ifdef CONFIG_MMU
>  
> -#ifdef CONFIG_KPROBES
> -static inline int notify_page_fault(struct pt_regs *regs, unsigned int fsr)

Some architectures make this `static inline'.  Others make it
`nokprobes_inline', others make it `static inline __kprobes'.  The
latter seems weird - why try to put an inline function into
.kprobes.text?

So..  what's the best thing to do here?  You chose `static
nokprobe_inline' - is that the best approach, if so why?  Does
kprobe_page_fault() actually need to be inlined?

Also, some architectures had notify_page_fault returning int, others
bool.  You chose bool and that seems appropriate and all callers are OK
with that.
