Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A948C83F17
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Jul 2025 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCLrYUYMlCqfNd7qWU8XD8XrOlnmSr6JrkI98f2Lkgc=; b=Co4/u8Ux8TKouI
	CqEvPRUx1vT8kyrOYiznLZgSGTug074ssiYS0UBUf7nKFNNVYmHXRZPIeIyZr7qusJyoE+gv9AT+c
	hC2FyvpYDv2AoFqRILXQIH0KZAD4tdEcLiEhMyUUO4kLhRquZkiJf0Mv2nPldsbZ4kO8mCJ3Ak9Lr
	bZqyqsdJO2t37IHRXFSVmMwvVtbyUYc2PJliw7eF91BfTAinRuAoqZYv2is+dBq7R2Eq+wNWg/d5H
	rJYH+kTvZFszWLuq7uR53A7VOSnP8osZAw8pLhRRf0cIexyb7GaozW7dRpxh8tQUWpk+L+/w+qgki
	RVQCdB3CWNg4kVdchjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uck7J-0000000CZaE-32uO;
	Fri, 18 Jul 2025 12:23:09 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjZM-0000000CVBf-3sma
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Jul 2025 11:48:06 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B495D7A0179;
	Fri, 18 Jul 2025 07:48:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 18 Jul 2025 07:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1752839280;
	 x=1752925680; bh=TixgCXnBJyIqXhUnfdaZUNI3oOckDeciyEbiH83Iars=; b=
	uFmmKuoJEFwkN9w9M9/KALI1tOWTBpMQ8X/YdhGWRYGR3HGR4zqJ+4mY/tIKA3lz
	K6JrpnqzBdvKVIYidiMRdUqDHN6T6KPghwGKXx20z2yelscyUKa20DEnpt7n/tH9
	CGw+h8+hAuNvaa342DoVxb60Mw84wSMXUx8G4AxQAKdW7BNw98/lea+dtbBl1XLC
	+bgQ65qPFimTkJJr4hDAcPpzfmSVbkAyqdyR4QG+tBBdl8CxYjPVHBsjIn23mcoz
	TYn2mWwmgFNBFGCgD2aVhNWvzR9BfEiF03NasySj1XNe19qIo3wn2X93PVucLVuu
	ZmNx/fIqaZW+6myHuXm+9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752839280; x=
	1752925680; bh=TixgCXnBJyIqXhUnfdaZUNI3oOckDeciyEbiH83Iars=; b=e
	ldWWJRZXpycMZO4g1g39yKpaQe4dgQXLaQGyT6tqokPvwoW3rpoMmsF5Vd9sFJGq
	vP4f0WtEHgl9uxtlZJWxTTWenQibeTqZKhw4sN/O5xRUBK8YjFWnNMrMNlH3FHGF
	ZLp771oROhYm2T3DvXqoHsadk3ZbOdlT2Um2SWGY2E8lhXBEtJOFatDH5BHk7pgS
	2SMHVGrhC0BFn4f/oMc7oV73ls3T2KyQIK1M3LhWzWRIYgq9RaGT1PgiZU4UJGHk
	7ZneWgbUWSrqTA1MXertkoE0F7fwi8feaD36omUaoPzu0ZP+a6OCteeznWVfUfZe
	6AvHpS3c1+g7gs+gqkNzA==
X-ME-Sender: <xms:bzR6aPzxyY2UNeMJMGctEQygJEaZpk_wTgmHDOg7BUhXYKQQvV7R4A>
    <xme:bzR6aNm4Hf6eVe8bC4D5bOvJJB-2S8LojTuKSnCc-ajRQOtiRWkQNe69_FGvrWu6C
    OO_4M2ZFoC1oA>
X-ME-Received: <xmr:bzR6aPUfU246mSVlmguOvaxZqnuOHTeT_Kt6V6a426DYR7lt3yCMFqG_kcNvuRnIxYIO8GzzaJm2AXb0XUX1sgsBMDF5MF_7H8TRdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertd
    dttdejnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgkeffieefieevkeelteejvdetvddtledugfdvhfetjeejie
    duledtfefffedvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepfeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegsrhgrkhgvrhdrnhhoohgsrdhkvghrnhgv
    lhesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthho
    pegrtghmvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrmhhhhihunhhgsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtgho
    mhdprhgtphhtthhopegrlhgvgigrnhguvghrrdhshhhishhhkhhinheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehjohhlshgrsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehirhhoghgvrhhssehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:bzR6aG1a8_Jm7Z8PUhNrDsZL5pCj7eKkHIb7QyugE8solOeclK9auw>
    <xmx:bzR6aHkDuDVEqwmM5eITZ9M2qrK9K7o4Z9WmsX4bRINhozKz6G-JqA>
    <xmx:bzR6aFFp9e_sb1F9vkWseJ2Pirf7iiUH8t5hzcGtkQchrbGUNF1KIg>
    <xmx:bzR6aMlJDfoAuTxePBe-o703q2Q8C3aTQBK0FGDCTzEumq-pTX_31A>
    <xmx:cDR6aDCkJWPN7o5mNZCTZ-VzGM-vKzYy8K1Fs4TBu73yW5ciCzf9ghRb>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 07:47:59 -0400 (EDT)
Date: Fri, 18 Jul 2025 13:47:56 +0200
From: Greg KH <greg@kroah.com>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, vgupta@kernel.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] arc:kernel:perf_event.c : replaced sprintf with
 sysfs_emit()
Message-ID: <2025071801-driveway-curly-698c@gregkh>
References: <aGjUpI1yNjEhSiAq@brak3rDesk>
 <CAG+54DZQC+-6E-P3D4BUtVujNegL1qKpcB5SGh28+rX5hrHFiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+54DZQC+-6E-P3D4BUtVujNegL1qKpcB5SGh28+rX5hrHFiw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_044805_377903_05EEFA29 
X-CRM114-Status: GOOD (  20.69  )
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

T24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgMDM6NTc6MjBQTSArMDUzMCwgUnVqcmEgQmhhdHQgd3Jv
dGU6Cj4gSGksCj4gCj4gT24gU2F0LCBKdWwgNSwgMjAyNSBhdCAxOjAw4oCvUE0gUnVqcmEgQmhh
dHQgPGJyYWtlci5ub29iLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFJlcGxhY2Vk
IHNwcmludGYoKSB3aXRoIHN5c2ZzX2VtaXQoKSBpbiBzeXNmcypfc2hvdygpIGZ1bmN0aW9uIGlu
Cj4gPiBwZXJmX2V2ZW50LmMgZmlsZSB0byBmb2xsb3cgdGhlIGtlcm5lbCdzIGd1aWRlbGluZXMg
ZnJvbQo+ID4gZG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9zeXNmcy5yc3QKPiA+IFRoaXMgd2ls
bCBpbXByb3ZlIGNvbnNpc3RlbmN5LCBzYWZldHksIGFuZCBtYWtlcyBpdCBlYXNpZXIgdG8gbWFp
bnRhaW4KPiA+IGFuZCB1cGRhdGUgaW4gZnV0dXJlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJ1
anJhIEJoYXR0IDxicmFrZXIubm9vYi5rZXJuZWxAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9hcmMva2VybmVsL3BlcmZfZXZlbnQuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMv
a2VybmVsL3BlcmZfZXZlbnQuYyBiL2FyY2gvYXJjL2tlcm5lbC9wZXJmX2V2ZW50LmMKPiA+IGlu
ZGV4IGVkNmQ0ZjBjZDYyMS4uNDI0ZWMwNzJjNDQxIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcmMv
a2VybmVsL3BlcmZfZXZlbnQuYwo+ID4gKysrIGIvYXJjaC9hcmMva2VybmVsL3BlcmZfZXZlbnQu
Ywo+ID4gQEAgLTY0OCw3ICs2NDgsNyBAQCBzdGF0aWMgc3NpemVfdCBhcmNfcG11X2V2ZW50c19z
eXNmc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAgICAgICAgc3RydWN0IHBlcmZfcG11
X2V2ZW50c19hdHRyICpwbXVfYXR0cjsKPiA+Cj4gPiAgICAgICAgIHBtdV9hdHRyID0gY29udGFp
bmVyX29mKGF0dHIsIHN0cnVjdCBwZXJmX3BtdV9ldmVudHNfYXR0ciwgYXR0cik7Cj4gPiAtICAg
ICAgIHJldHVybiBzcHJpbnRmKHBhZ2UsICJldmVudD0weCUwNGxseFxuIiwgcG11X2F0dHItPmlk
KTsKPiA+ICsgICAgICAgcmV0dXJuIHN5c2ZzX2VtaXQocGFnZSwgImV2ZW50PTB4JTA0bGx4XG4i
LCBwbXVfYXR0ci0+aWQpOwo+ID4gIH0KPiA+Cj4gPiAgLyoKPiA+IC0tCj4gPiAyLjQzLjAKPiA+
Cj4gCj4gR2VudGxlIHJlbWluZGVyIGZvciB0aGUgcmVwbGFjZW1lbnQgb2Ygc3ByaW50ZigpIHdp
dGggdGhlIHN5c2ZzX2VtaXQoKSwga2luZGx5Cj4gcmV2aWV3IGl0LgoKV2h5IGlzIHRoaXMgcmVx
dWlyZWQ/ICBUaGVyZSBpcyBubyBidWcgaW4gdGhlIGN1cnJlbnQgY29kZSwgc28gbm8gbmVlZAp0
byBjaGFuZ2UgaXQgYXQgYWxsLiAgUGxlYXNlIGp1c3QgdXNlIHN5c2ZzX2VtaXQoKSBmb3IgbmV3
IHN5c2ZzIGZpbGVzLApubyBuZWVkIHRvIGNodXJuIHRoZSB0cmVlIGFuZCBjaGFuZ2UgYWxsIGV4
aXN0aW5nIGVudHJpZXMsIG90aGVyd2lzZSB3ZQp3b3VsZCBoYXZlIGRvbmUgdGhpcyBhIGxvbmcg
dGltZSBhZ28gd2hlbiB3ZSBpbnRyb2R1Y2VkIHRoZXNlIGZ1bmN0aW9ucy4KCnRoYW5rcywKCmdy
ZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
