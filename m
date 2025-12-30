Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63222EE01F6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 21:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UGGRNje2z7W/Colz+ybGRn0ZuzI/mFNZoCksXA8e8i4=; b=IGzjX9U1uNbDeERa5HhauGtEgn
	IN6FWPFuuAEqFQN/S9FdnGTOhhDj3pbkA+sZeg3phN4R6iMONJF/3IZNNSAgl4uCw5oxwfqT03Umd
	UcfxMquLpOiWad/9ZJP6CkjH1Q6dNidDZNTqtSFQUrn0b6+GTXbfoCdnthoznZ+4N1YYKV5n8IrDx
	hJxXdMVv5BNTNiv0CRnZHibREt3kcx08Kv5a2au/08gYu5/GnpLPWoVLDPgIPA4upd1bFQMyZyLVd
	pt3PtqNc0JWE4UWRACf7x9yhf8cNB3FRBqkBP6cCqJwTbYYxU1OFoPMPPAt0L0EQHH6bp3ufA8Yla
	KqDQw0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagxZ-00000005IYs-08zt;
	Tue, 30 Dec 2025 21:08:53 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagxV-00000005IYM-0n0o;
	Tue, 30 Dec 2025 21:08:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DD971400089;
	Tue, 30 Dec 2025 16:08:46 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 16:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767128926;
	 x=1767215326; bh=hvZE2Mdaq3RzQueJdX+n3+4wx/tUoxDbdm9E/c+gs1o=; b=
	m5VRocYSXIlaNjd+wnyxBkSVsUT/BydMIpJq7VagNGuKzBrqFtbgisYFelvU7Mqy
	ipBIrQzYfnPIapunzxQX69y2NP5LynZX8FpTsZ9zoCAgqOFuhNtQaOCU8cIOSKtU
	7F1PmHdpMDwwJLPSYVLfWRj3kV8QrKcp5y86LKuEP+N4WpmUHf64xINXxKVdg3kL
	qF4ZtIGseqI8F4kWe/w8WrErprFwyIM93VviN76uAnk8Hm1o///re+scA+CofU0m
	/ltX8JeBbs66ZEDAc17iuvb7gLtVZOlVlipCv5u5vt9kPimmSHADDrLuhkrOoW5a
	hFIdUFJhGqCpIpwwZLhNbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767128926; x=
	1767215326; bh=hvZE2Mdaq3RzQueJdX+n3+4wx/tUoxDbdm9E/c+gs1o=; b=S
	6oRw7Epu5P83pBA0VBspCtXLB9a+fetUFSiiUsfvJEL6RQPSW90uhRVcGFyC4Fo5
	gxkgaAx095YYoERFgoXy9eJDavez8YdhCRI4XplExR95uDhyO59c400fuyBiVIfT
	1cJu+S5IU994i2m+Ed6KeFLOGUDf0bwCaOOdGDOVLRNNc71azzHI2/ZOC0RQREMW
	BATRCK0mnBociX6piQSsajcRl8E14M3NQ+fk0gGIFN1Osb43dFTa7I4bHkMUlNP9
	hCxF7kwd6IXe6WpwBXgkNHdUB081jFrF0v8OJhfPE31oPOUAe1DsfnmlQaXuCIIL
	rtNvczVIOjav0rn9B2vHw==
X-ME-Sender: <xms:XD9UabAR9AMaHtmELUsYgLkS0pC60-lTD1E0dZYKeZoUrwRaF3Tyuw>
    <xme:XD9UacV7nsCRy-q07r96ibTWTP7RlkOdzm6fJ0mpsvjBkWiBKKGKNyIQ5Hs-UrS9o
    3F6BVZCqmwbGKj1TekeL6-Uc84Yqg3VnYSS31DQS_y7QaVVJmiK-m4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekuddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopeguihhnghhuhigvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhguhhpthgrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:XD9UaSZYiC2v220cdPaTYOU-oj3KPPFC1Xc3XmgWHjp4UHZYvckwZw>
    <xmx:XD9UaU_rZbeqDwREYLiDFU2r48qjrwn19l0pErG8anBa-9LRWtcXUw>
    <xmx:XD9UaRS-Hfm9K4o2wQLCtyVCO8PTdUu7MTjfaDxn_9M-5HK2LfJ_Lg>
    <xmx:XD9UaXJmwJ0jAtnQwzckrvQecW_EEq3-DNi_Xw4hDhRouIr-8Lb91Q>
    <xmx:Xj9UaXEt3t9oxxj_Pw_AnnsGkC0dmbkMLvZn9Hc02v0ZSP6jrwqnikBy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0E08700065; Tue, 30 Dec 2025 16:08:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1Q6nbcC_O6V
Date: Tue, 30 Dec 2025 22:08:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a745a59f-947c-4847-b31c-5e32125a51a4@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-4-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 4/5] x86/uapi: Stop leaking kconfig references to userspace
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_130849_680713_0B79F9AE 
X-CRM114-Status: UNSURE (   9.78  )
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

T24gVHVlLCBEZWMgMzAsIDIwMjUsIGF0IDA4OjEwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiAKPiAgLyogZW50cmllcyBpbiBBUkNIX0RMSU5GTzogKi8KPiAtI2lmIGRlZmluZWQoQ09ORklH
X0lBMzJfRU1VTEFUSU9OKSB8fCAhZGVmaW5lZChDT05GSUdfWDg2XzY0KQo+ICsjaWYgZGVmaW5l
ZChfX0tFUk5FTF9fKSAmJiAoZGVmaW5lZChDT05GSUdfSUEzMl9FTVVMQVRJT04pIHx8IAo+ICFk
ZWZpbmVkKENPTkZJR19YODZfNjQpKQo+ICAjIGRlZmluZSBBVF9WRUNUT1JfU0laRV9BUkNIIDMK
PiAgI2Vsc2UgLyogZWxzZSBpdCdzIG5vbi1jb21wYXQgeDg2LTY0ICovCj4gICMgZGVmaW5lIEFU
X1ZFQ1RPUl9TSVpFX0FSQ0ggMgoKV2hpbGUgdGhpcyBwYXRjaCBjbGVhcmx5IGtlZXBzIHRoZSBj
dXJyZW50IGJlaGF2aW9yLCBJIHRoaW5rIGl0J3MKd3JvbmcsIGFuZCAzMi1iaXQgdXNlcnNwYWNl
IHNob3VsZCBzZWUgYSAnMycgaW5zdGVhZCBvZiAnMicgaGVyZS4KCkl0IGNhbiBwcm9iYWJseSBq
dXN0IGJlICczJyB1bmNvbmRpdGlvbmFsbHksIG9yIHdlIGNhbgptYWtlIGl0IG1vcmUgY29tcGxl
eCBhbmQgaGF2ZSBhIHVzZXJzcGFjZSBkZWZpbml0aW9uIGJhc2VkCm9uIF9feDg2XzY0X18gYmVp
bmcgZGVmaW5lZC4KCkkgYWxzbyB3b25kZXIgaWYgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhl
IHRoaXJkCng4Ni02NCBlbnRyeSBiZWluZyB6ZXJvIHJhdGhlciB0aGFuIEFUX0lHTk9SRS4gSSBz
ZWUgdGhhdApzb21lIGFyY2hpdGVjdHVyZXMgZG8gaXQgbGlrZSB0aGlzLCB0byBrZWVwIHRoZSBu
dW1iZXIgY29uc3RhbnQKZXZlbiBpZiBzb21lIGVudHJpZXMgYXJlIG1pc3Npbmc6CgogICAgICAg
IGlmIChsaWtlbHkoc2lnbmFsX21pbnNpZ3N0a3N6KSkgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKICAgICAgICAgICAgICAgIE5FV19BVVhfRU5UKEFUX01JTlNJR1NUS1NaLCBzaWduYWxfbWlu
c2lnc3Rrc3opOyBcCiAgICAgICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgTkVXX0FVWF9FTlQoQVRfSUdO
T1JFLCAwKTsgICAgICAgICAgICAgICAgICAgICAgIFwKCiAgICAgQXJuZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
