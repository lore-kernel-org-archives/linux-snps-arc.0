From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 9 Nov 2018 11:13:33 -0800
Subject: [PATCH 06/13] arc: define syscall_get_arch()
In-Reply-To: <6C398ED8-30BC-4483-B5CF-1EB2F2699B0D@amacapital.net>
References: <20181109031605.GF21511@altlinux.org>
 <C2D7FE5348E1B147BCA15975FBA23075013A59239B@us01wembx1.internal.synopsys.com>
 <6C398ED8-30BC-4483-B5CF-1EB2F2699B0D@amacapital.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f5858051-57fa-dc3f-158a-6afe7fc04ca4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/9/18 11:03 AM, Andy Lutomirski wrote:
>> Does ptrace (or user of this API) need a unique value per arch. Otherwise instead
>> of adding the boilerplate code to all arches, they could simply define AUDIT_ARCH
>> and common code could return it. Also the EM_xxx are not there in
>> include/uapi/linux/elf.h to begin with since libc elf.h already defines them.
>>
> A lot of architectures allow multiple audit_arches at runtime due to compat support and similar features, so it really does want to be a function.  The goal of this patch set is to get it supported everywhere.
> 

I was wondering if we could have a common syscall_get_arch() simply returning an
per-arch AUDIT_ARCH. But seems like the function itself needs to be per arch
anyways due to the nuances above.
