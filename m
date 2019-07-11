From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Thu, 11 Jul 2019 15:28:07 +0530
Subject: [PATCH] mm/kprobes: Add generic kprobe_fault_handler() fallback
 definition
In-Reply-To: <1562304629-29376-1-git-send-email-anshuman.khandual@arm.com>
References: <1562304629-29376-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <542893ae-ed64-55b2-11ee-1f19710a25e4@arm.com>
To: linux-snps-arc@lists.infradead.org



On 07/05/2019 11:00 AM, Anshuman Khandual wrote:
> Architectures like parisc enable CONFIG_KROBES without having a definition
> for kprobe_fault_handler() which results in a build failure. Arch needs to
> provide kprobe_fault_handler() as it is platform specific and cannot have
> a generic working alternative. But in the event when platform lacks such a
> definition there needs to be a fallback.
> 
> This adds a stub kprobe_fault_handler() definition which not only prevents
> a build failure but also makes sure that kprobe_page_fault() if called will
> always return negative in absence of a sane platform specific alternative.
> 
> While here wrap kprobe_page_fault() in CONFIG_KPROBES. This enables stud
> definitions for generic kporbe_fault_handler() and kprobes_built_in() can
> just be dropped. Only on x86 it needs to be added back locally as it gets
> used in a !CONFIG_KPROBES function do_general_protection().
> 
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Russell King <linux at armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Will Deacon <will at kernel.org>
> Cc: Tony Luck <tony.luck at intel.com>
> Cc: Fenghua Yu <fenghua.yu at intel.com>
> Cc: Ralf Baechle <ralf at linux-mips.org>
> Cc: Paul Burton <paul.burton at mips.com>
> Cc: James Hogan <jhogan at kernel.org>
> Cc: Benjamin Herrenschmidt <benh at kernel.crashing.org>
> Cc: Paul Mackerras <paulus at samba.org>
> Cc: Michael Ellerman <mpe at ellerman.id.au>
> Cc: Heiko Carstens <heiko.carstens at de.ibm.com>
> Cc: Vasily Gorbik <gor at linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger at de.ibm.com>
> Cc: Yoshinori Sato <ysato at users.sourceforge.jp>
> Cc: Rich Felker <dalias at libc.org>
> Cc: "David S. Miller" <davem at davemloft.net>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Ingo Molnar <mingo at redhat.com>
> Cc: Borislav Petkov <bp at alien8.de>
> Cc: "H. Peter Anvin" <hpa at zytor.com>
> Cc: "Naveen N. Rao" <naveen.n.rao at linux.ibm.com>
> Cc: Anil S Keshavamurthy <anil.s.keshavamurthy at intel.com>
> Cc: Masami Hiramatsu <mhiramat at kernel.org>
> Cc: Allison Randal <allison at lohutok.net>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Cc: Enrico Weigelt <info at metux.net>
> Cc: Richard Fontana <rfontana at redhat.com>
> Cc: Kate Stewart <kstewart at linuxfoundation.org>
> Cc: Mark Rutland <mark.rutland at arm.com>
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: Guenter Roeck <linux at roeck-us.net>
> Cc: x86 at kernel.org
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-arm-kernel at lists.infradead.org
> Cc: linux-ia64 at vger.kernel.org
> Cc: linux-mips at vger.kernel.org
> Cc: linuxppc-dev at lists.ozlabs.org
> Cc: linux-s390 at vger.kernel.org
> Cc: linux-sh at vger.kernel.org
> Cc: sparclinux at vger.kernel.org
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual at arm.com>
> ---

Any updates or suggestions on this patch ? Currently there is a build failure on
parisc architecture due to the lack of a kprobe_fault_handler() definition when
CONFIG_KPROBES is enabled and this build failure needs to be fixed.

This patch solves the build problem. But otherwise I am also happy to just define
a stub definition for kprobe_fault_handler() on parisc arch when CONFIG_KPROBES
is enabled, which will avoid the build failure. Please suggest.
