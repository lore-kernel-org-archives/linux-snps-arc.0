Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A0BC4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Dec 2022 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=efzG2XSDkxlniAqLjuNqhte353MQkBIDgIg2j/iiy6c=; b=sOuft4zZd0D/YG
	oSvDG9r0PUtHonRv0agU9Yai9QA/xv6KeRBOWl0xpIXQ8Mx5xYKN3CVd2w13WFUjQu70AFwiXEF/5
	kn+cN1OzBI0enDb/5Hz6LXmd55GJlX224CPdvNCqfw876EvDn7Etdl61XU6r9880YlmYn59YfnS5n
	ayH6fQW7KJZS7/8igNtx9seE9bcO6o9ofnIg5kkXpM/qbt/K2qPHLuJ2hBoeMtY11wDcldF38t8+H
	4TJzBTiNWL3w8aNQ47eTiABY0kMVTIRPMspjufUHQGxiikFUt8Zg0DD5CXfO3+tbW8QHqpjxL1WUa
	WrXH0FTQRQyqJEpBMyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4qEU-005hbW-Jd; Mon, 12 Dec 2022 21:21:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4qEQ-005haq-63
	for linux-snps-arc@lists.infradead.org; Mon, 12 Dec 2022 21:21:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4qEK-0006Ab-3e; Mon, 12 Dec 2022 22:20:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4qEH-0046Xn-Nu; Mon, 12 Dec 2022 22:20:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4qEH-004bDz-Lh; Mon, 12 Dec 2022 22:20:53 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-serial@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] serial: arc_uart: Drop empty platform remove function
Date: Mon, 12 Dec 2022 22:20:37 +0100
Message-Id: <20221212212037.3773636-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1ZFqVjickndN0gqkcb1KHAfmGOf0XDUNbl2udK5Prrg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5siEDIfLwerQaKD6mTdBeccjjnlYBgq8kNA2nmO +iufywSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5ebIgAKCRDB/BR4rcrsCemXB/ 0Sm0090b+aitBLel1JUaVMR8XyTYJa+igBBPJQI/gNOfpFwHjP9Mrv3bT4jLYqPxqVGgvYYzcWFNUP E95ci8fy8jYEZalzn15/eBxzubYvJ9RqCRfKdHPaqAHEkLBsLXArlTsYoNLNmOhi9kr6/h2vLwTwPy VdAwIL4sVZjhupbRWZwzo5N0RS78OJBELeANvHI2eZUyXIrHFb1ejBNuFjPk0MgydjYP3H1CPaT7qQ eHr5/sL4SckeIvK2Y6BhQmQUaAm+B0itAzp1nlGWix8ptAH3VmWaLQw+/z07UljD3ju8HyiXaDkluR Qa5VTKFCYk9VjT2LdDeilrNZWnHYh+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_132102_628712_DE92E6C3 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

QSByZW1vdmUgY2FsbGJhY2sganVzdCByZXR1cm5pbmcgMCBpcyBlcXVpdmFsZW50IHRvIG5vIHJl
bW92ZSBjYWxsYmFjawphdCBhbGwuIFNvIGRyb3AgdGhlIHVzZWxlc3MgZnVuY3Rpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9hcmNfdWFydC5jIHwgNyAtLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJp
YWwvYXJjX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9hcmNfdWFydC5jCmluZGV4IDJhNjVl
YTI2NjBlMS4uZjFiNjAzNGFkZGRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvYXJj
X3VhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYwpAQCAtNjMyLDEyICs2
MzIsNiBAQCBzdGF0aWMgaW50IGFyY19zZXJpYWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAlyZXR1cm4gdWFydF9hZGRfb25lX3BvcnQoJmFyY191YXJ0X2RyaXZlciwgJmFy
Y191YXJ0X3BvcnRzW2Rldl9pZF0ucG9ydCk7CiB9CiAKLXN0YXRpYyBpbnQgYXJjX3NlcmlhbF9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKLXsKLQkvKiBUaGlzIHdpbGwgbmV2
ZXIgYmUgY2FsbGVkICovCi0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGFyY191YXJ0X2R0X2lkc1tdID0gewogCXsgLmNvbXBhdGlibGUgPSAic25wcyxh
cmMtdWFydCIgfSwKIAl7IC8qIFNlbnRpbmVsICovIH0KQEAgLTY0Niw3ICs2NDAsNiBAQCBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBhcmNfdWFydF9kdF9pZHMpOwogCiBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBhcmNfcGxhdGZvcm1fZHJpdmVyID0gewogCS5wcm9iZSA9IGFyY19zZXJp
YWxfcHJvYmUsCi0JLnJlbW92ZSA9IGFyY19zZXJpYWxfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJ
CS5uYW1lID0gRFJJVkVSX05BTUUsCiAJCS5vZl9tYXRjaF90YWJsZSAgPSBhcmNfdWFydF9kdF9p
ZHMsCi0tIAoyLjM4LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
