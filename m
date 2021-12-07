Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64329C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Dec 2021 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZaaQ4J02Aj96FJsCBAfRRc1f5uNsOMk2iAVGZzfhZjI=; b=t7Pc4eXm3+NBQH
	Fsu6YhCdh7QVKDCvFF30ZnezmVblbHiTw7qlZYUvhVu1Ahu7/clATxbxg3duYPKwgtO2e6gwMsWDA
	81V/R6RVcSJBA6D+2TELkdCCA6eSsaOOUq3iHSZDX8nWmg+rc9+kCzUS5AV9PFtprxpTVJr9YC/xf
	XWeSC3Wgew3c5Hy6Sh8qiS1BGTRHe0iVqlSBYsGA+6Wh+b8s6LDLMUPf+7yO/K1eUNa3eLhuOtv+f
	VyhXwk/YbTzLXwoZsFmU6tcHufdyniLzcDkXhBnXTf9UdTftGuHbvdWNVz7tDbXwyosV5T03wOk8X
	7SvxWbSYzvxe/pSy4eCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucvd-009NeN-OD; Tue, 07 Dec 2021 16:02:53 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucvb-009Ndg-EY
 for linux-snps-arc@lists.infradead.org; Tue, 07 Dec 2021 16:02:52 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15711C15C9;
 Tue,  7 Dec 2021 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1638892971; bh=P62qdX/l7dChA+9BP9l5YcQucCvyVPRPBnhMjKuW1pE=;
 h=From:To:Cc:Subject:Date:From;
 b=H9F1KTKiiiLyMxx98FBZCFFHLTml0Qz+xsgpM3rY+1h8GthjInZm8hsL3P5y7UZ/+
 EYjbts2H8n2CJfF2dzJaH1sKQakHlY0TfZrRzy7qKc6LOSreMT0+q9//WCokcAX2PW
 9AjqQ5wPmYsY4mxEInCbhf1mCajC6kJ3GyracNiNRSx/0XClI0p1H4S8SoTizuqTLi
 miNyV+9AKajYNU4L5KoUfHekODZD/aZz+Vjblqrcu3T29ZYNdOJ4dhy3MpPKvZr1I3
 BrzEycKVazaSNoh10wEKWwq+c75xI+bHc2U08xYAVjNnIBG4a/ttM/R6ynNHvrgn7H
 aA6a2GMbOiRjQ==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id ED80CA005C;
 Tue,  7 Dec 2021 16:02:49 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] openssl: Use linux-latomic target for ARC
Date: Tue,  7 Dec 2021 08:02:41 -0800
Message-Id: <20211207160241.16841-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_080251_537128_1047CFA6 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Some atomic ops for 32-bit ARC processors are implemented in GCC's libatomic.
For example those dealing with 64-bit data (e.g. __atomic_load_8()) as well as
some others. That said it's required to add "-latomic" for successful linkage.

Otherwise error messages like this happen on OpenSSL building for ARC:
------------------------------->8------------------------------
| ...ld: libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
| .../openssl-3.0.0/crypto/threads_pthread.c:219: undefined reference to `__atomic_is_lock_free'
| ...ld: .../openssl-3.0.0/crypto/threads_pthread.c:219: undefined reference to `__atomic_is_lock_free'
| ...ld: .../openssl-3.0.0/crypto/threads_pthread.c:220: undefined reference to `__atomic_fetch_or_8'
------------------------------->8------------------------------

Fix that by using a special target, which does exactly what's needed.
See [1] and [2] for more details on the matter.

[1] https://github.com/openssl/openssl/commit/cdf2986a70d92668d882eb29737225f1aaafd0f1
[2] https://github.com/openssl/openssl/pull/15640

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

Please pardon that re-send as initially I erroneously
sent it to OE-devel. Sending it to the right one now!

---
 meta/recipes-connectivity/openssl/openssl_3.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
index 4b1ae71a85..da73ed6bc3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -70,6 +70,9 @@ do_configure () {
 	esac
 	target="$os-${HOST_ARCH}"
 	case $target in
+	linux-arc)
+		target=linux-latomic
+		;;
 	linux-arm*)
 		target=linux-armv4
 		;;
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
