Return-Path: <SRS0=BC9U=LF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EA3C48BE5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:53:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43841613D3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43841613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ebARdBf+jRTIDNpZ0D1Dhjood9kVoNrFub1cHhEdqI=; b=uFDVN7HVvvmsEI
	Gb2nCLKr7iFoEtFHnyLR79Pqm79X7gLJ3GQqq4CkyIigaMHMx+ctEpXZLdiu2tYANuA3FUgmtyWtI
	g0nIrWem8MMKiZoGIbk0Cf3r1bEletQyW/pNsIYwjUoq0xspGX4pSJ3t6P5aiVViWMsMYBMJDvWEw
	8JOjaybUWvs8rqMj0GT0YnY6koluL+s3odJrasko4PFAZEF45sWGqEX1A5cPRdcdQ9N7xawRoepBO
	4EImlQoQDaiscQp7NO4JZIcDrzEmAh0mskA6LzW7rpwlc95AEF3C7L2w96E3uyJ3sSd7UO/glQCJB
	r60r+P69CKnEDo1WGk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrlLs-006NLu-Oc; Fri, 11 Jun 2021 17:53:52 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrlLo-006NLN-Mq
 for linux-snps-arc@lists.infradead.org; Fri, 11 Jun 2021 17:53:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86D4840391;
 Fri, 11 Jun 2021 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623434028; bh=RQhvl5OzQwVDrrST6cBlzKnnw+WljoX7EAN9o+Zz0IE=;
 h=From:To:Cc:Subject:Date:From;
 b=MTaS3Ce547PDenZQ5HVU4C5RS2vMA6NoU9yP8YLdA2LR0Ic/xvMC8a8UdVz59QlFJ
 NcN/Jmlgs02+6wOUBZ2K3enXMW16bAQLY3n3uI6aqkz60FSWTTGO85eZFu2+e3yCkr
 gwir/yYy46zcEr7aEN7TARXUQAHdprzIawBzXKvUJmFCMaxEGZQjIV5SoWsmWNQsvb
 IPstbHtrol/g/l5mZk0qpVCnyNDjgBguo7L7/esR/h24b7FCGYZTLg2kxtn+pwDXZz
 nq9osl5yvvilUCMEa2JbMf92whsWrhvt43nhjQUn1O8Lx+P7/QZlB/aoWgK9rQGtxz
 Lae+2eZAuQEJg==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 by mailhost.synopsys.com (Postfix) with ESMTP id C9DBFA0071;
 Fri, 11 Jun 2021 17:53:46 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] gcc: Fixes for ARC
Date: Fri, 11 Jun 2021 10:53:44 -0700
Message-Id: <20210611175344.26796-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_105348_764581_02EB7F27 
X-CRM114-Status: GOOD (  20.55  )
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

A couple of fixes to be a part of 11.2 whenever it happens

1. https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=0061fabeb9393c362601486105202cfe837a5a68
   Fixes "harfbuzz" build, see https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/382
   for all the gory details.

2. https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8
   Fixes ext4 run-time issue:
   ------------------------->8---------------------------
   Path: /bin/busybox
   CPU: 0 PID: 1 Comm: init Not tainted 5.13.0-rc2-dirty #23
   Invalid Read @ 0x41c9e600 by insn @ __bio_try_merge_page+0x4e/0xfc
   ECR: 0x00050100 EFA: 0x41c9e600 ERET: 0x80159656
   STAT: 0x80080202 [IE K     ]   BTA: 0x80159648
    SP: 0x80821b88  FP: 0x00000008 BLK: bio_add_page+0x22/0x5c
   LPS: 0x801a6a94 LPE: 0x801a6a98 LPC: 0x00000000
   r00: 0x80823300 r01: 0xbfb85e38 r02: 0x00002000
   r03: 0x00000000 r04: 0x80821b9b r05: 0x80821bfc
   r06: 0x00000000 r07: 0x00000700 r08: 0x00000000
   r09: 0xffffffff r10: 0x00000000 r11: 0x00000000
   r12: 0x8080b300
   Stack Trace:
     __bio_try_merge_page+0x4e/0xfc
     bio_add_page+0x22/0x5c
     do_mpage_readpage+0x534/0x65c
     mpage_readahead+0x30/0xdc
     read_pages+0x34/0x194
     page_cache_ra_unbounded+0x56/0x154
     filemap_fault+0x25a/0x5d8
     __do_fault+0x94/0xe8
     handle_mm_fault+0x4de/0xbd4
     do_page_fault+0x108/0x21c
     ret_from_exception+0x0/0x8
   ------------------------->8---------------------------

3. https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a9b6a004f89fdd95b0470e1324dc4dee8c41d24
   Precautious fix for rare corner cases which we don't wnat to really end-up in.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-devtools/gcc/gcc-11.1.inc             |   3 +
 ...0038-arc-Update-64bit-move-split-patterns.patch | 290 +++++++++++++++++++++
 .../gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch | 127 +++++++++
 .../gcc/0040-arc-Update-doloop_end-patterns.patch  | 105 ++++++++
 4 files changed, 525 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
index bf29879ded..69e4c8bacc 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -69,6 +69,9 @@ SRC_URI = "\
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch \
+           file://0038-arc-Update-64bit-move-split-patterns.patch \
+           file://0039-arc-Fix-u-maddhisi-patterns.patch \
+           file://0040-arc-Update-doloop_end-patterns.patch \
 "
 SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
 SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
diff --git a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
new file mode 100644
index 0000000000..37fe95d711
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
@@ -0,0 +1,290 @@
+From 0061fabeb9393c362601486105202cfe837a5a68 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Wed, 9 Jun 2021 12:12:57 +0300
+Subject: [PATCH] arc: Update 64bit move split patterns.
+
+ARCv2HS can use a limited number of instructions to implement 64bit
+moves. The VADD2 is used as a 64bit move, the LDD/STD are 64 bit loads
+and stores. All those instructions are not baseline, hence we need to
+provide alternatives when they are not available or cannot be generate
+due to instruction restriction.
+
+This patch is cleaning up those move patterns, and updates splits
+instruction lengths.
+
+This is a backport from mainline gcc.
+
+gcc/
+2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc-protos.h (arc_split_move_p): New prototype.
+	* config/arc/arc.c (arc_split_move_p): New function.
+	(arc_split_move): Clean up.
+	* config/arc/arc.md (movdi_insn): Clean up, use arc_split_move_p.
+	(movdf_insn): Likewise.
+	* config/arc/simdext.md (mov<VWH>_insn): Likewise.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=0061fabeb9393c362601486105202cfe837a5a68]
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+(cherry picked from commit c0ba7a8af5366c37241f20e8be41e362f7260389)
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gcc/config/arc/arc-protos.h |  1 +
+ gcc/config/arc/arc.c        | 44 ++++++++++++----------
+ gcc/config/arc/arc.md       | 91 +++++++++------------------------------------
+ gcc/config/arc/simdext.md   | 38 ++++---------------
+ 4 files changed, 52 insertions(+), 122 deletions(-)
+
+diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
+index 1f56a0d82e4..62d7e45d29d 100644
+--- a/gcc/config/arc/arc-protos.h
++++ b/gcc/config/arc/arc-protos.h
+@@ -50,6 +50,7 @@ extern void arc_split_ior (rtx *);
+ extern bool arc_check_mov_const (HOST_WIDE_INT );
+ extern bool arc_split_mov_const (rtx *);
+ extern bool arc_can_use_return_insn (void);
++extern bool arc_split_move_p (rtx *);
+ #endif /* RTX_CODE */
+ 
+ extern bool arc_ccfsm_branch_deleted_p (void);
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index 3201c3fefd7..db541bc11f5 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -10129,6 +10129,31 @@ arc_process_double_reg_moves (rtx *operands)
+   return true;
+ }
+ 
++
++/* Check if we need to split a 64bit move.  We do not need to split it if we can
++   use vadd2 or ldd/std instructions.  */
++
++bool
++arc_split_move_p (rtx *operands)
++{
++  machine_mode mode = GET_MODE (operands[0]);
++
++  if (TARGET_LL64
++      && ((memory_operand (operands[0], mode)
++	   && (even_register_operand (operands[1], mode)
++	       || satisfies_constraint_Cm3 (operands[1])))
++	  || (memory_operand (operands[1], mode)
++	      && even_register_operand (operands[0], mode))))
++    return false;
++
++  if (TARGET_PLUS_QMACW
++      && even_register_operand (operands[0], mode)
++      && even_register_operand (operands[1], mode))
++    return false;
++
++  return true;
++}
++
+ /* operands 0..1 are the operands of a 64 bit move instruction.
+    split it into two moves with operands 2/3 and 4/5.  */
+ 
+@@ -10146,25 +10171,6 @@ arc_split_move (rtx *operands)
+       return;
+   }
+ 
+-  if (TARGET_LL64
+-      && ((memory_operand (operands[0], mode)
+-	   && (even_register_operand (operands[1], mode)
+-	       || satisfies_constraint_Cm3 (operands[1])))
+-	  || (memory_operand (operands[1], mode)
+-	      && even_register_operand (operands[0], mode))))
+-    {
+-      emit_move_insn (operands[0], operands[1]);
+-      return;
+-    }
+-
+-  if (TARGET_PLUS_QMACW
+-      && even_register_operand (operands[0], mode)
+-      && even_register_operand (operands[1], mode))
+-    {
+-      emit_move_insn (operands[0], operands[1]);
+-      return;
+-    }
+-
+   if (TARGET_PLUS_QMACW
+       && GET_CODE (operands[1]) == CONST_VECTOR)
+     {
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index 7a52551eef5..91a838a38e4 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -1329,47 +1329,20 @@ core_3, archs4x, archs4xd, archs4xd_slow"
+   "register_operand (operands[0], DImode)
+    || register_operand (operands[1], DImode)
+    || (satisfies_constraint_Cm3 (operands[1])
+-      && memory_operand (operands[0], DImode))"
+-  "*
+-{
+-  switch (which_alternative)
+-    {
+-    default:
+-      return \"#\";
+-
+-    case 0:
+-    if (TARGET_PLUS_QMACW
+-	&& even_register_operand (operands[0], DImode)
+-	&& even_register_operand (operands[1], DImode))
+-      return \"vadd2%?\\t%0,%1,0\";
+-    return \"#\";
+-
+-    case 2:
+-    if (TARGET_LL64
+-        && memory_operand (operands[1], DImode)
+-	&& even_register_operand (operands[0], DImode))
+-      return \"ldd%U1%V1 %0,%1%&\";
+-    return \"#\";
+-
+-    case 3:
+-    if (TARGET_LL64
+-	&& memory_operand (operands[0], DImode)
+-	&& (even_register_operand (operands[1], DImode)
+-	    || satisfies_constraint_Cm3 (operands[1])))
+-     return \"std%U0%V0 %1,%0\";
+-    return \"#\";
+-    }
+-}"
+-  "&& reload_completed"
++       && memory_operand (operands[0], DImode))"
++  "@
++   vadd2\\t%0,%1,0
++   #
++   ldd%U1%V1\\t%0,%1
++   std%U0%V0\\t%1,%0"
++  "&& reload_completed && arc_split_move_p (operands)"
+   [(const_int 0)]
+   {
+    arc_split_move (operands);
+    DONE;
+   }
+   [(set_attr "type" "move,move,load,store")
+-   ;; ??? The ld/st values could be 4 if it's [reg,bignum].
+-   (set_attr "length" "8,16,*,*")])
+-
++   (set_attr "length" "8,16,16,16")])
+ 
+ ;; Floating point move insns.
+ 
+@@ -1408,50 +1381,22 @@ core_3, archs4x, archs4xd, archs4xd_slow"
+ (define_insn_and_split "*movdf_insn"
+   [(set (match_operand:DF 0 "move_dest_operand"      "=D,r,r,r,r,m")
+ 	(match_operand:DF 1 "move_double_src_operand" "r,D,r,E,m,r"))]
+-  "register_operand (operands[0], DFmode)
+-   || register_operand (operands[1], DFmode)"
+-  "*
+-{
+- switch (which_alternative)
+-   {
+-    default:
+-      return \"#\";
+-
+-    case 2:
+-    if (TARGET_PLUS_QMACW
+-	&& even_register_operand (operands[0], DFmode)
+-	&& even_register_operand (operands[1], DFmode))
+-      return \"vadd2%?\\t%0,%1,0\";
+-    return \"#\";
+-
+-    case 4:
+-    if (TARGET_LL64
+-	&& ((even_register_operand (operands[0], DFmode)
+-	     && memory_operand (operands[1], DFmode))
+-	    || (memory_operand (operands[0], DFmode)
+-	        && even_register_operand (operands[1], DFmode))))
+-      return \"ldd%U1%V1 %0,%1%&\";
+-    return \"#\";
+-
+-    case 5:
+-    if (TARGET_LL64
+-	&& ((even_register_operand (operands[0], DFmode)
+-	     && memory_operand (operands[1], DFmode))
+-	    || (memory_operand (operands[0], DFmode)
+-		&& even_register_operand (operands[1], DFmode))))
+-     return \"std%U0%V0 %1,%0\";
+-    return \"#\";
+-   }
+-}"
+-  "reload_completed"
++  "(register_operand (operands[0], DFmode)
++    || register_operand (operands[1], DFmode))"
++  "@
++   #
++   #
++   vadd2\\t%0,%1,0
++   #
++   ldd%U1%V1\\t%0,%1
++   std%U0%V0\\t%1,%0"
++  "&& reload_completed && arc_split_move_p (operands)"
+   [(const_int 0)]
+   {
+    arc_split_move (operands);
+    DONE;
+   }
+   [(set_attr "type" "move,move,move,move,load,store")
+-   (set_attr "predicable" "no,no,no,yes,no,no")
+-   ;; ??? The ld/st values could be 16 if it's [reg,bignum].
+    (set_attr "length" "4,16,8,16,16,16")])
+ 
+ (define_insn_and_split "*movdf_insn_nolrsr"
+diff --git a/gcc/config/arc/simdext.md b/gcc/config/arc/simdext.md
+index f0900757452..36f41a5c3d0 100644
+--- a/gcc/config/arc/simdext.md
++++ b/gcc/config/arc/simdext.md
+@@ -1402,41 +1402,19 @@
+ 	(match_operand:VWH 1 "general_operand"    "i,r,m,r"))]
+   "(register_operand (operands[0], <MODE>mode)
+        || register_operand (operands[1], <MODE>mode))"
+-  "*
+-{
+-  switch (which_alternative)
+-    {
+-     default:
+-       return \"#\";
+-
+-     case 1:
+-       if (TARGET_PLUS_QMACW
+-           && even_register_operand (operands[0], <MODE>mode)
+-	   && even_register_operand (operands[1], <MODE>mode))
+-         return \"vadd2%?\\t%0,%1,0\";
+-       return \"#\";
+-
+-     case 2:
+-       if (TARGET_LL64)
+-         return \"ldd%U1%V1 %0,%1\";
+-       return \"#\";
+-
+-     case 3:
+-       if (TARGET_LL64)
+-	   return \"std%U0%V0 %1,%0\";
+-	 return \"#\";
+-    }
+-}"
+-  "reload_completed"
++  "@
++   #
++   vadd2\\t%0,%1,0
++   ldd%U1%V1\\t%0,%1
++   std%U0%V0\\t%1,%0"
++  "&& reload_completed && arc_split_move_p (operands)"
+   [(const_int 0)]
+   {
+    arc_split_move (operands);
+    DONE;
+   }
+-  [(set_attr "type" "move,multi,load,store")
+-   (set_attr "predicable" "no,no,no,no")
+-   (set_attr "iscompact"  "false,false,false,false")
+-   ])
++  [(set_attr "type" "move,move,load,store")
++   (set_attr "length" "16,8,16,16")])
+ 
+ (define_expand "movmisalign<mode>"
+  [(set (match_operand:VWH 0 "general_operand" "")
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
new file mode 100644
index 0000000000..9c5a2b8b33
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
@@ -0,0 +1,127 @@
+From 4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Wed, 9 Jun 2021 12:12:57 +0300
+Subject: [PATCH] arc: Fix (u)maddhisi patterns
+
+Rework the (u)maddhisi4 patterns and use VMAC2H(U) instruction instead
+of the 64bit MAC(U) instruction.
+This fixes the next execute.exp failures:
+     arith-rand-ll.c   -O2  execution test
+     arith-rand-ll.c   -O3  execution test
+     pr78726.c   -O2  execution test
+     pr78726.c   -O3  execution test
+
+gcc/
+2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.md (maddhisi4): Use VMAC2H instruction.
+	(machi): New pattern.
+	(umaddhisi4): Use VMAC2HU instruction.
+	(umachi): New pattern.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8]
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+(cherry picked from commit dd4778a59b4693777c732075021375e19eee6a76)
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gcc/config/arc/arc.md | 66 ++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 41 insertions(+), 25 deletions(-)
+
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index 91a838a38e4..2a7e087ff72 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -6053,48 +6053,64 @@ core_3, archs4x, archs4xd, archs4xd_slow"
+ 
+ ;; MAC and DMPY instructions
+ 
+-; Use MAC instruction to emulate 16bit mac.
++; Use VMAC2H(U) instruction to emulate scalar 16bit mac.
+ (define_expand "maddhisi4"
+   [(match_operand:SI 0 "register_operand" "")
+    (match_operand:HI 1 "register_operand" "")
+    (match_operand:HI 2 "extend_operand"   "")
+    (match_operand:SI 3 "register_operand" "")]
+-  "TARGET_PLUS_DMPY"
++  "TARGET_PLUS_MACD"
+   "{
+-   rtx acc_reg = gen_rtx_REG (DImode, ACC_REG_FIRST);
+-   rtx tmp1 = gen_reg_rtx (SImode);
+-   rtx tmp2 = gen_reg_rtx (SImode);
+-   rtx accl = gen_lowpart (SImode, acc_reg);
+-
+-   emit_move_insn (accl, operands[3]);
+-   emit_insn (gen_rtx_SET (tmp1, gen_rtx_SIGN_EXTEND (SImode, operands[1])));
+-   emit_insn (gen_rtx_SET (tmp2, gen_rtx_SIGN_EXTEND (SImode, operands[2])));
+-   emit_insn (gen_mac (tmp1, tmp2));
+-   emit_move_insn (operands[0], accl);
++   rtx acc_reg = gen_rtx_REG (SImode, ACC_REG_FIRST);
++
++   emit_move_insn (acc_reg, operands[3]);
++   emit_insn (gen_machi (operands[1], operands[2]));
++   emit_move_insn (operands[0], acc_reg);
+    DONE;
+   }")
+ 
+-; The same for the unsigned variant, but using MACU instruction.
++(define_insn "machi"
++  [(set (reg:SI ARCV2_ACC)
++	(plus:SI
++	 (mult:SI (sign_extend:SI (match_operand:HI 0 "register_operand" "%r"))
++		  (sign_extend:SI (match_operand:HI 1 "register_operand" "r")))
++	 (reg:SI ARCV2_ACC)))]
++  "TARGET_PLUS_MACD"
++  "vmac2h\\t0,%0,%1"
++  [(set_attr "length" "4")
++   (set_attr "type" "multi")
++   (set_attr "predicable" "no")
++   (set_attr "cond" "nocond")])
++
++; The same for the unsigned variant, but using VMAC2HU instruction.
+ (define_expand "umaddhisi4"
+   [(match_operand:SI 0 "register_operand" "")
+    (match_operand:HI 1 "register_operand" "")
+-   (match_operand:HI 2 "extend_operand"   "")
++   (match_operand:HI 2 "register_operand" "")
+    (match_operand:SI 3 "register_operand" "")]
+-  "TARGET_PLUS_DMPY"
++  "TARGET_PLUS_MACD"
+   "{
+-   rtx acc_reg = gen_rtx_REG (DImode, ACC_REG_FIRST);
+-   rtx tmp1 = gen_reg_rtx (SImode);
+-   rtx tmp2 = gen_reg_rtx (SImode);
+-   rtx accl = gen_lowpart (SImode, acc_reg);
+-
+-   emit_move_insn (accl, operands[3]);
+-   emit_insn (gen_rtx_SET (tmp1, gen_rtx_ZERO_EXTEND (SImode, operands[1])));
+-   emit_insn (gen_rtx_SET (tmp2, gen_rtx_ZERO_EXTEND (SImode, operands[2])));
+-   emit_insn (gen_macu (tmp1, tmp2));
+-   emit_move_insn (operands[0], accl);
++   rtx acc_reg = gen_rtx_REG (SImode, ACC_REG_FIRST);
++
++   emit_move_insn (acc_reg, operands[3]);
++   emit_insn (gen_umachi (operands[1], operands[2]));
++   emit_move_insn (operands[0], acc_reg);
+    DONE;
+   }")
+ 
++(define_insn "umachi"
++  [(set (reg:SI ARCV2_ACC)
++	(plus:SI
++	 (mult:SI (zero_extend:SI (match_operand:HI 0 "register_operand" "%r"))
++		  (zero_extend:SI (match_operand:HI 1 "register_operand" "r")))
++	 (reg:SI ARCV2_ACC)))]
++  "TARGET_PLUS_MACD"
++  "vmac2hu\\t0,%0,%1"
++  [(set_attr "length" "4")
++   (set_attr "type" "multi")
++   (set_attr "predicable" "no")
++   (set_attr "cond" "nocond")])
++
+ (define_expand "maddsidi4"
+   [(match_operand:DI 0 "register_operand" "")
+    (match_operand:SI 1 "register_operand" "")
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
new file mode 100644
index 0000000000..5f0bf8df8f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
@@ -0,0 +1,105 @@
+From 5a9b6a004f89fdd95b0470e1324dc4dee8c41d24 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Wed, 9 Jun 2021 12:12:57 +0300
+Subject: [PATCH] arc: Update doloop_end patterns
+
+ARC processor can use LP instruction to implement zero overlay loops.
+The current inplementation doesn't handle the unlikely situation when
+the loop iterator is located in memory.  Refurbish the loop_end insn
+pattern into a define_insn_and_split pattern.
+
+gcc/
+2021-07-09  Claudiu Zissulescu  <claziss@synopsys.com>
+
+	* config/arc/arc.md (loop_end): Change it to
+	define_insn_and_split.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a9b6a004f89fdd95b0470e1324dc4dee8c41d24]
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+(cherry picked from commit 174e75a210753b68de0f2c398a13ace0f512e35b)
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gcc/config/arc/arc.md | 46 ++++++++++++++++++++--------------------------
+ 1 file changed, 20 insertions(+), 26 deletions(-)
+
+diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
+index 2a7e087ff72..d704044c13f 100644
+--- a/gcc/config/arc/arc.md
++++ b/gcc/config/arc/arc.md
+@@ -4986,7 +4986,7 @@ core_3, archs4x, archs4xd, archs4xd_slow"
+ (define_expand "doloop_end"
+   [(parallel [(set (pc)
+ 		   (if_then_else
+-		    (ne (match_operand 0 "" "")
++		    (ne (match_operand 0 "nonimmediate_operand")
+ 			(const_int 1))
+ 		    (label_ref (match_operand 1 "" ""))
+ 		    (pc)))
+@@ -5012,44 +5012,38 @@ core_3, archs4x, archs4xd, archs4xd_slow"
+ 
+ ;; if by any chance the lp_count is not used, then use an 'r'
+ ;; register, instead of going to memory.
+-(define_insn "loop_end"
+-  [(set (pc)
+-	(if_then_else (ne (match_operand:SI 2 "nonimmediate_operand" "0,m")
+-			  (const_int 1))
+-		      (label_ref (match_operand 1 "" ""))
+-		      (pc)))
+-   (set (match_operand:SI 0 "nonimmediate_operand" "=r,m")
+-	(plus (match_dup 2) (const_int -1)))
+-   (unspec [(const_int 0)] UNSPEC_ARC_LP)
+-   (clobber (match_scratch:SI 3 "=X,&r"))]
+-  ""
+-  "; ZOL_END, begins @%l1"
+-  [(set_attr "length" "0")
+-   (set_attr "predicable" "no")
+-   (set_attr "type" "loop_end")])
+-
+ ;; split pattern for the very slim chance when the loop register is
+ ;; memory.
+-(define_split
++(define_insn_and_split "loop_end"
+   [(set (pc)
+-	(if_then_else (ne (match_operand:SI 0 "memory_operand")
++	(if_then_else (ne (match_operand:SI 0 "nonimmediate_operand" "+r,!m")
+ 			  (const_int 1))
+-		      (label_ref (match_operand 1 ""))
++		      (label_ref (match_operand 1 "" ""))
+ 		      (pc)))
+    (set (match_dup 0) (plus (match_dup 0) (const_int -1)))
+    (unspec [(const_int 0)] UNSPEC_ARC_LP)
+-   (clobber (match_scratch:SI 2))]
+-  "memory_operand (operands[0], SImode)"
++   (clobber (match_scratch:SI 2 "=X,&r"))]
++  ""
++  "@
++   ; ZOL_END, begins @%l1
++   #"
++  "reload_completed && memory_operand (operands[0], Pmode)"
+   [(set (match_dup 2) (match_dup 0))
+-   (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))
++   (parallel
++    [(set (reg:CC_ZN CC_REG)
++	  (compare:CC_ZN (plus:SI (match_dup 2) (const_int -1))
++			 (const_int 0)))
++     (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))])
+    (set (match_dup 0) (match_dup 2))
+-   (set (reg:CC CC_REG) (compare:CC (match_dup 2) (const_int 0)))
+    (set (pc)
+-	(if_then_else (ne (reg:CC CC_REG)
++	(if_then_else (ne (reg:CC_ZN CC_REG)
+ 			  (const_int 0))
+ 		      (label_ref (match_dup 1))
+ 		      (pc)))]
+-  "")
++  ""
++  [(set_attr "length" "0,24")
++   (set_attr "predicable" "no")
++   (set_attr "type" "loop_end")])
+ 
+ (define_insn "loop_fail"
+   [(set (reg:SI LP_COUNT)
+-- 
+2.16.2
+
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
