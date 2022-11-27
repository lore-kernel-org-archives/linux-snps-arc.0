Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0927DC43217
	for <linux-snps-arc@archiver.kernel.org>; Sun, 27 Nov 2022 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9Cjl7tb2J3g4J7oi+t0xXT3AhZS21RmgAC8ZlRc8Uk=; b=25VuOVEHA8WyUc
	xWulPgWaAFfvFMYTcPLY9eOPZ3sDWqaPz+LawSPBt+EGLMAYTBT0bXS77YcPOW4ZruOdHo6i8r9bk
	ZhRBnEzS+GVXibfH+xXe9xHJ/F1ulCvfYgkxoHTOzL1JcK9yzocIJY3wHEAgEw5JgktfdkCGOQAC7
	ViXdefJu0UoWxJmweiEmg6jNOpYIp8tx0V3++Xl6nnjOEDkccvzr1vnqKBIpgqw8PNHQrOsHkyON5
	pYSfD5UofLZgegzZjaot/8uDYOLPP9AbURCpDH1C1fReVixit2yxuSEIldiSroPpxgrWtzLQUWk6K
	bm8juwUA94j+Y0+pBGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLda-00CjiH-4N; Sun, 27 Nov 2022 17:40:18 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLdW-00Cjds-A0
	for linux-snps-arc@lists.infradead.org; Sun, 27 Nov 2022 17:40:16 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ARAtoBl021102;
	Sun, 27 Nov 2022 09:40:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=E2Lu4IC8KOUXK9y+W3eUb2kmcH/o1YQFQd01q0xCdtk=;
 b=qf7nKbAx/Zur3iHthUokNjC652CBw7uob7nqKskIW9f/QfPy6nwyu5YO+mIbWNClPiIL
 89PDC7dZsWYTZodcOz5MrZxAuBcg5GCtV3tg1J4erK+pa0JL4ViRblgzKJ47nhy2WLzd
 p40Ytzy5TRHsYwm3tNj+Xhp0eWMdYeWwB+puw+WXj0bVVFqZMN78XGTt1z1BZ0re38rg
 jBbBW4Jfl7hFu+NxlWIjRF04aFkGeUA6XlrImdF+U3jUqBa3PaeMhiYB6C+Gu9Q9NuXU
 oAP9IwVeMfEeUB/NM/VP0WgZZqZsk2vEMd3jpk3i1aeHkQrp7SodNYQgB5jfWKXv5F/P eg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3m3jamkdhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Nov 2022 09:40:11 -0800
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C61A340094;
	Sun, 27 Nov 2022 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1669570811; bh=lrayN64XPaU4gFGrTzG0IoaJBfpLHhPPjzsZF0gcKxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXMH5NAFB+8V6TzWp6IHavc/DhUp43tUhFhw5DTCV7sNvp+/HA+E1JSt8K+g0aIol
	 u8q1nfeJqwyWVrYA1xCE4h9gRPUDznNRSXTNU31HZ/kfOuj85wjimHorbH2AYMv96d
	 +uwkofxiZ9r9o9aMnVqsATsBnCCkrc/VpawFoT4zu3GLfOhaRv1hRWIbBJZtaAUtcL
	 H+RW/URiT2ITb4E4AAgs2GhriSkBvEXV6R14twsijP3jWhYYTnyc6az+y2Ge3pBuML
	 roqJUqRSkGealfbrg+6AkH1si/JqI8M1WIBLueAT8EtFAQqe2tAAQqF4Lry9BYTwCw
	 dZVKc8l/Ju5QQ==
Received: from atlantis.internal.synopsys.com (unknown [10.225.29.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 42528A005E;
	Sun, 27 Nov 2022 17:40:09 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: libc-alpha@sourceware.org
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        Vineet Gupta <vineet.gupta@linux.dev>,
        Florian Weimer <fweimer@redhat.com>,
        Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
        arcml <linux-snps-arc@lists.infradead.org>
Subject: [PATCH v3 2/2] ARC: update definitions in elf/elf.h
Date: Sun, 27 Nov 2022 18:38:25 +0100
Message-Id: <20221127173825.3106-3-shahab@synopsys.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221127173825.3106-1-shahab@synopsys.com>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <20221127173825.3106-1-shahab@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-GUID: LTrYxdM3XCzQgRCg6mgkrXGWA7LlXcua
X-Proofpoint-ORIG-GUID: LTrYxdM3XCzQgRCg6mgkrXGWA7LlXcua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_08,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211270147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_094014_584066_95E0DE4C 
X-CRM114-Status: GOOD (  24.15  )
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

Finally, a specific SHT class for ARC has been added to glibcelf.py.
Else, it would result in a collision:

  _register_elf_h(Sht, ranges=True,
 File "/src/glibc/scripts/glibcelf.py", line x, in _register_elf_h
   raise ValueError('duplicate value {}: {}, {}'.format(
                    ValueError: duplicate value 1879048193:
                    SHT_ARC_ATTRIBUTES, SHT_X86_64_UNWIND

[1]
https://sourceware.org/pipermail/elfutils-devel/2022q4/005530.html

[2]
https://sourceware.org/pipermail/elfutils-devel/2022q4/005548.html

No regression has been observed after applying this patch.  Below
follows the result:

UNSUPPORTED: crypt/cert
UNSUPPORTED: elf/tst-audit22
FAIL: elf/tst-audit25a
FAIL: elf/tst-audit25b
FAIL: elf/tst-bz15311
FAIL: elf/tst-bz28937
FAIL: elf/tst-dlmopen4
UNSUPPORTED: elf/tst-dlopen-self-container
UNSUPPORTED: elf/tst-dlopen-tlsmodid-container
UNSUPPORTED: elf/tst-glibc-hwcaps-prepend-cache
UNSUPPORTED: elf/tst-ldconfig-bad-aux-cache
UNSUPPORTED: elf/tst-ldconfig-ld_so_conf-update
UNSUPPORTED: elf/tst-pldd
UNSUPPORTED: elf/tst-preload-pthread-libc
XPASS: elf/tst-protected1a
XPASS: elf/tst-protected1b
FAIL: elf/tst-tls-allocation-failure-static-patched
FAIL: elf/tst-tls1
FAIL: elf/tst-tls3
FAIL: elf/tst-tlsalign-extern
UNSUPPORTED: elf/tst-valgrind-smoke
UNSUPPORTED: grp/tst-initgroups1
UNSUPPORTED: grp/tst-initgroups2
UNSUPPORTED: io/tst-getcwd-smallbuff
UNSUPPORTED: locale/tst-localedef-path-norm
FAIL: localedata/sort-test
UNSUPPORTED: localedata/tst-localedef-hardlinks
FAIL: malloc/tst-malloc-thread-fail-malloc-check
FAIL: malloc/tst-malloc_info-malloc-check
UNSUPPORTED: math/test-fesetexcept-traps
UNSUPPORTED: math/test-fexcept-traps
UNSUPPORTED: math/test-nearbyint-except
UNSUPPORTED: math/test-nearbyint-except-2
UNSUPPORTED: misc/tst-adjtimex
UNSUPPORTED: misc/tst-clock_adjtime
FAIL: misc/tst-misalign-clone
FAIL: misc/tst-misalign-clone-internal
UNSUPPORTED: misc/tst-ntp_adjtime
UNSUPPORTED: misc/tst-pkey
UNSUPPORTED: misc/tst-rseq
UNSUPPORTED: misc/tst-rseq-disable
UNSUPPORTED: misc/tst-syslog
UNSUPPORTED: misc/tst-ttyname
FAIL: nptl/test-cond-printers
FAIL: nptl/test-condattr-printers
FAIL: nptl/test-mutex-printers
FAIL: nptl/test-mutexattr-printers
FAIL: nptl/test-rwlock-printers
FAIL: nptl/test-rwlockattr-printers
UNSUPPORTED: nptl/tst-pthread-gdb-attach
UNSUPPORTED: nptl/tst-pthread-gdb-attach-static
UNSUPPORTED: nptl/tst-pthread-getattr
UNSUPPORTED: nptl/tst-rseq-nptl
UNSUPPORTED: nss/tst-nss-compat1
UNSUPPORTED: nss/tst-nss-db-endgrent
UNSUPPORTED: nss/tst-nss-db-endpwent
UNSUPPORTED: nss/tst-nss-files-hosts-long
UNSUPPORTED: nss/tst-nss-gai-actions
UNSUPPORTED: nss/tst-nss-test3
UNSUPPORTED: nss/tst-reload1
UNSUPPORTED: nss/tst-reload2
UNSUPPORTED: posix/bug-ga2
UNSUPPORTED: posix/bug-ga2-mem
FAIL: posix/globtest
UNSUPPORTED: posix/tst-vfork3
UNSUPPORTED: posix/tst-vfork3-mem
UNSUPPORTED: resolv/mtrace-tst-leaks2
UNSUPPORTED: resolv/tst-leaks2
UNSUPPORTED: resolv/tst-resolv-ai_idn
UNSUPPORTED: resolv/tst-resolv-ai_idn-latin1
UNSUPPORTED: resolv/tst-resolv-res_init
UNSUPPORTED: resolv/tst-resolv-res_init-thread
UNSUPPORTED: rt/tst-bz28213
UNSUPPORTED: rt/tst-mqueue1
UNSUPPORTED: rt/tst-mqueue10
UNSUPPORTED: rt/tst-mqueue2
UNSUPPORTED: rt/tst-mqueue3
UNSUPPORTED: rt/tst-mqueue4
UNSUPPORTED: rt/tst-mqueue5
UNSUPPORTED: rt/tst-mqueue6
UNSUPPORTED: rt/tst-mqueue8
UNSUPPORTED: rt/tst-mqueue8x
UNSUPPORTED: rt/tst-mqueue9
UNSUPPORTED: stdlib/test-bz22786
UNSUPPORTED: stdlib/tst-system
UNSUPPORTED: string/test-bcopy
UNSUPPORTED: string/test-memmove
UNSUPPORTED: string/tst-memmove-overflow
UNSUPPORTED: string/tst-strerror
UNSUPPORTED: string/tst-strsignal
UNSUPPORTED: time/tst-clock_settime
UNSUPPORTED: time/tst-settimeofday
Summary of test results:
     21 FAIL
   4184 PASS
     69 UNSUPPORTED
     16 XFAIL
      2 XPASS

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
ChangeLog:
v3:
  - Fix a collision in glibcelf.py.
  - Add test results to the commit message.
v2:
  - Rename instances of R_ARC_JUMP_SLOT to R_ARC_JMP_SLOT.
  - Remove an unnecessary extra empty line introduced in elf/elf.h.

 elf/elf.h                | 29 ++++++++++++++++++++++++-----
 scripts/glibcelf.py      |  3 +++
 sysdeps/arc/dl-machine.h |  8 ++++----
 3 files changed, 31 insertions(+), 9 deletions(-)

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
diff --git a/scripts/glibcelf.py b/scripts/glibcelf.py
index 59aab56ecf..a85594c3d9 100644
--- a/scripts/glibcelf.py
+++ b/scripts/glibcelf.py
@@ -304,6 +304,8 @@ class Sht(_TypedConstant):
     prefix = 'SHT_'
 class ShtALPHA(Sht):
     """Supplemental SHT_* constants for EM_ALPHA."""
+class ShtARC(Sht):
+    """Supplemental SHT_* constants for EM_ARC."""
 class ShtARM(Sht):
     """Supplemental SHT_* constants for EM_ARM."""
 class ShtCSKY(Sht):
@@ -317,6 +319,7 @@ class ShtPARISC(Sht):
 class ShtRISCV(Sht):
     """Supplemental SHT_* constants for EM_RISCV."""
 _register_elf_h(ShtALPHA, prefix='SHT_ALPHA_', parent=Sht)
+_register_elf_h(ShtARC, prefix='SHT_ARC_', parent=Sht)
 _register_elf_h(ShtARM, prefix='SHT_ARM_', parent=Sht)
 _register_elf_h(ShtCSKY, prefix='SHT_CSKY_', parent=Sht)
 _register_elf_h(ShtIA_64, prefix='SHT_IA_64_', parent=Sht)
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
