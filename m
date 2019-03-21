From: paul@paul-moore.com (Paul Moore)
Date: Wed, 20 Mar 2019 21:17:47 -0400
Subject: [PATCH v2 01/13] Move EM_ARCOMPACT and EM_ARCV2 to
 uapi/linux/elf-em.h
In-Reply-To: <20190317232839.GB16301@altlinux.org>
References: <20190317232839.GB16301@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHC9VhSWrSsykMm+or6gpMYJQ7WuiNEEmmsCQnQ+KMyR=W8p+w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sun, Mar 17, 2019@7:28 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> These should never have been defined in the arch tree to begin with, and
> now uapi/linux/audit.h header is going to use EM_ARCOMPACT and EM_ARCV2
> in order to define AUDIT_ARCH_ARCOMPACT and AUDIT_ARCH_ARCV2 which are
> needed to implement syscall_get_arch() which in turn is required to
> extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> Acked-by: Paul Moore <paul at paul-moore.com>
> Cc: Elvira Khabirova <lineprinter at altlinux.org>
> Cc: Eugene Syromyatnikov <esyr at redhat.com>
> Cc: Alexey Brodkin <alexey.brodkin at synopsys.com>
> Cc: Oleg Nesterov <oleg at redhat.com>
> Cc: Andy Lutomirski <luto at kernel.org>
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-audit at redhat.com
> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> ---
>
> Notes:
>     v2: unchanged
>
>  arch/arc/include/asm/elf.h  | 6 +-----
>  include/uapi/linux/elf-em.h | 2 ++
>  2 files changed, 3 insertions(+), 5 deletions(-)

Merged into audit/next, thanks everyone.

-- 
paul moore
www.paul-moore.com
