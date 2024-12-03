Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D1E64A88
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Dec 2024 12:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=byCJ8BeJHSSmfVAGrhEXbyLyK9Ss5PV9L3sfAHlyP38=; b=tmsg8Nl6caIjL5
	VoqMALoDlzno2/BGomFFzyUKhGzErS54fI76zrMnOJOpDOhBo8Y5CDfiZn08IudfhXwDrJ7FybvxJ
	WbzgKXKonn1eIoNBddh/3qHAB7EAm3bIEm++KWfqvK3osOqtKyt68ob2Y2Nwe6l1TAWUvDhp9V0wm
	LhtPW5AC/IG6MoOOOFAFrtSk33dA6B0ilg/R7GvzEgMcT9iL30mkWd2oVptx4Z5B1I5LkFOckfpQq
	T6ZF8ewS/uGqEUhdnHT/jFSmi4EbzLwOS1zEqkGlj1dc5pZKnVJkPPx7hC/1qboRv4H+CKmOh7qbg
	XAWvJfutFsZgISSmfluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIS9j-00000009S1b-2Hgg;
	Tue, 03 Dec 2024 12:37:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIS9h-00000009S14-0l6C
	for linux-snps-arc@lists.infradead.org;
	Tue, 03 Dec 2024 12:37:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34E7DA4152B;
	Tue,  3 Dec 2024 12:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F88CC4CECF;
	Tue,  3 Dec 2024 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229448;
	bh=69QcTpbm8HYAOEez/L3Ux7Gj2eB8EOWegOb73arSY9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=eAdJ8xP11KMa4dw/P2p5f0dF61hJ8OlvUOKtLwvyvXvCFCzsKOrfx47mDJdfFXzFo
	 lzL18hX1CKWxmQod0RQqfKADCsBVZXlhtd5Rqjy3o/kwjFkwOCWhFqgJctaay9SFOd
	 8Ofc/mD5fArxkigj+/8Y1FkI+UepRHpULZgQ1CihbPImMRX2xrjPahmsmceVv5BPzH
	 WNI0mIgeGxNuYzKeGimbX60nFcjZ9LGrEBXlA0txsXATkCPq3uD84IdbI3DZaRFDaL
	 f8UHmxPbA12uUJlawWSKRgdmHWOvfAXzdVuoFDev97NgN++jWar+oTAzZeY6iZFWZF
	 qS5BlTSZMjANw==
From: Leon Romanovsky <leon@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARC: build: Try to guess GCC variant of cross compiler
Date: Tue,  3 Dec 2024 14:37:15 +0200
Message-ID: <00d3173fe207ab9ba85dc974777a6ccb4656b03c.1733229205.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_043729_280507_9C386D97 
X-CRM114-Status: UNSURE (   9.32  )
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

RnJvbTogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNvbT4KCkFSQyBHQ0MgY29tcGls
ZXIgaXMgcGFja2FnZWQgc3RhcnRpbmcgZnJvbSBGZWRvcmEgMzlpIGFuZCB0aGUgR0NDCnZhcmlh
bnQgb2YgY3Jvc3MgY29tcGlsZSB0b29scyBoYXMgYXJjLWxpbnV4LWdudS0gcHJlZml4IGFuZCBu
b3QKYXJjLWxpbnV4LS4gVGhpcyBpcyBjYXVzaW5nIHRoYXQgQ1JPU1NfQ09NUElMRSB2YXJpYWJs
ZSBpcyBsZWZ0IHVuc2V0LgoKVGhpcyBjaGFuZ2UgYWxsb3dzIGJ1aWxkcyB3aXRob3V0IG5lZWQg
dG8gc3VwcGx5IENST1NTX0NPTVBJTEUgYXJndW1lbnQKaWYgZGlzdHJvIHBhY2thZ2UgaXMgdXNl
ZC4KCkJlZm9yZSB0aGlzIGNoYW5nZToKJCBtYWtlIC1qIDEyOCBBUkNIPWFyYyBXPTEgZHJpdmVy
cy9pbmZpbmliYW5kL2h3L21seDQvCiAgZ2NjOiB3YXJuaW5nOiDigJgtbWNwdT3igJkgaXMgZGVw
cmVjYXRlZDsgdXNlIOKAmC1tdHVuZT3igJkgb3Ig4oCYLW1hcmNoPeKAmSBpbnN0ZWFkCiAgZ2Nj
OiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24g4oCYLW1tZWRpdW0tY2Fs
bHPigJkKICBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiDigJgt
bWxvY2vigJkKICBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlvbiDi
gJgtbXVuYWxpZ25lZC1hY2Nlc3PigJkKClsxXSBodHRwczovL3BhY2thZ2VzLmZlZG9yYXByb2pl
Y3Qub3JnL3BrZ3MvY3Jvc3MtZ2NjL2djYy1hcmMtbGludXgtZ251L2luZGV4Lmh0bWwKU2lnbmVk
LW9mZi1ieTogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNvbT4KLS0tCiBhcmNoL2Fy
Yy9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL01ha2VmaWxlIGIvYXJjaC9hcmMvTWFrZWZp
bGUKaW5kZXggMjM5MGRkMDQyZTM2Li5mYjk4NDc4ZWQxYWIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJj
L01ha2VmaWxlCisrKyBiL2FyY2gvYXJjL01ha2VmaWxlCkBAIC02LDcgKzYsNyBAQAogS0JVSUxE
X0RFRkNPTkZJRyA6PSBoYXBzX2hzX3NtcF9kZWZjb25maWcKIAogaWZlcSAoJChDUk9TU19DT01Q
SUxFKSwpCi1DUk9TU19DT01QSUxFIDo9ICQoY2FsbCBjYy1jcm9zcy1wcmVmaXgsIGFyYy1saW51
eC0gYXJjZWItbGludXgtKQorQ1JPU1NfQ09NUElMRSA6PSAkKGNhbGwgY2MtY3Jvc3MtcHJlZml4
LCBhcmMtbGludXgtIGFyY2ViLWxpbnV4LSBhcmMtbGludXgtZ251LSkKIGVuZGlmCiAKIGNmbGFn
cy15CSs9IC1mbm8tY29tbW9uIC1waXBlIC1mbm8tYnVpbHRpbiAtbW1lZGl1bS1jYWxscyAtRF9f
bGludXhfXwotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1zbnBzLWFyYwo=
