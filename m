Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB900D31A19
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNGeFmDUBFVkqTu6PSpz79UujwA7hw6pyZPTYDxwY2w=; b=j8F/kYL61JlNEm
	C48c5Ff1gBsXLK7YKJ0v6rPPu2RU7ytm86Fk2bU49c8xhd4aftnsSeoSgl+esbnUPXtXTiRXT7PAf
	3eI6iZZJ65n+WKoLvVmuhJgiHbk5N+3YC4Dp3H38cxcDl3S2MkuPm2MeoVID8NXjMVQEFKyrbQTx1
	OfqUGeAnBr34nTWrCfM/a6QDjsGYkfWDh0dpWFrygVpnjeQuN+8aeb6jv4CJGqELDro879MU75wxM
	AoX8j2i60wOmL9D1lAuvQ3F/0//zxOLFbngcTFct6kgp7iK6jJAnoA6g56aZXmEzOnOWrjEi3xUll
	23bx1ZGbgETgbN444cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIu-00000008CIO-26Jr;
	Wed, 14 Jan 2026 07:28:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIn-00000008CBU-3xwm;
	Wed, 14 Jan 2026 07:28:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7a/8gcbX01XP0/CB6Qd22scjF/OCyrYXm0gztMHssc=;
	b=dAc3knakfpp5DOvozjUAzoewOZ2pVCF/gzFHHIZ75ZyWUHoMYvGm/4/09V1mA7934bDNxI
	o8gD9fHx/aoRilno7/lwiTZRd10IK5bC8RN+D7DKML6UnnYDtoNVpHNgyAI9Lw6eKvpVs3
	e/KiA20HVCghVVTcxUPZB34U1So1sEh5Gw/BgVehGVuJoZAuEb7t18x2pegQqJ5mefjAvm
	fV1es3dz7yXmx0JDg+jFub20M6R/nf90wgBOsSdhhloAi1vbdnBvni4ArSXLfh+Zs5Z2Og
	oJWVW3QVgWeA6LWHyckX4gMdJvDzi3ymAV6AV7ZY4eLe0avARB78clO/ETU8lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7a/8gcbX01XP0/CB6Qd22scjF/OCyrYXm0gztMHssc=;
	b=U/JNrNkBGW3Y1nOEUaTFB2cpGsA8hZXMVJD6By/YcVfJ2SSkYeJjE6uzVutPg+0uOmQEFf
	hiXM8qitjatAN+BQ==
Date: Wed, 14 Jan 2026 08:28:15 +0100
Subject: [PATCH v3 3/5] nios2: uapi: Remove custom asm/swab.h from UAPI
MIME-Version: 1.0
Message-Id: <20260114-headers_install-config-leak-v3-3-c14cde735a79@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=1518;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mE+0AJr1mZB6A2o+OL0n7XdbaqJ3PgEVC2ckr3OVoI0=;
 b=zHTjG8R/h7uXxKeC9I3uek7xU7TY91UMhtbGC20yAPj5ya4N/uCIjgRNXiJw13vsOPf8QLkN/
 AdLzoLuojFQDPOjMqW281pckTTVbMF16RgvhBWDqP94AqSmP3qrsZXA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232826_114820_889D1FD1 
X-CRM114-Status: UNSURE (   8.40  )
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
aWcgc3ltYm9scy4KVGhleSBhcmUgdW5kZWZpbmVkIHRoZXJlIGluIGFueSBjYXNlLiBBcyBhbGwg
YWN0dWFsIGRlZmluaXRpb25zIG9mIHRoaXMKaGVhZGVyIGFyZSBndWFyZGVkIGJlaGluZCBhIGtj
b25maWcgc3ltYm9sLCBmb3IgdXNlcnNwYWNlIHRoZSBoZWFkZXIgaXMKYWx3YXlzIGlkZW50aWNh
bCB0byBpdHMgYXNtLWdlbmVyaWMgdmFyaWFudC4KCk1ha2UgdGhlIGN1c3RvbSBVQVBJIGhlYWRl
ciBhIGtlcm5lbC1pbnRlcm5hbCBvbmUsIHNvIHRoZSBsZWFrcyBvZgprY29uZmlnIHN5bWJvbHMg
YXJlIGZpeGVkIGFuZCB1c2Vyc3BhY2Ugd2lsbCBpbnN0ZWFkIHVzZQphc20tZ2VuZXJpYy9zd2Fi
LmggZGlyZWN0bHkuCgpTdWdnZXN0ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvOTNjNTUwODYtOTMxYS00MjgyLWE5
NGMtZGU0OTU0MDQ3ZmE5QGFwcC5mYXN0bWFpbC5jb20vClNpZ25lZC1vZmYtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvbmlv
czIvaW5jbHVkZS97dWFwaSA9PiB9L2FzbS9zd2FiLmggfCAwCiBzY3JpcHRzL2hlYWRlcnNfaW5z
dGFsbC5zaCAgICAgICAgICAgICAgIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbmlvczIvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmggYi9h
cmNoL25pb3MyL2luY2x1ZGUvYXNtL3N3YWIuaApzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1l
IGZyb20gYXJjaC9uaW9zMi9pbmNsdWRlL3VhcGkvYXNtL3N3YWIuaApyZW5hbWUgdG8gYXJjaC9u
aW9zMi9pbmNsdWRlL2FzbS9zd2FiLmgKZGlmZiAtLWdpdCBhL3NjcmlwdHMvaGVhZGVyc19pbnN0
YWxsLnNoIGIvc2NyaXB0cy9oZWFkZXJzX2luc3RhbGwuc2gKaW5kZXggNGYwMzUyMWY0MDI2Li42
MTNmNDAwYTY3ZDEgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCisrKyBi
L3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCkBAIC03MCw4ICs3MCw2IEBAIGNvbmZpZ3M9JChz
ZWQgLWUgJwogIwogIyBUaGUgZm9ybWF0IGlzIDxmaWxlLW5hbWU+OjxDT05GSUctb3B0aW9uPiBp
biBlYWNoIGxpbmUuCiBjb25maWdfbGVha19pZ25vcmVzPSIKLWFyY2gvbmlvczIvaW5jbHVkZS91
YXBpL2FzbS9zd2FiLmg6Q09ORklHX05JT1MyX0NJX1NXQUJfTk8KLWFyY2gvbmlvczIvaW5jbHVk
ZS91YXBpL2FzbS9zd2FiLmg6Q09ORklHX05JT1MyX0NJX1NXQUJfU1VQUE9SVAogYXJjaC94ODYv
aW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaDpDT05GSUdfSUEzMl9FTVVMQVRJT04KIGFyY2gveDg2
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmg6Q09ORklHX1g4Nl82NAogIgoKLS0gCjIuNTIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
