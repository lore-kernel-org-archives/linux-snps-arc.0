Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F4CE94116
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAwv58fSslEEMrckafycXz3L3kj2RQOlw7lWXd0H8eY=; b=4ewCBpQf1tTnEt
	cgfj5LIj8BMHEcL5+9P/6pHk3YvCDEQk1m9KNi2hQHhS2DGJAwN4Rd2GZcNcXzEMO/aTseMVC91Ys
	qB5Z5IZSYCQazNqhMmPRRnfWWn9Hed8TSOhYPrqYlqu2iSx7X2MeA1QgwRlDIQAG3xOWwpo3cGL6M
	IPmEHR5U8p+pP1D08GrEyzlpaXiFg69XB9ka6iLntPLzHkwnOpaWDmj8KY2hJydJJsAfVGkb+5XsZ
	6CBpZlM1+ptP1HQJi/p6cQhK426joL9rSxoHUPt0x2lpu/g68HAVZ7js6OQytXFqW8oD1KW5KnJ7P
	K4FHmeMcA4GJSs/p37rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsv-00000004UqV-0fr9;
	Tue, 30 Dec 2025 07:11:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujs-3EvL;
	Tue, 30 Dec 2025 07:11:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4/bNZrUYTbxYxNrc58e0uJZN6c9cRUxViZqrgTyrx0=;
	b=hsuVNeIsqG+mp9hett6W8DjHHiEpQ6s2Ho/Td0fRW71oUG+rYuSSfZq91hgaFgiRczjp1Y
	voLAxW0UmoN/kotLkDRkcu9gJigMuTvHLkiscMLnSYSp8TXVs80qz8YQ2E4BiDFtRnHzOD
	Ek7BWrFUUU7O++M33LyONfs/PfD2djwH2pzAZBpP/Ln+CWczbbw67udib1WdYy3bJw8mry
	kDKLpaRqKTiO7e2g78DigGcWrlsKexkeaWI5+o7LSLQdp+WCwhZcoMVDiezUaQfYjlIKBY
	ZC/5yoDj6LS5TYIByw4ZARygb+8eIVEcnQY8RrHoKtukzxIoOJ8Bc3N8STTrtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4/bNZrUYTbxYxNrc58e0uJZN6c9cRUxViZqrgTyrx0=;
	b=GIVvWqOacv2Vx/tzMallrDWHecJqxqWGHuyDaSQdA8bQDAnAoIA7/AA86aAHaGJtIRhjfv
	b4WxnNlqFsCRA4CA==
Date: Tue, 30 Dec 2025 08:10:58 +0100
Subject: [PATCH 3/5] nios2: uapi: Stop leaking
 CONFIG_NIOS2_CI_SWAB_{NO,SUPPORT} references to userspace
MIME-Version: 1.0
Message-Id: <20251230-headers_install-config-leak-v1-3-efba5c58073d@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1689;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=n9zn4K/Hu7Fta3297AtI35P1y+fLlUk+UIK90uLO2Gk=;
 b=z57bRP/lyKdng7CDc9KNssbRyXisTA525qNWfLIqSqxCBd+OiPFi0tHkwlZuZAWi578OPYPSe
 nCI2sAmmFr0CkBFmwSGAUWfzScu3QlmGj83lokWClpqSYYYBRUD58aX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_122605_A0FE788B 
X-CRM114-Status: GOOD (  10.41  )
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
aWRlIHRoZSBrY29uZmlnIHJlZmVyZW5jZQpiZWhpbmQgJ2lmZGVmIF9fS0VSTkVMX18nLCBzbyBp
dCB3aWxsIGJlIHN0cmlwcGVkIGJ5CmhlYWRlcnNfaW5zdGFsbC5zaC4gVGhlIHJlc3VsdCBmb3Ig
dXNlcnNwYWNlIHdpbGwgYmUgdGhlIHNhbWUsIGJ1dCB0aGUKZXhjZXB0aW9ucyBpbiBoZWFkZXJz
X2luc3RhbGwuc2ggY2FuIGFsc28gYmUgcmVtb3ZlZC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvbmlv
czIvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmggfCAyICsrCiBzY3JpcHRzL2hlYWRlcnNfaW5zdGFs
bC5zaCAgICAgICAgIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9pbmNsdWRlL3VhcGkvYXNtL3N3
YWIuaCBiL2FyY2gvbmlvczIvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmgKaW5kZXggOTc1MDU0N2E1
ZjgyLi5iYmZhOWJkMTBiMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIvaW5jbHVkZS91YXBpL2Fz
bS9zd2FiLmgKKysrIGIvYXJjaC9uaW9zMi9pbmNsdWRlL3VhcGkvYXNtL3N3YWIuaApAQCAtMTQs
NiArMTQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8YXNtLWdlbmVy
aWMvc3dhYi5oPgogCisjaWZkZWYgX19LRVJORUxfXwogI2lmZGVmIENPTkZJR19OSU9TMl9DSV9T
V0FCX1NVUFBPUlQKICNpZmRlZiBfX0dOVUNfXwogCkBAIC0zNCw1ICszNSw2IEBAIHN0YXRpYyBp
bmxpbmUgX19hdHRyaWJ1dGVfXygoY29uc3QpKSBfX3UzMiBfX2FyY2hfc3dhYjMyKF9fdTMyIHgp
CiAKICNlbmRpZiAvKiBfX0dOVUNfXyAqLwogI2VuZGlmIC8qIENPTkZJR19OSU9TMl9DSV9TV0FC
X1NVUFBPUlQgKi8KKyNlbmRpZiAvKiBfX0tFUk5FTF9fICovCiAKICNlbmRpZiAvKiBfQVNNX05J
T1MyX1NXQUJfSCAqLwpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9oZWFkZXJzX2luc3RhbGwuc2ggYi9z
Y3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaAppbmRleCA0ZjAzNTIxZjQwMjYuLjYxM2Y0MDBhNjdk
MSAxMDA3NTUKLS0tIGEvc2NyaXB0cy9oZWFkZXJzX2luc3RhbGwuc2gKKysrIGIvc2NyaXB0cy9o
ZWFkZXJzX2luc3RhbGwuc2gKQEAgLTcwLDggKzcwLDYgQEAgY29uZmlncz0kKHNlZCAtZSAnCiAj
CiAjIFRoZSBmb3JtYXQgaXMgPGZpbGUtbmFtZT46PENPTkZJRy1vcHRpb24+IGluIGVhY2ggbGlu
ZS4KIGNvbmZpZ19sZWFrX2lnbm9yZXM9IgotYXJjaC9uaW9zMi9pbmNsdWRlL3VhcGkvYXNtL3N3
YWIuaDpDT05GSUdfTklPUzJfQ0lfU1dBQl9OTwotYXJjaC9uaW9zMi9pbmNsdWRlL3VhcGkvYXNt
L3N3YWIuaDpDT05GSUdfTklPUzJfQ0lfU1dBQl9TVVBQT1JUCiBhcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL2F1eHZlYy5oOkNPTkZJR19JQTMyX0VNVUxBVElPTgogYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9hdXh2ZWMuaDpDT05GSUdfWDg2XzY0CiAiCgotLSAKMi41Mi4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
