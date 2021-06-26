Return-Path: <SRS0=GyMv=LU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D9C49EA5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 26 Jun 2021 05:59:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6ECC6162C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 26 Jun 2021 05:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6ECC6162C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cdjrlc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8GL4JK3bho1jWLuaNykdubY9EBmXbPwo68+00SMMn9c=; b=3hrIg6qeQO1mf/
	jHkfZADp3/C3kcoJQ4byqXO5PJhYZOfKSTvLTE+TtUt3oWl+S2NTHWSSQu5cAj4n38xbz4zgoa4is
	4v/Lwchn1pmSw4PfWfF5omtffHPYM4AfiWjTcWRuhzTNZeW5vqafItwcFLGJS/IljMlxkQF+5eaZs
	XXsMUeSfHeSp4BvTHnAI55HVYPkgDeEZkdJIRJPYFy6oW1jA2hoN8Bsz5wVcavF8p3u5noJ1wzQ+f
	77obuVsAKkTRE3L2XNHG2X880xTZ6wR4+9wjSNYvMHb6kVkUTxQvDwrnQDZ0VM0taY+r0U7it2o30
	JSWtoNcF4/iawhJidqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx1Lw-003XXZ-QL; Sat, 26 Jun 2021 05:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx1Lv-003XWq-AM
 for linux-snps-arc@bombadil.infradead.org; Sat, 26 Jun 2021 05:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=lxpSAaboUiPCSVkE7AtrR/6+po7H5HbYoTgGH30u7uw=; b=hhuLVqF5psbAyn/8MgZvp+gnkb
 dvCL3Kr0QMwrOm4nJTAbfbvc4lqV78VtQ3Pg5FzwTAH7TZ5nYtrv2DLrugufoNrB29e/r6nN6LJ88
 8CfHtJxPxKNhfGWmEugIGKvtbaXBK7gcYHjUn0E/idZhE2g8Q7XTBg8qCDX9PVIYdeFoUC3lyS7Uu
 AZBnFr8oTSUk0dnSBonM0XWJl+/QW1TzDWw/xHWYsrgJTqYH9zw2qikOdr7eZ8K4rC/YAOhA7qgDN
 2C1ztUF/yAzwZQU+pi9GNLAbeDsju11aiKs0d2oo+jbZ2NA5BRDNQIal/k+oZll9vXpcM9yq53I4s
 uTiQw3mw==;
Received: from smtpbg501.qq.com ([203.205.250.101])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx1Lc-00Bpjh-CZ
 for linux-snps-arc@lists.infradead.org; Sat, 26 Jun 2021 05:59:34 +0000
X-QQ-mid: bizesmtp47t1624687125tbk99k7p
Received: from localhost.localdomain (unknown [182.148.13.245])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 26 Jun 2021 13:58:37 +0800 (CST)
X-QQ-SSF: 0100000000200060B000B00A0000000
X-QQ-FEAT: TaaFKY1SPpXtlusc4/oYzImKccHA1vsYnLQncRnrBWp24sC1esDZXxYFT0Xfc
 4mS8vS0InU1+juMAcUmprR5jFDUU2oLvxx2+lEFAO9lugSUpyCGPQEn9fKFhCvOSGBrjiy5
 K7O9zyClqdT8OfmpfhavQulltnz7nYoWCsO9U3fWS7RUkSHz70EVxD+Z7XnYoN9UJ+ou2qb
 dmRTUFJRNlnBu/XxknwrifBDDVTlzU8GFU6gF/7wVW2z7P6mibHGQa6q6mgKzr/uRkT4xex
 dscfLdTZ9u+pE2+3bhj5ykH+NUY04aazEaFo7TYxjyDWUpB3Eg33hTqZc=
X-QQ-GoodBg: 0
From: Jinchao Wang <wjc@cdjrlc.com>
To: vgupta@synopsys.com, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org
Cc: mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Jinchao Wang <wjc@cdjrlc.com>
Subject: [PATCH] arc: Prefer unsigned int to bare use of unsigned
Date: Sat, 26 Jun 2021 13:58:28 +0800
Message-Id: <20210626055828.29207-1-wjc@cdjrlc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_065927_731018_BBF31AD3 
X-CRM114-Status: GOOD (  11.18  )
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

Fix checkpatch warnings:
    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>
---
 arch/arc/include/asm/checksum.h   |  2 +-
 arch/arc/include/asm/perf_event.h |  2 +-
 arch/arc/kernel/unwind.c          | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/checksum.h b/arch/arc/include/asm/checksum.h
index 69debd77cd04..0b485800a392 100644
--- a/arch/arc/include/asm/checksum.h
+++ b/arch/arc/include/asm/checksum.h
@@ -24,7 +24,7 @@
  */
 static inline __sum16 csum_fold(__wsum s)
 {
-	unsigned r = s << 16 | s >> 16;	/* ror */
+	unsigned int r = s << 16 | s >> 16;	/* ror */
 	s = ~s;
 	s -= r;
 	return s >> 16;
diff --git a/arch/arc/include/asm/perf_event.h b/arch/arc/include/asm/perf_event.h
index 30b9ae511ea9..e1971d34ef30 100644
--- a/arch/arc/include/asm/perf_event.h
+++ b/arch/arc/include/asm/perf_event.h
@@ -123,7 +123,7 @@ static const char * const arc_pmu_ev_hw_map[] = {
 #define C(_x)			PERF_COUNT_HW_CACHE_##_x
 #define CACHE_OP_UNSUPPORTED	0xffff
 
-static const unsigned arc_pmu_cache_map[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
+static const unsigned int arc_pmu_cache_map[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {
 		[C(OP_READ)] = {
 			[C(RESULT_ACCESS)]	= PERF_COUNT_ARC_LDC,
diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 47bab67f8649..9e28058cdba8 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -260,7 +260,7 @@ static void init_unwind_hdr(struct unwind_table *table,
 {
 	const u8 *ptr;
 	unsigned long tableSize = table->size, hdrSize;
-	unsigned n;
+	unsigned int n;
 	const u32 *fde;
 	struct {
 		u8 version;
@@ -462,7 +462,7 @@ static uleb128_t get_uleb128(const u8 **pcur, const u8 *end)
 {
 	const u8 *cur = *pcur;
 	uleb128_t value;
-	unsigned shift;
+	unsigned int shift;
 
 	for (shift = 0, value = 0; cur < end; shift += 7) {
 		if (shift + 7 > 8 * sizeof(value)
@@ -483,7 +483,7 @@ static sleb128_t get_sleb128(const u8 **pcur, const u8 *end)
 {
 	const u8 *cur = *pcur;
 	sleb128_t value;
-	unsigned shift;
+	unsigned int shift;
 
 	for (shift = 0, value = 0; cur < end; shift += 7) {
 		if (shift + 7 > 8 * sizeof(value)
@@ -609,7 +609,7 @@ static unsigned long read_pointer(const u8 **pLoc, const void *end,
 static signed fde_pointer_type(const u32 *cie)
 {
 	const u8 *ptr = (const u8 *)(cie + 2);
-	unsigned version = *ptr;
+	unsigned int version = *ptr;
 
 	if (*++ptr) {
 		const char *aug;
@@ -904,7 +904,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 	const u8 *ptr = NULL, *end = NULL;
 	unsigned long pc = UNW_PC(frame) - frame->call_frame;
 	unsigned long startLoc = 0, endLoc = 0, cfa;
-	unsigned i;
+	unsigned int i;
 	signed ptrType = -1;
 	uleb128_t retAddrReg = 0;
 	const struct unwind_table *table;
-- 
2.31.1




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
