From: paul.burton@mips.com (Paul Burton)
Date: Wed, 3 Apr 2019 22:51:56 +0000
Subject: [PATCH 5/6 v3] syscalls: Remove start and number from
 syscall_get_arguments() args
In-Reply-To: <20190401134421.278590567@goodmis.org>
References: <20190401134104.676620247@goodmis.org>
 <20190401134421.278590567@goodmis.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190403225151.s5suxxmu6b2c4svt@pburton-laptop>
To: linux-snps-arc@lists.infradead.org

Hi Steven,

On Mon, Apr 01, 2019@09:41:09AM -0400, Steven Rostedt wrote:
> From: "Steven Rostedt (Red Hat)" <rostedt at goodmis.org>
> 
> At Linux Plumbers, Andy Lutomirski approached me and pointed out that the
> function call syscall_get_arguments() implemented in x86 was horribly
> written and not optimized for the standard case of passing in 0 and 6 for
> the starting index and the number of system calls to get. When looking at
> all the users of this function, I discovered that all instances pass in only
> 0 and 6 for these arguments. Instead of having this function handle
> different cases that are never used, simply rewrite it to return the first 6
> arguments of a system call.
> 
> This should help out the performance of tracing system calls by ptrace,
> ftrace and perf.
> 
> Link: http://lkml.kernel.org/r/20161107213233.754809394 at goodmis.org
> 
> Cc: Oleg Nesterov <oleg at redhat.com>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Kees Cook <keescook at chromium.org>
> Cc: Andy Lutomirski <luto at amacapital.net>
> Cc: Dominik Brodowski <linux at dominikbrodowski.net>
> Cc: Dave Martin <dave.martin at arm.com>
> Cc: "Dmitry V. Levin" <ldv at altlinux.org>
> Cc: x86 at kernel.org
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-arm-kernel at lists.infradead.org
> Cc: linux-c6x-dev at linux-c6x.org
> Cc: uclinux-h8-devel at lists.sourceforge.jp
> Cc: linux-hexagon at vger.kernel.org
> Cc: linux-ia64 at vger.kernel.org
> Cc: linux-mips at vger.kernel.org
> Cc: nios2-dev at lists.rocketboards.org
> Cc: openrisc at lists.librecores.org
> Cc: linux-parisc at vger.kernel.org
> Cc: linuxppc-dev at lists.ozlabs.org
> Cc: linux-riscv at lists.infradead.org
> Cc: linux-s390 at vger.kernel.org
> Cc: linux-sh at vger.kernel.org
> Cc: sparclinux at vger.kernel.org
> Cc: linux-um at lists.infradead.org
> Cc: linux-xtensa at linux-xtensa.org
> Cc: linux-arch at vger.kernel.org
> Reported-by: Andy Lutomirski <luto at amacapital.net>
> Signed-off-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

Acked-by: Paul Burton <paul.burton at mips.com> # MIPS parts

Thanks,
    Paul
