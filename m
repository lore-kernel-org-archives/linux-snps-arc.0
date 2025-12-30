Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7262E9411F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS+kC0CFI91l/NuMWml6KuooPEXr1afesge6uUrhsR4=; b=5DxFNsi++hBL6x
	I0IW/3GVU0ea9OMVZuCewr6ahON5Xa3jGwhi0aN8u8WvjIN1JnN09tLlI4QedO1j2xcbgZIgE+aP9
	rLulz93L5r6eXbglaK3Hqb4HhM5BooX9Xa97d+GrzDPEvCWQ3FdprOQcIxjCEX2xA3Cebl0kZlxsP
	QRkLiwNXlYBSDtTozGpXZUlHsTDioPnKJg+nerYLJ7d34Nif3NeKIDi8Pi6dj+CNlrii+cRqRS8p5
	fW2bjuYOajn0k5ukxu4w4S9yfQj44HXZiex4P2Ex8ab7cqzqAqKN3/8U9YcOd+nFHiqmxk95Dw5l5
	wBQHiIM6zXVQfh3ssB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTst-00000004UoD-21sX;
	Tue, 30 Dec 2025 07:11:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujp-3F4U;
	Tue, 30 Dec 2025 07:11:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in4GJONd74GWeqIRrh+mhY9mjCdUEPtCPJkNmmK3dx0=;
	b=KSl10LEqr/doF+o6gyht4lon1lkLhhl3VQsI+FN0oKGdKZF81JQ5TBLhx8JjAXdfPtV/iC
	qIQe9SLAbZ7u78i6vU13HOwGTDtESkeTZE01qFQM/HbaFGg/QsJzJERHuFUimNX4nkMhkH
	yWppjl9wXwW6jxEHQyRdsV9sS2QxGboN3U8wFHP6++KaAmqYR00boru3w76lvro2+hoLCb
	ZLzouH0vqWsz2fC5HFVMzJ4+/EPnaRabQCoY/jDNl1AINSAxIXq7OusWq1H94ZNeCz8XB9
	vszHjs5fTseOyn4Rys6OQmcNtDkmzumuvKscR3XDy1PIKs+CnOovd4QAms5RsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in4GJONd74GWeqIRrh+mhY9mjCdUEPtCPJkNmmK3dx0=;
	b=JFVEiJ44d+GfnQqgHc3+1EeDwJ029+GMLn+V4OaWKdUlKfzQnoPJNnxhE3f66VRRbCjYMn
	osfYUe6Js6nm+MAg==
Date: Tue, 30 Dec 2025 08:10:56 +0100
Subject: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE reference
 to userspace
MIME-Version: 1.0
Message-Id: <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1530;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h1MsBNdSKkOd89IIdtn656mx/NIGmUDhFE20RygCuoU=;
 b=t2Rp3UhE6erZ0JNQ1XxNhg5jEn4P9iBsZ/09JRJ2bo2X/yGCssXYNY4IStsp+xa0U7RwYhsBQ
 ySdxSZoNqX0DTmDu2Y1foVt+pYmJn89SmQTeVL3L0ryhJvptgl6oKap
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_123900_D20A8FA6 
X-CRM114-Status: GOOD (  10.05  )
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
dCBmb3IgdXNlcnNwYWNlIHdpbGwgYmUgdGhlIHNhbWUsIGJ1dCB0aGUKZXhjZXB0aW9uIGluIGhl
YWRlcnNfaW5zdGFsbC5zaCBjYW4gYWxzbyBiZSByZW1vdmVkLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJj
aC9hcmMvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmggfCAyICstCiBzY3JpcHRzL2hlYWRlcnNfaW5z
dGFsbC5zaCAgICAgICB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3N3YWIu
aCBiL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc3dhYi5oCmluZGV4IDhkMWYxZWY0NGJhNy4u
YjJjZWRlMWI3NGI5IDEwMDY0NAotLS0gYS9hcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3N3YWIu
aAorKysgYi9hcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3N3YWIuaApAQCAtMjAsNyArMjAsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKIC8qIE5hdGl2ZSBzaW5nbGUgY3ljbGUgZW5k
aWFuIHN3YXAgaW5zbiAqLwotI2lmZGVmIENPTkZJR19BUkNfSEFTX1NXQVBFCisjaWYgZGVmaW5l
ZChfX0tFUk5FTF9fKSAmJiBkZWZpbmVkKENPTkZJR19BUkNfSEFTX1NXQVBFKQogCiAjZGVmaW5l
IF9fYXJjaF9zd2FiMzIoeCkJCVwKICh7CQkJCQlcCmRpZmYgLS1naXQgYS9zY3JpcHRzL2hlYWRl
cnNfaW5zdGFsbC5zaCBiL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCmluZGV4IDBlNGU5Mzll
ZmM5NC4uNzI3ZjdmODJjMmM3IDEwMDc1NQotLS0gYS9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5z
aAorKysgYi9zY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaApAQCAtNzAsNyArNzAsNiBAQCBjb25m
aWdzPSQoc2VkIC1lICcKICMKICMgVGhlIGZvcm1hdCBpcyA8ZmlsZS1uYW1lPjo8Q09ORklHLW9w
dGlvbj4gaW4gZWFjaCBsaW5lLgogY29uZmlnX2xlYWtfaWdub3Jlcz0iCi1hcmNoL2FyYy9pbmNs
dWRlL3VhcGkvYXNtL3N3YWIuaDpDT05GSUdfQVJDX0hBU19TV0FQRQogYXJjaC9hcm0vaW5jbHVk
ZS91YXBpL2FzbS9wdHJhY2UuaDpDT05GSUdfQ1BVX0VORElBTl9CRTgKIGFyY2gvbmlvczIvaW5j
bHVkZS91YXBpL2FzbS9zd2FiLmg6Q09ORklHX05JT1MyX0NJX1NXQUJfTk8KIGFyY2gvbmlvczIv
aW5jbHVkZS91YXBpL2FzbS9zd2FiLmg6Q09ORklHX05JT1MyX0NJX1NXQUJfU1VQUE9SVAoKLS0g
CjIuNTIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
