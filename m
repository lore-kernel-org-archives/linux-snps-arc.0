Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0802C04FFE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 May 2024 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CdtvBYbzDHRI/ddDJTz2lPEfFz7sjYwNr5iCRu+iWIc=; b=jmuoD38VGM436/
	4QyayKhxYCHiro8s3xXCuv6REVlrSr0ttir38Usn6GfttaYiiS5GXtUMJWj8NCIsWJQA2APj6I3M5
	1nLVuc/9keaU/kj5TOa42jvSwYC65zQvWWXk2s1jL7wB47Hp/Qjl8LP5vNqWg3QIZmluH9M4Qr5K7
	492A9Xu7IWDlvfKWj5ejzk7APwPFlU+x9IrONyx8Q0hu5WPMZ0syaSWjoMCpP+FTgdW2v7ZMSVsAW
	fm27y6deXcESw62rJH5fPf5RGblBTLlxBDpPqt9nqrgwC805OguM89J1nX28oP5hq5yUFbJMxlM2M
	l2tyF5Whg8xdlFbHbYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s944P-0000000Ehmr-3oSe;
	Mon, 20 May 2024 14:32:57 +0000
Received: from fmfe14.freemail.hu ([46.107.16.207] helo=smtp-out.freemail.hu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s944N-0000000Ehm6-0xnQ
	for linux-snps-arc@lists.infradead.org;
	Mon, 20 May 2024 14:32:56 +0000
Received: from fizweb.elte.hu (fizweb.elte.hu [157.181.183.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4Vjfyr65TbzgX;
	Mon, 20 May 2024 16:27:00 +0200 (CEST)
From: egyszeregy@freemail.hu
To: vgupta@kernel.org,
	pasha.tatashin@soleen.com,
	kent.overstreet@linux.dev,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] arc: rename aux.h to arc_aux.h
Date: Mon, 20 May 2024 16:26:47 +0200
Message-Id: <20240520142647.70440-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1716215221;
 
	s=20181004; d=freemail.hu;
 
	h=From:To:Cc:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 
	l=2297; bh=9zxQy+6Bi08HDP4ghvGzDmmjLAAoSIfkUlTLTmqf+Co=;
 
	b=jywbwGazbNSiU9j+vnzoACV6BWbm+X2x9aOKn7BlgwjvH+L8nqey9n4Z3/tawXgn
 
	pVEOD68I+yV2XbEsrsf8UuJSUJZrxw0HSmRxuyaVRwSIUiLhj5za7RcfKzk4/zsx03t
 
	QZryEzN6imZJHOsuQojp0UvqNQahaHGvqDakQttFB54+5WhXWeokk0QyosZwtQmSOAX
 
	wqo/BYhp69Ss9vY/gVgqn9GuxeCKQ7bgNwdMeh/1+HppRwUxcLoFraP7v40G1u91hKJ
 
	wTCPP8uYFcm/lI3mNfIwyce8YRshhgol4HIDO3OvLIbLvWNaEFDC4OiHfST2jzjrLRj
 
	a9SjFVOMhA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_073255_456061_D7A00A46 
X-CRM114-Status: UNSURE (   8.80  )
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

RnJvbTogQmVuamFtaW4gU3rFkWtlIDxlZ3lzemVyZWd5QGZyZWVtYWlsLmh1PgoKVGhlIGdvYWwg
aXMgdG8gY2xlYW4tdXAgTGludXggcmVwb3NpdG9yeSBmcm9tIEFVWCBmaWxlIG5hbWVzLCBiZWNh
dXNlCnRoZSB1c2Ugb2Ygc3VjaCBmaWxlIG5hbWVzIGlzIHByb2hpYml0ZWQgb24gb3RoZXIgb3Bl
cmF0aW5nIHN5c3RlbXMKc3VjaCBhcyBXaW5kb3dzLCBzbyB0aGUgTGludXggcmVwb3NpdG9yeSBj
YW5ub3QgYmUgY2xvbmVkIGFuZAplZGl0ZWQgb24gdGhlbS4KClNpZ25lZC1vZmYtYnk6IEJlbmph
bWluIFN6xZFrZSA8ZWd5c3plcmVneUBmcmVlbWFpbC5odT4KLS0tCiBhcmNoL2FyYy9pbmNsdWRl
L2FzbS9hcmNyZWdzLmggICAgICAgfCAyICstCiBhcmNoL2FyYy9pbmNsdWRlL2FzbS9tbXUtYXJj
djIuaCAgICAgfCAyICstCiBpbmNsdWRlL3NvYy9hcmMve2F1eC5oID0+IGFyY19hdXguaH0gfCAw
CiBpbmNsdWRlL3NvYy9hcmMvbWNpcC5oICAgICAgICAgICAgICAgfCAyICstCiBpbmNsdWRlL3Nv
Yy9hcmMvdGltZXJzLmggICAgICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBpbmNsdWRlL3NvYy9hcmMve2F1eC5o
ID0+IGFyY19hdXguaH0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcmMvaW5jbHVkZS9hc20v
YXJjcmVncy5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vYXJjcmVncy5oCmluZGV4IDRiMTNmNjBm
ZTdjYS4uMDA1ZDllNGQxODdhIDEwMDY0NAotLS0gYS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9hcmNy
ZWdzLmgKKysrIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vYXJjcmVncy5oCkBAIC0xNDYsNyArMTQ2
LDcgQEAKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAotI2luY2x1ZGUgPHNvYy9hcmMvYXV4Lmg+
CisjaW5jbHVkZSA8c29jL2FyYy9hcmNfYXV4Lmg+CiAKIC8qIEhlbHBlcnMgKi8KICNkZWZpbmUg
VE9fS0IoYnl0ZXMpCQkoKGJ5dGVzKSA+PiAxMCkKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1
ZGUvYXNtL21tdS1hcmN2Mi5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vbW11LWFyY3YyLmgKaW5k
ZXggZDg1ZGMwNzIxOTA3Li40MTQxMjY0MmYyNzkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJjL2luY2x1
ZGUvYXNtL21tdS1hcmN2Mi5oCisrKyBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL21tdS1hcmN2Mi5o
CkBAIC05LDcgKzksNyBAQAogI2lmbmRlZiBfQVNNX0FSQ19NTVVfQVJDVjJfSAogI2RlZmluZSBf
QVNNX0FSQ19NTVVfQVJDVjJfSAogCi0jaW5jbHVkZSA8c29jL2FyYy9hdXguaD4KKyNpbmNsdWRl
IDxzb2MvYXJjL2FyY19hdXguaD4KIAogLyoKICAqIFRMQiBNYW5hZ2VtZW50IHJlZ3MKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvc29jL2FyYy9hdXguaCBiL2luY2x1ZGUvc29jL2FyYy9hcmNfYXV4LmgK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIGluY2x1ZGUvc29jL2FyYy9hdXguaApy
ZW5hbWUgdG8gaW5jbHVkZS9zb2MvYXJjL2FyY19hdXguaApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9z
b2MvYXJjL21jaXAuaCBiL2luY2x1ZGUvc29jL2FyYy9tY2lwLmgKaW5kZXggZDFhOTNjNzNmMDA2
Li5hNzhkYWNkMTQ5ZjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc29jL2FyYy9tY2lwLmgKKysrIGIv
aW5jbHVkZS9zb2MvYXJjL21jaXAuaApAQCAtOCw3ICs4LDcgQEAKICNpZm5kZWYgX19TT0NfQVJD
X01DSVBfSAogI2RlZmluZSBfX1NPQ19BUkNfTUNJUF9ICiAKLSNpbmNsdWRlIDxzb2MvYXJjL2F1
eC5oPgorI2luY2x1ZGUgPHNvYy9hcmMvYXJjX2F1eC5oPgogCiAjZGVmaW5lIEFSQ19SRUdfTUNJ
UF9CQ1IJMHgwZDAKICNkZWZpbmUgQVJDX1JFR19NQ0lQX0lEVV9CQ1IJMHgwRDUKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc29jL2FyYy90aW1lcnMuaCBiL2luY2x1ZGUvc29jL2FyYy90aW1lcnMuaApp
bmRleCBhZTk5ZDNlODU1ZjEuLjUxYTc0MTY2Mjk2YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zb2Mv
YXJjL3RpbWVycy5oCisrKyBiL2luY2x1ZGUvc29jL2FyYy90aW1lcnMuaApAQCAtNiw3ICs2LDcg
QEAKICNpZm5kZWYgX19TT0NfQVJDX1RJTUVSU19ICiAjZGVmaW5lIF9fU09DX0FSQ19USU1FUlNf
SAogCi0jaW5jbHVkZSA8c29jL2FyYy9hdXguaD4KKyNpbmNsdWRlIDxzb2MvYXJjL2FyY19hdXgu
aD4KIAogLyogVGltZXIgcmVsYXRlZCBBdXggcmVnaXN0ZXJzICovCiAjZGVmaW5lIEFSQ19SRUdf
VElNRVIwX0xJTUlUCTB4MjMJLyogdGltZXIgMCBsaW1pdCAqLwotLSAKMi4zOS4zCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
