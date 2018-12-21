From: ldv@altlinux.org (Dmitry V. Levin)
Date: Fri, 21 Dec 2018 04:21:12 +0300
Subject: [PATCH v6 05/27] arc: define syscall_get_arch()
In-Reply-To: <20181213172146.GE6024@altlinux.org>
References: <20181213171833.GA5240@altlinux.org>
 <20181213172146.GE6024@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181221012112.GB4591@altlinux.org>
To: linux-snps-arc@lists.infradead.org

Hi,

On Thu, Dec 13, 2018@08:21:46PM +0300, Dmitry V. Levin wrote:
> syscall_get_arch() is required to be implemented on all architectures
> in addition to already implemented syscall_get_nr(),
> syscall_get_arguments(), syscall_get_error(), and
> syscall_get_return_value() functions in order to extend the generic
> ptrace API with PTRACE_GET_SYSCALL_INFO request.
> 
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> Cc: Elvira Khabirova <lineprinter at altlinux.org>
> Cc: Eugene Syromyatnikov <esyr at redhat.com>
> Cc: Oleg Nesterov <oleg at redhat.com>
> Cc: Andy Lutomirski <luto at kernel.org>
> Cc: Alexey Brodkin <alexey.brodkin at synopsys.com>
> Cc: Paul Moore <paul at paul-moore.com>
> Cc: Eric Paris <eparis at redhat.com>
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-audit at redhat.com
> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> ---

Looks like the whole series is going to be pinged for quite some time yet,
so would you mind taking this patch into your arc tree, please?
 
Thanks.

> Notes:
>     v6: unchanged
>     v5: added Cc
>     v2: added Acked-by
> 
>  arch/arc/include/asm/syscall.h | 11 +++++++++++
>  include/uapi/linux/audit.h     |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
> index 29de09804306..c7fc4c0c3bcb 100644
> --- a/arch/arc/include/asm/syscall.h
> +++ b/arch/arc/include/asm/syscall.h
> @@ -9,6 +9,7 @@
>  #ifndef _ASM_ARC_SYSCALL_H
>  #define _ASM_ARC_SYSCALL_H  1
>  
> +#include <uapi/linux/audit.h>
>  #include <linux/err.h>
>  #include <linux/sched.h>
>  #include <asm/unistd.h>
> @@ -68,4 +69,14 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	}
>  }
>  
> +static inline int
> +syscall_get_arch(void)
> +{
> +	return IS_ENABLED(CONFIG_ISA_ARCOMPACT)
> +		? (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)
> +			? AUDIT_ARCH_ARCOMPACTBE : AUDIT_ARCH_ARCOMPACT)
> +		: (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)
> +			? AUDIT_ARCH_ARCV2BE : AUDIT_ARCH_ARCV2);
> +}
> +
>  #endif
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 818ae690ab79..bedf3bf54c3a 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -375,6 +375,10 @@ enum {
>  
>  #define AUDIT_ARCH_AARCH64	(EM_AARCH64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>  #define AUDIT_ARCH_ALPHA	(EM_ALPHA|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_ARCOMPACT	(EM_ARCOMPACT|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_ARCOMPACTBE	(EM_ARCOMPACT)
> +#define AUDIT_ARCH_ARCV2	(EM_ARCV2|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_ARCV2BE	(EM_ARCV2)
>  #define AUDIT_ARCH_ARM		(EM_ARM|__AUDIT_ARCH_LE)
>  #define AUDIT_ARCH_ARMEB	(EM_ARM)
>  #define AUDIT_ARCH_CRIS		(EM_CRIS|__AUDIT_ARCH_LE)
> -- 
> ldv

-- 
ldv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20181221/fc930f01/attachment.sig>
