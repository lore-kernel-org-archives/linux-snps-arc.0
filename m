Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57BFC433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Nov 2022 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1ade6NBGREuQMuNjdXvrkWzKBlM8x5VwD71WSpijDc=; b=mNs/N4eUyLTRQS
	/1cKbus6JPliOBpDdadmLg4d+73Pp8pxfD0dxoGB8I5V+l95G3R2iAZdOKUnlb8W+uO/9f5WWjico
	MCV1mXbAx4w8UEAEtaS45CulEl80ZQv8k+YGAi2d1bTauYyFp1fQn7ZYEQx3uVCF9uyaTfC96HJ+C
	auDazUgDCrOGA0nrVImKwOZkQYgIAHvwrBGKI5RYUpUabW86tGI9ia2fLMfmw04hJl+XrjF/ROOUW
	6Au6MPqSR+1RIGUg7XuFCxQ6cO4cqDjMde2uSj4iwOZN++gYiR9i7ulq2oXI6/YcoAlvUPoAF1Pjx
	u8erob6q76XmkG8e1oeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6Va-00DwAk-D0; Mon, 21 Nov 2022 13:06:46 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6VX-00Dw9v-Es
	for linux-snps-arc@lists.infradead.org; Mon, 21 Nov 2022 13:06:45 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALAT9tO016875;
	Mon, 21 Nov 2022 05:06:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=MubY36Hw0/xm+/tJnqjXr/DmKl+JiMEk3xtXjdEVz5c=;
 b=EN0TD364y8I5Ns3hdmB8gQC6ANWJC2rHn7U9+v7EOaN5mU3D9FBj1v6cOcBgCBTsg0pA
 t4+ZzqzGRL23Pt9kUIx4SEMjqjNfPthhYwYnxXBkvfcfWwZ7XpK+y1dGK77TzexSVojS
 tS8yVhl0y8IvIKLDDp3zzCukepp2UwW6l3UJrwlpbEh4WKjojrQ2JiJa4hpjPMtSI2Tx
 PYVotXSFxh1r+IMRIJ+i7ZMlK/T8Nlog309KdGdDxIZrg8DgoHIssgiTcKBjpSZdtu5U
 c/rirHtawa6r4polP6CS0FIj9vRPfdr9BCvjLAgXxU4UOPjp13tNNoWT/j7bH4mf38nr 2w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3kxxnhxrmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 05:06:34 -0800
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BDF94008A;
	Mon, 21 Nov 2022 13:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1669035993; bh=H4PHrf8KUtvUMyaeGB9Rk9WveB1qqBDWRlJ3jOsLvIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JO5VCvnzhgiIR4WPm0kuSItKg5N56rAAKrH1/SwWBApMCcuAUr02xEGM97aDFspVx
	 wYEwIDgpvhlNkD9mt+rQaXwsWg9d775YUY/Tdy8yYuMEH0Y2QH8tjE0LEcA5gwYKBm
	 MWqY8BEd8U4TbbBQ60AcmANpG/llxGIoBZhBB1hbSFAsjGfupcQOnzvBS/yU1bSFp5
	 VxGiqhpHAyVdkUuO7VU8OWF4rBk7eGjaW8ghrpElON9EvqmVtBMEwC0RUNMEFLbR+J
	 qMY3p9uqEwEd1v7DaBSST65b7NaPqtjs4BzS1BV70u0qos61phyC/j7DCSx9pBY98/
	 c7JvfIesw0V4w==
Received: from atlantis.internal.synopsys.com (unknown [10.225.29.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 71C39A005E;
	Mon, 21 Nov 2022 13:06:28 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: libc-alpha@sourceware.org
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        Vineet Gupta <vineet.gupta@linux.dev>,
        Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
        arcml <linux-snps-arc@lists.infradead.org>
Subject: [PATCH v2] ARC: update definitions in elf/elf.h
Date: Mon, 21 Nov 2022 14:06:24 +0100
Message-Id: <20221121130624.9628-1-shahab@synopsys.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118131542.23188-1-shahab@synopsys.com>
References: <20221118131542.23188-1-shahab@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Hj8nidbDrHbeZ5UWTbvu7idZfr6KFcJ6
X-Proofpoint-ORIG-GUID: Hj8nidbDrHbeZ5UWTbvu7idZfr6KFcJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211210102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_050643_664717_C6710F3F 
X-CRM114-Status: GOOD (  22.08  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

While porting ARCv2 to elfutils [1], it was brought up that the
necessary changes to the project's libelf/elf.h must come from
glibc, because they sync it from glibc [2].  Therefore, this patch
is to update ARC entries in elf/elf.h.

The majority of the update is about adding new definitions,
specially for the relocations.  However, there is one rename, one
deletion, and one change:

- R_ARC_JUMP_SLOT renamed to R_ARC_JMP_SLOT to match binutils.
- R_ARC_B26 removed because it is unused and deprecated.
- R_ARC_TLS_DTPOFF_S9 changed from 0x4a to the correct value 0x49.

[1]
https://sourceware.org/pipermail/elfutils-devel/2022q4/005530.html

[2]
https://sourceware.org/pipermail/elfutils-devel/2022q4/005548.html

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
Chagelog:
v2:
  - Rename instances of R_ARC_JUMP_SLOT to R_ARC_JMP_SLOT.
  - Remove an unnecessary extra empty line introduced in elf/elf.h.

 elf/elf.h                | 29 ++++++++++++++++++++++++-----
 sysdeps/arc/dl-machine.h |  8 ++++----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/elf/elf.h b/elf/elf.h
index 920e6891e6..da41bad34b 100644
--- a/elf/elf.h
+++ b/elf/elf.h
@@ -4159,6 +4159,15 @@ enum
 #define R_LARCH_GNU_VTINHERIT  57
 #define R_LARCH_GNU_VTENTRY  58
 
+/* ARC specific declarations.  */
+
+/* Processor specific flags for the Ehdr e_flags field.  */
+#define EF_ARC_MACH_MSK	    0x000000ff
+#define EF_ARC_OSABI_MSK    0x00000f00
+#define EF_ARC_ALL_MSK	    (EF_ARC_MACH_MSK | EF_ARC_OSABI_MSK)
+
+/* Processor specific values for the Shdr sh_type field.  */
+#define SHT_ARC_ATTRIBUTES	(SHT_LOPROC + 1) /* ARC attributes section.  */
 
 /* ARCompact/ARCv2 specific relocs.  */
 #define R_ARC_NONE		0x0
@@ -4166,7 +4175,7 @@ enum
 #define R_ARC_16		0x2
 #define R_ARC_24		0x3
 #define R_ARC_32		0x4
-#define R_ARC_B26		0x5
+
 #define R_ARC_B22_PCREL		0x6
 #define R_ARC_H30		0x7
 #define R_ARC_N8		0x8
@@ -4206,16 +4215,23 @@ enum
 #define R_ARC_SECTOFF_ME_2	0x2A
 #define R_ARC_SECTOFF_1		0x2B
 #define R_ARC_SECTOFF_2		0x2C
+#define R_ARC_SDA_12		0x2D
+#define R_ARC_SDA16_ST2		0x30
+#define R_ARC_32_PCREL		0x31
 #define R_ARC_PC32		0x32
 #define R_ARC_GOTPC32		0x33
 #define R_ARC_PLT32		0x34
 #define R_ARC_COPY		0x35
 #define R_ARC_GLOB_DAT		0x36
-#define R_ARC_JUMP_SLOT		0x37
+#define R_ARC_JMP_SLOT		0x37
 #define R_ARC_RELATIVE		0x38
 #define R_ARC_GOTOFF		0x39
 #define R_ARC_GOTPC		0x3A
 #define R_ARC_GOT32		0x3B
+#define R_ARC_S21W_PCREL_PLT	0x3C
+#define R_ARC_S25H_PCREL_PLT	0x3D
+
+#define R_ARC_JLI_SECTOFF	0x3F
 
 #define R_ARC_TLS_DTPMOD	0x42
 #define R_ARC_TLS_DTPOFF	0x43
@@ -4224,9 +4240,12 @@ enum
 #define R_ARC_TLS_GD_LD	        0x46
 #define R_ARC_TLS_GD_CALL	0x47
 #define R_ARC_TLS_IE_GOT	0x48
-#define R_ARC_TLS_DTPOFF_S9	0x4a
-#define R_ARC_TLS_LE_S9		0x4a
-#define R_ARC_TLS_LE_32		0x4b
+#define R_ARC_TLS_DTPOFF_S9	0x49
+#define R_ARC_TLS_LE_S9		0x4A
+#define R_ARC_TLS_LE_32		0x4B
+#define R_ARC_S25W_PCREL_PLT	0x4C
+#define R_ARC_S21H_PCREL_PLT	0x4D
+#define R_ARC_NPS_CMEM16	0x4E
 
 /* OpenRISC 1000 specific relocs.  */
 #define R_OR1K_NONE		0
diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
index c6ad232384..8420cd0006 100644
--- a/sysdeps/arc/dl-machine.h
+++ b/sysdeps/arc/dl-machine.h
@@ -183,14 +183,14 @@ __start:								\n\
    ELF_RTYPE_CLASS_NOCOPY iff TYPE should not be allowed to resolve to one
    of the main executable's symbols, as for a COPY reloc.  */
 #define elf_machine_type_class(type)				\
-  ((((type) == R_ARC_JUMP_SLOT					\
+  ((((type) == R_ARC_JMP_SLOT					\
      || (type) == R_ARC_TLS_DTPMOD				\
      || (type) == R_ARC_TLS_DTPOFF				\
      || (type) == R_ARC_TLS_TPOFF) * ELF_RTYPE_CLASS_PLT)	\
    | (((type) == R_ARC_COPY) * ELF_RTYPE_CLASS_COPY))
 
 /* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
-#define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
+#define ELF_MACHINE_JMP_SLOT  R_ARC_JMP_SLOT
 
 /* Fixup a PLT entry to bounce directly to the function at VALUE.  */
 
@@ -261,7 +261,7 @@ elf_machine_rela (struct link_map *map, struct r_scope_elem *scope[],
           break;
 
         case R_ARC_GLOB_DAT:
-        case R_ARC_JUMP_SLOT:
+        case R_ARC_JMP_SLOT:
             *reloc_addr = value;
           break;
 
@@ -321,7 +321,7 @@ elf_machine_lazy_rel (struct link_map *map, struct r_scope_elem *scope[],
   ElfW(Addr) *const reloc_addr = (void *) (l_addr + reloc->r_offset);
   const unsigned int r_type = ELFW (R_TYPE) (reloc->r_info);
 
-  if (r_type == R_ARC_JUMP_SLOT)
+  if (r_type == R_ARC_JMP_SLOT)
     *reloc_addr += l_addr;
   else
     _dl_reloc_bad_type (map, r_type, 1);
-- 
2.38.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
