From: will.deacon@arm.com (Will Deacon)
Date: Fri, 10 Mar 2017 18:09:39 +0000
Subject: [PATCH 03/20] asm-generic: Drop getrlimit and setrlimit syscalls
 from default list
In-Reply-To: <1488395968-14313-4-git-send-email-ynorov@caviumnetworks.com>
References: <1488395968-14313-1-git-send-email-ynorov@caviumnetworks.com>
 <1488395968-14313-4-git-send-email-ynorov@caviumnetworks.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170310180938.GG18894@arm.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 02, 2017@12:49:11AM +0530, Yury Norov wrote:
> The newer prlimit64 syscall provides all the functionality provided by
> the getrlimit and setrlimit syscalls and adds the pid of target process,
> so future architectures won't need to include getrlimit and setrlimit.
> 
> Therefore drop getrlimit and setrlimit syscalls from the generic syscall
> list unless __ARCH_WANT_SET_GET_RLIMIT is defined by the architecture's
> unistd.h prior to including asm-generic/unistd.h, and adjust all architectures
> using the generic syscall list to define it so that no in-tree architectures
> are affected.
> 
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: James Hogan <james.hogan at imgtec.com>
> Cc: linux-arch at vger.kernel.org
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
> Acked-by: Arnd Bergmann <arnd at arndb.de>
> Acked-by: Mark Salter <msalter at redhat.com> [c6x]
> Acked-by: James Hogan <james.hogan at imgtec.com> [metag]
> Acked-by: Ley Foon Tan <lftan at altera.com> [nios2]
> Acked-by: Stafford Horne <shorne at gmail.com> [openrisc]
> Acked-by: Vineet Gupta <vgupta at synopsys.com> #arch/arc bits
> Signed-off-by: Yury Norov <ynorov at caviumnetworks.com>
> ---
>  arch/arc/include/uapi/asm/unistd.h       | 1 +
>  arch/arm64/include/uapi/asm/unistd.h     | 1 +
>  arch/c6x/include/uapi/asm/unistd.h       | 1 +
>  arch/h8300/include/uapi/asm/unistd.h     | 1 +
>  arch/hexagon/include/uapi/asm/unistd.h   | 1 +
>  arch/metag/include/uapi/asm/unistd.h     | 1 +
>  arch/nios2/include/uapi/asm/unistd.h     | 1 +
>  arch/openrisc/include/uapi/asm/unistd.h  | 1 +
>  arch/score/include/uapi/asm/unistd.h     | 1 +
>  arch/tile/include/uapi/asm/unistd.h      | 1 +
>  arch/unicore32/include/uapi/asm/unistd.h | 1 +
>  include/uapi/asm-generic/unistd.h        | 5 +++++
>  12 files changed, 16 insertions(+)

For the arm64 part:

Acked-by: Will Deacon <will.deacon at arm.com>

Will
