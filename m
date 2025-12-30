Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD36E94116
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SRyQXcdvZgyIsUhI3UC9moqZYl7rATXkRfA3EaQhsVg=; b=2dQlB4YE5TQgvi
	WRuq+SEf3jJyPymTo4pbqbkpF3uu7FhzDfIniTfb5HhJf9Z67M/z4P+LRUA1Jcss5p7EAbDyOgG/X
	cZ9MObY+AKKnr0EJ//Vh7kQdzLjNG6KwUT3QBCjLYyx/MSuvVBCYaP4HTYE1HCngbbHz4dmrZTubG
	YWNlQjvABWcpBUOa4CjDgu0JSM66tIupmys4N7mP5Ut/osxgIxVXYHKVSK6scIfRQOT5Hz5miSAYp
	hd5JREhKigQKllXjwh5TC0J1Jz7m/2gXRQMr0T/NAxRm4k81Q+21HK2Z6CGJZYgEzVXXJjo4BFjsi
	2uMEkQgMwblxnnmPl11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTso-00000004UmS-3ruJ;
	Tue, 30 Dec 2025 07:11:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujo-3Fo8;
	Tue, 30 Dec 2025 07:11:04 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sa39lfrywozshHjUOd0QqKWLPIfeYAU14+UfJcFQKAw=;
	b=SasWZcLIxY1ZqsQFgmJqfPq18eV8KYliz7FxkDmpXmRXilxx2h6pDPc84OwKLSMSUx7Bj8
	sz3svT2F4w/KZAHDK+Zs4ADRpzgJ4jW6KFrBR4yz9G9962/p4C8MG+sTu52Qfk/aAQpngJ
	0euGrTcIuE+PUL2WbhEbWBRbNw8hTHw3muBBFrmcpQeuErxPDPNxRS0FC+AxAt+7TGTxS4
	ppua8FUjg0k47wbhjFyO/MIUMUrz//lvFPUhkSRX8d9AukOvLeRAS6/8BQt0gKa24AAe7S
	FPELjrsyO5qw7WnNcT42ICEwOt5glmMLCAlEK02nxsS2Q8f6Udten12heiPEhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sa39lfrywozshHjUOd0QqKWLPIfeYAU14+UfJcFQKAw=;
	b=USB0X405bczNGlaE1WzQDIIdqzYD+2mpODVHwjTpJ/pQNwUG3pXZ9BavujUpWH2nBacELY
	kVLcoUPsDC69QFBA==
Subject: [PATCH 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Date: Tue, 30 Dec 2025 08:10:55 +0100
Message-Id: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP96U2kC/x3MUQqDMAwA0KtIvg2skYHdVYZIbKOGlSqNjIF4d
 8s+3887waSoGLyaE4p81XTLFa5tIKycF0GN1UAPejoij6twlGKjZjs4JQxbnnXBJPzBqWdPzsd
 +6gLUYS8y6++/v4frugF8C0TtbQAAAA==
X-Change-ID: 20251229-headers_install-config-leak-b8a9219d8b3c
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1197;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ROM+0B5pgXepje/uif9VYbF7UjhihvMVKWe93PkPMFU=;
 b=btRZRWxwkyz+l3mSxrXtg+4ibvHwOXultE53vihV/3iNWtus0ZPxUB3Q0EF66yyP89dOKZ0WA
 KapArctkpS6CmWwQgfJKIYi54oqSNxnIgJxRzlE1shXgql5UhBsEZUc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_122351_5B35D255 
X-CRM114-Status: UNSURE (   5.65  )
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

QSBmZXcgVUFQSSBoZWFkZXJzIHN0aWxsIGNvbnRhaW5lZCByZWZlcmVuY2VzIHRvIGtjb25maWcg
c3ltYm9scy4KQ2xlYW4gdGhlbSBhbGwgdXAgYW5kIGFmdGVyd2FyZHMgcmVtb3ZlIHRoZSBub3cg
dXNlbGVzcyBleGNlcHRpb24KbWFjaGluZXJ5IGluIGhlYWRlcnNfaW5zdGFsbC5zaC4KCkludGVu
ZGVkIHRvIGJlIHJvdXRlZCB0aHJvdWdoIHRoZSBrYnVpbGQgdHJlZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
VGhvbWFzIFdlacOfc2NodWggKDUpOgogICAgICBBUkM6IHVhcGk6IFN0b3AgbGVha2luZyBDT05G
SUdfQVJDX0hBU19TV0FQRSByZWZlcmVuY2UgdG8gdXNlcnNwYWNlCiAgICAgIEFSTTogdWFwaTog
U3RvcCBsZWFraW5nIENPTkZJR19DUFVfRU5ESUFOX0JFOCByZWZlcmVuY2UgdG8gdXNlcnNwYWNl
CiAgICAgIG5pb3MyOiB1YXBpOiBTdG9wIGxlYWtpbmcgQ09ORklHX05JT1MyX0NJX1NXQUJfe05P
LFNVUFBPUlR9IHJlZmVyZW5jZXMgdG8gdXNlcnNwYWNlCiAgICAgIHg4Ni91YXBpOiBTdG9wIGxl
YWtpbmcga2NvbmZpZyByZWZlcmVuY2VzIHRvIHVzZXJzcGFjZQogICAgICBzY3JpcHRzOiBoZWFk
ZXJzX2luc3RhbGwuc2g6IFJlbW92ZSBjb25maWcgbGVhayBpZ25vcmUgbWFjaGluZXJ5CgogYXJj
aC9hcmMvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmggICB8ICAyICstCiBhcmNoL2FybS9pbmNsdWRl
L3VhcGkvYXNtL3B0cmFjZS5oIHwgIDIgKy0KIGFyY2gvbmlvczIvaW5jbHVkZS91YXBpL2FzbS9z
d2FiLmggfCAgMiArKwogYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCB8ICAyICst
CiBzY3JpcHRzL2hlYWRlcnNfaW5zdGFsbC5zaCAgICAgICAgIHwgMzAgKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzEgZGVs
ZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBk
MDQwMjdjYjFlOApjaGFuZ2UtaWQ6IDIwMjUxMjI5LWhlYWRlcnNfaW5zdGFsbC1jb25maWctbGVh
ay1iOGE5MjE5ZDhiM2MKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
