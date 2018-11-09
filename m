From: luto@amacapital.net (Andy Lutomirski)
Date: Fri, 9 Nov 2018 11:03:32 -0800
Subject: [PATCH 06/13] arc: define syscall_get_arch()
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075013A59239B@us01wembx1.internal.synopsys.com>
References: <20181109031605.GF21511@altlinux.org>
 <C2D7FE5348E1B147BCA15975FBA23075013A59239B@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6C398ED8-30BC-4483-B5CF-1EB2F2699B0D@amacapital.net>
To: linux-snps-arc@lists.infradead.org



> On Nov 9, 2018,@8:50 AM, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:
> 
>> On 11/8/18 7:16 PM, Dmitry V. Levin wrote:
>> syscall_get_arch() is required to be implemented on all architectures
>> that use tracehook_report_syscall_entry() in order to extend
>> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>> 
>> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
>> ---
>> arch/arc/include/asm/syscall.h | 6 ++++++
>> include/uapi/linux/audit.h     | 1 +
>> 2 files changed, 7 insertions(+)
>> 
>> diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
>> index 29de09804306..5662778a7411 100644
>> --- a/arch/arc/include/asm/syscall.h
>> +++ b/arch/arc/include/asm/syscall.h
>> @@ -9,6 +9,7 @@
>> #ifndef _ASM_ARC_SYSCALL_H
>> #define _ASM_ARC_SYSCALL_H  1
>> 
>> +#include <uapi/linux/audit.h>
>> #include <linux/err.h>
>> #include <linux/sched.h>
>> #include <asm/unistd.h>
>> @@ -68,4 +69,9 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>>    }
>> }
>> 
>> +static inline int syscall_get_arch(void)
>> +{
>> +    return AUDIT_ARCH_ARC;
>> +}
>> +
> 
> Does ptrace (or user of this API) need a unique value per arch. Otherwise instead
> of adding the boilerplate code to all arches, they could simply define AUDIT_ARCH
> and common code could return it. Also the EM_xxx are not there in
> include/uapi/linux/elf.h to begin with since libc elf.h already defines them.

A lot of architectures allow multiple audit_arches at runtime due to compat support and similar features, so it really does want to be a function.  The goal of this patch set is to get it supported everywhere.

>> #endif
>> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
>> index 818ae690ab79..a7149ceb5b98 100644
>> --- a/include/uapi/linux/audit.h
>> +++ b/include/uapi/linux/audit.h
>> @@ -375,6 +375,7 @@ enum {
>> 
>> #define AUDIT_ARCH_AARCH64    (EM_AARCH64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> #define AUDIT_ARCH_ALPHA    (EM_ALPHA|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>> +#define AUDIT_ARCH_ARC        (EM_ARC)
>> #define AUDIT_ARCH_ARM        (EM_ARM|__AUDIT_ARCH_LE)
>> #define AUDIT_ARCH_ARMEB    (EM_ARM)
>> #define AUDIT_ARCH_CRIS        (EM_CRIS|__AUDIT_ARCH_LE)
> 
> So I don't have the context of this patch (or coverletter) but what exactly are we
> trying to do with this (adding LE to audit)  - what happens when an arch is
> capable of either and is say built for BE ?

The primary intent is that the triple (audit_arch, syscall_nr, arg1, ..., arg6) should describe what system call is being called and what its arguments are.  I?m personally not sure what, if any, technical value there is in the LE bit.

I do think it makes sense for BE and LE to have different values.
