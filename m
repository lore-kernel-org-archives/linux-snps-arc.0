From: khilman@baylibre.com (Kevin Hilman)
Date: Sat, 08 Dec 2018 13:58:18 -0800
Subject: stable/linux-4.9.y build: 193 builds: 2 failed, 191 passed,
 122 warnings (v4.9.144)
In-Reply-To: <5c0bd5f7.1c69fb81.d977c.b70f@mx.google.com>
References: <5c0bd5f7.1c69fb81.d977c.b70f@mx.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7hpnubhe9x.fsf@baylibre.com>
To: linux-snps-arc@lists.infradead.org

FYI... we now have stable trees building all the ARCv2 defconfigs in
kernelCI.org, and there are couple build failures.  Following the link
below, you'll be able to see full build logs.

Kevin

"kernelci.org bot" <bot at kernelci.org> writes:

> stable/linux-4.9.y build: 193 builds: 2 failed, 191 passed, 122 warnings (v4.9.144)
>
> Full Build Summary: https://kernelci.org/build/stable/branch/linux-4.9.y/kernel/v4.9.144/
>
> Tree: stable
> Branch: linux-4.9.y
> Git Describe: v4.9.144
> Git Commit: 1aa861ff238ecd17a3095b0dbd2d20bdf7bfaf14
> Git URL: http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> Built: 6 unique architectures
>
> Build Failures Detected:
>
> arc:    gcc version 7.1.1 20170710 (ARCv2 ISA Linux uClibc toolchain 2017.09)
>
>     zebu_hs_defconfig: FAIL
>     zebu_hs_smp_defconfig: FAIL
>
> Warnings Detected:
>
> arc:    gcc version 7.1.1 20170710 (ARCv2 ISA Linux uClibc toolchain 2017.09)
>
>     allnoconfig: 5 warnings
>     axs103_defconfig: 18 warnings
>     axs103_smp_defconfig: 19 warnings
>     nsim_hs_smp_defconfig: 6 warnings
>     nsimosci_hs_defconfig: 8 warnings
>     nsimosci_hs_smp_defconfig: 9 warnings
>     tinyconfig: 6 warnings
>     vdk_hs38_defconfig: 19 warnings
>     vdk_hs38_smp_defconfig: 20 warnings
>     zebu_hs_defconfig: 5 warnings
>     zebu_hs_smp_defconfig: 6 warnings
>
> mips:    gcc version 6.3.0 (GCC)
>
>     decstation_defconfig: 1 warning
>
>
> Warnings summary:
>
>     36   fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     12   arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     11   kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     11   include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     9    net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     9    net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     9    include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>     7    warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     6    fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     5    lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
>     4    block/cfq-iosched.c:3840:1: warning: control reaches end of non-void function [-Wreturn-type]
>     2    arch/arc/kernel/unwind.c:188:14: warning: 'unw_hdr_alloc' defined but not used [-Wunused-function]
>     1    drivers/net/ethernet/amd/declance.c:1231:2: warning: 'desc' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> ================================================================================
>
> Detailed per-defconfig build reports:
>
> --------------------------------------------------------------------------------
> acs5k_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> acs5k_tiny_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> allnoconfig (i386) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> allnoconfig (x86_64) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> allnoconfig (arm64) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> allnoconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> allnoconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> allnoconfig (arc) ? PASS, 0 errors, 5 warnings, 0 section mismatches
>
> Warnings:
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>
> --------------------------------------------------------------------------------
> am200epdkit_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ar7_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> aspeed_g4_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> aspeed_g5_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> assabet_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> at91_dt_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ath25_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ath79_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> axm55xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> axs103_defconfig (arc) ? PASS, 0 errors, 18 warnings, 0 section mismatches
>
> Warnings:
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     block/cfq-iosched.c:3840:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> axs103_smp_defconfig (arc) ? PASS, 0 errors, 19 warnings, 0 section mismatches
>
> Warnings:
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     block/cfq-iosched.c:3840:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> badge4_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> bcm2835_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> bcm47xx_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> bcm63xx_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> bigsur_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> bmips_be_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> bmips_stb_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> capcella_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> cavium_octeon_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> cerfcube_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ci20_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> clps711x_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> cm_x2xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> cm_x300_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> cns3420vb_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> cobalt_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> colibri_pxa270_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> colibri_pxa300_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> collie_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> corgi_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> davinci_all_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> db1xxx_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> decstation_defconfig (mips) ? PASS, 0 errors, 1 warning, 0 section mismatches
>
> Warnings:
>     drivers/net/ethernet/amd/declance.c:1231:2: warning: 'desc' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> --------------------------------------------------------------------------------
> defconfig (arm64) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> dove_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> e55_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ebsa110_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> efm32_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> em_x270_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ep93xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> eseries_pxa_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> exynos_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ezx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> footbridge_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> fuloong2e_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> gpr_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> h3600_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> h5000_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> hackkit_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> hisi_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> imote2_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> imx_v4_v5_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> imx_v6_v7_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> integrator_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> iop13xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> iop32x_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> iop33x_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ip22_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ip27_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ip28_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ip32_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ixp4xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> jazz_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> jmr3927_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> jornada720_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> keystone_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> ks8695_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lart_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lasat_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lemote2f_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> loongson1b_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> loongson1c_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> loongson3_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lpc18xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lpc32xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lpd270_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> lubbock_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> magician_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mainstone_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> malta_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> malta_kvm_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> malta_kvm_guest_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> malta_qemu_32r6_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> maltaaprp_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> maltasmvp_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> maltasmvp_eva_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> maltaup_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> maltaup_xpa_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> markeins_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mini2440_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mips_paravirt_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mmp2_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> moxart_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mpc30x_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mps2_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> msp71xx_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mtx1_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> multi_v4t_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> multi_v5_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> multi_v7_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mv78xx0_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mvebu_v5_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mvebu_v7_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> mxs_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> neponset_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> netwinder_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> netx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> nhk8815_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> nlm_xlp_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> nlm_xlr_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> nsim_hs_smp_defconfig (arc) ? PASS, 0 errors, 6 warnings, 0 section mismatches
>
> Warnings:
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> nsimosci_hs_defconfig (arc) ? PASS, 0 errors, 8 warnings, 0 section mismatches
>
> Warnings:
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> nsimosci_hs_smp_defconfig (arc) ? PASS, 0 errors, 9 warnings, 0 section mismatches
>
> Warnings:
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> nuc910_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> nuc950_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> nuc960_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> omap1_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> omap2plus_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> orion5x_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> palmz72_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pcm027_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pic32mzda_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pistachio_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pleb_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pnx8335_stb225_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> prima2_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pxa168_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pxa255-idp_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pxa3xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pxa910_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> pxa_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> qcom_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> qi_lb60_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> raumfeld_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> rb532_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> rbtx49xx_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> realview_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> rm200_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> rpc_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> rt305x_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> s3c2410_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> s3c6400_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> s5pv210_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> sama5_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> sb1250_swarm_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> shannon_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> shmobile_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> simpad_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> socfpga_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> spear13xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> spear3xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> spear6xx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> spitz_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> stm32_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> sunxi_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tb0219_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tb0226_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tb0287_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tct_hammer_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tegra_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tinyconfig (x86_64) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tinyconfig (i386) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tinyconfig (arm64) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tinyconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tinyconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> tinyconfig (arc) ? PASS, 0 errors, 6 warnings, 0 section mismatches
>
> Warnings:
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     warning: (ARC) selects HAVE_FUTEX_CMPXCHG which has unmet direct dependencies (FUTEX)
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> trizeps4_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> u300_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> u8500_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> vdk_hs38_defconfig (arc) ? PASS, 0 errors, 19 warnings, 0 section mismatches
>
> Warnings:
>     arch/arc/kernel/unwind.c:188:14: warning: 'unw_hdr_alloc' defined but not used [-Wunused-function]
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     block/cfq-iosched.c:3840:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> vdk_hs38_smp_defconfig (arc) ? PASS, 0 errors, 20 warnings, 0 section mismatches
>
> Warnings:
>     arch/arc/kernel/unwind.c:188:14: warning: 'unw_hdr_alloc' defined but not used [-Wunused-function]
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     fs/ext4/ext4_jbd2.h:430:1: warning: control reaches end of non-void function [-Wreturn-type]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
>     fs/posix_acl.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     block/cfq-iosched.c:3840:1: warning: control reaches end of non-void function [-Wreturn-type]
>     lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> versatile_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> vexpress_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> vf610m4_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> viper_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> vt8500_v6_v7_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> workpad_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> xcep_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> xilfpga_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> xway_defconfig (mips) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> zebu_hs_defconfig (arc) ? FAIL, 0 errors, 5 warnings, 0 section mismatches
>
> Warnings:
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> zebu_hs_smp_defconfig (arc) ? FAIL, 0 errors, 6 warnings, 0 section mismatches
>
> Warnings:
>     include/linux/kernel.h:740:16: warning: comparison of distinct pointer types lacks a cast
>     kernel/sched/core.c:3294:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/core/ethtool.c:300:1: warning: control reaches end of non-void function [-Wreturn-type]
>     net/ipv4/tcp_input.c:4325:49: warning: array subscript is above array bounds [-Warray-bounds]
>     lib/cpumask.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
>     include/linux/sunrpc/svc_xprt.h:178:1: warning: control reaches end of non-void function [-Wreturn-type]
>
> --------------------------------------------------------------------------------
> zeus_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> --------------------------------------------------------------------------------
> zx_defconfig (arm) ? PASS, 0 errors, 0 warnings, 0 section mismatches
>
> ---
> For more info write to <info at kernelci.org>
> _______________________________________________
> Kernel-build-reports mailing list
> Kernel-build-reports at lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/kernel-build-reports
