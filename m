Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442F2E94120
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAzNVboCOrwKzA0PEdKFRp45qvqLLCi1/E5xGxTci+8=; b=lbJfrdnPSXhO2E
	TKe4gJRL8ozkw03UnY1sEdspdD2gKbzTgkhcLCx9sGc+4zCR79WfWVO8fvoFVx/JSz4pmuX9jh+H8
	aUGyXeJsWxROz/JACCBbxlYOHSpatXcyOgAKd8noAC6IQrHOlADkxb5XVsxwuPZPITuBEbKug6laY
	3606AlQh94/kNYY3p8bzHimcScr44kKYvUpk6yGO0+HeLdzYoIGiySD6UMjlsEy7a2cr6SN6of8ay
	5yWFjrV7kkVBZNr4Wuz/tPSua+VI5mPOIHTeBAT3D1D7gIfVpdtnDeyA9pQntW6fFLRdnTm3+stQ+
	3LopyaZtB4yWYlGzklrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsu-00000004Uor-011W;
	Tue, 30 Dec 2025 07:11:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujn-3GFB;
	Tue, 30 Dec 2025 07:11:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8y8y0Vihpsa7kuidmjsGKlmg3PpJ4ZCRAtbsIsvEA4=;
	b=EPru/JBdop90f20HwDMYpSDZfSu7RVm5ZonqWojoxnwP0ttp730pwGhgu+dcN2QcLVGnbo
	R1xPksWm/cDo8tOxhAzfTemulMqdtxAUiBnTeh/sgtOjFdbOnGdoafIFG8G1XWGOTUbnuV
	PvsiL59O3N5vAanT5C8+mFKWWiBSckzkZvPaZL4jwQvR4/dTsb8cJxHGMo33N8gIz3IGQB
	Y+6pGztPk3G/1Y/ek3HXKk9EPrHNR8vqsM/0Jps2yy42l3fYxQEUennmR5Bk4kB9BMhvYb
	Oby8T8BN8jGtTZKGcQcCvkdL5fkzFOfcaLa+Thgc8OZunk54ld/vJWUyx5R48w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8y8y0Vihpsa7kuidmjsGKlmg3PpJ4ZCRAtbsIsvEA4=;
	b=CH3rtd9E772ePoMaKS1UNf/jOc7XYb1l2Rk95sRGGqKZAlJR3w34KPDweNubhBMDgyL4ld
	4z38lK3DT3eCFEBg==
Date: Tue, 30 Dec 2025 08:10:57 +0100
Subject: [PATCH 2/5] ARM: uapi: Stop leaking CONFIG_CPU_ENDIAN_BE8
 reference to userspace
MIME-Version: 1.0
Message-Id: <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
In-Reply-To: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1602;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dlMzPHrReQ/pbAK9lXDYAAj3fJdbnf/meKB9Kt356Y8=;
 b=VfzyRNZ1kLHgDwyWyW6WGerkr2OPyUdHI92dxkNl9b8iSqPsOW9iadOCl6gKfQ3SCWmNwnWce
 BIxUeFaUYPOBS6RhRUr7D1L8LgIRkGJoyigr3HSPh05xywhCVZgb5ac
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_123243_F49F0E32 
X-CRM114-Status: GOOD (  10.49  )
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

VUFQSSBoZWFkZXJzIGFyZSBub3Qgc3VwcG9zZWQgdG8gbGVhayByZWZlcmVuY2VzIHRvIGtjb25m
aWcgc3ltYm9scy4KVGhlc2Ugd29uJ3QgYmUgc2V0IHdoZW4gYnVpbGRpbmcgdXNlcnNwYWNlLiBI
aWRlIHRoZSBrY29uZmlnIHJlZmVyZW5jZQpiZWhpbmQgJ2lmIGRlZmluZWQoX19LRVJORUxfXykn
LCBzbyBpdCB3aWxsIGJlIHN0cmlwcGVkIGJ5CmhlYWRlcnNfaW5zdGFsbC5zaCwgdGhlIHNhbWUg
d2F5IG90aGVyIGtjb25maWcgcmVmZXJlbmNlcyBpbiB0aGlzIGZpbGUKYXJlIGhhbmRsZWQuIFRo
ZSByZXN1bHQgZm9yIHVzZXJzcGFjZSB3aWxsIGJlIHRoZSBzYW1lLCBidXQgdGhlCmV4Y2VwdGlv
biBpbiBoZWFkZXJzX2luc3RhbGwuc2ggY2FuIGFsc28gYmUgcmVtb3ZlZC4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgot
LS0KIGFyY2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggfCAyICstCiBzY3JpcHRzL2hl
YWRlcnNfaW5zdGFsbC5zaCAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvdWFw
aS9hc20vcHRyYWNlLmggYi9hcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCmluZGV4
IDg4OTZjMjNjY2JhNy4uZmU2NTZkYTE3MDFiIDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRl
L3VhcGkvYXNtL3B0cmFjZS5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vcHRyYWNl
LmgKQEAgLTEwNSw3ICsxMDUsNyBAQAogLyoKICAqIERlZmF1bHQgZW5kaWFubmVzcyBzdGF0ZQog
ICovCi0jaWZkZWYgQ09ORklHX0NQVV9FTkRJQU5fQkU4CisjaWYgZGVmaW5lZChfX0tFUk5FTF9f
KSAmJiBkZWZpbmVkKENPTkZJR19DUFVfRU5ESUFOX0JFOCkKICNkZWZpbmUgUFNSX0VORFNUQVRF
CVBTUl9FX0JJVAogI2Vsc2UKICNkZWZpbmUgUFNSX0VORFNUQVRFCTAKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoIGIvc2NyaXB0cy9oZWFkZXJzX2luc3RhbGwuc2gKaW5k
ZXggNzI3ZjdmODJjMmM3Li40ZjAzNTIxZjQwMjYgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvaGVhZGVy
c19pbnN0YWxsLnNoCisrKyBiL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCkBAIC03MCw3ICs3
MCw2IEBAIGNvbmZpZ3M9JChzZWQgLWUgJwogIwogIyBUaGUgZm9ybWF0IGlzIDxmaWxlLW5hbWU+
OjxDT05GSUctb3B0aW9uPiBpbiBlYWNoIGxpbmUuCiBjb25maWdfbGVha19pZ25vcmVzPSIKLWFy
Y2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmg6Q09ORklHX0NQVV9FTkRJQU5fQkU4CiBh
cmNoL25pb3MyL2luY2x1ZGUvdWFwaS9hc20vc3dhYi5oOkNPTkZJR19OSU9TMl9DSV9TV0FCX05P
CiBhcmNoL25pb3MyL2luY2x1ZGUvdWFwaS9hc20vc3dhYi5oOkNPTkZJR19OSU9TMl9DSV9TV0FC
X1NVUFBPUlQKIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmg6Q09ORklHX0lBMzJf
RU1VTEFUSU9OCgotLSAKMi41Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
