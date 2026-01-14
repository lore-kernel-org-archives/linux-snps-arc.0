Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EE6D31A15
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToB8YJGT4gmUGczBQBRBGjDFWMm3o5O1V/BMN1p4I0U=; b=j33jVqmzWxnlqJ
	YcmyNMhVyHBLZPxhUm5X6d0zv77gK8AyI6J0yTPoNkGpQ20zpTYDJfmJYdFyjcNc+DJ3P9UvduhSX
	dT4aDKQqtFyCQpm3fWVLvqPpD6auzb8Ha4LYS0vwSh4cydnKyiyIo6EtIRkbF+Dz7ao60zfabOEFZ
	tlBJBdmqYlxRDa9FXbvoWnWchkQ17CO5lR9snOYwooXPyWRStL45pYLPEVdGy2L6pSNQ0MO1k3doZ
	6OCCdOPDNuxlCwV3F/qeOjr6z0eSGJfIhS/QaHdmpYhLifDEICDjTnzQTfgjpX4MkOSVHaAzG5HMV
	MAWKWTjuZCzUKPPLeLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIv-00000008CJE-0LDS;
	Wed, 14 Jan 2026 07:28:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIo-00000008CBX-1sSI;
	Wed, 14 Jan 2026 07:28:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=;
	b=gaXlW5zA/MYXd6NbKuezEsmax7N92NNr4JWvZvwHId5OISIAYn8uD46FhMFrA9rhwh2PRT
	EU0b26GySHVzPsAzOYDbM/keTxzpVFwGiiun2TuBUg0SjiaXLmaSw4FrRiQOQQ9XMbJWPP
	H2U0UVpJJaO8U29C2enDwnR/UMAAVPLvLhgDXm4BCz/Wm8CvPydD5Uz1rPKaScpvPLSzZQ
	rgzesRbic6oQ6uN+Kg/qW5KULzgEACr+K8gTep6zyB8EfKJ4cD/jfpsV22tvs/Ghi949iy
	qP1+gYIKJIv8w9mfjwbEjWjCxH+yuA+6vENEqyRliyuWEZqmJlNFMlp8zP0fxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=;
	b=+CvknTftYYD7GsBliqMP9VsegNPf4yvMf3lA0DILNaZeqSNhWWacnQesZmGXC/a3+kji+5
	9N/szH70sgpJCXCQ==
Date: Wed, 14 Jan 2026 08:28:16 +0100
Subject: [PATCH v3 4/5] x86/uapi: Stop leaking kconfig references to
 userspace
MIME-Version: 1.0
Message-Id: <20260114-headers_install-config-leak-v3-4-c14cde735a79@linutronix.de>
References: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
In-Reply-To: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=1708;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1ntrFEOo6yMiRT1zeHWBcYc625HQZOv1NUT0dl13IAY=;
 b=unZ0CyXvkfkoMgqz27osbmzz+sWFiYYt2jt4IQ0m90dr/ZexgmllmyMRDCycdCQ5buZiUfe11
 jvv3AV3A6BDC47vBKjbr1LRDnU26RzSjl1j0vpNZO74hj4Hi4fc7GQm
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232826_619667_051D7CBC 
X-CRM114-Status: GOOD (  11.37  )
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
LCBzbyBpdCB3aWxsIGJlIHN0cmlwcGVkIGJ5CmhlYWRlcnNfaW5zdGFsbC5zaC4gVGhlIHJlc3Vs
dCBmb3IgdXNlcnNwYWNlIHdpbGwgYmUgdGhlIHNhbWUsIGJ1dCB0aGUKZXhjZXB0aW9ucyBpbiBo
ZWFkZXJzX2luc3RhbGwuc2ggY2FuIGFsc28gYmUgcmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKLS0tClRo
ZXJlIGlzIG5vIHBvaW50IGluIGV4cG9zaW5nIEFUX1ZFQ1RPUl9TSVpFX0FSQ0ggaW4gdGhlIFVB
UEkgaW4gYW55CmNhc2UgYW5kIEkgaGF2ZSBhbm90aGVyIHNlcmllcyBpbiB0aGUgd29ya3MgdG8g
Z2V0IHJpZCBvZiBpdCBjb21wbGV0ZWx5LgotLS0KIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20v
YXV4dmVjLmggfCAyICstCiBzY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaCAgICAgICAgIHwgMiAt
LQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIGIvYXJjaC94ODYvaW5j
bHVkZS91YXBpL2FzbS9hdXh2ZWMuaAppbmRleCA2YmViNTViYmVmYTQuLmJkZGU5ZTE4Zjk0ZSAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysgYi9hcmNo
L3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCkBAIC0xMSw3ICsxMSw3IEBACiAjZGVmaW5l
IEFUX1NZU0lORk9fRUhEUgkJMzMKIAogLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTzogKi8KLSNp
ZiBkZWZpbmVkKENPTkZJR19JQTMyX0VNVUxBVElPTikgfHwgIWRlZmluZWQoQ09ORklHX1g4Nl82
NCkKKyNpZiBkZWZpbmVkKF9fS0VSTkVMX18pICYmIChkZWZpbmVkKENPTkZJR19JQTMyX0VNVUxB
VElPTikgfHwgIWRlZmluZWQoQ09ORklHX1g4Nl82NCkpCiAjIGRlZmluZSBBVF9WRUNUT1JfU0la
RV9BUkNIIDMKICNlbHNlIC8qIGVsc2UgaXQncyBub24tY29tcGF0IHg4Ni02NCAqLwogIyBkZWZp
bmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAyCmRpZmYgLS1naXQgYS9zY3JpcHRzL2hlYWRlcnNfaW5z
dGFsbC5zaCBiL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCmluZGV4IDYxM2Y0MDBhNjdkMS4u
MTMwMWJhNjhkNzcyIDEwMDc1NQotLS0gYS9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaAorKysg
Yi9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaApAQCAtNzAsOCArNzAsNiBAQCBjb25maWdzPSQo
c2VkIC1lICcKICMKICMgVGhlIGZvcm1hdCBpcyA8ZmlsZS1uYW1lPjo8Q09ORklHLW9wdGlvbj4g
aW4gZWFjaCBsaW5lLgogY29uZmlnX2xlYWtfaWdub3Jlcz0iCi1hcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oOkNPTkZJR19JQTMyX0VNVUxBVElPTgotYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9hdXh2ZWMuaDpDT05GSUdfWDg2XzY0CiAiCiAKIGZvciBjIGluICRjb25maWdzCgot
LSAKMi41Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
