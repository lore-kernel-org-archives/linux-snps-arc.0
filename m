Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3783C33CB6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC7E24658
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S7QsO0Bv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DpI5XmdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC7E24658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ojm72E3Y3G7gOCxo8h5GJ/36fJkxnjNdne0AbRX9fE=; b=S7QsO0Bv13WCxc
	S8idEp5AtuEw/c8X26I7bRuAQV5EEqDhQkrlIbK540cOX+bRWShg3v5jdwfWJ7g85kPz5eCDWbF4i
	B/pecMb5vIHzQXL0dUGpqmx7mpqNnM0jMKWloEleF3E3mJJ3fcQQY1e+lvoo/seSGUFbz7vTEtFa6
	vlMswYDINrFdPgfhv81vxjbT6RVE+eOfQLfNIHHK9iwDNjU/fdwv8zCUmN2ZwJotO/itxnCPtLIXl
	LYsmL9JpV4TVk7cZ2XhMCEXrpcxifyPIT5RJYJGQja8Ex6Ci+pCmiLwzIcbnimNpaq8l8ulYw45GX
	M64Onnwk8rbbHjl9kN+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irSUp-0003Xv-Pl; Tue, 14 Jan 2020 20:09:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irSUj-0003Ub-7Q
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 20:09:00 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CB322406F1;
 Tue, 14 Jan 2020 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579032536; bh=KAlf2p4wGz+94y3EQ9KwXhmJn1lHpeOnvb6o+KcrGBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DpI5XmdXeJkr91JuxRySFxxmKXApulm2WYX9JWR9+OCQPtQWErGMGaVN6WiOt76AG
 XZ00QkKk42oXLoMmeJ1DZUbz82tvlve7E1H0k3RDaLpA6NWvJopjStxXRUgNrvEgcl
 hSwhuBcsmna5s0GC7Vl221yPHmO7cVX23P0fip83vYlkEjRqRbHsCp8JIZjHNesaFv
 Rl57rinxodXZmq499z23UVCsOxNXRgVvkYGXdoglNYzD+mao6ArwEneVc0wbS2DZRe
 Ioc/2tiv0XL+ZHlWB4mHeZ6DOcYnqS5dfDmCKtUluM7Vz+J98ACKS+24/jwieZAIHD
 KQvNiMm8vqiqA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.25])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5A9E2A00A0;
 Tue, 14 Jan 2020 20:08:55 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>,
 Aleksa Sarai <cyphar@cyphar.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space pointer
 range check
Date: Tue, 14 Jan 2020 12:08:44 -0800
Message-Id: <20200114200846.29434-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114200846.29434-1-vgupta@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_120857_302537_4D4C11D9 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: linux-arch@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This came up when switching ARC to word-at-a-time interface and using
generic/optimized strncpy_from_user

It seems the existing code checks for user buffer/string range multiple
times and one of tem cn be avoided.

There's an open-coded range check which computes @max off of user_addr_max()
and thus typically way larger than the kernel buffer @count and subsequently
discarded in do_strncpy_from_user()

	if (max > count)
		max = count;

The canonical user_access_begin() => access_ok() follow anyways and even
with @count it should suffice for an intial range check as is true for
any copy_{to,from}_user()

And in case actual user space buffer is smaller than kernel dest pointer
(i.e. @max < @count) the usual string copy, null byte detection would
abort the process early anyways

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 lib/strncpy_from_user.c | 36 +++++++++++-------------------------
 lib/strnlen_user.c      | 28 +++++++---------------------
 2 files changed, 18 insertions(+), 46 deletions(-)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index dccb95af6003..a1622d71f037 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -21,22 +21,15 @@
 /*
  * Do a strncpy, return length of string without final '\0'.
  * 'count' is the user-supplied count (return 'count' if we
- * hit it), 'max' is the address space maximum (and we return
- * -EFAULT if we hit it).
+ * hit it). If access fails, return -EFAULT.
  */
 static inline long do_strncpy_from_user(char *dst, const char __user *src,
-					unsigned long count, unsigned long max)
+					unsigned long count)
 {
 	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
+	unsigned long max = count;
 	unsigned long res = 0;
 
-	/*
-	 * Truncate 'max' to the user-specified limit, so that
-	 * we only have one limit we need to check in the loop
-	 */
-	if (max > count)
-		max = count;
-
 	if (IS_UNALIGNED(src, dst))
 		goto byte_at_a_time;
 
@@ -72,7 +65,7 @@ static inline long do_strncpy_from_user(char *dst, const char __user *src,
 	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
 	 * too? If so, that's ok - we got as much as the user asked for.
 	 */
-	if (res >= count)
+	if (res == count)
 		return res;
 
 	/*
@@ -103,25 +96,18 @@ static inline long do_strncpy_from_user(char *dst, const char __user *src,
  */
 long strncpy_from_user(char *dst, const char __user *src, long count)
 {
-	unsigned long max_addr, src_addr;
-
 	if (unlikely(count <= 0))
 		return 0;
 
-	max_addr = user_addr_max();
-	src_addr = (unsigned long)untagged_addr(src);
-	if (likely(src_addr < max_addr)) {
-		unsigned long max = max_addr - src_addr;
+	kasan_check_write(dst, count);
+	check_object_size(dst, count, false);
+	if (user_access_begin(src, count)) {
 		long retval;
-
-		kasan_check_write(dst, count);
-		check_object_size(dst, count, false);
-		if (user_access_begin(src, max)) {
-			retval = do_strncpy_from_user(dst, src, count, max);
-			user_access_end();
-			return retval;
-		}
+		retval = do_strncpy_from_user(dst, src, count);
+		user_access_end();
+		return retval;
 	}
+
 	return -EFAULT;
 }
 EXPORT_SYMBOL(strncpy_from_user);
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 6c0005d5dd5c..5ce61f303d6e 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -20,19 +20,13 @@
  * if it fits in a aligned 'long'. The caller needs to check
  * the return value against "> max".
  */
-static inline long do_strnlen_user(const char __user *src, unsigned long count, unsigned long max)
+static inline long do_strnlen_user(const char __user *src, unsigned long count)
 {
 	const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
 	unsigned long align, res = 0;
+	unsigned long max = count;
 	unsigned long c;
 
-	/*
-	 * Truncate 'max' to the user-specified limit, so that
-	 * we only have one limit we need to check in the loop
-	 */
-	if (max > count)
-		max = count;
-
 	/*
 	 * Do everything aligned. But that means that we
 	 * need to also expand the maximum..
@@ -64,7 +58,7 @@ static inline long do_strnlen_user(const char __user *src, unsigned long count,
 	 * Uhhuh. We hit 'max'. But was that the user-specified maximum
 	 * too? If so, return the marker for "too long".
 	 */
-	if (res >= count)
+	if (res == count)
 		return count+1;
 
 	/*
@@ -98,22 +92,14 @@ static inline long do_strnlen_user(const char __user *src, unsigned long count,
  */
 long strnlen_user(const char __user *str, long count)
 {
-	unsigned long max_addr, src_addr;
-
 	if (unlikely(count <= 0))
 		return 0;
 
-	max_addr = user_addr_max();
-	src_addr = (unsigned long)untagged_addr(str);
-	if (likely(src_addr < max_addr)) {
-		unsigned long max = max_addr - src_addr;
+	if (user_access_begin(str, count)) {
 		long retval;
-
-		if (user_access_begin(str, max)) {
-			retval = do_strnlen_user(str, count, max);
-			user_access_end();
-			return retval;
-		}
+		retval = do_strnlen_user(str, count);
+		user_access_end();
+		return retval;
 	}
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
