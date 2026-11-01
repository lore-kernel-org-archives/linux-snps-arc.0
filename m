Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC93606A338
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IPOBFJFi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=JP7risWM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wqG4Mz8E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=IvgdTA0B54QIx1TNanxz2IWYpGGxlf36SJmQ53kQ1h0=; b=IPOBFJFiLjKLkSPlOGB85TWvzM
	dFJQgVyfNR+tZ0R/MfhvuSvTN2amG61mE6i1YnsI0Awu5w4Zvg/zGB7eelE7UIWPxgCwU7ZccJaGK
	5io4GGa6ev70ry885ToGpB0tVok2g1Q+5rwniHSBfs4zX2Ux8QK3EE4OsaFTV3TPnnk3s05Y6YoS3
	hI2pvFRsHn5dXxNYYv8h5X0z7Armp/6PmpyWEFgNG0u863MNdWUxI9uxBPkDBJLLQfHAIFZ6CfHhT
	Yax0KRgLFMkcxNkFo8qiOL2xO246nc59xvXuAIGbeh4NRg8lTBcr9cXQHQMSBLKWym9JKDGRoe9VC
	ftBhxi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTbl-0000000E8RF-1Siw;
	Sun, 01 Nov 2026 11:20:17 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTbi-0000000E8Qr-1zXx
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Nov 2026 11:20:15 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 326AD140021B
	for <linux-snps-arc@lists.infradead.org>; Sun,  1 Nov 2026 06:20:13 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 01 Nov 2026 06:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793532010;
	 x=1793618410; bh=AR7KeiImAKAGT3RDLJDFL80BXJiLYwayh2zGhuN99is=; b=
	JP7risWM7s9MnW3Or9CymgnEBFHHKx33AO6ub0Egl+9bYXYLoKEWaJIV4XsG+D69
	zAl/v4ezObtaIJ0GGR9oDOF2ULiCNfExwTe9ilo5EZC2fxIHnV1/wHlvTPMKuPHv
	1XjOE4xiPWozQ5BvbsxsTk8yQQq/pQ4G+IdcTgQAgaGghCkPOkFuGfH/WpavHRcH
	L/E+bZREdMarNtf3Cq8HXb5T0R2g9IJqiFvz0IR0EnraBo+t9JtpClOy5ED5gxmI
	mdkBSzb22GL6wkPP41h87J0R4iNhJe2/Hq3UV19axR/QVc6br2tUvyt8W6ej/K6R
	4suxBFjMxZ8c5hfgbeGLFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793532010; x=
	1793618410; bh=AR7KeiImAKAGT3RDLJDFL80BXJiLYwayh2zGhuN99is=; b=w
	qG4Mz8E1BsqlHQ7YpmTnVyAme4pUKy1G9pCZwIivw4tVSZsgvJzAZJo/5+19pA0r
	tdsXjSLAb6HqcuNOLNxjKKiz6uiaNw8Rh2eAPxcW15YuOHOF1r5REjjwNQ2MlrUB
	bASxkeYAHDD65ZsD1agpI+oAc32SUvaDF8V0MW3X+Jemb/iEQ1R1IhcAqNKrpPYs
	FbkkMsaIQfuxWsKbo198TlfQxhGPiBQSvEkBgQ7uaKOMLUnmguLiNJqFexTFnCxE
	B3e4pgvfoyr+OyYKMfTSFckuAgmGaTgcEYYizv/CHjbdotN2D7xgEhca7/NsapeS
	QzwqCARqoot3GqC0R7HyQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793532010; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:HjzOxG+BBbjwJX/CGM4FuSFnbh4XE1PCFR31N+GbVAkaqFn
	xljw9rndfBhPuUcZCOPAjSCxDjQkth/7Q8HIVkRlQaGfDZWst+Pl8f0ODKqwKTvH
	ZibNjW4Sc3ytWDJLKxiO4bC11yYFeUddeWQVswIkP7WxCYhGWz4ZCizEGLGrcgDX
	klheQtjl31WV/zvzDtlJtZI5B5cUJP4y7pF+4lDKCs543nj82buLpFdVlaBo+FeY
	StgOG32QAmcZKt7Y8DFXQXtL8nlxe5fJkh3shDoksyG9ldwBJKqtU3QThaNjH23q
	TeLfCsy0TuV43XKcPE9/F9xtMzjCMguKiBVxz4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xvWc2I2uWzxz9a+9OTFmKblJ1M8ZKEA+BnLF6s+JzKw=:DCU0XSxu0Cgb71JY/lQBbLj5A5ApBrrzZ4yZzi2QJx4=;
X-ME-Sender: <xms:ZiDnav1EgjBw1vmjlVMR8OBojQev_7I5SI7OAEc9ib4et0jFZgxkgQ>
    <xme:ZiDnao6BPYzg-vs7a5Sl4rIx7zTt8iTxYd_dQBkk_Puhc4I96r1MnXV8PdyzVI8d1
    OnsSOk1psHYHAexqLB3bfBiFpZp2BbKjPWGDO4d7TCZDqUXyyeCX2U>
X-ME-Proxy-Cause: dmFkZTGwXwjaijkdfwdLTDS1rJfoLQWQwx/OAGcc1wJWXzOV1LlplydKYfLs7sS3u2ic62
    CzmXdvRhZjRZGtDfGhtKARvLCtcOHzTxamYAY1vpeT9vjCt7kBSjW/vpGBUUmizvEJGKq6
    HkqF3xMdewiKgZlnnl159Lr7mHqRKTudhZbE10HWQVv9w5n7RlQsBFoq6w7bB+eewqatia
    yVvCxIbIwQoFkA0HtrFVYZqQFw9H0MbHp9asXu+PqBTYcgfs5J8p38Ocb45DoWEUi37MwQ
    ziM//GXR0xixs0EBHrvoPsgRCYRgU839aioly6QJeQyTomb68QuPIpfSity3TpmwqTfbaI
    2y+LmdhzM3COgeiwVX+NmpxPzJj+RhgZyOYhGXNVmou9eSv6fAShKmECpOkqi2xxvw5aED
    IoUMsdghLUhudH7svI8U1TIQNe0AH0XIB7qihGZmpGiLRr2x8mqP5BdD/QOoKyzu0t+44L
    epiU4YyDc/6XkrZ9asaxajrCZVp88aZL1BEdpGae9/m/6vjI1bO0qcZ4I1g21VwjAl075E
    QaWF93GgVAys865KPRuVkLZ5fqYnWVuwg+cA37f3+6MC2qRMaVYf5hbd/sYzMix+EtVlFv
    tgvydwvzd0deBidGeCtVKLwCKMmyiM2Zv1CAQEDJol5zA2r8BCOPFoJafibg
X-ME-Proxy: <xmx:aCDnamhQRRW-WDDutkfIUPCZQ745GOmpL73CXqDz-sWy-p-8HmF_dQ>
    <xmx:aCDnalQyGQfYGuTceXkZbnpyTZ8MQwN7AWil1l_HxjQCukF9_HHtVw>
    <xmx:aCDnanYpsN2BqzYLxyh0eeTaYWvKA-P15XCLiNPCto35y7DzJY1mfQ>
    <xmx:aCDnaiR-7ixKbfrozu8dLm6X-FjV1ykjEG6A3ZMF3hO_KhjsX66zkA>
    <xmx:aiDnap1ZTCnpGIGIlvPNOcPfDRyFa5joBTHsjpiOBEvtWZzjVcm0n1tA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E548E32A0093; Sun,  1 Nov 2026 06:20:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A2HaaWELKR9F
Date: Sun, 01 Nov 2026 12:19:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Ley Foon Tan" <lftan@altera.com>
Cc: linux-kernel@vger.kernel.org, "kernel test robot" <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Message-Id: <cf2a83ea-5e5a-42c2-905b-199a43b6341a@app.fastmail.com>
In-Reply-To: <e9f9ac85-442a-4bcc-8ec6-a03a6519178d@kernel.org>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
 <47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
 <3175caa0-9f49-465d-959e-6b6c9bbb4f01@kernel.org>
 <e9f9ac85-442a-4bcc-8ec6-a03a6519178d@kernel.org>
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_032014_590493_8CB19A59 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMSwgMjAyNiwgYXQgMDE6MjYsIFZpbmVldCBHdXB0YSB3cm90ZToKPiBPbiAx
MC8zMS8yNiAxNjo1NywgVmluZWV0IEd1cHRhIHdyb3RlOgoKPj4KPj4g4pSM4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQCj4+IOKUgsKgIHJvdXRpbmXCoCDilIIgY2FsbHMg
4pSCIGZ1bmN0aW9ucyDilIIKPj4g4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSkCj4+IOKUgiBfX3VkaXZzaTMg4pSCIDQxNcKgIMKg4pSCIDIzOMKgIMKgIMKgIMKg4pSC
Cj4+IOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUpAo+PiDilIIgX191
bW9kc2kzIOKUgiAyMDPCoCDCoOKUgiAxMzHCoCDCoCDCoCDCoOKUggo+PiDilJzilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilLzilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilKQKPj4g4pSCIF9fZGl2c2kzwqAg4pSCIDc3wqAg
wqAg4pSCIDU3wqAgwqAgwqAgwqAg4pSCCj4+IOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUpAo+PiDilIIgX19tb2RzaTPCoCDilIIgNDHCoCDCoCDilIIgMzPCoCDCoCDC
oCDCoCDilIIKPj4g4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCj4+
Cj4+IEkgY2FuIHRha2UgYSBzdGFiIGF0IHByb3ZpZGluZyB0aGUgZ2VuZXJpYyBsaWJnY2MgaW1w
bGVtZW50YXRpb24gaW4KPj4gbGliLyogYnV0IEkgb25seSBleHBlY3QgdGhlIGFyY2hlcyB1c2lu
ZyBsaWJnY2MgdmVyc2lvbiB0byBzd2l0Y2guCj4KPiBJdCBzZWVtcyB0aGVyZSA0IGFyZSBhbHdh
eXMgbmVlZGVkIHRvZ2V0aGVyIG9yIG5vdCBhdCBhbGwuCj4gRG8gd2Ugd2FudCA0IEtjb25maWcg
Z2F0ZXMgb3IganVzdCBvbmUgd2lsbCBzdWZmaWNlID8KCkVpdGhlciB3YXkgaXMgZmluZSBmb3Ig
bWUuIFNpbW9uIGRpZCBzZXBhcmF0ZSBzeW1ib2xzIGluIGhpcwpuaW9zMiBwYXRjaFsxXSwgYW5k
IEkgZG9uJ3QgbWluZCBzdGF5aW5nIHdpdGggdGhhdCB2ZXJzaW9uCnVubGVzcyBzb21lb25lIGVs
c2UgZmVlbHMgc3Ryb25nbHkgYWJvdXQgaXQuCgpJIHdvdWxkIGhvd2V2ZXIgbGlrZSB0byBoYXZl
IHNlcGFyYXRlIHBhdGNoZXMgdG8gYWRkIGxpYi9kaXZtdWwuYwphbmQgbGliL211bHNpMy5jLCBh
bmQgdGhlbiBwYXRjaGVzIG9uIHRvcCB0aGF0IHN0YXJ0IHVzaW5nIHRoZXNlCmZyb20gbmlvczIg
YW5kIGFyYy4KCiAgICAgQXJuZAoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MTAzMC1uaW9zMi1yZW1vdmUtdXNhZ2Utb2YtbGliZ2NjLXYxLTMtNGUzNDFjNjYwODJlQHNpZW1l
bnMtZW5lcmd5LmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
