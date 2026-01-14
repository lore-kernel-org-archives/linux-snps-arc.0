Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A1ED31A15
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EHAof4f2VC+B94eTNsooumejwueQgqImTb5ZPWmjdzE=; b=L5HrG+Pk+QHL17
	Fx2RlFFHkJ6j/8Wvq4JRiVBKCi6MwcOY0xkGLLEJ9WYQIHnaNXO9115WOHBph3ZYEa3xDWaZGydT5
	9Qw05jEZcwA1lxDtzqhAh3T9MYsfoInVt7jNKM8xs5Xa5tITeqxYFGVgnRmBXSml4SxvOMZ7CBACm
	oHm6H6x3qmYDnZ5cUEIq9AYeOuSM/ObmNdLInp6tQzNcLt/BJwjcRBtmEfu2vULLNrGhoY+8xNKq1
	KG80qqrXT8ZWDFy3mSLuXD3eyB4Zy04FAXFMFAFqxV2fSbdbO8YlLdSvG4EsH0VLUqtoOb69el/he
	URSioCd1lnmmrIZUQzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIq-00000008CDw-2eQk;
	Wed, 14 Jan 2026 07:28:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIn-00000008CBP-27cH;
	Wed, 14 Jan 2026 07:28:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXOoPefyW4YJoJDaug/A7xf5w8lSV44uaqzA/Tcxgcw=;
	b=WPAE4nVN356pmJs2KHN1PTaTncE6vb8ROHVeBoRXn/B2cXoNErp09wKpaFt+MuTU6Zp1DC
	qjYT5wtDe3ycc5/wVQ4HzzOvcyQP3dxvGQB+2w0nNMJxAKU1y9bGgCh/TQ2EjIYBC2ACOA
	7fDelQ2KoW2FJCD3w3ULleViyqRQsllNTGm7pucnlLpN1ctETXeM4fv5QO4DZDKDOXhJef
	CKhG82j5Bv0Wje9hIyScox5qfJXze/knv+wmF+/L+e/pX5kPcuxSp34KFi2UXlinCBvTr4
	cM1X3GdmYYHJbnOC+jzod3zwFULfVMvqdsxhpMwA6+SSOdkronVqb69FpkNn5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXOoPefyW4YJoJDaug/A7xf5w8lSV44uaqzA/Tcxgcw=;
	b=hQyPK7F/cdd3hb3Xe4yGcEZmoYY4bMQY04jZRtPZs8lAoVAh7UEtH5zw01v1e3NTOQkZM/
	F2YT58m4xCWCcKCQ==
Subject: [PATCH v3 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Date: Wed, 14 Jan 2026 08:28:12 +0100
Message-Id: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIxFZ2kC/33NTQ6CMBCG4auQrq3pD2Bx5T2MMYUOMLEppsUGQ
 7i7hejGBbN7Z/F8MwngEQI5ZzPxEDHg4FLIQ0aaXrsOKJrURDBRcCEq2oM24MMdXRi1tbQZXIs
 dtaAftFa6ErwyqpYNScLTQ4vTpl9vqXsM4+Df21jk6/frSrbrRk4ZhbbWRVModpLmYtG9Rj84n
 I4GyGpH8fNKxrnY90TycqOYytOVTP57y7J8AKAD47kaAQAA
X-Change-ID: 20251229-headers_install-config-leak-b8a9219d8b3c
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=1833;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=O3gy1aejCT+Re+qAfKDxCmkgzvWYuY4jLw++qa5054M=;
 b=EDQmfJkXOCC6sUNJXISeegObpPcU0uJNUnCPIg4H5uBC6WqbN3ayHFAqduV0YSKTgMR/8vIZB
 ZbTbsTiYK4dCFfS+WUIHqX1knRF+WbVZH/DBwuh96qIsfIUoCvFC2eT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232825_687777_96259B28 
X-CRM114-Status: UNSURE (   7.12  )
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
Q2hhbmdlcyBpbiB2MzoKLSBSZXBsYWNlIEFSQ0hfVVNFX0JVSUxUSU5fQlNXQVAgd2l0aCBtYW51
YWwgJ3N3YXBlJyBpbmxpbmUgYXNtLgotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNjAxMTItaGVhZGVyc19pbnN0YWxsLWNvbmZpZy1sZWFrLXYyLTAtNGQ4MDg0NDQ0
NjAzQGxpbnV0cm9uaXguZGUKCkNoYW5nZXMgaW4gdjI6Ci0gRHJvcCBBUkNfSEFTX1NXQVBFIGtj
b25maWcgb3B0aW9uLCB1c2UgQVJDSF9VU0VfQlVJTFRJTl9CU1dBUAotIERyb3AgUFNSX0VORFNU
QVRFIGZyb20gdGhlIEFSTSBwdHJhY2UuaCBoZWFkZXIuCi0gRHJvcCBuaW9zMiB1YXBpIGFzbS9z
d2FiLmguCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTIzMC1o
ZWFkZXJzX2luc3RhbGwtY29uZmlnLWxlYWstdjEtMC1lZmJhNWM1ODA3M2RAbGludXRyb25peC5k
ZQoKLS0tClRob21hcyBXZWnDn3NjaHVoICg1KToKICAgICAgQVJDOiBBbHdheXMgdXNlIFNXQVBF
IGluc3RydWN0aW9ucyBmb3IgX19hcmNoX3N3YWIzMigpCiAgICAgIEFSTTogdWFwaTogRHJvcCBQ
U1JfRU5EU1RBVEUKICAgICAgbmlvczI6IHVhcGk6IFJlbW92ZSBjdXN0b20gYXNtL3N3YWIuaCBm
cm9tIFVBUEkKICAgICAgeDg2L3VhcGk6IFN0b3AgbGVha2luZyBrY29uZmlnIHJlZmVyZW5jZXMg
dG8gdXNlcnNwYWNlCiAgICAgIHNjcmlwdHM6IGhlYWRlcnNfaW5zdGFsbC5zaDogUmVtb3ZlIGNv
bmZpZyBsZWFrIGlnbm9yZSBtYWNoaW5lcnkKCiBhcmNoL2FyYy9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgLS0tCiBhcmNoL2FyYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKy0KIGFyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc3dhYi5oICAgICAgICAg
fCA2MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcm0vaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmggICAgICAgICB8ICAzICstCiBhcmNoL2FybS9pbmNsdWRlL3VhcGkvYXNt
L3B0cmFjZS5oICAgICAgIHwgIDkgLS0tLS0KIGFyY2gvYXJtL2tlcm5lbC9zaWduYWwuYyAgICAg
ICAgICAgICAgICAgfCAgMyArLQogYXJjaC9uaW9zMi9pbmNsdWRlL3t1YXBpID0+IH0vYXNtL3N3
YWIuaCB8ICAwCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oICAgICAgIHwgIDIg
Ky0KIHNjcmlwdHMvaGVhZGVyc19pbnN0YWxsLnNoICAgICAgICAgICAgICAgfCAzMCArLS0tLS0t
LS0tLS0tLS0KIDkgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25z
KC0pCi0tLQpiYXNlLWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBkMDQwMjdj
YjFlOApjaGFuZ2UtaWQ6IDIwMjUxMjI5LWhlYWRlcnNfaW5zdGFsbC1jb25maWctbGVhay1iOGE5
MjE5ZDhiM2MKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
