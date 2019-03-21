From: paul@paul-moore.com (Paul Moore)
Date: Wed, 20 Mar 2019 21:18:17 -0400
Subject: [PATCH v2 02/13] arc: define syscall_get_arch()
In-Reply-To: <20190317232847.GC16301@altlinux.org>
References: <20190317232847.GC16301@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHC9VhTVqYLnaLkZqVcdtOsNqisZz6DaGsnPu13FjNfYco9Yxg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sun, Mar 17, 2019@7:28 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> syscall_get_arch() is required to be implemented on all architectures
> in addition to already implemented syscall_get_nr(),
> syscall_get_arguments(), syscall_get_error(), and
> syscall_get_return_value() functions in order to extend the generic
> ptrace API with PTRACE_GET_SYSCALL_INFO request.
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
>  arch/arc/include/asm/syscall.h | 11 +++++++++++
>  include/uapi/linux/audit.h     |  4 ++++
>  2 files changed, 15 insertions(+)

Merged into audit/next, thanks everyone.

-- 
paul moore
www.paul-moore.com
