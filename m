Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE08E94121
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkGjwEWxAORVXqCDV5/cg65yQf42RffRDP7SiM5Ly2Y=; b=kOPiKye44veN7P
	f6H+ovXDjq7D155WE4YIJyFOcYhWKmuyIdnN/ifhtJ1untu4K/sW0NG81MWgo7ej7+ELITPz/eRfn
	2g+rzlpj6hiAnmfku6ItdN5kzSwXpg0Ar+uNJ8GZoT7BwAnhftA9ir4Bc/2gIlyxjufw5euML8wFl
	WoKVfZmIlxVJn1lxtz8d0eC+OVrIq3VVOm3LIMsEjVbB3NTjiYwyu0jPnrh+kbu8pAbVcuI/3C6u2
	QwZhYO0NS6iuu/uIG0+kL4PP98QzRhfziqmLM0Syz/CfMVgPmm8lylpUgKzg9PmiV7KJGm2hI1+QC
	AATgcSkBGCeJ0Oh85JKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsu-00000004UpY-2M6O;
	Tue, 30 Dec 2025 07:11:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsk-00000004Ujv-19KB;
	Tue, 30 Dec 2025 07:11:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=216KVOlY02968JQn1X6t3Xl8U0YV+kMSpa6yCEhcMZ0=;
	b=JntQ3si8MLrP2MpCR1+OEWNd81aJ/qhkCp94JA/Ya1ve8COVEizpQpdOtwHChAXB5kltbU
	Ws3gZWwf2Myp17MCTCJAHH3HDfVMt6wJROw/X6gVEREUdbBtAjz3EjsUmDRgwyDoRngH/7
	vUqd9H/F0U5YB93waS8ZU4vmhBot5MgRv/CEdepkjG0X9nbxTJaJZfd5lG5NteBa4EBVrh
	0ErZG2q2WrrcXdkV/rnLgNolfMOXBXWG5PUaxPVlwjiPhdV6g5EITNsDacv+oDqg9I8d18
	NZTvPR/bfjFHib8xNSLt7nWeoq0Xu2lY5LG8o+5la0rr3hBMzuZ/PwsHwPzXBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=216KVOlY02968JQn1X6t3Xl8U0YV+kMSpa6yCEhcMZ0=;
	b=KI95VUE1ItLOgk32L8YjnYbIKghtAzkSpebLn2uXfUH3jy+0BPCOpegdnYYznoFj/i1Wej
	UZ04m9ZkrtUUVXBg==
Date: Tue, 30 Dec 2025 08:10:59 +0100
Subject: [PATCH 4/5] x86/uapi: Stop leaking kconfig references to userspace
MIME-Version: 1.0
Message-Id: <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1557;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZOE7KyuSlKH6XcxA1h4Q37Qp45CteslFj5lH67emOQk=;
 b=OYir6/1EucH7c1HcVMuphZ1xXvzTijkLimlJ4SpgcqZmSSE0gYkERzRWWRVaMrfoovAGdZrxd
 fDqcdtuv+EaCh+sTYpUahJeWGST4wS+3dsAx5bAB5+bNC+BNgNfLceK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_470444_72DEFE5D 
X-CRM114-Status: UNSURE (   9.86  )
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
b21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFy
Y2gveDg2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggfCAyICstCiBzY3JpcHRzL2hlYWRlcnNf
aW5zdGFsbC5zaCAgICAgICAgIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNt
L2F1eHZlYy5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAppbmRleCA2YmVi
NTViYmVmYTQuLmJkZGU5ZTE4Zjk0ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBp
L2FzbS9hdXh2ZWMuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oCkBA
IC0xMSw3ICsxMSw3IEBACiAjZGVmaW5lIEFUX1NZU0lORk9fRUhEUgkJMzMKIAogLyogZW50cmll
cyBpbiBBUkNIX0RMSU5GTzogKi8KLSNpZiBkZWZpbmVkKENPTkZJR19JQTMyX0VNVUxBVElPTikg
fHwgIWRlZmluZWQoQ09ORklHX1g4Nl82NCkKKyNpZiBkZWZpbmVkKF9fS0VSTkVMX18pICYmIChk
ZWZpbmVkKENPTkZJR19JQTMyX0VNVUxBVElPTikgfHwgIWRlZmluZWQoQ09ORklHX1g4Nl82NCkp
CiAjIGRlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIIDMKICNlbHNlIC8qIGVsc2UgaXQncyBub24t
Y29tcGF0IHg4Ni02NCAqLwogIyBkZWZpbmUgQVRfVkVDVE9SX1NJWkVfQVJDSCAyCmRpZmYgLS1n
aXQgYS9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaCBiL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxs
LnNoCmluZGV4IDYxM2Y0MDBhNjdkMS4uMTMwMWJhNjhkNzcyIDEwMDc1NQotLS0gYS9zY3JpcHRz
L2hlYWRlcnNfaW5zdGFsbC5zaAorKysgYi9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaApAQCAt
NzAsOCArNzAsNiBAQCBjb25maWdzPSQoc2VkIC1lICcKICMKICMgVGhlIGZvcm1hdCBpcyA8Zmls
ZS1uYW1lPjo8Q09ORklHLW9wdGlvbj4gaW4gZWFjaCBsaW5lLgogY29uZmlnX2xlYWtfaWdub3Jl
cz0iCi1hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oOkNPTkZJR19JQTMyX0VNVUxB
VElPTgotYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaDpDT05GSUdfWDg2XzY0CiAi
CiAKIGZvciBjIGluICRjb25maWdzCgotLSAKMi41Mi4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
