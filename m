Return-Path: <SRS0=YnoV=EL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27D6C5517A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 21:23:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FEE820724
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 21:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ct11WqVK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WeRhFH/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FEE820724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B5aWwJkwisnbhj359B73ZhJpIVYH4AujQ/i7MI6ts0w=; b=ct11WqVKPglZyzhNzjtQ2xcdf
	zGpEVcQe//AHdM025BiSpDjIJx56ZqzQOMo+uVq+f5ukohOnT19oNPMZay7isTa/i5+ZGJXpFmbfD
	eVbTtlkQVKmtr/smVeAPZPBNQ9qz9YuJ+13LjyXaZZZ8sdFkv8oKl3W7HdVjsrvTyFhtrdFTwmt/F
	tQZgudvEpHwi+W9ZMOjn2fszMoF8UESn4Vdw8VOxzWO0McXQLSKsxKUVwnnFg0VVRN/Uo9FjyStVG
	ADxgXTRQc036cFKFmaURXGK7htGntaS+eXwMg0BqYbXnSOZZiA9GxC0VctVu/QmM9thEsMJ/6NK/t
	l+Bs2f6Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kamin-0004LP-A7; Thu, 05 Nov 2020 21:23:05 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kami4-0003y6-Sy
 for linux-snps-arc@lists.infradead.org; Thu, 05 Nov 2020 21:22:31 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ECA5940066;
 Thu,  5 Nov 2020 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604611339; bh=mNfE+zkMa68VxwrMuN4ESnNP3XrXt4EiRox8Wp8ljDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WeRhFH/7jsEvdoyqmRjC2VyNhaRJN59VCn8iw8pdGe4irOsQLyVz420H19M5wjhJv
 XsA2r3A5rVIpc94I4DzXke33eW2jGfLuzIHH5UGci5R2frYIlET5Vkq5X9L0oBftTO
 ZBTI8r4JUREHPO3YK6/eH0q7/nxP4Gl9GB+Y15NJVZIquUdEaVgOWCAWWiNhk++jKP
 wUBGOrELltwwjJ3ZR4jbzevq28fIvdzWdJn3XYXj6sTwcm+ojmeSZZ54NbNQNax2+c
 gEanMzaBtHQHTzpzmCNs6SkupnzxY/qqnu53wfHjMNgr4ByIlnDwFydhYRLWqDPX7i
 5BUTyWlTUMmpA==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 17282A022B;
 Thu,  5 Nov 2020 21:22:18 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 3/3] include/soc: remove headers for EZChip NPS
Date: Thu,  5 Nov 2020 13:22:10 -0800
Message-Id: <20201105212210.1891598-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105212210.1891598-1-vgupta@synopsys.com>
References: <20201105212210.1891598-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_162221_197650_796DC763 
X-CRM114-Status: GOOD (  18.89  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

NPS platform has been removed from ARC port and there are no in-tree
user of it now . So RIP !

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/soc/nps/common.h | 172 ---------------------------------------
 include/soc/nps/mtm.h    |  59 --------------
 2 files changed, 231 deletions(-)
 delete mode 100644 include/soc/nps/common.h
 delete mode 100644 include/soc/nps/mtm.h

diff --git a/include/soc/nps/common.h b/include/soc/nps/common.h
deleted file mode 100644
index 8c18dc6d3fde..000000000000
--- a/include/soc/nps/common.h
+++ /dev/null
@@ -1,172 +0,0 @@
-/*
- * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
- *
- * This software is available to you under a choice of one of two
- * licenses.  You may choose to be licensed under the terms of the GNU
- * General Public License (GPL) Version 2, available from the file
- * COPYING in the main directory of this source tree, or the
- * OpenIB.org BSD license below:
- *
- *     Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *      - Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *
- *      - Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- */
-
-#ifndef SOC_NPS_COMMON_H
-#define SOC_NPS_COMMON_H
-
-#ifdef CONFIG_SMP
-#define NPS_IPI_IRQ					5
-#endif
-
-#define NPS_HOST_REG_BASE			0xF6000000
-
-#define NPS_MSU_BLKID				0x018
-
-#define CTOP_INST_RSPI_GIC_0_R12		0x3C56117E
-#define CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST	0x5B60
-#define CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM	0x00010422
-
-#ifndef AUX_IENABLE
-#define AUX_IENABLE				0x40c
-#endif
-
-#define CTOP_AUX_IACK				(0xFFFFF800 + 0x088)
-
-#ifndef __ASSEMBLY__
-
-/* In order to increase compilation test coverage */
-#ifdef CONFIG_ARC
-static inline void nps_ack_gic(void)
-{
-	__asm__ __volatile__ (
-	"       .word %0\n"
-	:
-	: "i"(CTOP_INST_RSPI_GIC_0_R12)
-	: "memory");
-}
-#else
-static inline void nps_ack_gic(void) { }
-#define write_aux_reg(r, v)
-#define read_aux_reg(r) 0
-#endif
-
-/* CPU global ID */
-struct global_id {
-	union {
-		struct {
-#ifdef CONFIG_EZNPS_MTM_EXT
-			u32 __reserved:20, cluster:4, core:4, thread:4;
-#else
-			u32 __reserved:24, cluster:4, core:4;
-#endif
-		};
-		u32 value;
-	};
-};
-
-/*
- * Convert logical to physical CPU IDs
- *
- * The conversion swap bits 1 and 2 of cluster id (out of 4 bits)
- * Now quad of logical clusters id's are adjacent physically,
- * and not like the id's physically came with each cluster.
- * Below table is 4x4 mesh of core clusters as it layout on chip.
- * Cluster ids are in format: logical (physical)
- *
- *    -----------------   ------------------
- * 3 |  5 (3)   7 (7)  | | 13 (11)   15 (15)|
- *
- * 2 |  4 (2)   6 (6)  | | 12 (10)   14 (14)|
- *    -----------------   ------------------
- * 1 |  1 (1)   3 (5)  | |  9  (9)   11 (13)|
- *
- * 0 |  0 (0)   2 (4)  | |  8  (8)   10 (12)|
- *    -----------------   ------------------
- *       0       1            2        3
- */
-static inline int nps_cluster_logic_to_phys(int cluster)
-{
-#ifdef __arc__
-	 __asm__ __volatile__(
-	"       mov r3,%0\n"
-	"       .short %1\n"
-	"       .word %2\n"
-	"       mov %0,r3\n"
-	: "+r"(cluster)
-	: "i"(CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST),
-	  "i"(CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM)
-	: "r3");
-#endif
-
-	return cluster;
-}
-
-#define NPS_CPU_TO_CLUSTER_NUM(cpu) \
-	({ struct global_id gid; gid.value = cpu; \
-		nps_cluster_logic_to_phys(gid.cluster); })
-
-struct nps_host_reg_address {
-	union {
-		struct {
-			u32 base:8, cl_x:4, cl_y:4,
-			blkid:6, reg:8, __reserved:2;
-		};
-		u32 value;
-	};
-};
-
-struct nps_host_reg_address_non_cl {
-	union {
-		struct {
-			u32 base:7, blkid:11, reg:12, __reserved:2;
-		};
-		u32 value;
-	};
-};
-
-static inline void *nps_host_reg_non_cl(u32 blkid, u32 reg)
-{
-	struct nps_host_reg_address_non_cl reg_address;
-
-	reg_address.value = NPS_HOST_REG_BASE;
-	reg_address.blkid = blkid;
-	reg_address.reg = reg;
-
-	return (void *)reg_address.value;
-}
-
-static inline void *nps_host_reg(u32 cpu, u32 blkid, u32 reg)
-{
-	struct nps_host_reg_address reg_address;
-	u32 cl = NPS_CPU_TO_CLUSTER_NUM(cpu);
-
-	reg_address.value = NPS_HOST_REG_BASE;
-	reg_address.cl_x  = (cl >> 2) & 0x3;
-	reg_address.cl_y  = cl & 0x3;
-	reg_address.blkid = blkid;
-	reg_address.reg   = reg;
-
-	return (void *)reg_address.value;
-}
-#endif /* __ASSEMBLY__ */
-
-#endif /* SOC_NPS_COMMON_H */
diff --git a/include/soc/nps/mtm.h b/include/soc/nps/mtm.h
deleted file mode 100644
index d2f5e7e3703e..000000000000
--- a/include/soc/nps/mtm.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
- *
- * This software is available to you under a choice of one of two
- * licenses.  You may choose to be licensed under the terms of the GNU
- * General Public License (GPL) Version 2, available from the file
- * COPYING in the main directory of this source tree, or the
- * OpenIB.org BSD license below:
- *
- *     Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *      - Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *
- *      - Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- */
-
-#ifndef SOC_NPS_MTM_H
-#define SOC_NPS_MTM_H
-
-#define CTOP_INST_HWSCHD_OFF_R3                 0x3B6F00BF
-#define CTOP_INST_HWSCHD_RESTORE_R3             0x3E6F70C3
-
-static inline void hw_schd_save(unsigned int *flags)
-{
-	__asm__ __volatile__(
-	"       .word %1\n"
-	"       st r3,[%0]\n"
-	:
-	: "r"(flags), "i"(CTOP_INST_HWSCHD_OFF_R3)
-	: "r3", "memory");
-}
-
-static inline void hw_schd_restore(unsigned int flags)
-{
-	__asm__ __volatile__(
-	"       mov r3, %0\n"
-	"       .word %1\n"
-	:
-	: "r"(flags), "i"(CTOP_INST_HWSCHD_RESTORE_R3)
-	: "r3");
-}
-
-#endif /* SOC_NPS_MTM_H */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
