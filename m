Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB2AC3F2C6
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AB720675
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="peJHCQe5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SMNPm6PQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66AB720675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rp/u6JRnRbgIOo/rRich0cyCNAw4iNsb/0tqNTJe66o=; b=peJHCQe5jer7+6
	PO417EskmgxnShYzG82ZMxmZ0arKUHr/mjWJjju8zjy/pIkuSeP3xD91wKIJlga2+Ng1JoU0VIShB
	LHHzgV9ytBtsriqZkpw4EPJlJDRmpgiIdUg0MeNK2Timv1zIDGQzriTZTO0H0rP+cMwNcmYW6OfLI
	DwYzB9K0xOZRMOs3bORyXXyVLDSK/nC+ZNsSRElkTTz1SpYfEt4Mnw5GHfDjujuKjFQM2TvKIJFST
	Bf5gTvApks3vH3UbVo0syb4KRgvI/5VX/DMnTjswaWQBCfXS7TfpiLxR62SYAShnr+ObXtIHj6/w1
	I7y0KgPVp2kMNZQGj/CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAHeC-0001SN-J4; Fri, 06 Mar 2020 18:24:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAHeA-0001Or-4r
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 18:24:31 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D897AC00B0;
 Fri,  6 Mar 2020 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583519068; bh=ZI+Y0xP27VBHwlN7LGoTrXWU2OXhUz+BiGK0rlFr//o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SMNPm6PQK4MXvEdYfi1fJcJ5mLsCET9YHCai1zYwk1IFG00tn81Z5FjAlv2HCMiDB
 2Vla2OZaa9PVMilutrHIIfAmsz/+Ag6ZNniAQYeseK0dQpJbhBczsNtcyvkaB5hZDK
 mejnSjUdUgql2aA+g2FjV/RxJJ5xPqiEM/X3vCZusdTmaQGxRiAi1S9MKHH+KNgCxq
 qicg5xub36031mwvu148HNoRLQBCM4aUbyMDncx+bx6y3fYfCerCfgvSKSdqIJ1rZ/
 opfGkMDiJt0h+G8mD+p1B2IFJSP8Nfv/E0d5Ba5yynAEuYa3sX56RMKj/OxARjHuYj
 4OnS1kABxZJaw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8CBD1A007C;
 Fri,  6 Mar 2020 18:24:27 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 02/17] ARC: add definitions to elf/elf.h
Date: Fri,  6 Mar 2020 10:24:04 -0800
Message-Id: <20200306182419.13945-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306182419.13945-1-vgupta@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_102430_255667_071F1D4F 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 elf/elf.h | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/elf/elf.h b/elf/elf.h
index ab8930463c67..51e9968405ff 100644
--- a/elf/elf.h
+++ b/elf/elf.h
@@ -330,7 +330,7 @@ typedef struct
 #define EM_CLOUDSHIELD	192	/* CloudShield */
 #define EM_COREA_1ST	193	/* KIPO-KAIST Core-A 1st gen. */
 #define EM_COREA_2ND	194	/* KIPO-KAIST Core-A 2nd gen. */
-#define EM_ARC_COMPACT2	195	/* Synopsys ARCompact V2 */
+#define EM_ARCV2	195	/* Synopsys ARCv2 ISA.  */
 #define EM_OPEN8	196	/* Open8 RISC */
 #define EM_RL78		197	/* Renesas RL78 */
 #define EM_VIDEOCORE5	198	/* Broadcom VideoCore V */
@@ -4028,6 +4028,74 @@ enum
 #define R_NDS32_TLS_TPOFF	102
 #define R_NDS32_TLS_DESC	119
 
+/* ARCompact/ARCv2 specific relocs.  */
+#define R_ARC_NONE		0x0
+#define R_ARC_8			0x1
+#define R_ARC_16		0x2
+#define R_ARC_24		0x3
+#define R_ARC_32		0x4
+#define R_ARC_B26		0x5
+#define R_ARC_B22_PCREL		0x6
+#define R_ARC_H30		0x7
+#define R_ARC_N8		0x8
+#define R_ARC_N16		0x9
+#define R_ARC_N24		0xA
+#define R_ARC_N32		0xB
+#define R_ARC_SDA		0xC
+#define R_ARC_SECTOFF		0xD
+#define R_ARC_S21H_PCREL	0xE
+#define R_ARC_S21W_PCREL	0xF
+#define R_ARC_S25H_PCREL	0x10
+#define R_ARC_S25W_PCREL	0x11
+#define R_ARC_SDA32		0x12
+#define R_ARC_SDA_LDST		0x13
+#define R_ARC_SDA_LDST1		0x14
+#define R_ARC_SDA_LDST2		0x15
+#define R_ARC_SDA16_LD		0x16
+#define R_ARC_SDA16_LD1		0x17
+#define R_ARC_SDA16_LD2		0x18
+#define R_ARC_S13_PCREL		0x19
+#define R_ARC_W			0x1A
+#define R_ARC_32_ME		0x1B
+#define R_ARC_N32_ME		0x1C
+#define R_ARC_SECTOFF_ME	0x1D
+#define R_ARC_SDA32_ME		0x1E
+#define R_ARC_W_ME		0x1F
+#define R_ARC_H30_ME		0x20
+#define R_ARC_SECTOFF_U8	0x21
+#define R_ARC_SECTOFF_S9	0x22
+#define R_AC_SECTOFF_U8		0x23
+#define R_AC_SECTOFF_U8_1	0x24
+#define R_AC_SECTOFF_U8_2	0x25
+#define R_AC_SECTOFF_S9		0x26
+#define R_AC_SECTOFF_S9_1	0x27
+#define R_AC_SECTOFF_S9_2	0x28
+#define R_ARC_SECTOFF_ME_1	0x29
+#define R_ARC_SECTOFF_ME_2	0x2A
+#define R_ARC_SECTOFF_1		0x2B
+#define R_ARC_SECTOFF_2		0x2C
+#define R_ARC_PC32		0x32
+#define R_ARC_GOTPC32		0x33
+#define R_ARC_PLT32		0x34
+#define R_ARC_COPY		0x35
+#define R_ARC_GLOB_DAT		0x36
+#define R_ARC_JUMP_SLOT		0x37
+#define R_ARC_RELATIVE		0x38
+#define R_ARC_GOTOFF		0x39
+#define R_ARC_GOTPC		0x3A
+#define R_ARC_GOT32		0x3B
+
+#define R_ARC_TLS_DTPMOD	0x42
+#define R_ARC_TLS_DTPOFF	0x43
+#define R_ARC_TLS_TPOFF		0x44
+#define R_ARC_TLS_GD_GOT	0x45
+#define R_ARC_TLS_GD_LD	        0x46
+#define R_ARC_TLS_GD_CALL	0x47
+#define R_ARC_TLS_IE_GOT	0x48
+#define R_ARC_TLS_DTPOFF_S9	0x4a
+#define R_ARC_TLS_LE_S9		0x4a
+#define R_ARC_TLS_LE_32		0x4b
+
 __END_DECLS
 
 #endif	/* elf.h */
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
