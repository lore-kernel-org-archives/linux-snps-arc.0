Return-Path: <SRS0=zy2i=M4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2695AC4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 19:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1EAE61078
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 19:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1EAE61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Myn12jKBkiZ/osc9yokDKv6mm28PqgOKccs/A+cK9PE=; b=TyJnvw/meunJ2E
	D9uZy/oJZFEKkCISBPkGay0RMUGYORKQfDqPbF+hbcexm9aDLvxyrjiVOEvbr2jeUgbzg071FFF5P
	BZ6U6D1lTn3a6C6eSq5UK4VRJgO8BQaWpPprT1v5eGj/Jhj/EBPno+yIrYU2tpdD3L2IKBncVEO/W
	gRBAeqQbP03lE0xdxsiG12YSZjUNl5qGJGtxt2B2tYWJqr2L9KUatuXAvkPxEficqbge4ocCA44Lg
	iDfiIMmdQdYC/cgYHELrUBTmTJbsyhtGwR6odm7YMp0gDgio+PcxU9QowSj4DMW8KVHNlhZ2Xt/yR
	Xj7piXOAmaH6KEsOJCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiov-00AduS-7H; Thu, 05 Aug 2021 19:14:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBios-00AdtZ-K3
 for linux-snps-arc@lists.infradead.org; Thu, 05 Aug 2021 19:14:20 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D1DB6463B9;
 Thu,  5 Aug 2021 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628190857; bh=FIJHlm9Oeck01oRbTOwcXlwmWsrlbmTLxX4fL7vtOCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1Yf2opcY13IMkJZskMdfodkmnSDmgbc5mnOxZlET7IJwgbCplACG8NEsL5+CXrZz
 cMzw/zLsItWOWiC7RKePUWusvGfLyCHL0HSSMElPc/EOw9jMJbq2ZFPhDLUxNF8OuY
 ASEiiJEhBvLed01eZR9RCsI0BuhPOGbFGlSJVUgBFzfpiiBVCV95qAgOKx8vcT8YYs
 j0tfPjBF3ofSw3RQbLKP6iIzQ/UY+8ISLkqk51qS2PNy0vuCg2GY4d9CNybhTOs83e
 NS8FHTudKYKB15in7atPzURYab5zhVUK7AfJ4cFDHBD9r0VG1QVxgfRdw2K+3+GYiH
 rgvvX4wHIe+XQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 9A53DA029E;
 Thu,  5 Aug 2021 19:14:14 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [RFC] bitops/non-atomic: make @nr unsigned to avoid any DIV
Date: Thu,  5 Aug 2021 12:14:08 -0700
Message-Id: <20210805191408.2003237-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
References: <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_121418_729327_6FB71ECE 
X-CRM114-Status: GOOD (  14.98  )
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

signed math causes generation of costlier instructions such as DIV when
they could be done by barrerl shifter.

Worse part is this is not caught by things like bloat-o-meter since
instruction length / symbols are typically same size.

e.g.

stock (signed math)
__________________

919b4614 <test_taint>:
919b4614:	div	r2,r0,0x20
                ^^^
919b4618:	add2	r2,0x920f6050,r2
919b4620:	ld_s	r2,[r2,0]
919b4622:	lsr	r0,r2,r0
919b4626:	j_s.d	[blink]
919b4628:	bmsk_s	r0,r0,0
919b462a:	nop_s

(patched) unsigned math
__________________

919b4614 <test_taint>:
919b4614:	lsr	r2,r0,0x5  @nr/32
                ^^^
919b4618:	add2	r2,0x920f6050,r2
919b4620:	ld_s	r2,[r2,0]
919b4622:	lsr	r0,r2,r0     #test_bit()
919b4626:	j_s.d	[blink]
919b4628:	bmsk_s	r0,r0,0
919b462a:	nop_s

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
This is an RFC for feeback, I understand this impacts every arch,
but as of now it is only buld/run tested on ARC.
---
---
 include/asm-generic/bitops/non-atomic.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/bitops/non-atomic.h b/include/asm-generic/bitops/non-atomic.h
index 7e10c4b50c5d..c5a7d8eb9c2b 100644
--- a/include/asm-generic/bitops/non-atomic.h
+++ b/include/asm-generic/bitops/non-atomic.h
@@ -13,7 +13,7 @@
  * If it's called on the same region of memory simultaneously, the effect
  * may be that only one operation succeeds.
  */
-static inline void __set_bit(int nr, volatile unsigned long *addr)
+static inline void __set_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -21,7 +21,7 @@ static inline void __set_bit(int nr, volatile unsigned long *addr)
 	*p  |= mask;
 }
 
-static inline void __clear_bit(int nr, volatile unsigned long *addr)
+static inline void __clear_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -38,7 +38,7 @@ static inline void __clear_bit(int nr, volatile unsigned long *addr)
  * If it's called on the same region of memory simultaneously, the effect
  * may be that only one operation succeeds.
  */
-static inline void __change_bit(int nr, volatile unsigned long *addr)
+static inline void __change_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -55,7 +55,7 @@ static inline void __change_bit(int nr, volatile unsigned long *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline int __test_and_set_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -74,7 +74,7 @@ static inline int __test_and_set_bit(int nr, volatile unsigned long *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_clear_bit(int nr, volatile unsigned long *addr)
+static inline int __test_and_clear_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -85,7 +85,7 @@ static inline int __test_and_clear_bit(int nr, volatile unsigned long *addr)
 }
 
 /* WARNING: non atomic and it can be reordered! */
-static inline int __test_and_change_bit(int nr,
+static inline int __test_and_change_bit(unsigned int nr,
 					    volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
@@ -101,7 +101,7 @@ static inline int __test_and_change_bit(int nr,
  * @nr: bit number to test
  * @addr: Address to start counting from
  */
-static inline int test_bit(int nr, const volatile unsigned long *addr)
+static inline int test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
 	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
 }
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
