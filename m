From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 May 2016 05:13:46 +0000
Subject: [PATCH v2] asm-generic: Drop renameat syscall from default list
References: <1461965366-7893-1-git-send-email-james.hogan@imgtec.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4EA010A@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 30 April 2016 02:59 AM, James Hogan wrote:
> The newer renameat2 syscall provides all the functionality provided by
> the renameat syscall and adds flags, so future architectures won't need
> to include renameat.
>
> Therefore drop the renameat syscall from the generic syscall list unless
> __ARCH_WANT_RENAMEAT is defined by the architecture's unistd.h prior to
> including asm-generic/unistd.h, and adjust all architectures using the
> generic syscall list to define it so that no in-tree architectures are
> affected.
>
> Signed-off-by: James Hogan <james.hogan at imgtec.com>
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: linux-arch at vger.kernel.org
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: linux-arm-kernel at lists.infradead.org
> Cc: Mark Salter <msalter at redhat.com>
> Cc: Aurelien Jacquiot <a-jacquiot at ti.com>
> Cc: linux-c6x-dev at linux-c6x.org
> Cc: Richard Kuo <rkuo at codeaurora.org>
> Cc: linux-hexagon at vger.kernel.org
> Cc: linux-metag at vger.kernel.org
> Cc: Jonas Bonn <jonas at southpole.se>
> Cc: linux at lists.openrisc.net
> Cc: Chen Liqin <liqin.linux at gmail.com>
> Cc: Lennox Wu <lennox.wu at gmail.com>
> Cc: Chris Metcalf <cmetcalf at mellanox.com>
> Cc: Guan Xuetao <gxt at mprc.pku.edu.cn>
> Cc: Ley Foon Tan <lftan at altera.com>
> Cc: nios2-dev at lists.rocketboards.org
> Cc: Yoshinori Sato <ysato at users.sourceforge.jp>
> Cc: uclinux-h8-devel at lists.sourceforge.jp
> ---
> I just found this patch on an old branch, it appears to have slipped
> through the cracks. Time for a respon.
>
> Changes in v2:
> - Rebase onto v4.6-rc5.
> - Add __ARCH_WANT_RENAMEAT to h8300 and nios2 arches too.
> ---
>  arch/arc/include/uapi/asm/unistd.h       | 1 +

Acked-by: Vineet Gupta <vgupta at synopsys.com>  # for arch/arc
