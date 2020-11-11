Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43570C388F9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 16:43:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F07B2072C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 16:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0O10ZAwM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F07B2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=patchew.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:To:From:Resent-From:MIME-Version:In-Reply-To:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=M9qjnACOJGwMMYDllegxJmisDgQas56K3U2NjgWUoyc=; b=0O10ZAwMg+JnuhIkWLLo1VfwHz
	TWGd4uaM4PwS77Ss0cKRNy2SOrizrrUTGXe4D5T/DIEW78YHRNLaWCZPpBWuNwHqalmaC/4nWCmhD
	YRhC/PPvs/Th1j4eWJ+uyvrUM2jyJbRRzg3GNFdegRSp0sIrCONt2lZewCpDzYFO+Gk5789ZmFYVr
	aCihgrz7jjyY9PDLPl+V+YTIFEh0o/30kQFfobtr581jOYWZB2xor+vOhf/KWUgMkLalLS+sNIVHm
	bqynOvEiDqhjkA51Z8MhlKt4g0XASqsNbmRIhrS8AFt1y+k7eVud0XjMS3QqSGAUp98/sgs4H7T0H
	b8ycGC1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kctDt-0007wh-NF; Wed, 11 Nov 2020 16:43:53 +0000
Received: from sender4-of-o57.zoho.com ([136.143.188.57])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kctDp-0007tv-8o
 for linux-snps-arc@lists.infradead.org; Wed, 11 Nov 2020 16:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1605113021; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g9v33el88Ff8Aahqto0eyXyYOlCwBY+MQ22Sfm6GoqP7o1qFdzW2wEEUzAqh/oZkS2oKNIn6C8/JSeqoC1UolKrM//73mZPeIbZ4nJgwqACUH8/E0CZ9+KcUp1iSO4Iwfs1ru/cb425lLiO7S0bW5B9dU0a8nGUGm0Aq/gO50s4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605113021;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lN/Fl8g6kJIbrOJVNCEe20JTisDRvNb/0f7ZuPkQl2g=; 
 b=KqrmcJaLBTz+O7qIfSbyyuGcNIIimwCGvjrPP1SPAHTKJ2YF2HTGITmEGh00x3SobCN++bOgvL3gAu35N24fzbOB8M53kvk6++eYhKERJdBflsuISETdfpVOYtHs9nm59Vmb9aMdXQGGZIbTOfBmm9tzDmBX705LSKTePcs09X8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605113019998294.5738977552131;
 Wed, 11 Nov 2020 08:43:39 -0800 (PST)
Message-ID: <160511301811.9551.14652724194098827996@b92d57cec08d>
Subject: Re: [PATCH 00/15] *** ARC port for review ***
In-Reply-To: <20201111161758.9636-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: cupertinomiranda@gmail.com
Date: Wed, 11 Nov 2020 08:43:39 -0800 (PST)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_114349_639657_55CE228F 
X-CRM114-Status: UNSURE (   7.55  )
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
Reply-To: qemu-devel@nongnu.org
Cc: claziss@gmail.com, cupertinomiranda@gmail.com, qemu-devel@nongnu.org,
 shahab.vahedi@gmail.com, shahab@synopsys.com, cmiranda@synopsys.com,
 linux-snps-arc@lists.infradead.org, claziss@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
Resent-Message-Id: <20201111164354.7F07B2072C@mail.kernel.org>
Resent-Date: Wed, 11 Nov 2020 16:43:54 +0000 (UTC)

Patchew URL: https://patchew.org/QEMU/20201111161758.9636-1-cupertinomiranda@gmail.com/



Hi,

This series seems to have some coding style problems. See output below for
more information:

Message-id: 20201111161758.9636-1-cupertinomiranda@gmail.com
Subject: [PATCH 00/15] *** ARC port for review ***
Type: series

=== TEST SCRIPT BEGIN ===
#!/bin/bash
git rev-parse base > /dev/null || exit 0
git config --local diff.renamelimit 0
git config --local diff.renames True
git config --local diff.algorithm histogram
./scripts/checkpatch.pl --mailback base..
=== TEST SCRIPT END ===

Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
From https://github.com/patchew-project/qemu
 - [tag update]      patchew/1605104763-118687-1-git-send-email-zhengchuan@huawei.com -> patchew/1605104763-118687-1-git-send-email-zhengchuan@huawei.com
 * [new tag]         patchew/20201111161758.9636-1-cupertinomiranda@gmail.com -> patchew/20201111161758.9636-1-cupertinomiranda@gmail.com
Switched to a new branch 'test'
dc09f35 tests/acceptance: ARC: Add linux boot testing.
482f8c4 tests/tcg: ARC: Add TCG instruction definition tests
bafbb71 arc: Add support for ARCv2
2fb7984 arc: Add Synopsys ARC emulation boards
6e52aab1 arc: Add gdbstub and XML for debugging support
c052fe6 arc: Add memory protection unit (MPU) support
df0adea arc: Add memory management unit (MMU) support
7f70667 arc: Add IRQ and timer subsystem support
46999ef arc: Add BCR and AUX registers implementation
08846bb arc: TCG instruction definitions
710758d arc: TCG instruction generator and hand-definitions
21c6742 arc: TCG and decoder glue code and helpers
e9b9883 arc: Opcode definitions table
50f88cc arc: Decoder code
0c1f209 arc: Add initial core cpu files

=== OUTPUT BEGIN ===
1/15 Checking commit 0c1f20962105 (arc: Add initial core cpu files)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

WARNING: line over 80 characters
#285: FILE: target/arc/cpu.c:114:
+    DEFINE_PROP_BOOL("slc-datahalf", ARCCPU, cfg.slc_data_halfcycle_steal, false),

WARNING: line over 80 characters
#286: FILE: target/arc/cpu.c:115:
+    DEFINE_PROP_BOOL("slc-dataadd", ARCCPU, cfg.slc_data_add_pre_pipeline, false),

ERROR: Use of volatile is usually wrong, please add a comment
#894: FILE: target/arc/cpu.h:250:
+    volatile uint32_t T_Limit;

ERROR: Use of volatile is usually wrong, please add a comment
#895: FILE: target/arc/cpu.h:251:
+    volatile uint64_t last_clk;

total: 2 errors, 3 warnings, 1194 lines checked

Patch 1/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

2/15 Checking commit 50f88ccf9ad1 (arc: Decoder code)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

ERROR: Don't use '#' flag of printf format ('%#') in format strings, use '0x' prefix instead
#276: FILE: disas/arc.c:259:
+                (*info->fprintf_func)(info->stream, "%#x", value);

ERROR: Don't use '#' flag of printf format ('%#') in format strings, use '0x' prefix instead
#310: FILE: disas/arc.c:293:
+                    (*info->fprintf_func)(info->stream, "%#x", value);

ERROR: "foo * bar" should be "foo *bar"
#1173: FILE: target/arc/decoder.c:689:
+                                    bfd_boolean * invalid  ATTRIBUTE_UNUSED)

ERROR: "foo * bar" should be "foo *bar"
#1179: FILE: target/arc/decoder.c:695:
+                                  bfd_boolean * invalid  ATTRIBUTE_UNUSED)

ERROR: "foo * bar" should be "foo *bar"
#1185: FILE: target/arc/decoder.c:701:
+                                     bfd_boolean * invalid  ATTRIBUTE_UNUSED)

ERROR: "foo * bar" should be "foo *bar"
#1191: FILE: target/arc/decoder.c:707:
+                                   bfd_boolean * invalid  ATTRIBUTE_UNUSED)

ERROR: Macros with complex values should be enclosed in parenthesis
#1253: FILE: target/arc/decoder.c:769:
+#define ARC_OPERAND(NAME, BITS, SHIFT, RELO, FLAGS, FUN) OPERAND_##NAME,

ERROR: Macros with complex values should be enclosed in parenthesis
#1276: FILE: target/arc/decoder.c:792:
+#define ARC_FLAG(NAME, MNEMONIC, CODE, BITS, SHIFT, AVAIL) F_##NAME,

total: 8 errors, 1 warnings, 2295 lines checked

Patch 2/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

3/15 Checking commit e9b9883582ca (arc: Opcode definitions table)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 19976 lines checked

Patch 3/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.
4/15 Checking commit 21c674282d28 (arc: TCG and decoder glue code and helpers)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 1457 lines checked

Patch 4/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.
5/15 Checking commit 710758dec714 (arc: TCG instruction generator and hand-definitions)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

ERROR: Macros with multiple statements should be enclosed in a do - while loop
#178: FILE: target/arc/translate.c:157:
+#define CC_EPILOGUE          \
+    if (ctx->insn.cc) {      \
+        gen_set_label(done); \
+    }                        \
+    tcg_temp_free(cc)

ERROR: externs should be avoided in .c files
#372: FILE: target/arc/translate.c:351:
+extern bool enabled_interrupts;

ERROR: Macros with complex values should be enclosed in parenthesis
#485: FILE: target/arc/translate.c:464:
+#define MAPPING(MNEMONIC, NAME, NOPS, ...) MAP_##MNEMONIC##_##NAME,

ERROR: Macros with complex values should be enclosed in parenthesis
#498: FILE: target/arc/translate.c:477:
+#define MAPPING(MNEMONIC, NAME, NOPS, ...) NOPS,

ERROR: do not initialise statics to 0 or NULL
#1064: FILE: target/arc/translate.c:1043:
+    static bool initialized = false;

ERROR: Macros with multiple statements should be enclosed in a do - while loop
#1099: FILE: target/arc/translate.c:1078:
+#define MAPPING(MNEMONIC, NAME, NOPS, ...)                              \
+            case MAP_##MNEMONIC##_##NAME:                               \
+                ret = SEMANTIC_FUNCTION_CALL_##NOPS(NAME, __VA_ARGS__); \
+                break;

total: 6 errors, 1 warnings, 1546 lines checked

Patch 5/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

6/15 Checking commit 08846bb66dec (arc: TCG instruction definitions)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

ERROR: externs should be avoided in .c files
#251: FILE: target/arc/semfunc-helper.c:233:
+extern bool enabled_interrupts;

ERROR: do not initialise statics to 0 or NULL
#255: FILE: target/arc/semfunc-helper.c:237:
+    static int in_delay_slot = false;

WARNING: architecture specific defines should be avoided
#9304: FILE: target/arc/semfunc.h:22:
+#ifndef __ARC_SEMFUNC_H__

total: 2 errors, 2 warnings, 9308 lines checked

Patch 6/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

7/15 Checking commit 46999efd8b8a (arc: Add BCR and AUX registers implementation)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

WARNING: architecture specific defines should be avoided
#226: FILE: target/arc/cache.h:19:
+#ifndef __ARC_CACHE_H__

ERROR: Macros with complex values should be enclosed in parenthesis
#858: FILE: target/arc/regs.c:59:
+#define AUX_REG(NAME, GET, SET) #NAME,

ERROR: Macros with complex values should be enclosed in parenthesis
#1390: FILE: target/arc/regs.h:44:
+#define AUX_REG(NAME, GET, SET) AUX_ID_##NAME,

ERROR: Macros with complex values should be enclosed in parenthesis
#1398: FILE: target/arc/regs.h:52:
+#define DEF(NUM, CPU, SUB, NAME) CPU##_##NUM,

total: 3 errors, 2 warnings, 1415 lines checked

Patch 7/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

8/15 Checking commit 7f70667a3510 (arc: Add IRQ and timer subsystem support)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

ERROR: do not initialise globals to 0 or NULL
#57: FILE: target/arc/irq.c:42:
+bool enabled_interrupts = false;

WARNING: architecture specific defines should be avoided
#700: FILE: target/arc/irq.h:21:
+#ifndef __IRQ_H__

WARNING: architecture specific defines should be avoided
#1203: FILE: target/arc/timer.h:21:
+#ifndef __ARC_TIMER_H__

total: 1 errors, 3 warnings, 1179 lines checked

Patch 8/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

9/15 Checking commit df0adeadbaee (arc: Add memory management unit (MMU) support)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

ERROR: do not initialise statics to 0 or NULL
#680: FILE: target/arc/mmu.c:662:
+    static bool is_initialized = false;

total: 1 errors, 1 warnings, 943 lines checked

Patch 9/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

10/15 Checking commit c052fe6e32bc (arc: Add memory protection unit (MPU) support)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 798 lines checked

Patch 10/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.
11/15 Checking commit 6e52aab1c1f3 (arc: Add gdbstub and XML for debugging support)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

WARNING: line over 80 characters
#754: FILE: target/arc/gdbstub.c:407:
+                             GDB_AUX_MIN_REG_LAST,        /* number of registers */

WARNING: line over 80 characters
#756: FILE: target/arc/gdbstub.c:409:
+                             0);                          /* position in g packet */

total: 0 errors, 3 warnings, 732 lines checked

Patch 11/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.
12/15 Checking commit 2fb7984a73bc (arc: Add Synopsys ARC emulation boards)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 529 lines checked

Patch 12/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.
13/15 Checking commit bafbb7176f2d (arc: Add support for ARCv2)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

ERROR: space prohibited between function name and open parenthesis '('
#192: FILE: include/disas/dis-asm.h:469:
+int print_insn_arc              (bfd_vma, disassemble_info*);

total: 1 errors, 1 warnings, 154 lines checked

Patch 13/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

14/15 Checking commit 482f8c4587f4 (tests/tcg: ARC: Add TCG instruction definition tests)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

WARNING: line over 80 characters
#368: FILE: tests/tcg/arc/check_addx.S:43:
+  TEST_RR_3OP( 20,  add, 0xffffffffffff8000, 0x0000000000000000, 0xffffffffffff8000 )

WARNING: line over 80 characters
#370: FILE: tests/tcg/arc/check_addx.S:45:
+  TEST_RR_3OP( 22,  add, 0xffffffff7fff8000, 0xffffffff80000000, 0xffffffffffff8000 )

WARNING: line over 80 characters
#372: FILE: tests/tcg/arc/check_addx.S:47:
+  TEST_RR_3OP( 23,  add, 0x0000000000007fff, 0x0000000000000000, 0x0000000000007fff )

WARNING: line over 80 characters
#373: FILE: tests/tcg/arc/check_addx.S:48:
+  TEST_RR_3OP( 24,  add, 0x000000007fffffff, 0x000000007fffffff, 0x0000000000000000 )

WARNING: line over 80 characters
#374: FILE: tests/tcg/arc/check_addx.S:49:
+  TEST_RR_3OP( 25,  add, 0x0000000080007ffe, 0x000000007fffffff, 0x0000000000007fff )

WARNING: line over 80 characters
#376: FILE: tests/tcg/arc/check_addx.S:51:
+  TEST_RR_3OP( 26,  add, 0xffffffff80007fff, 0xffffffff80000000, 0x0000000000007fff )

WARNING: line over 80 characters
#377: FILE: tests/tcg/arc/check_addx.S:52:
+  TEST_RR_3OP( 27,  add, 0x000000007fff7fff, 0x000000007fffffff, 0xffffffffffff8000 )

WARNING: line over 80 characters
#379: FILE: tests/tcg/arc/check_addx.S:54:
+  TEST_RR_3OP( 28,  add, 0xffffffffffffffff, 0x0000000000000000, 0xffffffffffffffff )

WARNING: line over 80 characters
#380: FILE: tests/tcg/arc/check_addx.S:55:
+  TEST_RR_3OP( 29,  add, 0x0000000000000000, 0xffffffffffffffff, 0x0000000000000001 )

WARNING: line over 80 characters
#381: FILE: tests/tcg/arc/check_addx.S:56:
+  TEST_RR_3OP( 30,  add, 0xfffffffffffffffe, 0xffffffffffffffff, 0xffffffffffffffff )

WARNING: line over 80 characters
#383: FILE: tests/tcg/arc/check_addx.S:58:
+  TEST_RR_3OP( 31,  add, 0x0000000080000000, 0x0000000000000001, 0x000000007fffffff )

ERROR: space prohibited between function name and open parenthesis '('
#2264: FILE: tests/tcg/arc/check_excp_1.c:3:
+void main (void)

ERROR: space prohibited between function name and open parenthesis '('
#2266: FILE: tests/tcg/arc/check_excp_1.c:5:
+  __builtin_arc_trap_s (0);

ERROR: space prohibited between function name and open parenthesis '('
#2267: FILE: tests/tcg/arc/check_excp_1.c:6:
+  printf ("[PASS] TRAPC:1\n");

ERROR: space prohibited between function name and open parenthesis '('
#2268: FILE: tests/tcg/arc/check_excp_1.c:7:
+  __builtin_arc_trap_s (1);

ERROR: space prohibited between function name and open parenthesis '('
#2269: FILE: tests/tcg/arc/check_excp_1.c:8:
+  printf ("[PASS] TRAPC:2\n");

ERROR: space prohibited between function name and open parenthesis '('
#2275: FILE: tests/tcg/arc/check_excp_1.c:14:
+  printf ("[PASS] TRAPC:IRQ\n");

ERROR: line over 90 characters
#2534: FILE: tests/tcg/arc/check_ldstx.S:21:
+       TEST_CASE(9, r0, 0xcafebabe,  "ld:9", mov r2, 5` mov r1, @tdat` ld_s.as r0,[r1, r2])

ERROR: line over 90 characters
#2931: FILE: tests/tcg/arc/check_lp06.S:141:
+; Timer interrupt and a single insn ZOL. We need to check if indeed we get multiple interrupts, while in ZOL.

ERROR: line over 90 characters
#2932: FILE: tests/tcg/arc/check_lp06.S:142:
+; Timer interrupt and CLRI/SETI body ZOL. The same as above, 2 tests with seti/clri and clri/seti instruction order.

ERROR: line over 90 characters
#3042: FILE: tests/tcg/arc/check_mac.S:44:
+.macro mac_test acch=NOTSET, accl=NOTSET, val1, val2, res, racch=NOTSET, raccl=NOTSET, n=0, v=0, test_num

ERROR: line over 90 characters
#3056: FILE: tests/tcg/arc/check_mac.S:58:
+.macro macu_test acch=NOTSET, accl=NOTSET, val1, val2, res, racch=NOTSET, raccl=NOTSET, v=0, test_num

ERROR: line over 90 characters
#3071: FILE: tests/tcg/arc/check_mac.S:73:
+.macro macd_test acch=NOTSET, accl=NOTSET, val1, val2, resh, resl, racch=NOTSET, raccl=NOTSET, n=0, v=0, test_num

ERROR: line over 90 characters
#3086: FILE: tests/tcg/arc/check_mac.S:88:
+.macro macdu_test acch=NOTSET, accl=NOTSET, val1, val2, resh, resl, racch=NOTSET, raccl=NOTSET, v=0, test_num

ERROR: line over 90 characters
#3111: FILE: tests/tcg/arc/check_mac.S:113:
+mac_test val1=0xFFFFFFFD, val2=0x09, res=0xFFFFFFF9, racch=0xFFFFFFFF, raccl=0xFFFFFFF9, n=1, test_num=4

ERROR: line over 90 characters
#3113: FILE: tests/tcg/arc/check_mac.S:115:
+mac_test acch=0, accl=0, val1=0x7FFFFFFF, val2=0x7FFFFFFF, res=1, racch=0x3FFFFFFF, raccl=0x01, n=0, v=0, test_num=5

ERROR: line over 90 characters
#3115: FILE: tests/tcg/arc/check_mac.S:117:
+mac_test val1=0x80000000, val2=0x80000000, res=1, racch=0x7FFFFFFF, raccl=0x01, n=0, v=0, test_num=6

ERROR: line over 90 characters
#3117: FILE: tests/tcg/arc/check_mac.S:119:
+mac_test val1=0x12344321, val2=0x56788654, res=0xE1C14CD5, racch=0x86262098, raccl=0xE1C14CD5, n=1, v=1, test_num=7

WARNING: line over 80 characters
#3119: FILE: tests/tcg/arc/check_mac.S:121:
+mac_test acch=0, accl=0, val1=0, val2=0, res=0, racch=0, raccl=0, n=0, v=1, test_num=8

ERROR: line over 90 characters
#3131: FILE: tests/tcg/arc/check_mac.S:133:
+macu_test val1=0xFFFFFFFD, val2=0x09, res=0xFFFFFFF9, racch=0x0D, raccl=0xFFFFFFF9, test_num=12

ERROR: line over 90 characters
#3133: FILE: tests/tcg/arc/check_mac.S:135:
+macu_test acch=0, accl=0, val1=0x7FFFFFFF, val2=0x7FFFFFFF, res=1, racch=0x3FFFFFFF, raccl=0x01, v=0, test_num=13

ERROR: line over 90 characters
#3135: FILE: tests/tcg/arc/check_mac.S:137:
+macu_test val1=0x80000000, val2=0x80000000, res=1, racch=0x7FFFFFFF, raccl=0x01, v=0, test_num=14

WARNING: line over 80 characters
#3136: FILE: tests/tcg/arc/check_mac.S:138:
+; acc is 0x7FFFFFFF00000001; line below still will not trigger an overflow for MACU

ERROR: line over 90 characters
#3137: FILE: tests/tcg/arc/check_mac.S:139:
+macu_test val1=0x12344321, val2=0x56788654, res=0xE1C14CD5, racch=0x86262098, raccl=0xE1C14CD5, v=0, test_num=15

ERROR: line over 90 characters
#3139: FILE: tests/tcg/arc/check_mac.S:141:
+macu_test acch=0xFFFFFFFF, accl=0xFFFFFFFF, val1=1, val2=1, res=0, racch=0, raccl=0, v=1, test_num=16

WARNING: line over 80 characters
#3141: FILE: tests/tcg/arc/check_mac.S:143:
+macu_test acch=0, accl=0, val1=0, val2=0, res=0, racch=0, raccl=0, v=1, test_num=17

ERROR: line over 90 characters
#3150: FILE: tests/tcg/arc/check_mac.S:152:
+macd_test val1=0xFFFFFFFF, val2=0x5, resh=0, resl=20, racch=0x0, raccl=20, n=0, test_num=20

ERROR: line over 90 characters
#3152: FILE: tests/tcg/arc/check_mac.S:154:
+macd_test val1=0xFFFFFFFD, val2=0x09, resh = 0xFFFFFFFF, resl=0xFFFFFFF9, racch=0xFFFFFFFF, raccl=0xFFFFFFF9, n=1, test_num=21

ERROR: line over 90 characters
#3154: FILE: tests/tcg/arc/check_mac.S:156:
+macd_test acch=0, accl=0, val1=0x7FFFFFFF, val2=0x7FFFFFFF, resh=0x3FFFFFFF, resl=0x01, racch=0x3FFFFFFF, raccl=0x01, v=0, test_num=22

ERROR: line over 90 characters
#3156: FILE: tests/tcg/arc/check_mac.S:158:
+macd_test val1=0x80000000, val2=0x80000000, resh=0x7FFFFFFF, resl=0x01, racch=0x7FFFFFFF, raccl=0x01, v=0, test_num=23

ERROR: line over 90 characters
#3158: FILE: tests/tcg/arc/check_mac.S:160:
+macd_test val1=0x12344321, val2=0x56788654, resh=0x86262098, resl=0xE1C14CD5, racch=0x86262098, raccl=0xE1C14CD5, n=1, v=1, test_num=24

ERROR: line over 90 characters
#3160: FILE: tests/tcg/arc/check_mac.S:162:
+macd_test acch=0, accl=0, val1=0, val2=0, resh=0, resl=0, racch=0, raccl=0, n=0, v=1, test_num=25

WARNING: line over 80 characters
#3169: FILE: tests/tcg/arc/check_mac.S:171:
+macdu_test val1=0xFFFFFFFF, val2=0x5, resh=5, resl=20, racch=5, raccl=20, test_num=28

ERROR: line over 90 characters
#3171: FILE: tests/tcg/arc/check_mac.S:173:
+macdu_test val1=0xFFFFFFFD, val2=0x09, resh=0x0D, resl=0xFFFFFFF9, racch=0x0D, raccl=0xFFFFFFF9, test_num=29

ERROR: line over 90 characters
#3173: FILE: tests/tcg/arc/check_mac.S:175:
+macdu_test acch=0, accl=0, val1=0x7FFFFFFF, val2=0x7FFFFFFF, resh=0x3FFFFFFF, resl=0x01, racch=0x3FFFFFFF, raccl=0x01, v=0, test_num=30

ERROR: line over 90 characters
#3175: FILE: tests/tcg/arc/check_mac.S:177:
+macdu_test val1=0x80000000, val2=0x80000000, resh=0x7FFFFFFF, resl=0x01, racch=0x7FFFFFFF, raccl=0x01, v=0, test_num=31

WARNING: line over 80 characters
#3176: FILE: tests/tcg/arc/check_mac.S:178:
+; acc is 0x7FFFFFFF00000001; line below still will not trigger an overflow for MACU

ERROR: line over 90 characters
#3177: FILE: tests/tcg/arc/check_mac.S:179:
+macdu_test val1=0x12344321, val2=0x56788654, resh=0x86262098, resl=0xE1C14CD5, racch=0x86262098, raccl=0xE1C14CD5, v=0, test_num=32

ERROR: line over 90 characters
#3179: FILE: tests/tcg/arc/check_mac.S:181:
+macdu_test acch=0xFFFFFFFF, accl=0xFFFFFFFF, val1=1, val2=1, resh=0, resl=0, racch=0, raccl=0, v=1, test_num=33

ERROR: line over 90 characters
#3181: FILE: tests/tcg/arc/check_mac.S:183:
+macdu_test acch=0, accl=0, val1=0, val2=0, resh=0, resl=0, racch=0, raccl=0, v=1, test_num=34

ERROR: line over 90 characters
#3314: FILE: tests/tcg/arc/check_manip_10_mmu.S:82:
+  .equ T5_PD0, ((T5_VIRT_ADDR+T5_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#3315: FILE: tests/tcg/arc/check_manip_10_mmu.S:83:
+  .equ T5_PD1, ((T5_PHYS_ADDR+T5_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R | REG_PD1_KRNL_E)

ERROR: line over 90 characters
#3492: FILE: tests/tcg/arc/check_manip_4_mmu.S:81:
+  .equ T4_PD0, ((T4_VIRT_ADDR+T4_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#3493: FILE: tests/tcg/arc/check_manip_4_mmu.S:82:
+  .equ T4_PD1, ((T4_PHYS_ADDR+T4_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R | REG_PD1_KRNL_E)

ERROR: line over 90 characters
#3657: FILE: tests/tcg/arc/check_manip_5_mmu.S:82:
+  .equ T5_PD0, ((T5_VIRT_ADDR+T5_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#3658: FILE: tests/tcg/arc/check_manip_5_mmu.S:83:
+  .equ T5_PD1, ((T5_PHYS_ADDR+T5_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R | REG_PD1_KRNL_E)

WARNING: line over 80 characters
#3830: FILE: tests/tcg/arc/check_manip_mmu.S:83:
+  .equ T1_PHYS_ADDR, 0x73311334     ; the physical address (same page offset as VA)

WARNING: line over 80 characters
#3833: FILE: tests/tcg/arc/check_manip_mmu.S:86:
+  .equ T1_PD0   , ((T1_VIRT_ADDR & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#3905: FILE: tests/tcg/arc/check_manip_mmu.S:158:
+  .equ T2_PD0, ((T2_VIRT_ADDR+T2_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#3969: FILE: tests/tcg/arc/check_manip_mmu.S:222:
+  .equ T3_PD0_ENT1, ((T3_VIRT_ADDR_1+T3_ADDR_1_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

WARNING: line over 80 characters
#3970: FILE: tests/tcg/arc/check_manip_mmu.S:223:
+  .equ T3_PD1_ENT1, ((T3_PHYS_ADDR_1               & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R)

ERROR: line over 90 characters
#3971: FILE: tests/tcg/arc/check_manip_mmu.S:224:
+  .equ T3_PD0_ENT2, ((T3_VIRT_ADDR_2               & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

WARNING: line over 80 characters
#3972: FILE: tests/tcg/arc/check_manip_mmu.S:225:
+  .equ T3_PD1_ENT2, ((T3_PHYS_ADDR_2               & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R)

WARNING: line over 80 characters
#3978: FILE: tests/tcg/arc/check_manip_mmu.S:231:
+  sth     r1, [T3_PHYS_ADDR_2]                ; 0x56 0x34 at the beginning of 2nd page

WARNING: line over 80 characters
#3980: FILE: tests/tcg/arc/check_manip_mmu.S:233:
+  stb     r1, [T3_PHYS_ADDR_2+2]              ; 0x12 The 3rd byte on the 2nd page

ERROR: line over 90 characters
#4032: FILE: tests/tcg/arc/check_manip_mmu.S:285:
+  .equ T4_PD0, ((T4_VIRT_ADDR+T4_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#4033: FILE: tests/tcg/arc/check_manip_mmu.S:286:
+  .equ T4_PD1, ((T4_PHYS_ADDR+T4_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R | REG_PD1_KRNL_E)

ERROR: line over 90 characters
#4109: FILE: tests/tcg/arc/check_manip_mmu.S:362:
+  .equ T5_PD0, ((T5_VIRT_ADDR+T5_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#4110: FILE: tests/tcg/arc/check_manip_mmu.S:363:
+  .equ T5_PD1, ((T5_PHYS_ADDR+T5_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R | REG_PD1_KRNL_E)

ERROR: line over 90 characters
#4243: FILE: tests/tcg/arc/check_manip_mmu.S:496:
+  .equ T9_PD0, ((T9_VIRT_ADDR+T9_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD0_GLOBAL | REG_PD0_VALID)

ERROR: line over 90 characters
#4244: FILE: tests/tcg/arc/check_manip_mmu.S:497:
+  .equ T9_PD1, ((T9_PHYS_ADDR+T9_ADDR_OFS & PAGE_NUMBER_MSK) | REG_PD1_KRNL_R | REG_PD1_KRNL_E)

WARNING: line over 80 characters
#4279: FILE: tests/tcg/arc/check_manip_mmu.S:532:
+  cmp     r11, @T9_VIRT_ADDR+0x2000-4 ; Last instruction of the first page (blne.d)?

WARNING: line over 80 characters
#5788: FILE: tests/tcg/arc/check_prefetch.S:14:
+  TEST_CASE( 2, r0, 0x00000000, "prefetch:2", prefetch    [0x12]`      mov r0, 0x0)

WARNING: line over 80 characters
#5789: FILE: tests/tcg/arc/check_prefetch.S:15:
+  TEST_CASE( 3, r0, 0x00000000, "prefetch:3", prefetchw   [0x12]`      mov r0, 0x0)

WARNING: line over 80 characters
#5790: FILE: tests/tcg/arc/check_prefetch.S:16:
+  TEST_CASE( 4, r0, 0x00000000, "prefetch:4", prefetchw   [r1, r2]`    mov r0, 0x0)

WARNING: line over 80 characters
#5791: FILE: tests/tcg/arc/check_prefetch.S:17:
+  TEST_CASE( 5, r0, 0x00000000, "prefetch:5", prefetchw   [0x12, 0x1]` mov r0, 0x0)

WARNING: line over 80 characters
#5792: FILE: tests/tcg/arc/check_prefetch.S:18:
+  TEST_CASE( 6, r0, 0x00000000, "prefetch:6", prefetch    [r1, r2]`    mov r0, 0x0)

WARNING: line over 80 characters
#5793: FILE: tests/tcg/arc/check_prefetch.S:19:
+  TEST_CASE( 7, r0, 0x00000000, "prefetch:7", prefetch    [0x12, 0x1]` mov r0, 0x0)

WARNING: line over 80 characters
#5796: FILE: tests/tcg/arc/check_prefetch.S:22:
+       TEST_CASE( 8, r0, 0x00000004, "prefetch:8", prefetch    [r13]`       ld r0,[r13])

WARNING: line over 80 characters
#5797: FILE: tests/tcg/arc/check_prefetch.S:23:
+       TEST_CASE( 9, r0, 0x40000000, "prefetch:9", prefetch.aw [r13,4]`     ld r0,[r13])

WARNING: line over 80 characters
#5798: FILE: tests/tcg/arc/check_prefetch.S:24:
+       TEST_CASE(10, r0, 0x40400000, "prefetch:10", prefetch.ab [r13,4]`     ld r0,[r13])

WARNING: line over 80 characters
#6069: FILE: tests/tcg/arc/check_subf.S:42:
+sub0_flags_test 0xA0000000, 0xB0000000, 0xF0000000, z=0, n=1, c=1, v=0, test_num=0x01

WARNING: line over 80 characters
#6070: FILE: tests/tcg/arc/check_subf.S:43:
+sub1_flags_test 0xA0000000, 0x58000000, 0xF0000000, z=0, n=1, c=1, v=0, test_num=0x02

WARNING: line over 80 characters
#6071: FILE: tests/tcg/arc/check_subf.S:44:
+sub2_flags_test 0xA0000000, 0x2C000000, 0xF0000000, z=0, n=1, c=1, v=0, test_num=0x03

WARNING: line over 80 characters
#6072: FILE: tests/tcg/arc/check_subf.S:45:
+sub3_flags_test 0xA0000000, 0x16000000, 0xF0000000, z=0, n=1, c=1, v=0, test_num=0x04

WARNING: line over 80 characters
#6074: FILE: tests/tcg/arc/check_subf.S:47:
+sub0_flags_test 0xFFFFFF80, 0xF0000000, 0x0FFFFF80, z=0, n=0, c=0, v=0, test_num=0x05

WARNING: line over 80 characters
#6075: FILE: tests/tcg/arc/check_subf.S:48:
+sub1_flags_test 0xFFFFFF80, 0x78000000, 0x0FFFFF80, z=0, n=0, c=0, v=0, test_num=0x06

WARNING: line over 80 characters
#6076: FILE: tests/tcg/arc/check_subf.S:49:
+sub2_flags_test 0xFFFFFF80, 0x3C000000, 0x0FFFFF80, z=0, n=0, c=0, v=0, test_num=0x07

WARNING: line over 80 characters
#6077: FILE: tests/tcg/arc/check_subf.S:50:
+sub3_flags_test 0xFFFFFF80, 0x1E000000, 0x0FFFFF80, z=0, n=0, c=0, v=0, test_num=0x08

WARNING: line over 80 characters
#6079: FILE: tests/tcg/arc/check_subf.S:52:
+sub0_flags_test 0x80000000, 0x80000000, 0x00000000, z=1, n=0, c=0, v=0, test_num=0x09

WARNING: line over 80 characters
#6080: FILE: tests/tcg/arc/check_subf.S:53:
+sub1_flags_test 0x80000000, 0x40000000, 0x00000000, z=1, n=0, c=0, v=0, test_num=0x10

WARNING: line over 80 characters
#6081: FILE: tests/tcg/arc/check_subf.S:54:
+sub2_flags_test 0x80000000, 0x20000000, 0x00000000, z=1, n=0, c=0, v=0, test_num=0x11

WARNING: line over 80 characters
#6082: FILE: tests/tcg/arc/check_subf.S:55:
+sub3_flags_test 0x80000000, 0x10000000, 0x00000000, z=1, n=0, c=0, v=0, test_num=0x12

WARNING: line over 80 characters
#6084: FILE: tests/tcg/arc/check_subf.S:57:
+sub0_flags_test 0x80000000, 0xC0000000, 0xC0000000, z=0, n=1, c=1, v=0, test_num=0x13

WARNING: line over 80 characters
#6085: FILE: tests/tcg/arc/check_subf.S:58:
+sub1_flags_test 0x80000000, 0x60000000, 0xC0000000, z=0, n=1, c=1, v=0, test_num=0x14

WARNING: line over 80 characters
#6086: FILE: tests/tcg/arc/check_subf.S:59:
+sub2_flags_test 0x80000000, 0x30000000, 0xC0000000, z=0, n=1, c=1, v=0, test_num=0x15

WARNING: line over 80 characters
#6087: FILE: tests/tcg/arc/check_subf.S:60:
+sub3_flags_test 0x80000000, 0x18000000, 0xC0000000, z=0, n=1, c=1, v=0, test_num=0x16

WARNING: line over 80 characters
#6089: FILE: tests/tcg/arc/check_subf.S:62:
+sub0_flags_test 0x80000000, 0x00000008, 0x7FFFFFF8, z=0, n=0, c=0, v=1, test_num=0x17

WARNING: line over 80 characters
#6090: FILE: tests/tcg/arc/check_subf.S:63:
+sub1_flags_test 0x80000000, 0x00000004, 0x7FFFFFF8, z=0, n=0, c=0, v=1, test_num=0x18

WARNING: line over 80 characters
#6091: FILE: tests/tcg/arc/check_subf.S:64:
+sub2_flags_test 0x80000000, 0x00000002, 0x7FFFFFF8, z=0, n=0, c=0, v=1, test_num=0x19

WARNING: line over 80 characters
#6092: FILE: tests/tcg/arc/check_subf.S:65:
+sub3_flags_test 0x80000000, 0x00000001, 0x7FFFFFF8, z=0, n=0, c=0, v=1, test_num=0x20

WARNING: line over 80 characters
#6117: FILE: tests/tcg/arc/check_subx.S:17:
+  TEST_RR_3OP( 2,  sub, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 );

WARNING: line over 80 characters
#6118: FILE: tests/tcg/arc/check_subx.S:18:
+  TEST_RR_3OP( 3,  sub, 0x0000000000000000, 0x0000000000000001, 0x0000000000000001 );

WARNING: line over 80 characters
#6119: FILE: tests/tcg/arc/check_subx.S:19:
+  TEST_RR_3OP( 4,  sub, 0xfffffffffffffffc, 0x0000000000000003, 0x0000000000000007 );

WARNING: line over 80 characters
#6121: FILE: tests/tcg/arc/check_subx.S:21:
+  TEST_RR_3OP( 5,  sub, 0x0000000000008000, 0x0000000000000000, 0xffffffffffff8000 );

WARNING: line over 80 characters
#6122: FILE: tests/tcg/arc/check_subx.S:22:
+  TEST_RR_3OP( 6,  sub, 0xffffffff80000000, 0xffffffff80000000, 0x0000000000000000 );

WARNING: line over 80 characters
#6123: FILE: tests/tcg/arc/check_subx.S:23:
+  TEST_RR_3OP( 7,  sub, 0xffffffff80008000, 0xffffffff80000000, 0xffffffffffff8000 );

WARNING: line over 80 characters
#6125: FILE: tests/tcg/arc/check_subx.S:25:
+  TEST_RR_3OP( 8,  sub, 0xffffffffffff8001, 0x0000000000000000, 0x0000000000007fff );

WARNING: line over 80 characters
#6126: FILE: tests/tcg/arc/check_subx.S:26:
+  TEST_RR_3OP( 9,  sub, 0x000000007fffffff, 0x000000007fffffff, 0x0000000000000000 );

WARNING: line over 80 characters
#6127: FILE: tests/tcg/arc/check_subx.S:27:
+  TEST_RR_3OP( 10, sub, 0x000000007fff8000, 0x000000007fffffff, 0x0000000000007fff );

WARNING: line over 80 characters
#6129: FILE: tests/tcg/arc/check_subx.S:29:
+  TEST_RR_3OP( 11, sub, 0xffffffff7fff8001, 0xffffffff80000000, 0x0000000000007fff );

WARNING: line over 80 characters
#6130: FILE: tests/tcg/arc/check_subx.S:30:
+  TEST_RR_3OP( 12, sub, 0x0000000080007fff, 0x000000007fffffff, 0xffffffffffff8000 );

WARNING: line over 80 characters
#6132: FILE: tests/tcg/arc/check_subx.S:32:
+  TEST_RR_3OP( 13, sub, 0x0000000000000001, 0x0000000000000000, 0xffffffffffffffff );

WARNING: line over 80 characters
#6133: FILE: tests/tcg/arc/check_subx.S:33:
+  TEST_RR_3OP( 14, sub, 0xfffffffffffffffe, 0xffffffffffffffff, 0x0000000000000001 );

WARNING: line over 80 characters
#6134: FILE: tests/tcg/arc/check_subx.S:34:
+  TEST_RR_3OP( 15, sub, 0x0000000000000000, 0xffffffffffffffff, 0xffffffffffffffff );

WARNING: line over 80 characters
#7789: FILE: tests/tcg/arc/check_xorx.S:28:
+  TEST_IMM_SRC1_EQ_DEST( 10, xor, 0xffffffffff00f00f, 0xffffffffff00f700, 0x70f );

WARNING: architecture specific defines should be avoided
#8584: FILE: tests/tcg/arc/test_macros.h:1:
+#ifndef __TEST_MACROS_SCALAR_H

ERROR: space prohibited after that open parenthesis '('
#8599: FILE: tests/tcg/arc/test_macros.h:16:
+#define TEST_CASE( testnum, testreg, correctval, name, code... ) \

ERROR: space prohibited before that close parenthesis ')'
#8599: FILE: tests/tcg/arc/test_macros.h:16:
+#define TEST_CASE( testnum, testreg, correctval, name, code... ) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8599: FILE: tests/tcg/arc/test_macros.h:16:
+#define TEST_CASE( testnum, testreg, correctval, name, code... ) \
+    test_ ## testnum:                                       \
+    code`                                                   \
+    mov  r12, testnum`                                      \
+    sub.f 0,testreg, correctval`                            \
+    bne  @fail`                                             \
+    PASS_TEST(name)

ERROR: spaces required around that ':' (ctx:VxE)
#8600: FILE: tests/tcg/arc/test_macros.h:17:
+    test_ ## testnum:                                       \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8603: FILE: tests/tcg/arc/test_macros.h:20:
+    sub.f 0,testreg, correctval`                            \
            ^

ERROR: space prohibited after that open parenthesis '('
#8607: FILE: tests/tcg/arc/test_macros.h:24:
+#define TEST_IMM_OP( testnum, inst, result, val1, imm ) \

ERROR: space prohibited before that close parenthesis ')'
#8607: FILE: tests/tcg/arc/test_macros.h:24:
+#define TEST_IMM_OP( testnum, inst, result, val1, imm ) \

ERROR: space prohibited after that open parenthesis '('
#8608: FILE: tests/tcg/arc/test_macros.h:25:
+    TEST_CASE( testnum, r0, result, xstr(inst) ":" xstr(testnum),       \

ERROR: space prohibited after that open parenthesis '('
#8613: FILE: tests/tcg/arc/test_macros.h:30:
+#define TEST_RR_3OP( testnum, inst, result, val1, val2 ) \

ERROR: space prohibited before that close parenthesis ')'
#8613: FILE: tests/tcg/arc/test_macros.h:30:
+#define TEST_RR_3OP( testnum, inst, result, val1, val2 ) \

ERROR: space prohibited after that open parenthesis '('
#8614: FILE: tests/tcg/arc/test_macros.h:31:
+    TEST_CASE( testnum, r0, result, xstr(inst) ":" xstr(testnum),  \

ERROR: space prohibited after that open parenthesis '('
#8620: FILE: tests/tcg/arc/test_macros.h:37:
+#define TEST_RR_2OP( testnum, inst, result, val)         \

ERROR: space prohibited after that open parenthesis '('
#8621: FILE: tests/tcg/arc/test_macros.h:38:
+    TEST_CASE( testnum, r0, result, xstr(inst) ":" xstr(testnum),  \

ERROR: space prohibited after that open parenthesis '('
#8626: FILE: tests/tcg/arc/test_macros.h:43:
+#define TEST_IMM_SRC1_EQ_DEST( testnum, inst, result, val1, imm ) \

ERROR: space prohibited before that close parenthesis ')'
#8626: FILE: tests/tcg/arc/test_macros.h:43:
+#define TEST_IMM_SRC1_EQ_DEST( testnum, inst, result, val1, imm ) \

ERROR: space prohibited after that open parenthesis '('
#8627: FILE: tests/tcg/arc/test_macros.h:44:
+    TEST_CASE( testnum, r1, result, xstr(inst) ":" xstr(testnum),           \

ERROR: space prohibited after that open parenthesis '('
#8632: FILE: tests/tcg/arc/test_macros.h:49:
+#define TEST_RR_SRC1_EQ_DEST( testnum, inst, result, val1, val2 ) \

ERROR: space prohibited before that close parenthesis ')'
#8632: FILE: tests/tcg/arc/test_macros.h:49:
+#define TEST_RR_SRC1_EQ_DEST( testnum, inst, result, val1, val2 ) \

ERROR: space prohibited after that open parenthesis '('
#8633: FILE: tests/tcg/arc/test_macros.h:50:
+    TEST_CASE( testnum, r1, result, xstr(inst) ":" xstr(testnum),           \

ERROR: space prohibited after that open parenthesis '('
#8639: FILE: tests/tcg/arc/test_macros.h:56:
+#define TEST_RR_2OP_SRC1_EQ_DEST( testnum, inst, result, val )     \

ERROR: space prohibited before that close parenthesis ')'
#8639: FILE: tests/tcg/arc/test_macros.h:56:
+#define TEST_RR_2OP_SRC1_EQ_DEST( testnum, inst, result, val )     \

ERROR: space prohibited after that open parenthesis '('
#8640: FILE: tests/tcg/arc/test_macros.h:57:
+    TEST_CASE( testnum, r1, result, xstr(inst) ":" xstr(testnum),            \

ERROR: space prohibited after that open parenthesis '('
#8645: FILE: tests/tcg/arc/test_macros.h:62:
+#define TEST_RR_SRC2_EQ_DEST( testnum, inst, result, val1, val2 )  \

ERROR: space prohibited before that close parenthesis ')'
#8645: FILE: tests/tcg/arc/test_macros.h:62:
+#define TEST_RR_SRC2_EQ_DEST( testnum, inst, result, val1, val2 )  \

ERROR: space prohibited after that open parenthesis '('
#8646: FILE: tests/tcg/arc/test_macros.h:63:
+    TEST_CASE( testnum, r2, result, xstr(inst) ":" xstr(testnum),            \

ERROR: space prohibited after that open parenthesis '('
#8652: FILE: tests/tcg/arc/test_macros.h:69:
+#define TEST_RR_SRC12_EQ_DEST( testnum, inst, result, val1 ) \

ERROR: space prohibited before that close parenthesis ')'
#8652: FILE: tests/tcg/arc/test_macros.h:69:
+#define TEST_RR_SRC12_EQ_DEST( testnum, inst, result, val1 ) \

ERROR: space prohibited after that open parenthesis '('
#8653: FILE: tests/tcg/arc/test_macros.h:70:
+    TEST_CASE( testnum, r1, result, xstr(inst) ":" xstr(testnum),      \

ERROR: space prohibited after that open parenthesis '('
#8658: FILE: tests/tcg/arc/test_macros.h:75:
+#define TEST_2OP_CARRY( testnum, inst, expected, val1, val2) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8658: FILE: tests/tcg/arc/test_macros.h:75:
+#define TEST_2OP_CARRY( testnum, inst, expected, val1, val2) \
+    test_ ## testnum:                                        \
+    mov  r12, testnum`                                       \
+        mov  r1, MASK_XLEN(val1)`                            \
+        mov  r2, MASK_XLEN(val2)`                            \
+        inst.f   0, r1, r2`                                  \
+        mov.cs   r3,(~expected) & 0x01`                      \
+        mov.cc   r3, (expected) & 0x01`                      \
+        cmp      r3, 0`                                      \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8659: FILE: tests/tcg/arc/test_macros.h:76:
+    test_ ## testnum:                                        \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8664: FILE: tests/tcg/arc/test_macros.h:81:
+        mov.cs   r3,(~expected) & 0x01`                      \
                    ^

ERROR: space prohibited after that open parenthesis '('
#8669: FILE: tests/tcg/arc/test_macros.h:86:
+#define TEST_1OP_CARRY( testnum, inst, expected, val) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8669: FILE: tests/tcg/arc/test_macros.h:86:
+#define TEST_1OP_CARRY( testnum, inst, expected, val) \
+    test_ ## testnum:                                 \
+    mov  r12, testnum`                                \
+        add.f    0, r0, r0`                           \
+        mov      r1, MASK_XLEN(val)`                  \
+        inst.f   0, r1`                               \
+        mov.cs   r3,(~expected) & 0x01`               \
+        mov.cc   r3, (expected) & 0x01`               \
+        cmp      r3, 0`                               \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8670: FILE: tests/tcg/arc/test_macros.h:87:
+    test_ ## testnum:                                 \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8675: FILE: tests/tcg/arc/test_macros.h:92:
+        mov.cs   r3,(~expected) & 0x01`               \
                    ^

ERROR: space prohibited after that open parenthesis '('
#8680: FILE: tests/tcg/arc/test_macros.h:97:
+#define TEST_2OP_ZERO( testnum, inst, expected, val1, val2)  \

ERROR: Macros with complex values should be enclosed in parenthesis
#8680: FILE: tests/tcg/arc/test_macros.h:97:
+#define TEST_2OP_ZERO( testnum, inst, expected, val1, val2)  \
+    test_ ## testnum:                                        \
+    mov  r12, testnum`                                       \
+        mov      r1, MASK_XLEN(val1)`                        \
+        mov      r2, MASK_XLEN(val2)`                        \
+        inst.f   0, r1, r2`                                  \
+        mov.eq   r3, (~expected) & 0x01`                     \
+        mov.ne   r3, (expected) & 0x01`                      \
+        cmp      r3, 0`                                      \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8681: FILE: tests/tcg/arc/test_macros.h:98:
+    test_ ## testnum:                                        \
                     ^

ERROR: space prohibited after that open parenthesis '('
#8691: FILE: tests/tcg/arc/test_macros.h:108:
+#define TEST_1OP_ZERO( testnum, inst, expected, val)  \

ERROR: Macros with complex values should be enclosed in parenthesis
#8691: FILE: tests/tcg/arc/test_macros.h:108:
+#define TEST_1OP_ZERO( testnum, inst, expected, val)  \
+    test_ ## testnum:                                 \
+    mov  r12, testnum`                                \
+        add.f    0, r0, r0`                           \
+        mov      r1, MASK_XLEN(val)`                  \
+        inst.f   0, r1`                               \
+        mov.eq   r3, (~expected) & 0x01`              \
+        mov.ne   r3, (expected) & 0x01`               \
+        cmp      r3, 0`                               \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8692: FILE: tests/tcg/arc/test_macros.h:109:
+    test_ ## testnum:                                 \
                     ^

ERROR: space prohibited after that open parenthesis '('
#8702: FILE: tests/tcg/arc/test_macros.h:119:
+#define TEST_2OP_OVERFLOW( testnum, inst, expected, val1, val2) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8702: FILE: tests/tcg/arc/test_macros.h:119:
+#define TEST_2OP_OVERFLOW( testnum, inst, expected, val1, val2) \
+    test_ ## testnum:                                           \
+    mov  r12, testnum`                                          \
+        mov      r1, MASK_XLEN(val1)`                           \
+        mov      r2, MASK_XLEN(val2)`                           \
+        inst.f   0, r1, r2`                                     \
+        mov.vs   r3,(~expected) & 0x01`                         \
+        mov.vc   r3, (expected) & 0x01`                         \
+        cmp      r3, 0`                                         \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8703: FILE: tests/tcg/arc/test_macros.h:120:
+    test_ ## testnum:                                           \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8708: FILE: tests/tcg/arc/test_macros.h:125:
+        mov.vs   r3,(~expected) & 0x01`                         \
                    ^

ERROR: space prohibited after that open parenthesis '('
#8713: FILE: tests/tcg/arc/test_macros.h:130:
+#define TEST_1OP_OVERFLOW( testnum, inst, expected, val) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8713: FILE: tests/tcg/arc/test_macros.h:130:
+#define TEST_1OP_OVERFLOW( testnum, inst, expected, val) \
+    test_ ## testnum:                                    \
+    mov  r12, testnum`                                   \
+        add.f    0, r0, r0`                              \
+        mov      r1, MASK_XLEN(val)`                     \
+        inst.f   0, r1`                                  \
+        mov.vs   r3,(~expected) & 0x01`                  \
+        mov.vc   r3, (expected) & 0x01`                  \
+        cmp      r3, 0`                                  \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8714: FILE: tests/tcg/arc/test_macros.h:131:
+    test_ ## testnum:                                    \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8719: FILE: tests/tcg/arc/test_macros.h:136:
+        mov.vs   r3,(~expected) & 0x01`                  \
                    ^

ERROR: space prohibited after that open parenthesis '('
#8724: FILE: tests/tcg/arc/test_macros.h:141:
+#define TEST_2OP_NEGATIVE( testnum, inst, expected, val1, val2)    \

ERROR: Macros with complex values should be enclosed in parenthesis
#8724: FILE: tests/tcg/arc/test_macros.h:141:
+#define TEST_2OP_NEGATIVE( testnum, inst, expected, val1, val2)    \
+    test_ ## testnum:                                              \
+    mov  r12, testnum`                                             \
+        mov      r1, MASK_XLEN(val1)`                              \
+        mov      r2, MASK_XLEN(val2)`                              \
+        inst.f   0, r1, r2`                                        \
+        mov.mi   r3,(~expected) & 0x01`                            \
+        mov.pl   r3, (expected) & 0x01`                            \
+        cmp      r3, 0`                                            \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8725: FILE: tests/tcg/arc/test_macros.h:142:
+    test_ ## testnum:                                              \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8730: FILE: tests/tcg/arc/test_macros.h:147:
+        mov.mi   r3,(~expected) & 0x01`                            \
                    ^

ERROR: space prohibited after that open parenthesis '('
#8735: FILE: tests/tcg/arc/test_macros.h:152:
+#define TEST_1OP_NEGATIVE( testnum, inst, expected, val)    \

ERROR: Macros with complex values should be enclosed in parenthesis
#8735: FILE: tests/tcg/arc/test_macros.h:152:
+#define TEST_1OP_NEGATIVE( testnum, inst, expected, val)    \
+    test_ ## testnum:                                       \
+    mov  r12, testnum`                                      \
+        add.f    0, r0, r0`                                 \
+        mov      r1, MASK_XLEN(val)`                        \
+        inst.f   0, r1`                                     \
+        mov.mi   r3,(~expected) & 0x01`                     \
+        mov.pl   r3, (expected) & 0x01`                     \
+        cmp      r3, 0`                                     \
+        bne      @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8736: FILE: tests/tcg/arc/test_macros.h:153:
+    test_ ## testnum:                                       \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8741: FILE: tests/tcg/arc/test_macros.h:158:
+        mov.mi   r3,(~expected) & 0x01`                     \
                    ^

ERROR: space prohibited after that open parenthesis '('
#8749: FILE: tests/tcg/arc/test_macros.h:166:
+#define TEST_BR2_OP_TAKEN( testnum, inst, val1, val2 )  \

ERROR: space prohibited before that close parenthesis ')'
#8749: FILE: tests/tcg/arc/test_macros.h:166:
+#define TEST_BR2_OP_TAKEN( testnum, inst, val1, val2 )  \

ERROR: Macros with complex values should be enclosed in parenthesis
#8749: FILE: tests/tcg/arc/test_macros.h:166:
+#define TEST_BR2_OP_TAKEN( testnum, inst, val1, val2 )  \
+    test_ ## testnum:`                                  \
+        mov  r12, testnum`                              \
+        mov  r1, val1`                                  \
+        mov  r2, val2`                                  \
+        sub.f 0,r1,r2`                                  \
+        inst 1f`                                        \
+        b @fail`                                        \
+        1:

ERROR: spaces required around that ':' (ctx:VxV)
#8750: FILE: tests/tcg/arc/test_macros.h:167:
+    test_ ## testnum:`                                  \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8754: FILE: tests/tcg/arc/test_macros.h:171:
+        sub.f 0,r1,r2`                                  \
                ^

ERROR: space required after that ',' (ctx:VxV)
#8754: FILE: tests/tcg/arc/test_macros.h:171:
+        sub.f 0,r1,r2`                                  \
                   ^

ERROR: spaces required around that ':' (ctx:VxE)
#8757: FILE: tests/tcg/arc/test_macros.h:174:
+        1:
          ^

ERROR: space prohibited after that open parenthesis '('
#8759: FILE: tests/tcg/arc/test_macros.h:176:
+#define TEST_BR2_OP_NOTTAKEN( testnum, inst, val1, val2 ) \

ERROR: space prohibited before that close parenthesis ')'
#8759: FILE: tests/tcg/arc/test_macros.h:176:
+#define TEST_BR2_OP_NOTTAKEN( testnum, inst, val1, val2 ) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8759: FILE: tests/tcg/arc/test_macros.h:176:
+#define TEST_BR2_OP_NOTTAKEN( testnum, inst, val1, val2 ) \
+    test_ ## testnum:`                                    \
+    mov  r12,testnum`                                     \
+        mov  r1, val1`                                    \
+        mov  r2, val2`                                    \
+        sub.f 0,r1,r2`                                    \
+        inst @fail

ERROR: spaces required around that ':' (ctx:VxV)
#8760: FILE: tests/tcg/arc/test_macros.h:177:
+    test_ ## testnum:`                                    \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8761: FILE: tests/tcg/arc/test_macros.h:178:
+    mov  r12,testnum`                                     \
             ^

ERROR: space required after that ',' (ctx:VxV)
#8764: FILE: tests/tcg/arc/test_macros.h:181:
+        sub.f 0,r1,r2`                                    \
                ^

ERROR: space required after that ',' (ctx:VxV)
#8764: FILE: tests/tcg/arc/test_macros.h:181:
+        sub.f 0,r1,r2`                                    \
                   ^

ERROR: space prohibited after that open parenthesis '('
#8767: FILE: tests/tcg/arc/test_macros.h:184:
+#define TEST_BR_OP_TAKEN( testnum, inst, val1, val2 )  \

ERROR: space prohibited before that close parenthesis ')'
#8767: FILE: tests/tcg/arc/test_macros.h:184:
+#define TEST_BR_OP_TAKEN( testnum, inst, val1, val2 )  \

ERROR: Macros with complex values should be enclosed in parenthesis
#8767: FILE: tests/tcg/arc/test_macros.h:184:
+#define TEST_BR_OP_TAKEN( testnum, inst, val1, val2 )  \
+    test_ ## testnum:`                                  \
+        mov  r12, testnum`                              \
+        mov  r1, val1`                                  \
+        mov  r2, val2`                                  \
+        inst r1,r2,1f`                                  \
+        b @fail`                                        \
+        1:

ERROR: spaces required around that ':' (ctx:VxV)
#8768: FILE: tests/tcg/arc/test_macros.h:185:
+    test_ ## testnum:`                                  \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8772: FILE: tests/tcg/arc/test_macros.h:189:
+        inst r1,r2,1f`                                  \
                ^

ERROR: space required after that ',' (ctx:VxV)
#8772: FILE: tests/tcg/arc/test_macros.h:189:
+        inst r1,r2,1f`                                  \
                   ^

ERROR: spaces required around that ':' (ctx:VxE)
#8774: FILE: tests/tcg/arc/test_macros.h:191:
+        1:
          ^

ERROR: space prohibited after that open parenthesis '('
#8776: FILE: tests/tcg/arc/test_macros.h:193:
+#define TEST_BR_OP_NOTTAKEN( testnum, inst, val1, val2 ) \

ERROR: space prohibited before that close parenthesis ')'
#8776: FILE: tests/tcg/arc/test_macros.h:193:
+#define TEST_BR_OP_NOTTAKEN( testnum, inst, val1, val2 ) \

ERROR: Macros with complex values should be enclosed in parenthesis
#8776: FILE: tests/tcg/arc/test_macros.h:193:
+#define TEST_BR_OP_NOTTAKEN( testnum, inst, val1, val2 ) \
+    test_ ## testnum:`                                    \
+        mov  r12,testnum`                                 \
+        mov  r1, val1`                                    \
+        mov  r2, val2`                                    \
+        inst r1,r2,@fail

ERROR: spaces required around that ':' (ctx:VxV)
#8777: FILE: tests/tcg/arc/test_macros.h:194:
+    test_ ## testnum:`                                    \
                     ^

ERROR: space required after that ',' (ctx:VxV)
#8778: FILE: tests/tcg/arc/test_macros.h:195:
+        mov  r12,testnum`                                 \
                 ^

ERROR: space required after that ',' (ctx:VxV)
#8781: FILE: tests/tcg/arc/test_macros.h:198:
+        inst r1,r2,@fail
                ^

ERROR: space required after that ',' (ctx:VxV)
#8781: FILE: tests/tcg/arc/test_macros.h:198:
+        inst r1,r2,@fail
                   ^

ERROR: Macros with complex values should be enclosed in parenthesis
#8783: FILE: tests/tcg/arc/test_macros.h:200:
+#define ARCTEST_BEGIN \
+    .text`                                      \
+        .align 4 `                              \
+        .global main`                           \
+    main:                                       \
+        test_1:`                                \
+        mov r12,1`                              \
+        mov.f 0,0`                              \
+        bne @fail

ERROR: spaces required around that ':' (ctx:VxE)
#8787: FILE: tests/tcg/arc/test_macros.h:204:
+    main:                                       \
         ^

ERROR: spaces required around that ':' (ctx:VxV)
#8788: FILE: tests/tcg/arc/test_macros.h:205:
+        test_1:`                                \
               ^

ERROR: space required after that ',' (ctx:VxV)
#8789: FILE: tests/tcg/arc/test_macros.h:206:
+        mov r12,1`                              \
                ^

ERROR: space required after that ',' (ctx:VxV)
#8790: FILE: tests/tcg/arc/test_macros.h:207:
+        mov.f 0,0`                              \
                ^

ERROR: Macros with complex values should be enclosed in parenthesis
#8793: FILE: tests/tcg/arc/test_macros.h:210:
+#define ARCTEST_END \
+         .align 4 ` \
+1:`\
+        st 1,[0xf0000008]`\
+        b @1b`\
+fail:`\
+        mov     r2, '['`\
+        st      r2, [0x90000000]`\
+        mov     r2, 'F'`\
+        st      r2, [0x90000000]`\
+        mov     r2, 'a'`\
+        st      r2, [0x90000000]`\
+        mov     r2, 'i'`\
+        st      r2, [0x90000000]`\
+        mov     r2, 'l'`\
+        st      r2, [0x90000000]`\
+        mov     r2, ']'`\
+        st      r2, [0x90000000]`\
+        mov     r2, ' '`\
+        st      r2, [0x90000000]`\
+        mov r13, r12`\
+        mov r15, 0x30`\
+        mov r14, r12`\
+loop_z: `\
+        sub.f   r13, r13, 0x0A`\
+        add.pl  r15, r15, 1`\
+        mov.pl  r14, r13 `\
+        bpl     @loop_z`\
+        st      r15, [0x90000000]`\
+        add     r14, r14, 0x30`\
+        st      r14, [0x90000000]`\
+        mov     r2, '\n'`\
+        st      r2, [0x90000000]`\
+        b       1b`

ERROR: spaces required around that ':' (ctx:VxV)
#8795: FILE: tests/tcg/arc/test_macros.h:212:
+1:`\
  ^

ERROR: space required after that ',' (ctx:VxV)
#8796: FILE: tests/tcg/arc/test_macros.h:213:
+        st 1,[0xf0000008]`\
             ^

ERROR: spaces required around that ':' (ctx:VxV)
#8798: FILE: tests/tcg/arc/test_macros.h:215:
+fail:`\
     ^

ERROR: spaces required around that ':' (ctx:VxW)
#8816: FILE: tests/tcg/arc/test_macros.h:233:
+loop_z: `\
       ^

ERROR: Macros with complex values should be enclosed in parenthesis
#8828: FILE: tests/tcg/arc/test_macros.h:245:
+#define PASS_TEST(name)\
+    .data `            \
+2010:`\
+    .ascii "[PASS] ",name ,"\n\0"` \
+  .align 4`\
+  .text`\
+  mov_s     r11, @2010b`\
+  1010:`\
+    ldb.ab  r12, [r11, 1]`\
+    breq    r12, 0, @1011f`\
+    stb     r12, [0x90000000]`\
+    j       @1010b`\
+  1011:`

ERROR: spaces required around that ':' (ctx:VxV)
#8830: FILE: tests/tcg/arc/test_macros.h:247:
+2010:`\
     ^

ERROR: space required after that ',' (ctx:VxV)
#8831: FILE: tests/tcg/arc/test_macros.h:248:
+    .ascii "[PASS] ",name ,"\n\0"` \
                     ^

ERROR: space required after that ',' (ctx:WxV)
#8831: FILE: tests/tcg/arc/test_macros.h:248:
+    .ascii "[PASS] ",name ,"\n\0"` \
                           ^

ERROR: spaces required around that ':' (ctx:VxV)
#8835: FILE: tests/tcg/arc/test_macros.h:252:
+  1010:`\
       ^

ERROR: spaces required around that ':' (ctx:VxV)
#8840: FILE: tests/tcg/arc/test_macros.h:257:
+  1011:`
       ^

ERROR: line over 90 characters
#8858: FILE: tests/tcg/configure.sh:98:
+    arc|alpha|cris|hppa|i386|lm32|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64)

total: 152 errors, 69 warnings, 8350 lines checked

Patch 14/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

15/15 Checking commit dc09f35a4b7e (tests/acceptance: ARC: Add linux boot testing.)
ERROR: line over 90 characters
#48: FILE: tests/acceptance/boot_linux_console.py:997:
+        tar_url = ('https://github.com/cupertinomiranda/arc-qemu-resources/archive/master.tar.gz')

ERROR: line over 90 characters
#84: FILE: tests/acceptance/boot_linux_console.py:1154:
+        self.vm.add_args('-netdev', 'user,id=net0,hostfwd=tcp::5558-:21,hostfwd=tcp::5557-:23')

total: 2 errors, 0 warnings, 70 lines checked

Patch 15/15 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

=== OUTPUT END ===

Test command exited with code: 1


The full log is available at
http://patchew.org/logs/20201111161758.9636-1-cupertinomiranda@gmail.com/testing.checkpatch/?type=message.
---
Email generated automatically by Patchew [https://patchew.org/].
Please send your feedback to patchew-devel@redhat.com
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
