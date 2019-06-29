From: linux@roeck-us.net (Guenter Roeck)
Date: Sat, 29 Jun 2019 07:50:09 -0700
Subject: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
In-Reply-To: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190629145009.GA28613@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

Hi,

On Thu, Jun 13, 2019@03:37:24PM +0530, Anshuman Khandual wrote:
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

With this patch applied, parisc:allmodconfig images no longer build.

In file included from arch/parisc/mm/fixmap.c:8:
include/linux/kprobes.h: In function 'kprobe_page_fault':
include/linux/kprobes.h:477:9: error:
	implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'?

Reverting the patch fixes the problem.

Guenter
