Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59546C79F89
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2026 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LykEshoU8it0r4fYnNvkPwgP1VsKTuvjMSJIsvU9ecw=; b=aVDMCm9qfvw2jT
	Q1xOl0unmiDfZGm5ik/qXzSVvixZUDnT0ZOz7ZTlnsWAuV//GojY82+2syj2cdzXaotKNSo9Exz8y
	dc9efhtV7xzLww3MfipaboTzVpyeMNSkONTSJOynq23KShoBtVg8TlSqChrbSSwL7PW2CjASPmu7B
	hPTElCZDIgUb2MZDlxeEkpBlUAQymyM/BzBIKImtkcYfkMaJz/Smmdd5mwVu/nfN9mPSZUY6oNw9O
	+Wul+0cSiDjWnH4+pzZNezdWamc/PYuXXY8kzhkFh+iYaSHk2j1xuVBaB5L5zqwOPSK/jHtGCe3Yl
	r4HN8eh2x5qgcAnsm/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SqW-000000061Aw-0DKy;
	Mon, 07 Sep 2026 06:28:48 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SqU-0000000619t-0rN0
	for linux-snps-arc@lists.infradead.org;
	Mon, 07 Sep 2026 06:28:47 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc439aa0078so2575228a12.0
        for <linux-snps-arc@lists.infradead.org>; Sun, 06 Sep 2026 23:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762525; x=1789367325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FLAE2XmmuZSgKOvA0qkWrT7oMG5vU8MEAkdw+Fem9Fc=;
        b=WW4Ik+QhLOrMvsvtr9cNnIuXuDS3hYC6W4a89zTeRHNNzb2xIbU4n0h4mTqE9H64Qg
         B94uoNaK/4q3QpcWK5YibCM9aB74TxUjYvaYZOe5L95ZDTgAxJ+xrDOFp0D6bcjWBiCA
         SPEmC4XrMWcxJYuWI8fko0i00KjsXc1iCQAFt2EgXtl4SuISft6FAMRI4qfXgba8mH8T
         08SZFz3pSn7iJSU5aFmmw+8soh26UIqOCYnl4ZEs0ITLVuaz7CYAViOQf8K+PpLfi/JW
         owIPCh4drJkcmzF5gfWosBTRApNFDMZBOJv1fuTSGF2hrrCVZ//TrqxbUyegMrAwwa5q
         stIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762525; x=1789367325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLAE2XmmuZSgKOvA0qkWrT7oMG5vU8MEAkdw+Fem9Fc=;
        b=JKcxW7KyF4s3dAUyd8zdC/IMKf9ckhm7bMa+pMaO//iF1/Thjan1lkWNqCU1lUTmuc
         IckbsiCYMQwAiqyxuthP8u9pE+BaY/PsSlyknAsKeARBIhu4WwvGZWP4QjURxcWTTCui
         m/L2l1K6kSGftgeDlWDjLOQVM3cBGNf/VxDF/5D6+p/th9DZE3k3KLzLfGI4xL3Tqld/
         hStI1hW4Ox5koekFFgRlsdeJg4qFPA2ogmLpotJy/QXnif1bSHHee6vzyvuS+2uPJFqU
         WPh1eItBNvu/kSBZykg5npJli2zgWu/amv+VlQh+f0YyhkdVUbXxi34l6XjhFLTj2cFC
         gXEg==
X-Gm-Message-State: AFuF++ll2yIkQa7CCb7SELUNF+0UDq99geGMyUKOQ+WzkPqjkWMB0wju
	11jSWDyYsb/SDwcbeklXEznxEOTQlso01XSQe+3+pLoVqQFitO0/yubY
X-Gm-Gg: AYBFou3bqKkhR7jBB3RPrbGsSsIp7HzzJ3BH1nlXxzlo86Gk+etNbt+4OfgAXw+5O/2
	I5GKm6VwGQmfKoX0DGi53DH8qmojAvK2LK3WMXqPHfJD+ASs94McGDyg5ftJ4KU8EV5yErkkHVS
	/2YhyyD8BDAyBnLx3FqOV0FumScszUHkCzyvUkRSOZgFGg/OAP7z6dYiB0djCWV6/opYqZL1yQw
	UUO/he6QvNpwF0yXhLkr7Fao/j+xHJ6CbLMuzAFhZ4+MXum5b/ekz7M/zGQ/VpbQ/mC4yWdABK0
	fVZ15SzZWx6bo3Wchxke6V8EMlGRXKdl9Fpwx3C5yz7mEcbAd+l902CYpLS/pX6CVqtLq2lccMi
	W2iDbwJj9c9evV3lXxZsWjErNAVnb0EF1mX1GmBuqhDPTLq05NVDmfTlJbVPXApsrhl37UbyM5P
	9YigSZujD/28BYS4RldqB4qS4BP1hlPiA6a7KR7lX63Unt2qPzb8BRa5PaJPrn1zQfL/Ph5i+b1
	vDXGuyngAX67Q==
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr30248151a91.5.1788762525152;
        Sun, 06 Sep 2026 23:28:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm36612713c88.4.2026.09.06.23.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:28:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: fix typo "satify" in comment
Date: Mon,  7 Sep 2026 11:58:40 +0530
Message-ID: <20260907062840.17276-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_232846_288433_90F60119 
X-CRM114-Status: GOOD (  10.04  )
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

Correct "satify" to "satisfy", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/tty/serial/arc_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 5c4895d154c0..3988e5958896 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -304,7 +304,7 @@ static unsigned int arc_serial_get_mctrl(struct uart_port *port)
 {
 	/*
 	 * Pretend we have a Modem status reg and following bits are
-	 *  always set, to satify the serial core state machine
+	 *  always set, to satisfy the serial core state machine
 	 *  (DSR) Data Set Ready
 	 *  (CTS) Clear To Send
 	 *  (CAR) Carrier Detect
-- 
2.48.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
