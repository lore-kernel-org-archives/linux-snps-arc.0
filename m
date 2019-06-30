From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Sun, 30 Jun 2019 10:11:03 +0530
Subject: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
In-Reply-To: <20190629145009.GA28613@roeck-us.net>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
 <20190629145009.GA28613@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <78863cd0-8cb5-c4fd-ed06-b1136bdbb6ef@arm.com>
To: linux-snps-arc@lists.infradead.org

Hello Guenter,

On 06/29/2019 08:20 PM, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Jun 13, 2019@03:37:24PM +0530, Anshuman Khandual wrote:
>> Architectures which support kprobes have very similar boilerplate around
>> calling kprobe_fault_handler(). Use a helper function in kprobes.h to unify
>> them, based on the x86 code.
>>
>> This changes the behaviour for other architectures when preemption is
>> enabled. Previously, they would have disabled preemption while calling the
>> kprobe handler. However, preemption would be disabled if this fault was
>> due to a kprobe, so we know the fault was not due to a kprobe handler and
>> can simply return failure.
>>
>> This behaviour was introduced in the commit a980c0ef9f6d ("x86/kprobes:
>> Refactor kprobes_fault() like kprobe_exceptions_notify()")
>>
> 
> With this patch applied, parisc:allmodconfig images no longer build.
> 
> In file included from arch/parisc/mm/fixmap.c:8:
> include/linux/kprobes.h: In function 'kprobe_page_fault':
> include/linux/kprobes.h:477:9: error:
> 	implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'?

Yikes.. Arch parisc does not even define (unlike mips which did but never exported)
now required function kprobe_fault_handler() when CONFIG_KPROBES is enabled.

I believe rather than defining one stub version only for parsic it would be better
to have an weak symbol generic stub definition for kprobe_fault_handler() in file
include/linux/kprobes.h when CONFIG_KPROBES is enabled along side the other stub
definition when !CONFIG_KPROBES. But arch which wants to use kprobe_page_fault()
cannot use stub kprobe_fault_handler() definition and will have to provide one.
I will probably add a comment regarding this.

> 
> Reverting the patch fixes the problem.
> 
> Guenter
> 

Thanks for reporting the problem.
