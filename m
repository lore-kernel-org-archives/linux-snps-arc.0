Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226A9E9411F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oUtOWk+ocfbO8RiRiBQNVsSxwqoNgX5GR1+gq0nvkI=; b=l+5MhT+khEDKOs
	AlSjgp/+Cj+LH2kEW/IHOh/GbkvY0221ZvNHNIIW9QOqoCVb6jxAqUBv7fZC5JacHuXAr4LUzzUEI
	MsKp0llXHU5JtBUpIUVZ6qcVYVri8nZWgx0nWOTULA661B283n6Pd4IYnMVpqEnLPcYjG3fn/2ZEi
	P4CrdCTWVfDwY34oeg6GfxqSlBpRdRE6a9uEM38mckQoz9O8TiIZOgJAcxbmJsaZVVU8ag4uPmaIe
	BjmNuSJkaysrAkT2EgdWILY0/c6qSYnf+c130syEGBsF6bFzd5tG3qU3KIy4ivxRfJqSvw8skj58A
	94FnI0zI9We7Xhl12/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsv-00000004Urg-3Q33;
	Tue, 30 Dec 2025 07:11:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTso-00000004UlP-1mD8;
	Tue, 30 Dec 2025 07:11:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=;
	b=eI+ulv6EecfcGflQRPoc2vHM0nkxzmkswCtLR6gSJZ8zOXD2xkfuvc3n7lxrSd4hx3jFvc
	ZK+JIDZ424h+vq+3ltldhv3xs72qPnqPx4W9MGOppxGxSUmSAbgzYDTCLLDdIMjLAxIdbT
	BZb+CjQckrOb+Zcq6BcE/HxNItK7sUqm5e/jUA4nAhkomhhzwXeTVJAnEKPr07xmE4yViU
	zJKzDjnH3jPu8dFqXKjMYujavKXjWULsB2m+Kd328Ev2QHr7p6UrYcMWVPIlRX836CSfdH
	33yqn2PySFlYIafa0kTuDs7kdgs1QLk5iRb7HG/u4elhXG0AhcmLS+0Sxa2NiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nm08QPvja+X8sRm8npcNZeirzQwsu4YExZqsNCkcus=;
	b=XeZFnivbaGws1YFVRSE6I5UJKD//1/a5LT4SNhlbj6BbogesPE1OR89CZQp3DYTp6uAX3G
	gd32wsqBDU+w5SAw==
Date: Tue, 30 Dec 2025 08:11:00 +0100
Subject: [PATCH 5/5] scripts: headers_install.sh: Remove config leak ignore
 machinery
MIME-Version: 1.0
Message-Id: <20251230-headers_install-config-leak-v1-5-efba5c58073d@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1231;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3m2ChPrsGt9AyZmjEghF2edS4ROwGKo0RjvgqUHiJ78=;
 b=w5y4GhWvN+Pxg5pF5YeO1iV331ad5+hzF2z+stSOqnSr6vKFsxQnMT/epvhMh2rMx3tw7qzat
 yi8NDsGyvfkD4Iulhz4DYvgNpnBCmNhOoGHlNnD0SXIFi+c6kH7Q9dZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231106_621593_DAFA48BF 
X-CRM114-Status: GOOD (  10.51  )
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

VGhlcmUgYXJlIG5vIGVudHJpZXMgbGVmdCB0byBpZ25vcmUgYW5kIG5vbmUgc2hvdWxkIGJlIGFk
ZGVkIGFnYWluLgoKUmVtb3ZlIHRoZSBub3cgdW51c2VkIGxvZ2ljLgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQog
c2NyaXB0cy9oZWFkZXJzX2luc3RhbGwuc2ggfCAyNCArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoIGIvc2NyaXB0cy9oZWFkZXJzX2luc3Rh
bGwuc2gKaW5kZXggMTMwMWJhNjhkNzcyLi45YzE1ZTc0ODc2MWMgMTAwNzU1Ci0tLSBhL3Njcmlw
dHMvaGVhZGVyc19pbnN0YWxsLnNoCisrKyBiL3NjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoCkBA
IC02NCwzMCArNjQsMTAgQEAgY29uZmlncz0kKHNlZCAtZSAnCiAJZAogJyAkT1VURklMRSkKIAot
IyBUaGUgZW50cmllcyBpbiB0aGUgZm9sbG93aW5nIGxpc3QgZG8gbm90IHJlc3VsdCBpbiBhbiBl
cnJvci4KLSMgUGxlYXNlIGRvIG5vdCBhZGQgYSBuZXcgZW50cnkuIFRoaXMgbGlzdCBpcyBvbmx5
IGZvciBleGlzdGluZyBvbmVzLgotIyBUaGUgbGlzdCB3aWxsIGJlIHJlZHVjZWQgZ3JhZHVhbGx5
LCBhbmQgZGVsZXRlZCBldmVudHVhbGx5LiAoaG9wZWZ1bGx5KQotIwotIyBUaGUgZm9ybWF0IGlz
IDxmaWxlLW5hbWU+OjxDT05GSUctb3B0aW9uPiBpbiBlYWNoIGxpbmUuCi1jb25maWdfbGVha19p
Z25vcmVzPSIKLSIKLQogZm9yIGMgaW4gJGNvbmZpZ3MKIGRvCi0JbGVha19lcnJvcj0xCi0KLQlm
b3IgaWdub3JlIGluICRjb25maWdfbGVha19pZ25vcmVzCi0JZG8KLQkJaWYgZWNobyAiJElORklM
RTokYyIgfCBncmVwIC1xICIkaWdub3JlJCI7IHRoZW4KLQkJCWxlYWtfZXJyb3I9Ci0JCQlicmVh
awotCQlmaQotCWRvbmUKLQotCWlmIFsgIiRsZWFrX2Vycm9yIiA9IDEgXTsgdGhlbgotCQllY2hv
ICJlcnJvcjogJElORklMRTogbGVhayAkYyB0byB1c2VyLXNwYWNlIiA+JjIKLQkJZXhpdCAxCi0J
ZmkKKwllY2hvICJlcnJvcjogJElORklMRTogbGVhayAkYyB0byB1c2VyLXNwYWNlIiA+JjIKKwll
eGl0IDEKIGRvbmUKIAogcm0gLWYgJFRNUEZJTEUKCi0tIAoyLjUyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
