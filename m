From: fweimer@redhat.com (Florian Weimer)
Date: Tue, 18 Dec 2018 22:26:09 +0100
Subject: [PATCH 12/21] ARC: Update syscall-names.list for ARC specific
 syscalls
In-Reply-To: <1545167083-16764-13-git-send-email-vgupta@synopsys.com> (Vineet
 Gupta's message of "Tue, 18 Dec 2018 13:04:34 -0800")
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-13-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87lg4my1am.fsf@oldenburg2.str.redhat.com>
To: linux-snps-arc@lists.infradead.org

* Vineet Gupta:

> diff --git a/sysdeps/unix/sysv/linux/syscall-names.list b/sysdeps/unix/sysv/linux/syscall-names.list
> index f88001c9c38d..62862010600f 100644
> --- a/sysdeps/unix/sysv/linux/syscall-names.list
> +++ b/sysdeps/unix/sysv/linux/syscall-names.list
> @@ -42,6 +42,9 @@ adjtimex
>  afs_syscall
>  alarm
>  alloc_hugepages
> +arc_gettls
> +arc_settls
> +arc_usr_cmpxchg
>  arch_prctl
>  arm_fadvise64_64
>  arm_sync_file_range

This should come in with a sync with a released upstream kernel.  Will
the port be in Linux 4.20?

Thanks,
Florian
