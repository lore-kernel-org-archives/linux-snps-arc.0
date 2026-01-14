Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D219D31A16
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rhh+Aey/U2vDeJxZzD6v/TOlyRRRLZoB0KooWDDHRQ=; b=IrhtQIQl+hu0aB
	nX25MfEWikYkhAyp1XmcJKJAeideQocAkUFOEzvyDAG0QU8I/q2bVGDPW8e7JN10UzZE2+CwOunb2
	PbjRb6NCDHjl3Zs07a54VYy80LeqnDLzDOn9XPhqARL8XY4bxh4t/ocy3u6zdwwFuxKrW4hm0RVCt
	+XPXtZBe4z/TJcNqNk5qNYSt+KW47+GgC8mWkLXTc0AVWyLhjcQla/FX7MyoA3N3c2fyAnaWsX/3w
	724Hw+4ghJcEBHTxcwB/5QPFJAuWWaX0zeDrjYRQtlF9URBKNDpSlxUr/4xMACF43HK/pd4Xn1ZBi
	+vAWZVf91Pg9wbw0SN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIr-00000008CF9-1BHL;
	Wed, 14 Jan 2026 07:28:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIn-00000008CBR-28TD;
	Wed, 14 Jan 2026 07:28:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=;
	b=4BbFAtdVbeRT7QbtXdm7bwd1qzzQzz3pXAwe++yn8h4N2z4yqZt7qIQUhAXU3dEJ7k2RqK
	rspzaRRTZEym0P4RUrwgcVmf9CncxjaxxHLHcuELoqDOdB3mhqMJpELLzpGOj/9VuMV0Ug
	a1sedRk8JNqjLqtaCzo4f2Ef6XTLvPOlsuP9Mec/+tabPFfbtMdDJJMADHB6Ew8JbYCkAN
	D3B3jbi/QIxjxDYzXOSLBtg7Fm4zVlwRQMkx2m5tAkJsyH8H9XaBWSUl1oTfiO4R2W4jFo
	pta9lRZETVcj69i9hI4nCuwwZA0pO8sKd6Kiu+vO0skOgOKUONscMrobzrtIFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=;
	b=bW0A42SfLtA7Amv19PyrViAn0Ddkpow0ImosXbhiOzuhGrK32qVLu8dHt4vjabxoNOyQpn
	w/fXAZilw5myHUAA==
Date: Wed, 14 Jan 2026 08:28:14 +0100
Subject: [PATCH v3 2/5] ARM: uapi: Drop PSR_ENDSTATE
MIME-Version: 1.0
Message-Id: <20260114-headers_install-config-leak-v3-2-c14cde735a79@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=2940;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=fz1o/QC//id3SLCiEx9I+QB/CLj6vfH/ATM2HwtC2M4=;
 b=J8tj378LP5E6jN1LFUC1whqX29eQyRdeMxXOv8p2BckKLdfyfbJlXwKzRNYpu2PNBehdXAHwT
 PVdkbcvuBfFDzjLqp9UWLeUVPJttaCMJqqXnO2o4ztQre80S5Ba3IMF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232825_683031_706292EF 
X-CRM114-Status: GOOD (  12.51  )
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

VGhlIHN5bWJvbCBQU1JfRU5EU1RBVEUgaXMgcG9pbnRsZXNzIGZvciB1c2Vyc3BhY2UuIERyb3Ag
aXQgZnJvbSB0aGUKVUFQSSBoZWFkZXJzIGFuZCBpbnN0ZWFkIGlubGluZSBpdCBpbnRvIHRoZSBv
bmx5IHR3byBjYWxsZXJzLgoKQXMgYXMgc2lkZS1lZmZlY3QsIHJlbW92ZSBhIGxlYWsgb2YgYW4g
aW50ZXJuYWwga2NvbmZpZyBzeW1ib2wgdGhyb3VnaAp0aGUgVUFQSSBoZWFkZXJzLgoKU3VnZ2Vz
dGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sL2QyYWQxMmYyLTNkNjUtNGJlZi04OTBjLTY1ZDc4YTMzZDc5MEBhcHAu
ZmFzdG1haWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndl
aXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL2FybS9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaCAgIHwgMyArKy0KIGFyY2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggfCA5IC0t
LS0tLS0tLQogYXJjaC9hcm0va2VybmVsL3NpZ25hbC5jICAgICAgICAgICB8IDMgKystCiBzY3Jp
cHRzL2hlYWRlcnNfaW5zdGFsbC5zaCAgICAgICAgIHwgMSAtCiA0IGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaApp
bmRleCAzMjY4NjRmNzlkMTguLmJiYTgzMjI4YmMyMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vcHJvY2Vzc29yLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vcHJvY2Vzc29y
LmgKQEAgLTczLDcgKzczLDggQEAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfdGhyZWFkX3N0cnVj
dF93aGl0ZWxpc3QodW5zaWduZWQgbG9uZyAqb2Zmc2V0LAogCQlyZWdzLT5BUk1fY3BzciA9IFVT
UjI2X01PREU7CQkJCVwKIAlpZiAoZWxmX2h3Y2FwICYgSFdDQVBfVEhVTUIgJiYgcGMgJiAxKQkJ
CQlcCiAJCXJlZ3MtPkFSTV9jcHNyIHw9IFBTUl9UX0JJVDsJCQkJXAotCXJlZ3MtPkFSTV9jcHNy
IHw9IFBTUl9FTkRTVEFURTsJCQkJCVwKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ1BVX0VORElB
Tl9CRTgpKQkJCQlcCisJCXJlZ3MtPkFSTV9jcHNyIHw9IFBTUl9FX0JJVDsJCQkJXAogCXJlZ3Mt
PkFSTV9wYyA9IHBjICYgfjE7CQkvKiBwYyAqLwkJCVwKIAlyZWdzLT5BUk1fc3AgPSBzcDsJCS8q
IHNwICovCQkJXAogfSkKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vcHRy
YWNlLmggYi9hcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCmluZGV4IDg4OTZjMjNj
Y2JhNy4uMmVmOTE3OTU3MDA1IDEwMDY0NAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNt
L3B0cmFjZS5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKQEAgLTEw
MiwxNSArMTAyLDYgQEAKICNkZWZpbmUgUFNSX0lUX01BU0sJMHgwNjAwZmMwMAkvKiBJZi1UaGVu
IGV4ZWN1dGlvbiBzdGF0ZSBtYXNrICovCiAjZGVmaW5lIFBTUl9FTkRJQU5fTUFTSwkweDAwMDAw
MjAwCS8qIEVuZGlhbm5lc3Mgc3RhdGUgbWFzayAqLwogCi0vKgotICogRGVmYXVsdCBlbmRpYW5u
ZXNzIHN0YXRlCi0gKi8KLSNpZmRlZiBDT05GSUdfQ1BVX0VORElBTl9CRTgKLSNkZWZpbmUgUFNS
X0VORFNUQVRFCVBTUl9FX0JJVAotI2Vsc2UKLSNkZWZpbmUgUFNSX0VORFNUQVRFCTAKLSNlbmRp
ZgotCiAvKiAKICAqIFRoZXNlIGFyZSAnbWFnaWMnIHZhbHVlcyBmb3IgUFRSQUNFX1BFRUtVU1Ig
dGhhdCByZXR1cm4gaW5mbyBhYm91dCB3aGVyZSBhCiAgKiBwcm9jZXNzIGlzIGxvY2F0ZWQgaW4g
bWVtb3J5LgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL3NpZ25hbC5jIGIvYXJjaC9hcm0v
a2VybmVsL3NpZ25hbC5jCmluZGV4IDc5YTY3MzBmYTBlYi4uN2JlOTE4OGQ4M2Q5IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9rZXJuZWwvc2lnbmFsLmMKKysrIGIvYXJjaC9hcm0va2VybmVsL3NpZ25h
bC5jCkBAIC0zMzcsNyArMzM3LDggQEAgc2V0dXBfcmV0dXJuKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCBzdHJ1Y3Qga3NpZ25hbCAqa3NpZywKIAkJCXJldHVybiAxOwogCX0KIAotCWNwc3IgfD0gUFNS
X0VORFNUQVRFOworCWlmIChJU19FTkFCTEVEKENPTkZJR19DUFVfRU5ESUFOX0JFOCkpCisJCWNw
c3IgfD0gUFNSX0VfQklUOwogCiAJLyoKIAkgKiBNYXliZSB3ZSBuZWVkIHRvIGRlbGl2ZXIgYSAz
Mi1iaXQgc2lnbmFsIHRvIGEgMjYtYml0IHRhc2suCmRpZmYgLS1naXQgYS9zY3JpcHRzL2hlYWRl
cnNfaW5zdGFsbC5zaCBiL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCmluZGV4IDcyN2Y3Zjgy
YzJjNy4uNGYwMzUyMWY0MDI2IDEwMDc1NQotLS0gYS9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5z
aAorKysgYi9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaApAQCAtNzAsNyArNzAsNiBAQCBjb25m
aWdzPSQoc2VkIC1lICcKICMKICMgVGhlIGZvcm1hdCBpcyA8ZmlsZS1uYW1lPjo8Q09ORklHLW9w
dGlvbj4gaW4gZWFjaCBsaW5lLgogY29uZmlnX2xlYWtfaWdub3Jlcz0iCi1hcmNoL2FybS9pbmNs
dWRlL3VhcGkvYXNtL3B0cmFjZS5oOkNPTkZJR19DUFVfRU5ESUFOX0JFOAogYXJjaC9uaW9zMi9p
bmNsdWRlL3VhcGkvYXNtL3N3YWIuaDpDT05GSUdfTklPUzJfQ0lfU1dBQl9OTwogYXJjaC9uaW9z
Mi9pbmNsdWRlL3VhcGkvYXNtL3N3YWIuaDpDT05GSUdfTklPUzJfQ0lfU1dBQl9TVVBQT1JUCiBh
cmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oOkNPTkZJR19JQTMyX0VNVUxBVElPTgoK
LS0gCjIuNTIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
