Return-Path: <SRS0=FQwO=LJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DF6C48BDF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Jun 2021 20:22:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D7B60FDC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Jun 2021 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D7B60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=akdk0Tae6LnMl5JcJHiytSdaiA9EkxMv7FVa2TzHQXo=; b=meQtXx95IibO8W
	nAIn9FOV0t0S9KmZAaS8icdQTiOBotL27AldwXbg09IuLwQe+DGO4Mc6sD0nfxLeng9ubewXlilRk
	0YSpSV8VYACkUB+YZKEkwwz0pqEz3G8IpNqOgfUvmGntZeWD94SWt9czO0KcNl/ClUHjCGfRRBBxj
	5KjhnNAQTILujw4MYX1Iq5AGcyyz4t0FUXEhJ1gOrsBS2SBoB9Y/dzK61z1bDWNIqiPfAKwSdl7rJ
	QO5piVURMO0J+vPuEikjAxyJ9fd2FV68CL9LrOqzxX6fDG87koI3n55jbY5AuCSZGBXPU4hhGyjog
	iP5x9NTPE8N+CeoPublA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFa3-002lGK-VA; Tue, 15 Jun 2021 20:22:39 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBUi-001BNL-LD
 for linux-snps-arc@lists.infradead.org; Tue, 15 Jun 2021 16:00:57 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B91B403BA;
 Tue, 15 Jun 2021 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623772839; bh=j0WPLeEVST0kkl2skFMCE+8psWBaRr32Bf5UUChpzGY=;
 h=From:To:Cc:Subject:Date:From;
 b=JFGVEyCzNjS5C5rOeVYn0o2lV/i4m9FlwoF5pRlwxd1bNH3xemKTsLfSpk32V2KtC
 5P8CQVfERFMSvTMTd+bU1z2WIdrmXP49Y9zCrDYZI6yeLM4Ljb4ed9BQ14D234i/0C
 eHZSXrdm5rl+jxUX+FGMC1avtE4EKAp5N0WVG5xPLwqRz32XiunteIDZWA7DwPZ0oA
 mkMMk3KoJqVNACSxV01bZMLbWBJt1SuG6PNHdolSiz//3bcyU9QNkrVOp/+5NTuQBz
 oojxdLqQ11jr0pSD/2fNQ183x8GMBRc/ckbt116g38mv/d1ncGkXClkB4pLI5lHBpn
 6R6BqetZOYnmQ==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 by mailhost.synopsys.com (Postfix) with ESMTP id DEDF9A005F;
 Tue, 15 Jun 2021 16:00:36 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] gdb: Add native GDB support for ARC
Date: Tue, 15 Jun 2021 09:00:33 -0700
Message-Id: <20210615160033.23140-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_090052_810590_14986EB1 
X-CRM114-Status: GOOD (  29.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This adds support of so-called "native" GDB for ARC processors.
It was submitted upstream a bit late for inclusion in v10.x,
but already in the upstream "master" branch and will be an essential part
of v11.1 whenever it happens.

These are the changes from upstream "master":
 * https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=b4e3cd0440109d0a5552d3313ccbd35c8103335b
 * https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=d4af727286e3a9f177ba11677fbd3a012d36558a
 * https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=46023bbe81355230b4e7b76d3084337823d02362
 * https://sourceware.org/git?p=binutils-gdb.git;a=commit;h=04c9f85efcd8df5fc482ce97c0104cc7dd5d19e6

Thanks a bunch to Anton & Shahab who made it possible!

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-devtools/gdb/gdb-10.2.inc             |   4 +
 .../0012-arc-Add-support-for-signal-handlers.patch | 218 +++++++++++
 ...pport-for-signal-frames-for-Linux-targets.patch | 232 ++++++++++++
 ...to-account-the-REGNUM-in-supply-collect-g.patch | 104 ++++++
 ...b-Add-native-support-for-ARC-in-GNU-Linux.patch | 414 +++++++++++++++++++++
 5 files changed, 972 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch

diff --git a/meta/recipes-devtools/gdb/gdb-10.2.inc b/meta/recipes-devtools/gdb/gdb-10.2.inc
index 0a7df54e9f..0d275075e6 100644
--- a/meta/recipes-devtools/gdb/gdb-10.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-10.2.inc
@@ -15,5 +15,9 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-resolve-restrict-keyword-conflict.patch \
            file://0010-Fix-invalid-sigprocmask-call.patch \
            file://0011-gdbserver-ctrl-c-handling.patch \
+           file://0012-arc-Add-support-for-signal-handlers.patch \
+           file://0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch \
+           file://0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch \
+           file://0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch \
            "
 SRC_URI[sha256sum] = "aaa1223d534c9b700a8bec952d9748ee1977513f178727e1bee520ee000b4f29"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch b/meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
new file mode 100644
index 0000000000..6a98b65766
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
@@ -0,0 +1,218 @@
+From bfee93403b46ae4f050282b7721ba39073905c69 Mon Sep 17 00:00:00 2001
+From: Anton Kolesov <Anton.Kolesov@synopsys.com>
+Date: Mon, 22 Aug 2016 19:39:46 +0300
+Subject: [PATCH 1/4] arc: Add support for signal handlers
+
+This patch adds the necessary infrastructure to handle signal frames for
+ARC architecture.  It is fairly similar to what any other architecture
+would have.  Linux specific parts will be in a separate patch.
+
+v2 [1]:
+- Make the logic of "arc_sigtramp_frame_sniffer ()" simpler.
+
+[1] Tom's remark for the first version
+https://sourceware.org/pipermail/gdb-patches/2020-November/173221.html
+
+gdb/ChangeLog:
+
+	* arc-tdep.c (arc_make_sigtramp_frame_cache): New function.
+	(arc_sigtramp_frame_this_id): Likewise.
+	(arc_sigtramp_frame_prev_register): Likewise.
+	(arc_sigtramp_frame_sniffer): Likewise.
+	(arc_siftramp_frame_unwind): New global variable.
+	(arc_gdbarch_init): Use sigtramp capabilities.
+	(arc_dump_tdep): Print sigtramp fields.
+	* arc-tdep.h (gdbarch_tdep): Add sigtramp fields.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=b4e3cd0440109d0a5552d3313ccbd35c8103335b]
+
+Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gdb/arc-tdep.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ gdb/arc-tdep.h |  13 ++++++
+ 2 files changed, 136 insertions(+)
+
+diff --git a/gdb/arc-tdep.c b/gdb/arc-tdep.c
+index 93e2fd88a9a..3356252525d 100644
+--- a/gdb/arc-tdep.c
++++ b/gdb/arc-tdep.c
+@@ -1843,6 +1843,104 @@ arc_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
+     reg->how = DWARF2_FRAME_REG_CFA;
+ }
+ 
++/*  Signal trampoline frame unwinder.  Allows frame unwinding to happen
++    from within signal handlers.  */
++
++static struct arc_frame_cache *
++arc_make_sigtramp_frame_cache (struct frame_info *this_frame)
++{
++  if (arc_debug)
++    debug_printf ("arc: sigtramp_frame_cache\n");
++
++  struct gdbarch_tdep *tdep = gdbarch_tdep (get_frame_arch (this_frame));
++
++  /* Allocate new frame cache instance and space for saved register info.  */
++  struct arc_frame_cache *cache = FRAME_OBSTACK_ZALLOC (struct arc_frame_cache);
++  cache->saved_regs = trad_frame_alloc_saved_regs (this_frame);
++
++  /* Get the stack pointer and use it as the frame base.  */
++  cache->prev_sp = arc_frame_base_address (this_frame, NULL);
++
++  /* If the ARC-private target-dependent info doesn't have a table of
++     offsets of saved register contents within an OS signal context
++     structure, then there is nothing to analyze.  */
++  if (tdep->sc_reg_offset == NULL)
++    return cache;
++
++  /* Find the address of the sigcontext structure.  */
++  CORE_ADDR addr = tdep->sigcontext_addr (this_frame);
++
++  /* For each register, if its contents have been saved within the
++     sigcontext structure, determine the address of those contents.  */
++  gdb_assert (tdep->sc_num_regs <= (ARC_LAST_REGNUM + 1));
++  for (int i = 0; i < tdep->sc_num_regs; i++)
++    {
++      if (tdep->sc_reg_offset[i] != ARC_OFFSET_NO_REGISTER)
++	cache->saved_regs[i].addr = addr + tdep->sc_reg_offset[i];
++    }
++
++  return cache;
++}
++
++/* Implement the "this_id" frame_unwind method for signal trampoline
++   frames.  */
++
++static void
++arc_sigtramp_frame_this_id (struct frame_info *this_frame,
++			    void **this_cache, struct frame_id *this_id)
++{
++  if (arc_debug)
++    debug_printf ("arc: sigtramp_frame_this_id\n");
++
++  if (*this_cache == NULL)
++    *this_cache = arc_make_sigtramp_frame_cache (this_frame);
++
++  struct gdbarch *gdbarch = get_frame_arch (this_frame);
++  struct arc_frame_cache *cache = (struct arc_frame_cache *) *this_cache;
++  CORE_ADDR stack_addr = cache->prev_sp;
++  CORE_ADDR code_addr
++    = get_frame_register_unsigned (this_frame, gdbarch_pc_regnum (gdbarch));
++  *this_id = frame_id_build (stack_addr, code_addr);
++}
++
++/* Get a register from a signal handler frame.  */
++
++static struct value *
++arc_sigtramp_frame_prev_register (struct frame_info *this_frame,
++				  void **this_cache, int regnum)
++{
++  if (arc_debug)
++    debug_printf ("arc: sigtramp_frame_prev_register (regnum = %d)\n", regnum);
++
++  /* Make sure we've initialized the cache.  */
++  if (*this_cache == NULL)
++    *this_cache = arc_make_sigtramp_frame_cache (this_frame);
++
++  struct arc_frame_cache *cache = (struct arc_frame_cache *) *this_cache;
++  return trad_frame_get_prev_register (this_frame, cache->saved_regs, regnum);
++}
++
++/* Frame sniffer for signal handler frame.  Only recognize a frame if we
++   have a sigcontext_addr handler in the target dependency.  */
++
++static int
++arc_sigtramp_frame_sniffer (const struct frame_unwind *self,
++			    struct frame_info *this_frame,
++			    void **this_cache)
++{
++  struct gdbarch_tdep *tdep;
++
++  if (arc_debug)
++    debug_printf ("arc: sigtramp_frame_sniffer\n");
++
++  tdep = gdbarch_tdep (get_frame_arch (this_frame));
++
++  /* If we have a sigcontext_addr handler, then just return 1 (same as the
++     "default_frame_sniffer ()").  */
++  return (tdep->sigcontext_addr != NULL && tdep->is_sigtramp != NULL
++	  && tdep->is_sigtramp (this_frame));
++}
++
+ /* Structure defining the ARC ordinary frame unwind functions.  Since we are
+    the fallback unwinder, we use the default frame sniffer, which always
+    accepts the frame.  */
+@@ -1858,6 +1956,21 @@ static const struct frame_unwind arc_frame_unwind = {
+   NULL
+ };
+ 
++/* Structure defining the ARC signal frame unwind functions.  Custom
++   sniffer is used, because this frame must be accepted only in the right
++   context.  */
++
++static const struct frame_unwind arc_sigtramp_frame_unwind = {
++  SIGTRAMP_FRAME,
++  default_frame_unwind_stop_reason,
++  arc_sigtramp_frame_this_id,
++  arc_sigtramp_frame_prev_register,
++  NULL,
++  arc_sigtramp_frame_sniffer,
++  NULL,
++  NULL
++};
++
+ 
+ static const struct frame_base arc_normal_base = {
+   &arc_frame_unwind,
+@@ -2272,6 +2385,7 @@ arc_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+   /* Frame unwinders and sniffers.  */
+   dwarf2_frame_set_init_reg (gdbarch, arc_dwarf2_frame_init_reg);
+   dwarf2_append_unwinders (gdbarch);
++  frame_unwind_append_unwinder (gdbarch, &arc_sigtramp_frame_unwind);
+   frame_unwind_append_unwinder (gdbarch, &arc_frame_unwind);
+   frame_base_set_default (gdbarch, &arc_normal_base);
+ 
+@@ -2350,6 +2464,15 @@ arc_dump_tdep (struct gdbarch *gdbarch, struct ui_file *file)
+   struct gdbarch_tdep *tdep = gdbarch_tdep (gdbarch);
+ 
+   fprintf_unfiltered (file, "arc_dump_tdep: jb_pc = %i\n", tdep->jb_pc);
++
++  fprintf_unfiltered (file, "arc_dump_tdep: is_sigtramp = <%s>\n",
++		      host_address_to_string (tdep->is_sigtramp));
++  fprintf_unfiltered (file, "arc_dump_tdep: sigcontext_addr = <%s>\n",
++		      host_address_to_string (tdep->sigcontext_addr));
++  fprintf_unfiltered (file, "arc_dump_tdep: sc_reg_offset = <%s>\n",
++		      host_address_to_string (tdep->sc_reg_offset));
++  fprintf_unfiltered (file, "arc_dump_tdep: sc_num_regs = %d\n",
++		      tdep->sc_num_regs);
+ }
+ 
+ /* This command accepts single argument - address of instruction to
+diff --git a/gdb/arc-tdep.h b/gdb/arc-tdep.h
+index 50b14905134..70fc3d95c48 100644
+--- a/gdb/arc-tdep.h
++++ b/gdb/arc-tdep.h
+@@ -124,6 +124,19 @@ struct gdbarch_tdep
+ 
+   /* Whether target has hardware (aka zero-delay) loops.  */
+   bool has_hw_loops;
++
++  /* Detect sigtramp.  */
++  bool (*is_sigtramp) (struct frame_info *);
++
++  /* Get address of sigcontext for sigtramp.  */
++  CORE_ADDR (*sigcontext_addr) (struct frame_info *);
++
++  /* Offset of registers in `struct sigcontext'.  */
++  const int *sc_reg_offset;
++
++  /* Number of registers in sc_reg_offsets.  Most likely a ARC_LAST_REGNUM,
++     but in theory it could be less, so it is kept separate.  */
++  int sc_num_regs;
+ };
+ 
+ /* Utility functions used by other ARC-specific modules.  */
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch b/meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
new file mode 100644
index 0000000000..f699a5888d
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
@@ -0,0 +1,232 @@
+From 16ddc17b4f403a38701e0108b02aff967900cc66 Mon Sep 17 00:00:00 2001
+From: Anton Kolesov <Anton.Kolesov@synopsys.com>
+Date: Thu, 22 Dec 2016 21:52:16 +0300
+Subject: [PATCH 2/4] arc: Add support for signal frames for Linux targets
+
+Implement functions needed to unwind signal frames on ARC Linux targets.
+
+gdb/ChangeLog
+
+	* arc-linux-tdep.c (arc_linux_sc_reg_offsets): New static variable.
+	(arc_linux_is_sigtramp): New function.
+	(arc_linux_sigcontext_addr): Likewise.
+	(arc_linux_init_osabi): Use them.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d4af727286e3a9f177ba11677fbd3a012d36558a]
+
+Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gdb/arc-linux-tdep.c | 181 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 181 insertions(+)
+
+diff --git a/gdb/arc-linux-tdep.c b/gdb/arc-linux-tdep.c
+index a7bace12623..17bb3e7b276 100644
+--- a/gdb/arc-linux-tdep.c
++++ b/gdb/arc-linux-tdep.c
+@@ -33,6 +33,60 @@
+ 
+ #define REGOFF(offset) (offset * ARC_REGISTER_SIZE)
+ 
++/* arc_linux_sc_reg_offsets[i] is the offset of register i in the `struct
++   sigcontext'.  Array index is an internal GDB register number, as defined in
++   arc-tdep.h:arc_regnum.
++
++   From <include/uapi/asm/sigcontext.h> and <include/uapi/asm/ptrace.h>.
++
++   The layout of this struct is tightly bound to "arc_regnum" enum
++   in arc-tdep.h.  Any change of order in there, must be reflected
++   here as well.  */
++static const int arc_linux_sc_reg_offsets[] = {
++  /* R0 - R12.  */
++  REGOFF (22), REGOFF (21), REGOFF (20), REGOFF (19),
++  REGOFF (18), REGOFF (17), REGOFF (16), REGOFF (15),
++  REGOFF (14), REGOFF (13), REGOFF (12), REGOFF (11),
++  REGOFF (10),
++
++  /* R13 - R25.  */
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER,
++
++  REGOFF (9),			/* R26 (GP) */
++  REGOFF (8),			/* FP */
++  REGOFF (23),			/* SP */
++  ARC_OFFSET_NO_REGISTER,	/* ILINK */
++  ARC_OFFSET_NO_REGISTER,	/* R30 */
++  REGOFF (7),			/* BLINK */
++
++  /* R32 - R59.  */
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
++  ARC_OFFSET_NO_REGISTER,
++
++  REGOFF (4),			/* LP_COUNT */
++  ARC_OFFSET_NO_REGISTER,	/* RESERVED */
++  ARC_OFFSET_NO_REGISTER,	/* LIMM */
++  ARC_OFFSET_NO_REGISTER,	/* PCL */
++
++  REGOFF (6),			/* PC  */
++  REGOFF (5),			/* STATUS32 */
++  REGOFF (2),			/* LP_START */
++  REGOFF (3),			/* LP_END */
++  REGOFF (1),			/* BTA */
++};
++
+ /* arc_linux_core_reg_offsets[i] is the offset in the .reg section of GDB
+    regnum i.  Array index is an internal GDB register number, as defined in
+    arc-tdep.h:arc_regnum.
+@@ -87,6 +141,127 @@ static const int arc_linux_core_reg_offsets[] = {
+   REGOFF (6)			/* ERET */
+ };
+ 
++/* Is THIS_FRAME a sigtramp function - the function that returns from
++   signal handler into normal execution flow? This is the case if the PC is
++   either at the start of, or in the middle of the two instructions:
++
++     mov r8, __NR_rt_sigreturn ; __NR_rt_sigreturn == 139
++     trap_s 0 ; `swi' for ARC700
++
++   On ARC uClibc Linux this function is called __default_rt_sa_restorer.
++
++   Returns TRUE if this is a sigtramp frame.  */
++
++static bool
++arc_linux_is_sigtramp (struct frame_info *this_frame)
++{
++  struct gdbarch *gdbarch = get_frame_arch (this_frame);
++  CORE_ADDR pc = get_frame_pc (this_frame);
++
++  if (arc_debug)
++    {
++      debug_printf ("arc-linux: arc_linux_is_sigtramp, pc=%s\n",
++		    paddress(gdbarch, pc));
++    }
++
++  static const gdb_byte insns_be_hs[] = {
++    0x20, 0x8a, 0x12, 0xc2,	/* mov  r8,nr_rt_sigreturn */
++    0x78, 0x1e			/* trap_s 0 */
++  };
++  static const gdb_byte insns_be_700[] = {
++    0x20, 0x8a, 0x12, 0xc2,	/* mov  r8,nr_rt_sigreturn */
++    0x22, 0x6f, 0x00, 0x3f	/* swi */
++  };
++
++  gdb_byte arc_sigtramp_insns[sizeof (insns_be_700)];
++  size_t insns_sz;
++  if (arc_mach_is_arcv2 (gdbarch))
++    {
++      insns_sz = sizeof (insns_be_hs);
++      memcpy (arc_sigtramp_insns, insns_be_hs, insns_sz);
++    }
++  else
++    {
++      insns_sz = sizeof (insns_be_700);
++      memcpy (arc_sigtramp_insns, insns_be_700, insns_sz);
++    }
++  if (gdbarch_byte_order (gdbarch) == BFD_ENDIAN_LITTLE)
++    {
++      /* On little endian targets, ARC code section is in what is called
++	 "middle endian", where half-words are in the big-endian order,
++	 only bytes inside the halfwords are in the little endian order.
++	 As a result it is very easy to convert big endian instruction to
++	 little endian, since it is needed to swap bytes in the halfwords,
++	 so there is no need to have information on whether that is a
++	 4-byte instruction or 2-byte.  */
++      gdb_assert ((insns_sz % 2) == 0);
++      for (int i = 0; i < insns_sz; i += 2)
++	std::swap (arc_sigtramp_insns[i], arc_sigtramp_insns[i+1]);
++    }
++
++  gdb_byte buf[insns_sz];
++
++  /* Read the memory at the PC.  Since we are stopped, any breakpoint must
++     have been removed.  */
++  if (!safe_frame_unwind_memory (this_frame, pc, buf, insns_sz))
++    {
++      /* Failed to unwind frame.  */
++      return FALSE;
++    }
++
++  /* Is that code the sigtramp instruction sequence?  */
++  if (memcmp (buf, arc_sigtramp_insns, insns_sz) == 0)
++    return TRUE;
++
++  /* No - look one instruction earlier in the code...  */
++  if (!safe_frame_unwind_memory (this_frame, pc - 4, buf, insns_sz))
++    {
++      /* Failed to unwind frame.  */
++      return FALSE;
++    }
++
++  return (memcmp (buf, arc_sigtramp_insns, insns_sz) == 0);
++}
++
++/* Get sigcontext structure of sigtramp frame - it contains saved
++   registers of interrupted frame.
++
++   Stack pointer points to the rt_sigframe structure, and sigcontext can
++   be found as in:
++
++   struct rt_sigframe {
++     struct siginfo info;
++     struct ucontext uc;
++     ...
++   };
++
++   struct ucontext {
++     unsigned long uc_flags;
++     struct ucontext *uc_link;
++     stack_t uc_stack;
++     struct sigcontext uc_mcontext;
++     sigset_t uc_sigmask;
++   };
++
++   sizeof (struct siginfo) == 0x80
++   offsetof (struct ucontext, uc_mcontext) == 0x14
++
++   GDB cannot include linux headers and use offsetof () because those are
++   target headers and GDB might be built for a different run host.  There
++   doesn't seem to be an established mechanism to figure out those offsets
++   via gdbserver, so the only way is to hardcode values in the GDB,
++   meaning that GDB will be broken if values will change.  That seems to
++   be a very unlikely scenario and other arches (aarch64, alpha, amd64,
++   etc) in GDB hardcode values.  */
++
++static CORE_ADDR
++arc_linux_sigcontext_addr (struct frame_info *this_frame)
++{
++  const int ucontext_offset = 0x80;
++  const int sigcontext_offset = 0x14;
++  return get_frame_sp (this_frame) + ucontext_offset + sigcontext_offset;
++}
++
+ /* Implement the "cannot_fetch_register" gdbarch method.  */
+ 
+ static int
+@@ -504,6 +679,12 @@ arc_linux_init_osabi (struct gdbarch_info info, struct gdbarch *gdbarch)
+   if (arc_debug)
+     debug_printf ("arc-linux: GNU/Linux OS/ABI initialization.\n");
+ 
++  /* Fill in target-dependent info in ARC-private structure.  */
++  tdep->is_sigtramp = arc_linux_is_sigtramp;
++  tdep->sigcontext_addr = arc_linux_sigcontext_addr;
++  tdep->sc_reg_offset = arc_linux_sc_reg_offsets;
++  tdep->sc_num_regs = ARRAY_SIZE (arc_linux_sc_reg_offsets);
++
+   /* If we are using Linux, we have in uClibc
+      (libc/sysdeps/linux/arc/bits/setjmp.h):
+ 
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch b/meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
new file mode 100644
index 0000000000..a7256065cc
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
@@ -0,0 +1,104 @@
+From 5eb97d5e92ad23ee81cebc1ebd5eafe0aa55fc17 Mon Sep 17 00:00:00 2001
+From: Shahab Vahedi <shahab@synopsys.com>
+Date: Tue, 10 Nov 2020 19:34:57 +0100
+Subject: [PATCH 3/4] arc: Take into account the REGNUM in supply/collect gdb
+ hooks
+
+All the arc_linux_supply_*() target operations and the
+arc_linux_collect_v2_regset() in arc-linux-tdep.c were
+supplying/collecting all the registers in regcache as if the
+REGNUM was set to -1.
+
+The more efficient behavior is to examine the REGNUM and act
+accordingly.  That is what this patch does.
+
+gdb/ChangeLog:
+
+	* arc-linux-tdep.c (supply_register): New.
+	(arc_linux_supply_gregset, arc_linux_supply_v2_regset,
+	arc_linux_collect_v2_regset): Consider REGNUM.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=46023bbe81355230b4e7b76d3084337823d02362]
+
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gdb/arc-linux-tdep.c | 41 ++++++++++++++++++++++++++++++++---------
+ 1 file changed, 32 insertions(+), 9 deletions(-)
+
+diff --git a/gdb/arc-linux-tdep.c b/gdb/arc-linux-tdep.c
+index 17bb3e7b276..e83d82b6f5c 100644
+--- a/gdb/arc-linux-tdep.c
++++ b/gdb/arc-linux-tdep.c
+@@ -535,6 +535,18 @@ arc_linux_skip_solib_resolver (struct gdbarch *gdbarch, CORE_ADDR pc)
+     }
+ }
+ 
++/* Populate REGCACHE with register REGNUM from BUF.  */
++
++static void
++supply_register (struct regcache *regcache, int regnum, const gdb_byte *buf)
++{
++  /* Skip non-existing registers.  */
++  if ((arc_linux_core_reg_offsets[regnum] == ARC_OFFSET_NO_REGISTER))
++    return;
++
++  regcache->raw_supply (regnum, buf + arc_linux_core_reg_offsets[regnum]);
++}
++
+ void
+ arc_linux_supply_gregset (const struct regset *regset,
+ 			  struct regcache *regcache,
+@@ -545,9 +557,14 @@ arc_linux_supply_gregset (const struct regset *regset,
+ 
+   const bfd_byte *buf = (const bfd_byte *) gregs;
+ 
+-  for (int reg = 0; reg <= ARC_LAST_REGNUM; reg++)
+-      if (arc_linux_core_reg_offsets[reg] != ARC_OFFSET_NO_REGISTER)
+-	regcache->raw_supply (reg, buf + arc_linux_core_reg_offsets[reg]);
++  /* regnum == -1 means writing all the registers.  */
++  if (regnum == -1)
++    for (int reg = 0; reg <= ARC_LAST_REGNUM; reg++)
++      supply_register (regcache, reg, buf);
++  else if (regnum <= ARC_LAST_REGNUM)
++    supply_register (regcache, regnum, buf);
++  else
++    gdb_assert_not_reached ("Invalid regnum in arc_linux_supply_gregset.");
+ }
+ 
+ void
+@@ -558,9 +575,12 @@ arc_linux_supply_v2_regset (const struct regset *regset,
+   const bfd_byte *buf = (const bfd_byte *) v2_regs;
+ 
+   /* user_regs_arcv2 is defined in linux arch/arc/include/uapi/asm/ptrace.h.  */
+-  regcache->raw_supply (ARC_R30_REGNUM, buf);
+-  regcache->raw_supply (ARC_R58_REGNUM, buf + REGOFF (1));
+-  regcache->raw_supply (ARC_R59_REGNUM, buf + REGOFF (2));
++  if (regnum == -1 || regnum == ARC_R30_REGNUM)
++    regcache->raw_supply (ARC_R30_REGNUM, buf);
++  if (regnum == -1 || regnum == ARC_R58_REGNUM)
++    regcache->raw_supply (ARC_R58_REGNUM, buf + REGOFF (1));
++  if (regnum == -1 || regnum == ARC_R59_REGNUM)
++    regcache->raw_supply (ARC_R59_REGNUM, buf + REGOFF (2));
+ }
+ 
+ /* Populate BUF with register REGNUM from the REGCACHE.  */
+@@ -618,9 +638,12 @@ arc_linux_collect_v2_regset (const struct regset *regset,
+ {
+   bfd_byte *buf = (bfd_byte *) v2_regs;
+ 
+-  regcache->raw_collect (ARC_R30_REGNUM, buf);
+-  regcache->raw_collect (ARC_R58_REGNUM, buf + REGOFF (1));
+-  regcache->raw_collect (ARC_R59_REGNUM, buf + REGOFF (2));
++  if (regnum == -1 || regnum == ARC_R30_REGNUM)
++    regcache->raw_collect (ARC_R30_REGNUM, buf);
++  if (regnum == -1 || regnum == ARC_R58_REGNUM)
++    regcache->raw_collect (ARC_R58_REGNUM, buf + REGOFF (1));
++  if (regnum == -1 || regnum == ARC_R59_REGNUM)
++    regcache->raw_collect (ARC_R59_REGNUM, buf + REGOFF (2));
+ }
+ 
+ /* Linux regset definitions.  */
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch b/meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
new file mode 100644
index 0000000000..31cf0b0be2
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
@@ -0,0 +1,414 @@
+From 32b366249fd42d74cbc4a91039431554ebadcfd0 Mon Sep 17 00:00:00 2001
+From: Anton Kolesov <anton.kolesov@synopsys.com>
+Date: Fri, 14 Feb 2014 11:56:23 +0400
+Subject: [PATCH 4/4] gdb: Add native support for ARC in GNU/Linux
+
+With this patch in place it is possible to build a GDB that
+can run on ARC (GNU/Linux) hosts for debugging ARC targets.
+
+The "arc-linux-nat.c" is a rather small one that mostly deals
+with registers and a few thread related hooks.
+
+v2 [1]:
+- Remove "void" from the input of "_initialize_arc_linux_nat ()"
+
+[1] Tom's remark after the first patch
+https://sourceware.org/pipermail/gdb-patches/2020-November/173223.html
+
+gdb/ChangeLog:
+
+	* Makefile.in (ALLDEPFILES): Add arc-linux-nat.c.
+	* configure.host (host to gdb names): Add arc*-*-linux*.
+	* configure.nat (gdb_host_cpu): Add arc.
+	* arc-linux-nat.c: New.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=04c9f85efcd8df5fc482ce97c0104cc7dd5d19e6]
+
+Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gdb/Makefile.in     |   1 +
+ gdb/arc-linux-nat.c | 320 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ gdb/configure.host  |   3 +
+ gdb/configure.nat   |   4 +
+ 4 files changed, 328 insertions(+)
+ create mode 100644 gdb/arc-linux-nat.c
+
+diff --git a/gdb/Makefile.in b/gdb/Makefile.in
+index ec371fc7e52..c76136907ae 100644
+--- a/gdb/Makefile.in
++++ b/gdb/Makefile.in
+@@ -2136,6 +2136,7 @@ ALLDEPFILES = \
+ 	amd64-obsd-tdep.c \
+ 	amd64-sol2-tdep.c \
+ 	amd64-tdep.c \
++	arc-linux-nat.c \
+ 	arc-tdep.c \
+ 	arm.c \
+ 	arm-bsd-tdep.c \
+diff --git a/gdb/arc-linux-nat.c b/gdb/arc-linux-nat.c
+new file mode 100644
+index 00000000000..41301fd4fed
+--- /dev/null
++++ b/gdb/arc-linux-nat.c
+@@ -0,0 +1,320 @@
++/* Native-dependent code for GNU/Linux ARC.
++
++   Copyright 2020 Free Software Foundation, Inc.
++
++   This file is part of GDB.
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3 of the License, or
++   (at your option) any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
++
++#include "defs.h"
++#include "frame.h"
++#include "inferior.h"
++#include "gdbcore.h"
++#include "regcache.h"
++#include "gdbsupport/gdb_assert.h"
++#include "target.h"
++#include "linux-nat.h"
++#include "nat/gdb_ptrace.h"
++
++#include <stdint.h>
++#include <sys/types.h>
++#include <sys/param.h>
++#include <signal.h>
++#include <sys/user.h>
++#include <sys/ioctl.h>
++#include "gdbsupport/gdb_wait.h"
++#include <fcntl.h>
++#include <sys/procfs.h>
++#include <linux/elf.h>
++
++#include "gregset.h"
++#include "arc-tdep.h"
++#include "arc-linux-tdep.h"
++#include "arch/arc.h"
++
++/* Defines ps_err_e, struct ps_prochandle.  */
++#include "gdb_proc_service.h"
++
++/* Linux starting with 4.12 supports NT_ARC_V2 note type, which adds R30,
++   R58 and R59 registers, which are specific to ARC HS and aren't
++   available in ARC 700.  */
++#if defined (NT_ARC_V2) && defined (__ARCHS__)
++#define ARC_HAS_V2_REGSET
++#endif
++
++class arc_linux_nat_target final : public linux_nat_target
++{
++public:
++  /* Add ARC register access methods.  */
++  void fetch_registers (struct regcache *, int) override;
++  void store_registers (struct regcache *, int) override;
++
++  const struct target_desc *read_description () override;
++
++  /* Handle threads  */
++  void low_prepare_to_resume (struct lwp_info *lp) override;
++};
++
++static arc_linux_nat_target the_arc_linux_nat_target;
++
++/* Read general registers from target process/thread (via ptrace)
++   into REGCACHE.  */
++
++static void
++fetch_gregs (struct regcache *regcache, int regnum)
++{
++  const int tid = get_ptrace_pid (regcache->ptid ());
++  struct iovec iov;
++  gdb_gregset_t regs;
++
++  iov.iov_base = &regs;
++  iov.iov_len = sizeof (gdb_gregset_t);
++
++  if (ptrace (PTRACE_GETREGSET, tid, NT_PRSTATUS, (void *) &iov) < 0)
++    perror_with_name (_("Couldn't get general registers"));
++  else
++    arc_linux_supply_gregset (NULL, regcache, regnum, &regs, 0);
++}
++
++#ifdef ARC_HAS_V2_REGSET
++/* Read ARC v2 registers from target process/thread (via ptrace)
++   into REGCACHE.  */
++
++static void
++fetch_v2_regs (struct regcache *regcache, int regnum)
++{
++  const int tid = get_ptrace_pid (regcache->ptid ());
++  struct iovec iov;
++  bfd_byte v2_buffer[ARC_LINUX_SIZEOF_V2_REGSET];
++
++  iov.iov_base = &v2_buffer;
++  iov.iov_len = ARC_LINUX_SIZEOF_V2_REGSET;
++
++  if (ptrace (PTRACE_GETREGSET, tid, NT_ARC_V2, (void *) &iov) < 0)
++    perror_with_name (_("Couldn't get ARC HS registers"));
++  else
++    arc_linux_supply_v2_regset (NULL, regcache, regnum, v2_buffer, 0);
++}
++#endif
++
++/* Store general registers from REGCACHE into the target process/thread.  */
++
++static void
++store_gregs (const struct regcache *regcache, int regnum)
++{
++  const int tid = get_ptrace_pid (regcache->ptid ());
++  struct iovec iov;
++  gdb_gregset_t regs;
++
++  iov.iov_base = &regs;
++  iov.iov_len = sizeof (gdb_gregset_t);
++
++  if (ptrace (PTRACE_GETREGSET, tid, NT_PRSTATUS, (void *) &iov) < 0)
++    perror_with_name (_("Couldn't get general registers"));
++  else
++    {
++      arc_linux_collect_gregset (NULL, regcache, regnum, regs, 0);
++
++      if (ptrace (PTRACE_SETREGSET, tid, NT_PRSTATUS, (void *) &iov) < 0)
++	perror_with_name (_("Couldn't write general registers"));
++    }
++}
++
++#ifdef ARC_HAS_V2_REGSET
++/* Store ARC v2 registers from REGCACHE into the target process/thread.  */
++
++static void
++store_v2_regs (const struct regcache *regcache, int regnum)
++{
++  const int tid = get_ptrace_pid (regcache->ptid ());
++  struct iovec iov;
++  bfd_byte v2_buffer[ARC_LINUX_SIZEOF_V2_REGSET];
++
++  iov.iov_base = &v2_buffer;
++  iov.iov_len = ARC_LINUX_SIZEOF_V2_REGSET;
++
++  if (ptrace (PTRACE_GETREGSET, tid, NT_ARC_V2, (void *) &iov) < 0)
++    perror_with_name (_("Couldn't get ARC HS registers"));
++  else
++    {
++      arc_linux_collect_v2_regset (NULL, regcache, regnum, v2_buffer, 0);
++
++      if (ptrace (PTRACE_SETREGSET, tid, NT_ARC_V2, (void *) &iov) < 0)
++	perror_with_name (_("Couldn't write ARC HS registers"));
++    }
++}
++#endif
++
++/* Target operation: Read REGNUM register (all registers if REGNUM == -1)
++   from target process into REGCACHE.  */
++
++void
++arc_linux_nat_target::fetch_registers (struct regcache *regcache, int regnum)
++{
++
++  if (regnum == -1 || regnum <= ARC_LAST_REGNUM)
++    fetch_gregs (regcache, regnum);
++
++#ifdef ARC_HAS_V2_REGSET
++  if (regnum == -1
++      || regnum == ARC_R30_REGNUM
++      || regnum == ARC_R58_REGNUM
++      || regnum == ARC_R59_REGNUM)
++      fetch_v2_regs (regcache, regnum);
++#endif
++}
++
++/* Target operation: Store REGNUM register (all registers if REGNUM == -1)
++   to the target process from REGCACHE.  */
++
++void
++arc_linux_nat_target::store_registers (struct regcache *regcache, int regnum)
++{
++  if (regnum == -1 || regnum <= ARC_LAST_REGNUM)
++    store_gregs (regcache, regnum);
++
++#ifdef ARC_HAS_V2_REGSET
++  if (regnum == -1
++      || regnum == ARC_R30_REGNUM
++      || regnum == ARC_R58_REGNUM
++      || regnum == ARC_R59_REGNUM)
++    store_v2_regs (regcache, regnum);
++#endif
++}
++
++/* Copy general purpose register(s) from REGCACHE into regset GREGS.
++   This function is exported to proc-service.c  */
++
++void
++fill_gregset (const struct regcache *regcache,
++	      gdb_gregset_t *gregs, int regnum)
++{
++  arc_linux_collect_gregset (NULL, regcache, regnum, gregs, 0);
++}
++
++/* Copy all the general purpose registers from regset GREGS into REGCACHE.
++   This function is exported to proc-service.c.  */
++
++void
++supply_gregset (struct regcache *regcache, const gdb_gregset_t *gregs)
++{
++  arc_linux_supply_gregset (NULL, regcache, -1, gregs, 0);
++}
++
++/* ARC doesn't have separate FP registers.  This function is exported
++   to proc-service.c.  */
++
++void
++fill_fpregset (const struct regcache *regcache,
++	       gdb_fpregset_t *fpregsetp, int regnum)
++{
++  if (arc_debug)
++    debug_printf ("arc-linux-nat: fill_fpregset called.");
++  return;
++}
++
++/* ARC doesn't have separate FP registers.  This function is exported
++   to proc-service.c.  */
++
++void
++supply_fpregset (struct regcache *regcache, const gdb_fpregset_t *fpregsetp)
++{
++  if (arc_debug)
++    debug_printf ("arc-linux-nat: supply_fpregset called.");
++  return;
++}
++
++/* Implement the "read_description" method of linux_nat_target.  */
++
++const struct target_desc *
++arc_linux_nat_target::read_description ()
++{
++  /* This is a native target, hence description is hardcoded.  */
++#ifdef __ARCHS__
++  arc_arch_features features (4, ARC_ISA_ARCV2);
++#else
++  arc_arch_features features (4, ARC_ISA_ARCV1);
++#endif
++  return arc_lookup_target_description (features);
++}
++
++/* As described in arc_linux_collect_gregset(), we need to write resume-PC
++   to ERET.  However by default GDB for native targets doesn't write
++   registers if they haven't been changed.  This is a callback called by
++   generic GDB, and in this callback we have to rewrite PC value so it
++   would force rewrite of register on target.  It seems that the only
++   other arch that utilizes this hook is x86/x86-64 for HW breakpoint
++   support.  But then, AFAIK no other arch has this stop_pc/eret
++   complexity.
++
++   No better way was found, other than this fake write of register value,
++   to force GDB into writing register to target.  Is there any?  */
++
++void
++arc_linux_nat_target::low_prepare_to_resume (struct lwp_info *lwp)
++{
++  /* When new processes and threads are created we do not have the address
++     space for them and calling get_thread_regcache will cause an internal
++     error in GDB.  It looks like that checking for last_resume_kind is the
++     sensible way to determine processes for which we cannot get regcache.
++     Ultimately, a better way would be removing the need for
++     low_prepare_to_resume in the first place.  */
++  if (lwp->last_resume_kind == resume_stop)
++    return;
++
++  struct regcache *regcache = get_thread_regcache (this, lwp->ptid);
++  struct gdbarch *gdbarch = regcache->arch ();
++
++  /* Read current PC value, then write it back.  It is required to call
++     invalidate(), otherwise GDB will note that new value is equal to old
++     value and will skip write.  */
++  ULONGEST new_pc;
++  regcache_cooked_read_unsigned (regcache, gdbarch_pc_regnum (gdbarch),
++				 &new_pc);
++  regcache->invalidate (gdbarch_pc_regnum (gdbarch));
++  regcache_cooked_write_unsigned (regcache, gdbarch_pc_regnum (gdbarch),
++				  new_pc);
++}
++
++/* Fetch the thread-local storage pointer for libthread_db.  Note that
++   this function is not called from GDB, but is called from libthread_db.
++   This is required to debug multithreaded applications with NPTL.  */
++
++ps_err_e
++ps_get_thread_area (struct ps_prochandle *ph, lwpid_t lwpid, int idx,
++		    void **base)
++{
++  if (arc_debug >= 2)
++    debug_printf ("arc-linux-nat: ps_get_thread_area called");
++
++  if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
++    return PS_ERR;
++
++  /* IDX is the bias from the thread pointer to the beginning of the
++     thread descriptor.  It has to be subtracted due to implementation
++     quirks in libthread_db.  */
++  *base = (void *) ((char *) *base - idx);
++
++  return PS_OK;
++}
++
++/* Suppress warning from -Wmissing-prototypes.  */
++void _initialize_arc_linux_nat ();
++void
++_initialize_arc_linux_nat ()
++{
++  /* Register the target.  */
++  linux_target = &the_arc_linux_nat_target;
++  add_inf_child_target (&the_arc_linux_nat_target);
++}
+diff --git a/gdb/configure.host b/gdb/configure.host
+index ce528237291..e94a19b0332 100644
+--- a/gdb/configure.host
++++ b/gdb/configure.host
+@@ -60,6 +60,7 @@ case "${host_cpu}" in
+ 
+ aarch64*)		gdb_host_cpu=aarch64 ;;
+ alpha*)			gdb_host_cpu=alpha ;;
++arc*)			gdb_host_cpu=arc ;;
+ arm*)			gdb_host_cpu=arm ;;
+ hppa*)			gdb_host_cpu=pa ;;
+ i[34567]86*)		gdb_host_cpu=i386 ;;
+@@ -91,6 +92,8 @@ alpha*-*-netbsd* | alpha*-*-knetbsd*-gnu)
+ 			gdb_host=nbsd ;;
+ alpha*-*-openbsd*)	gdb_host=nbsd ;;
+ 
++arc*-*-linux*)		gdb_host=linux ;;
++
+ arm*-*-freebsd*)	gdb_host=fbsd ;;
+ arm*-*-linux*)		gdb_host=linux ;;
+ arm*-*-netbsdelf* | arm*-*-knetbsd*-gnu)
+diff --git a/gdb/configure.nat b/gdb/configure.nat
+index bb70e303384..cd11bc86dca 100644
+--- a/gdb/configure.nat
++++ b/gdb/configure.nat
+@@ -238,6 +238,10 @@ case ${gdb_host} in
+ 		nat/aarch64-linux.o \
+ 		nat/aarch64-sve-linux-ptrace.o"
+ 		;;
++	    arc)
++		# Host: ARC based machine running GNU/Linux
++		NATDEPFILES="${NATDEPFILES} arc-linux-nat.o"
++		;;
+ 	    arm)
+ 		# Host: ARM based machine running GNU/Linux
+ 		NATDEPFILES="${NATDEPFILES} arm-linux-nat.o \
+-- 
+2.16.2
+
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
