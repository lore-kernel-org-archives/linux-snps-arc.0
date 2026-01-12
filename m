Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1558D25043
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rhh+Aey/U2vDeJxZzD6v/TOlyRRRLZoB0KooWDDHRQ=; b=kaJSreWQtwDjQA
	HYnEUH+0f0COndOVrKafuuJpbyy0k0ATNR17Sk4idjbYZa1k6bQTQYFmSV1csoSgzPSLWWUMcDBbO
	M003p8gwSp2EfNwn2gkXa7UgX5TQ5/tuptHNFP9xyK1JRUuQ0YvFZNRy5fo70qoGZXZF7EJpRkTwV
	hygKX7v4RTCb8N5KyEpTszF/7GUh7rfi5AJHOV+LQcWSiqJ5kUACxflNEjL+wDl9hKWZUvKbHUnQd
	r7BNuiKB0ErvJXhbNvsrmckGugpK5R0okwcAv91E2bGOx2lXeyu3zzdO8J3/+Mq9T1RXC3YlYhDp2
	i0wokUvNt8z99ibA2ruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCp4-00000004wPl-2OXs;
	Mon, 12 Jan 2026 07:58:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCox-00000004wJD-2V8n;
	Mon, 12 Jan 2026 07:58:41 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768204715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=;
	b=omYMiVgyCs2/ICjIBKHk+uRwVKqb2olpwT7SpzDhB5GVFq48MzJ/sHFdjM4oNWLwQPBxU1
	3PA9Ne8I1jwRRzFiSEzVJKc1Y3TnnU7FehqUKshQKo30JlPtUldAKsCrRR86DmO/d9WYsX
	1ChFodv4xO9yMpZ3gyslxtwEtuBJHm7JrxA3oogmrtvYjhn6JY2NS3zhhWpsMxbl8HG2//
	rshFGY/ctXk7vLOxa1SiNGOW31cMo+JVvMnQgcVTAZSdeaYiksXAd8TaGKo3QBr5T39V+h
	URj92ms8uHNgAFFrEbBODFt79o70DbqwZElk/n00VaztdlOVJCKc6EKsmg4/4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768204715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5s1E1yisqHJGGPTpys4I/1xezHpPYE2+zak8zKkm6YU=;
	b=jAfZhu7+MYFHbZQYp4Wr1DEqaexq5dbKqNHBkWycp5xJn1kHg0vAMVoGlzZuplCYqAuNVf
	srmP/2rF5wWJuFBw==
Date: Mon, 12 Jan 2026 08:58:30 +0100
Subject: [PATCH v2 2/5] ARM: uapi: Drop PSR_ENDSTATE
MIME-Version: 1.0
Message-Id: <20260112-headers_install-config-leak-v2-2-4d8084444603@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768204713; l=2940;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=fz1o/QC//id3SLCiEx9I+QB/CLj6vfH/ATM2HwtC2M4=;
 b=SgLGFJD93/ax6KUVAdEqFkrrtteLzYnyVrgmZLmHAO3OlDxH1a9NqMhU6ejqJ2eiYW+IB+Olx
 MoK7VJQoUOYB/DXjxAg1+xBNyQ+JiDlDEEof/TKvPnQt3686DHOkcx1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235839_771995_773B801A 
X-CRM114-Status: GOOD (  12.91  )
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
