From: noamc@ezchip.com (Noam Camus)
Date: Tue, 1 Dec 2015 15:02:58 +0200
Subject: [PATCH v3 11/18] ARC: [plat-eznps] Add eznps platform
In-Reply-To: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448974985-11487-12-git-send-email-noamc@ezchip.com>
To: linux-snps-arc@lists.infradead.org

From: Noam Camus <noamc@ezchip.com>

This platform include boards:
	Hardware Emulator (HE)
	Simulator based upon nSIM.

Signed-off-by: Noam Camus <noamc at ezchip.com>
---
 MAINTAINERS                             |    6 +
 arch/arc/plat-eznps/Kconfig             |   34 ++++
 arch/arc/plat-eznps/Makefile            |    7 +
 arch/arc/plat-eznps/entry.S             |   75 +++++++++
 arch/arc/plat-eznps/include/plat/ctop.h |  250 +++++++++++++++++++++++++++++++
 arch/arc/plat-eznps/include/plat/mtm.h  |   60 ++++++++
 arch/arc/plat-eznps/include/plat/smp.h  |   26 ++++
 arch/arc/plat-eznps/mtm.c               |  133 ++++++++++++++++
 arch/arc/plat-eznps/platform.c          |   27 ++++
 arch/arc/plat-eznps/smp.c               |  149 ++++++++++++++++++
 10 files changed, 767 insertions(+), 0 deletions(-)
 create mode 100644 arch/arc/plat-eznps/Kconfig
 create mode 100644 arch/arc/plat-eznps/Makefile
 create mode 100644 arch/arc/plat-eznps/entry.S
 create mode 100644 arch/arc/plat-eznps/include/plat/ctop.h
 create mode 100644 arch/arc/plat-eznps/include/plat/mtm.h
 create mode 100644 arch/arc/plat-eznps/include/plat/smp.h
 create mode 100644 arch/arc/plat-eznps/mtm.c
 create mode 100644 arch/arc/plat-eznps/platform.c
 create mode 100644 arch/arc/plat-eznps/smp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e9caa4b..abb1897 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4257,6 +4257,12 @@ S:	Maintained
 F:	drivers/video/fbdev/exynos/exynos_mipi*
 F:	include/video/exynos_mipi*
 
+EZchip NPS platform support
+M:	Noam Camus <noamc at ezchip.com>
+S:	Supported
+F:	arch/arc/plat-eznps
+F:	arch/arc/boot/dts/eznps.dts
+
 F71805F HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare at suse.com>
 L:	lm-sensors at lm-sensors.org
diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig
new file mode 100644
index 0000000..051fdca
--- /dev/null
+++ b/arch/arc/plat-eznps/Kconfig
@@ -0,0 +1,34 @@
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.txt.
+#
+
+menuconfig ARC_PLAT_EZNPS
+	bool "\"EZchip\" ARC dev platform"
+	select ARC_HAS_COH_CACHES if SMP
+	select CPU_BIG_ENDIAN
+	select CLKSRC_NPS
+	select EZCHIP_NPS_MANAGEMENT_ENET if ETHERNET
+	help
+	  Support for EZchip development platforms,
+	  based on ARC700 cores.
+	  We handle few flavours:
+	    - Hardware Emulator AKA HE which is FPGA based chasis
+	    - Simulator based on MetaWare nSIM
+	    - NPS400 chip based on ASIC
+
+config EZNPS_MTM_EXT
+	bool "ARC-EZchip MTM Extensions"
+	select CPUMASK_OFFSTACK
+	depends on ARC_PLAT_EZNPS && SMP
+	default y
+	help
+	  Here we add new hierarchy for CPUs topology.
+	  We got:
+		Core
+		Thread
+	  At the new thread level each CPU represent one HW thread.
+	  At highest hierarchy each core contain 16 threads,
+	  any of them seem like CPU from Linux point of view.
+	  All threads within same core share the execution unit of the
+	  core and HW scheduler round robin between them.
diff --git a/arch/arc/plat-eznps/Makefile b/arch/arc/plat-eznps/Makefile
new file mode 100644
index 0000000..21091b1
--- /dev/null
+++ b/arch/arc/plat-eznps/Makefile
@@ -0,0 +1,7 @@
+#
+# Makefile for the linux kernel.
+#
+
+obj-y := entry.o platform.o
+obj-$(CONFIG_SMP) += smp.o
+obj-$(CONFIG_EZNPS_MTM_EXT) += mtm.o
diff --git a/arch/arc/plat-eznps/entry.S b/arch/arc/plat-eznps/entry.S
new file mode 100644
index 0000000..b4dee38
--- /dev/null
+++ b/arch/arc/plat-eznps/entry.S
@@ -0,0 +1,75 @@
+/*******************************************************************************
+
+  EZNPS CPU startup Code
+  Copyright(c) 2012 EZchip Technologies.
+
+  This program is free software; you can redistribute it and/or modify it
+  under the terms and conditions of the GNU General Public License,
+  version 2, as published by the Free Software Foundation.
+
+  This program is distributed in the hope it will be useful, but WITHOUT
+  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+  more details.
+
+  The full GNU General Public License is included in this distribution in
+  the file called "COPYING".
+
+*******************************************************************************/
+#include <linux/linkage.h>
+#include <asm/entry.h>
+#include <asm/cache.h>
+#include <plat/ctop.h>
+
+	.cpu A7
+
+	.section .init.text, "ax", at progbits
+	.align 1024	; HW requierment for restart first PC
+
+ENTRY(res_service)
+#ifdef CONFIG_EZNPS_MTM_EXT
+	; For HW thread != 0 there is no work.
+	lr	r3, [CTOP_AUX_THREAD_ID]
+	cmp	r3, 0
+	jne	stext
+#endif
+
+#ifdef CONFIG_ARC_HAS_DCACHE
+	; With no cache coherency mechanism D$ need to be used very carefully.
+	; Address space:
+	; 0G-2G: We disable CONFIG_ARC_CACHE_PAGES.
+	; 2G-3G: We disable D$ by setting this bit.
+	; 3G-4G: D$ is disabled by architecture.
+	; FMT are huge pages for user application reside at 0-2G.
+	; Only FMT left as one who can use D$ where each such page got
+	; disable/enable bit for cachability.
+	; Programmer will use FMT pages for private data so cache coherency
+	; would not be a problem.
+	; First thing we invalidate D$
+	sr	1, [ARC_REG_DC_IVDC]
+	sr	HW_COMPLY_KRN_NOT_D_CACHED, [CTOP_AUX_HW_COMPLY]
+#endif
+
+#ifdef CONFIG_SMP
+	; check for boot CPU
+	lr	r3, [CTOP_AUX_GLOBAL_ID]
+	cmp	r3, 0
+	jeq	stext
+
+	; We set logical cpuid to be used by GET_CPUID
+	; We do not use physical cpuid since we want ids to be continious when
+	; it comes to cpus on the same quad cluster.
+	; This is useful for applications that used shared resources of a quad
+	; cluster such SRAMS.
+	lr 	r3, [CTOP_AUX_CORE_ID]
+	sr	r3, [CTOP_AUX_LOGIC_CORE_ID]
+	lr	r3, [CTOP_AUX_CLUSTER_ID]
+	; Set logical is acheived by swap of 2 middle bits of cluster id (4 bit)
+	; r3 is used since we use short instruction and we need q-class reg
+	.short	CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST
+	.word 	CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM
+	 sr	r3, [CTOP_AUX_LOGIC_CLUSTER_ID]
+#endif
+
+	j	stext
+END(res_service)
diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
new file mode 100644
index 0000000..25a08dc
--- /dev/null
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -0,0 +1,250 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#ifndef _PLAT_EZNPS_CTOP_H
+#define _PLAT_EZNPS_CTOP_H
+
+#define NPS_HOST_REG_BASE			0xF6000000
+
+/* core auxiliary registers */
+#ifdef __ASSEMBLY__
+#define CTOP_AUX_BASE				(-0x800)
+#else
+#define CTOP_AUX_BASE				0xFFFFF800
+#endif
+
+#define CTOP_AUX_GLOBAL_ID			(CTOP_AUX_BASE + 0x000)
+#define CTOP_AUX_CLUSTER_ID			(CTOP_AUX_BASE + 0x004)
+#define CTOP_AUX_CORE_ID			(CTOP_AUX_BASE + 0x008)
+#define CTOP_AUX_THREAD_ID			(CTOP_AUX_BASE + 0x00C)
+#define CTOP_AUX_LOGIC_GLOBAL_ID		(CTOP_AUX_BASE + 0x010)
+#define CTOP_AUX_LOGIC_CLUSTER_ID		(CTOP_AUX_BASE + 0x014)
+#define CTOP_AUX_LOGIC_CORE_ID			(CTOP_AUX_BASE + 0x018)
+#define CTOP_AUX_MT_CTRL			(CTOP_AUX_BASE + 0x020)
+#define CTOP_AUX_HW_COMPLY			(CTOP_AUX_BASE + 0x024)
+#define CTOP_AUX_LPC				(CTOP_AUX_BASE + 0x030)
+#define AUX_REG_TSI1				(CTOP_AUX_BASE + 0x050)
+#define CTOP_AUX_EFLAGS				(CTOP_AUX_BASE + 0x080)
+#define CTOP_AUX_IACK				(CTOP_AUX_BASE + 0x088)
+#define CTOP_AUX_GPA1				(CTOP_AUX_BASE + 0x08C)
+#define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
+
+/* EZchip core instructions */
+#define CTOP_INST_HWSCHD_OFF_R3			0x3b6f00bf
+#define CTOP_INST_HWSCHD_OFF_R4			0x3c6f00bf
+#define CTOP_INST_HWSCHD_RESTORE_R3		0x3e6f7083
+#define CTOP_INST_HWSCHD_RESTORE_R4		0x3e6f7103
+#define CTOP_INST_SCHD_RW			0x3e6f7004
+#define CTOP_INST_SCHD_RD			0x3e6f7084
+#define CTOP_INST_ASRI_0_R3			0x3b56003e
+#define CTOP_INST_XEX_DI_R2_R2_R3		0x4a664c00
+#define CTOP_INST_EXC_DI_R2_R2_R3		0x4a664c01
+#define CTOP_INST_AADD_DI_R2_R2_R3		0x4a664c02
+#define CTOP_INST_AAND_DI_R2_R2_R3		0x4a664c04
+#define CTOP_INST_AOR_DI_R2_R2_R3		0x4a664c05
+#define CTOP_INST_AXOR_DI_R2_R2_R3		0x4a664c06
+#define CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST	0x5b60
+#define CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM	0x00010422
+#define CTOP_INST_RSPI_GIC_0_R12		0x3c56117e
+
+/* Do not use D$ for address in 2G-3G */
+#define HW_COMPLY_KRN_NOT_D_CACHED		_BITUL(28)
+
+#ifndef __ASSEMBLY__
+#define NPS_MSU_BLKID				0x018
+#define NPS_CRG_BLKID				0x480
+#define NPS_CRG_SYNC_BIT			_BITUL(0)
+#define NPS_GIM_BLKID				0x5C0
+
+/* CPU global ID */
+struct global_id {
+	union {
+		struct {
+#ifdef CONFIG_EZNPS_MTM_EXT
+			u32 __reserved:20, cluster:4, core:4, thread:4;
+#else
+			u32 __reserved:24, cluster:4, core:4;
+#endif
+		};
+		u32 value;
+	};
+};
+
+/*
+ * Convert logical to physical CPU IDs
+ *
+ * The conversion swap bits 1 and 2 of cluster id (out of 4 bits)
+ * Now quad of logical clusters id's are adjacent physically,
+ * and not like the id's physically came with each cluster.
+ * Below table is 4x4 mesh of core clusters as it layout on chip.
+ * Cluster ids are in format: logical (physical)
+ *
+ *    -----------------   ------------------
+ * 3 |  5 (3)   7 (7)  | | 13 (11)   15 (15)|
+ *
+ * 2 |  4 (2)   6 (6)  | | 12 (10)   14 (14)|
+ *    -----------------   ------------------
+ * 1 |  1 (1)   3 (5)  | |  9  (9)   11 (13)|
+ *
+ * 0 |  0 (0)   2 (4)  | |  8  (8)   10 (12)|
+ *    -----------------   ------------------
+ *       0       1            2        3
+ */
+static inline int nps_cluster_logic_to_phys(int cluster)
+{
+	__asm__ __volatile__(
+	"       mov r3,%0\n"
+	"       .short %1\n"
+	"       .word %2\n"
+	"       mov %0,r3\n"
+	: "+r"(cluster)
+	: "i"(CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST),
+	  "i"(CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM)
+	: "r3");
+
+	return cluster;
+}
+
+#define NPS_CPU_TO_CLUSTER_NUM(cpu) \
+	({ struct global_id gid; gid.value = cpu; \
+		nps_cluster_logic_to_phys(gid.cluster); })
+
+struct nps_host_reg_address {
+	union {
+		struct {
+			u32     base:8, cl_x:4, cl_y:4,
+			blkid:6, reg:8, __reserved:2;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_mtm_cfg {
+	union {
+		struct {
+			u32 gen:1, gdis:1, clk_gate_dis:1, asb:1,
+			__reserved:9, nat:3, ten:16;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_mtm_cpu_cfg {
+	union {
+		struct {
+			u32 csa:22, dmsid:6, __reserved:3, cs:1;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_thr_init {
+	union {
+		struct {
+			u32 str:1, __reserved:27, thr_id:4;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_thr_init_sts {
+	union {
+		struct {
+			u32 bsy:1, err:1, __reserved:26, thr_id:4;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_aux_udmc {
+	union {
+		struct {
+			u32 dcp:1, cme:1, __reserved:20, nat:3,
+			__reserved2:5, dcas:3;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_aux_mt_ctrl {
+	union {
+		struct {
+			u32 mten:1, hsen:1, scd:1, sten:1,
+			st_cnt:8, __reserved:8,
+			hs_cnt:8, __reserved1:4;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_aux_hw_comply {
+	union {
+		struct {
+			u32 me:1, le:1, te:1, knc:1, __reserved:28;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_aux_lpc {
+	union {
+		struct {
+			u32 mep:1, __reserved:31;
+		};
+		u32 value;
+	};
+};
+
+struct nps_host_reg_address_non_cl {
+	union {
+		struct {
+			u32 base:7, blkid:11, reg:12, __reserved:2;
+		};
+		u32 value;
+	};
+};
+
+static inline void *nps_host_reg_non_cl(u32 blkid, u32 reg)
+{
+	struct nps_host_reg_address_non_cl reg_address;
+
+	reg_address.value = NPS_HOST_REG_BASE;
+	reg_address.blkid = blkid;
+	reg_address.reg = reg;
+
+	return (void *)reg_address.value;
+}
+
+static inline void *nps_host_reg(u32 cpu, u32 blkid, u32 reg)
+{
+	struct nps_host_reg_address reg_address;
+	u32 cl = NPS_CPU_TO_CLUSTER_NUM(cpu);
+
+	reg_address.value = NPS_HOST_REG_BASE;
+	reg_address.cl_x  = (cl >> 2) & 0x3;
+	reg_address.cl_y  = cl & 0x3;
+	reg_address.blkid = blkid;
+	reg_address.reg   = reg;
+
+	return (void *)reg_address.value;
+}
+
+/* CRG registers */
+#define REG_GEN_PURP_0	nps_host_reg_non_cl(NPS_CRG_BLKID, 0x1BF)
+
+#endif /* __ASEMBLY__ */
+
+#endif /* _PLAT_EZNPS_CTOP_H */
diff --git a/arch/arc/plat-eznps/include/plat/mtm.h b/arch/arc/plat-eznps/include/plat/mtm.h
new file mode 100644
index 0000000..29b91b5
--- /dev/null
+++ b/arch/arc/plat-eznps/include/plat/mtm.h
@@ -0,0 +1,60 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#ifndef _PLAT_EZNPS_MTM_H
+#define _PLAT_EZNPS_MTM_H
+
+#include <plat/ctop.h>
+
+static inline void *nps_mtm_reg_addr(u32 cpu, u32 reg)
+{
+	struct global_id gid;
+	u32 core, blkid;
+
+	gid.value = cpu;
+	core = gid.core;
+	blkid = (((core & 0x0C) << 2) | (core & 0x03));
+
+	return nps_host_reg(cpu, blkid, reg);
+}
+
+#ifdef CONFIG_EZNPS_MTM_EXT
+#define NPS_CPU_TO_THREAD_NUM(cpu) \
+	({ struct global_id gid; gid.value = cpu; gid.thread; })
+
+/* MTM registers */
+#define MTM_CFG(cpu)			nps_mtm_reg_addr(cpu, 0x81)
+#define MTM_THR_INIT(cpu)		nps_mtm_reg_addr(cpu, 0x92)
+#define MTM_THR_INIT_STS(cpu)		nps_mtm_reg_addr(cpu, 0x93)
+
+#define get_thread(map) map.thread
+#define eznps_max_cpus 4096
+#define eznps_cpus_per_cluster	256
+
+void mtm_enable_core(unsigned int cpu);
+int mtm_enable_thread(int cpu);
+#else /* !CONFIG_EZNPS_MTM_EXT */
+
+#define get_thread(map) 0
+#define eznps_max_cpus 256
+#define eznps_cpus_per_cluster	16
+#define mtm_enable_core(cpu)
+#define mtm_enable_thread(cpu) 1
+#define NPS_CPU_TO_THREAD_NUM(cpu) 0
+
+#endif /* CONFIG_EZNPS_MTM_EXT */
+
+#endif /* _PLAT_EZNPS_MTM_H */
diff --git a/arch/arc/plat-eznps/include/plat/smp.h b/arch/arc/plat-eznps/include/plat/smp.h
new file mode 100644
index 0000000..06b59bd
--- /dev/null
+++ b/arch/arc/plat-eznps/include/plat/smp.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#ifndef __PLAT_EZNPS_SMP_H
+#define __PLAT_EZNPS_SMP_H
+
+#ifdef CONFIG_SMP
+
+extern void res_service(void);
+
+#endif /* CONFIG_SMP */
+
+#endif
diff --git a/arch/arc/plat-eznps/mtm.c b/arch/arc/plat-eznps/mtm.c
new file mode 100644
index 0000000..aaaaffd
--- /dev/null
+++ b/arch/arc/plat-eznps/mtm.c
@@ -0,0 +1,133 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/smp.h>
+#include <linux/io.h>
+#include <linux/log2.h>
+#include <asm/arcregs.h>
+#include <plat/mtm.h>
+#include <plat/smp.h>
+
+#define MT_CTRL_HS_CNT		0xFF
+#define MT_CTRL_ST_CNT		0xF
+#define NPS_NUM_HW_THREADS	0x10
+
+static void mtm_init_nat(int cpu)
+{
+	struct nps_host_reg_mtm_cfg mtm_cfg;
+	struct nps_host_reg_aux_udmc udmc;
+	int log_nat, nat = 0, i, t;
+
+	/* Iterate core threads and update nat */
+	for (i = 0, t = cpu; i < NPS_NUM_HW_THREADS; i++, t++)
+		nat += test_bit(t, cpumask_bits(cpu_possible_mask));
+
+	log_nat = ilog2(nat);
+
+	udmc.value = read_aux_reg(CTOP_AUX_UDMC);
+	udmc.nat = log_nat;
+	write_aux_reg(CTOP_AUX_UDMC, udmc.value);
+
+	mtm_cfg.value = ioread32be(MTM_CFG(cpu));
+	mtm_cfg.nat = log_nat;
+	iowrite32be(mtm_cfg.value, MTM_CFG(cpu));
+}
+
+static void mtm_init_thread(int cpu)
+{
+	int i, tries = 5;
+	struct nps_host_reg_thr_init thr_init;
+	struct nps_host_reg_thr_init_sts thr_init_sts;
+
+	/* Set thread init register */
+	thr_init.value = 0;
+	iowrite32be(thr_init.value, MTM_THR_INIT(cpu));
+	thr_init.thr_id = NPS_CPU_TO_THREAD_NUM(cpu);
+	thr_init.str = 1;
+	iowrite32be(thr_init.value, MTM_THR_INIT(cpu));
+
+	/* Poll till thread init is done */
+	for (i = 0; i < tries; i++) {
+		thr_init_sts.value = ioread32be(MTM_THR_INIT_STS(cpu));
+		if (thr_init_sts.thr_id == thr_init.thr_id) {
+			if (thr_init_sts.bsy)
+				continue;
+			else if (thr_init_sts.err)
+				pr_warn("Failed to thread init cpu %u\n", cpu);
+			break;
+		}
+
+		pr_warn("Wrong thread id in thread init for cpu %u\n", cpu);
+		break;
+	}
+
+	if (i == tries)
+		pr_warn("Got thread init timeout for cpu %u\n", cpu);
+}
+
+int mtm_enable_thread(int cpu)
+{
+	struct nps_host_reg_mtm_cfg mtm_cfg;
+
+	if (NPS_CPU_TO_THREAD_NUM(cpu) == 0)
+		return 1;
+
+	/* Enable thread in mtm */
+	mtm_cfg.value = ioread32be(MTM_CFG(cpu));
+	mtm_cfg.ten |= (1 << (NPS_CPU_TO_THREAD_NUM(cpu)));
+	iowrite32be(mtm_cfg.value, MTM_CFG(cpu));
+
+	return 0;
+}
+
+void mtm_enable_core(unsigned int cpu)
+{
+	int i;
+	struct nps_host_reg_aux_mt_ctrl mt_ctrl;
+	struct nps_host_reg_mtm_cfg mtm_cfg;
+
+	if (NPS_CPU_TO_THREAD_NUM(cpu) != 0)
+		return;
+
+	/* Initialize Number of Active Threads */
+	mtm_init_nat(cpu);
+
+	/* Initialize mtm_cfg */
+	mtm_cfg.value = ioread32be(MTM_CFG(cpu));
+	mtm_cfg.ten = 1;
+	iowrite32be(mtm_cfg.value, MTM_CFG(cpu));
+
+	/* Initialize all other threads in core */
+	for (i = 1; i < NPS_NUM_HW_THREADS; i++)
+		mtm_init_thread(cpu + i);
+
+
+	/* Enable HW schedule, stall counter, mtm */
+	mt_ctrl.value = 0;
+	mt_ctrl.hsen = 1;
+	mt_ctrl.hs_cnt = MT_CTRL_HS_CNT;
+	mt_ctrl.sten = 1;
+	mt_ctrl.st_cnt = MT_CTRL_ST_CNT;
+	mt_ctrl.mten = 1;
+	write_aux_reg(CTOP_AUX_MT_CTRL, mt_ctrl.value);
+
+	/*
+	 * HW scheduling mechanism will start working
+	 * Only after call to instruction "schd.rw".
+	 * cpu_relax() calls "schd.rw" instruction.
+	 */
+	cpu_relax();
+}
diff --git a/arch/arc/plat-eznps/platform.c b/arch/arc/plat-eznps/platform.c
new file mode 100644
index 0000000..12efeb6
--- /dev/null
+++ b/arch/arc/plat-eznps/platform.c
@@ -0,0 +1,27 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/init.h>
+#include <asm/mach_desc.h>
+
+static const char *eznps_compat[] __initconst = {
+	"ezchip,arc-nps",
+	NULL,
+};
+
+MACHINE_START(NPS, "nps")
+	.dt_compat	= eznps_compat,
+MACHINE_END
diff --git a/arch/arc/plat-eznps/smp.c b/arch/arc/plat-eznps/smp.c
new file mode 100644
index 0000000..87849a3
--- /dev/null
+++ b/arch/arc/plat-eznps/smp.c
@@ -0,0 +1,149 @@
+/*
+ * Copyright(c) 2015 EZchip Technologies.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * The full GNU General Public License is included in this distribution in
+ * the file called "COPYING".
+ */
+
+#include <linux/smp.h>
+#include <linux/of_fdt.h>
+#include <linux/io.h>
+#include <asm/irq.h>
+#include <plat/ctop.h>
+#include <plat/smp.h>
+#include <plat/mtm.h>
+
+#define NPS_DEFAULT_MSID	0x34
+#define NPS_MTM_CPU_CFG		0x90
+
+static char smp_cpuinfo_buf[128] = {"Extn [EZNPS-SMP]\t: On\n"};
+
+/* Get cpu map from device tree */
+static int __init eznps_get_map(const char *name, struct cpumask *cpumask)
+{
+	unsigned long dt_root = of_get_flat_dt_root();
+	const char *buf;
+
+	buf = of_get_flat_dt_prop(dt_root, name, NULL);
+	if (!buf)
+		return 1;
+
+	cpulist_parse(buf, cpumask);
+
+	return 0;
+}
+
+/* Update board cpu maps */
+static void __init eznps_init_cpumasks(void)
+{
+	struct cpumask cpumask;
+
+	if (eznps_get_map("present-cpus", &cpumask)) {
+		pr_err("Failed to get present-cpus from dtb");
+		return;
+	}
+	init_cpu_present(&cpumask);
+
+	if (eznps_get_map("possible-cpus", &cpumask)) {
+		pr_err("Failed to get possible-cpus from dtb");
+		return;
+	}
+	init_cpu_possible(&cpumask);
+}
+
+static void eznps_init_core(unsigned int cpu)
+{
+	u32 sync_value;
+	struct nps_host_reg_aux_hw_comply hw_comply;
+	struct nps_host_reg_aux_lpc lpc;
+
+	if (NPS_CPU_TO_THREAD_NUM(cpu) != 0)
+		return;
+
+	hw_comply.value = read_aux_reg(CTOP_AUX_HW_COMPLY);
+	hw_comply.me  = 1;
+	hw_comply.le  = 1;
+	hw_comply.te  = 1;
+	write_aux_reg(CTOP_AUX_HW_COMPLY, hw_comply.value);
+
+	/* Enable MMU clock */
+	lpc.mep = 1;
+	write_aux_reg(CTOP_AUX_LPC, lpc.value);
+
+	/* Boot CPU only */
+	if (!cpu) {
+		/* Write to general purpose register in CRG */
+		sync_value = ioread32be(REG_GEN_PURP_0);
+		sync_value |= NPS_CRG_SYNC_BIT;
+		iowrite32be(sync_value, REG_GEN_PURP_0);
+	}
+}
+
+/*
+ * Master kick starting another CPU
+ */
+static void __init eznps_smp_wakeup_cpu(int cpu, unsigned long pc)
+{
+	struct nps_host_reg_mtm_cpu_cfg cpu_cfg;
+
+	if (mtm_enable_thread(cpu) == 0)
+		return;
+
+	/* set PC, dmsid, and start CPU */
+	cpu_cfg.value = (u32)res_service;
+	cpu_cfg.dmsid = NPS_DEFAULT_MSID;
+	cpu_cfg.cs = 1;
+	iowrite32be(cpu_cfg.value, nps_mtm_reg_addr(cpu, NPS_MTM_CPU_CFG));
+}
+
+static void eznps_ipi_send(int cpu)
+{
+	struct global_id gid;
+	struct {
+		union {
+			struct {
+				u32 num:8, cluster:8, core:8, thread:8;
+			};
+			u32 value;
+		};
+	} ipi;
+
+	gid.value = cpu;
+	ipi.thread = get_thread(gid);
+	ipi.core = gid.core;
+	ipi.cluster = nps_cluster_logic_to_phys(gid.cluster);
+	ipi.num = IPI_IRQ;
+
+	__asm__ __volatile__(
+	"	mov r3, %0\n"
+	"	.word %1\n"
+	:
+	: "r"(ipi.value), "i"(CTOP_INST_ASRI_0_R3)
+	: "r3");
+}
+
+static void eznps_init_per_cpu(int cpu)
+{
+	smp_ipi_irq_setup(cpu, IPI_IRQ);
+
+	eznps_init_core(cpu);
+	mtm_enable_core(cpu);
+}
+
+struct plat_smp_ops plat_smp_ops = {
+	.info		= smp_cpuinfo_buf,
+	.init_early_smp	= eznps_init_cpumasks,
+	.cpu_kick	= eznps_smp_wakeup_cpu,
+	.ipi_send	= eznps_ipi_send,
+	.init_per_cpu	= eznps_init_per_cpu,
+};
+
-- 
1.7.1
