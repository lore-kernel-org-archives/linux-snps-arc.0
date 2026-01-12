Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39E2D2503F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0m9syfsujGi5Z4LOnVYpjZDX/m7gpwyTWX8GDgyiLQ=; b=0Imn1WZP2Mj7Cn
	Q0U0o7sX0YaDHVJoNmsELVkQFB36t0BD1kgXfwuPvSShZdwysP1CVvB/njEMpMRPH+ekygayC4Mws
	7l65jMfARl2KLxL+fE9PGbpbUf+GYjaXeLdYWuAvYACCWJxOp+y2XYNvnu+W47U36VBbQ7/6Y+PKy
	WSGwIbjPgHWiw9rZbIWtbhIprRu3+wA+nnlSSCBZGUPNUYuuARA2yC7JYUlgc3+R++BizW/SKYAbh
	JcTfxcsXSMzNMO7NmbYTvlm/+w2Xb9V8oo7BocFI88WC+sgZ3WehQwDDCkVy4volVEFLDwuBPEsOH
	vBBR0bJvckqxxUboECqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCp0-00000004wLH-05FX;
	Mon, 12 Jan 2026 07:58:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCow-00000004wIz-3Lec;
	Mon, 12 Jan 2026 07:58:40 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768204714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LruWS9bgL9uclP30PRSFfk5G10oz266R8zNDPLNEDn0=;
	b=X/iPbSr2WhCsbIPCBtPUv11meOSFgbRYg2YRS/fSrizxcY3XqIYVlFfOS1olKjUpBIOOGT
	D9P0TPn5tqU0Q5QXrqdLS5qTvTdsYr084ncxWq1JcwxscCzhjLSIClOnIdmqxiJ99dTd62
	fweD5jQUVfZVe1FdgDWHLkDumCPsB377tR6WR7UVSKos5xorTG2N5vuuoSj92Jl4RVIXqM
	1ltUhePEAqgEr27+at4X6Z35H50AN4w12U+DYaHRMoK3O06JgWM0v9Hys6j7MT5LtbulJ1
	2i4xLZ0HLfkttmXarP/O1/Q2bpr91mYV9YF+daZcd7Pmi1r913qs8nNYcBjmPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768204714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LruWS9bgL9uclP30PRSFfk5G10oz266R8zNDPLNEDn0=;
	b=Db2EatKbe7CV5vmXClDvjR7hKP4hoeKYxA9rz/BxSXOyuEdlfqjDbbJC+GdSJ3WPrKHgkl
	ZpQtALIs+WDA9hCg==
Subject: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Date: Mon, 12 Jan 2026 08:58:28 +0100
Message-Id: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKSpZGkC/33NQQ6CMBCF4auQWTumLSGCK+9hiCntABOblrRIM
 IS7W4lrl/9bfG+DRJEpwbXYINLCiYPPoU4FmFH7gZBtblBCVVKpBkfSlmJ6sE+zdg5N8D0P6Eg
 /sat1o2Rj6640kIUpUs/rod/b3COnOcT3cbbI7/pzS/HXXSQKpL7TlalqcSntzbF/zTF4Xs+Wo
 N33/QPASapZygAAAA==
X-Change-ID: 20251229-headers_install-config-leak-b8a9219d8b3c
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768204713; l=1645;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Omi58sNcFPlfpcb80NgNOQYgGVaLrDz0Q3WmxNIaE/A=;
 b=siKiEG63pzaAcjEWKMUseFVtfGbQIsA69DJxTeH82PA2niUYDkywkH6jqlx/B62gz6XRkbhrr
 9LfD15N9UypCngp1M59620AJrGmB60iKRB4fbgEJy0X8yt3I19YCFp8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235838_984778_DDE4E3AD 
X-CRM114-Status: UNSURE (   7.16  )
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
Q2hhbmdlcyBpbiB2MjoKLSBEcm9wIEFSQ19IQVNfU1dBUEUga2NvbmZpZyBvcHRpb24sIHVzZSBB
UkNIX1VTRV9CVUlMVElOX0JTV0FQCi0gRHJvcCBQU1JfRU5EU1RBVEUgZnJvbSB0aGUgQVJNIHB0
cmFjZS5oIGhlYWRlci4KLSBEcm9wIG5pb3MyIHVhcGkgYXNtL3N3YWIuaC4KLSBMaW5rIHRvIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMjMwLWhlYWRlcnNfaW5zdGFsbC1jb25m
aWctbGVhay12MS0wLWVmYmE1YzU4MDczZEBsaW51dHJvbml4LmRlCgotLS0KVGhvbWFzIFdlacOf
c2NodWggKDUpOgogICAgICBBUkM6IEFsd2F5cyB1c2UgU1dBUEUgaW5zdHJ1Y3Rpb25zIGFuZCBl
bmFibGUgQVJDSF9VU0VfQlVJTFRJTl9CU1dBUAogICAgICBBUk06IHVhcGk6IERyb3AgUFNSX0VO
RFNUQVRFCiAgICAgIG5pb3MyOiB1YXBpOiBSZW1vdmUgY3VzdG9tIGFzbS9zd2FiLmggZnJvbSBV
QVBJCiAgICAgIHg4Ni91YXBpOiBTdG9wIGxlYWtpbmcga2NvbmZpZyByZWZlcmVuY2VzIHRvIHVz
ZXJzcGFjZQogICAgICBzY3JpcHRzOiBoZWFkZXJzX2luc3RhbGwuc2g6IFJlbW92ZSBjb25maWcg
bGVhayBpZ25vcmUgbWFjaGluZXJ5CgogYXJjaC9hcmMvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA2ICstCiBhcmNoL2FyYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDMgKy0KIGFyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc3dhYi5oICAgICAgICAgfCA5OSAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcm0vaW5jbHVkZS9hc20vcHJv
Y2Vzc29yLmggICAgICAgICB8ICAzICstCiBhcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNtL3B0cmFj
ZS5oICAgICAgIHwgIDkgLS0tCiBhcmNoL2FybS9rZXJuZWwvc2lnbmFsLmMgICAgICAgICAgICAg
ICAgIHwgIDMgKy0KIGFyY2gvbmlvczIvaW5jbHVkZS97dWFwaSA9PiB9L2FzbS9zd2FiLmggfCAg
MAogYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaCAgICAgICB8ICAyICstCiBzY3Jp
cHRzL2hlYWRlcnNfaW5zdGFsbC5zaCAgICAgICAgICAgICAgIHwgMzAgKy0tLS0tLS0tLQogOSBm
aWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE0NiBkZWxldGlvbnMoLSkKLS0tCmJhc2Ut
Y29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhkMGQwNDAyN2NiMWU4CmNoYW5nZS1p
ZDogMjAyNTEyMjktaGVhZGVyc19pbnN0YWxsLWNvbmZpZy1sZWFrLWI4YTkyMTlkOGIzYwoKQmVz
dCByZWdhcmRzLAotLSAKVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0
cm9uaXguZGU+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
