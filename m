Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBBFC2BD09
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 Jul 2024 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v32lk/zrhYormaN7PNd+5mQjlv8yFYXYgW+KtkxRFxY=; b=X0hBjz4lgT8ETU
	r2InVnT94r2RNzvKf4xksaJ/0d8yYkjW86aNEt78qnIF27bJQKB9gXZ3ZzzpPw87YrJ+YaBg7A0Y1
	Y5JaeAUxbxG3kogTc+XfTemIZgA01v2Lp/Z8ORVdZ+KF5V10e0oe/i3uB0UwkiC/k8erLkA9g/DN0
	OYZ0XHC6Xu9VpHr4ZhoooSek/Wez5WMCmcnvS2VSKrtiqPfr9CN5h366G0xMIfdEMBQak5Vrt/NDs
	DUvsJxRBuybpBf9yukjhUGmAmhEDG0gmJ3Gb26PghxTw27BYsET+RBcgd5v0x4vLuLh2YSM0+gP6r
	IU+26wCtoNMfDf3cBoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCHU-0000000H1rX-29Zd;
	Fri, 12 Jul 2024 09:09:32 +0000
Received: from fout2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCHA-0000000H1mO-3G2o;
	Fri, 12 Jul 2024 09:09:14 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id AF4B4138221C;
	Fri, 12 Jul 2024 05:09:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 12 Jul 2024 05:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1720775351;
	 x=1720861751; bh=sZ7e4XevovcBdrC0s9li43TyJDtZzYkioK9A8LGqM/Y=; b=
	M7SN+q9i0T1/jB6rkxntX3fgDkaikboa5B4fEQ7f99816KkJDDm+CP8PZpT8ZezN
	GNUQGwX8pzFBddHKwfg2FfGNMroyt65wjVT3xmfuIHK9WbS9ETLz6G3Tl6PSN+/F
	Gfumz/LDeEJNUhs/uKhyYOFI8xO/2U2gYlzfwSI9iCp9A1u8FAaz3YdE96uOlsIy
	C3z1sY56kT3e9DuxQR+jFBJ1IFYSZVRPnixfa4p7PBQmFvT6dCgKuWiOYdwH2RC8
	FCkIWbjvRk0llcGrJ0HVxt8Kl4gGJsU5QivQRQPATjazMWPswZcZVynMUPFb/PJN
	uQk5pfumf9/XpeBnVjhcTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720775351; x=
	1720861751; bh=sZ7e4XevovcBdrC0s9li43TyJDtZzYkioK9A8LGqM/Y=; b=N
	rQeQaoAYrmIx4P9f1dJ204CLgUujqrXKFMFrNNLiFFla4i8EB7bhNuKzjgRj3DGO
	Eym3G3cXIPA9uQzYswhcEucP6Mvp9c5FLUD/cdWl6bl7XVW+IM2TekwG8A4C79S9
	RKniQ50ZGXAG+CDKWB/rNZdBZS4WCdmBTR/EUR3Rn55HgdUBgbbooTGJE781Y63f
	S6Uud8LVRJi2zAyBSMhQQqQAgB1U3UpaSfZgH22siiPk6Nybr5f46Z1EhpNLZ6n7
	L3D7R8EZOD7aNt3qY7lxRGjX9Jaluw6Js9KGMNAtvS0npAU0x/wzA6w3JvX3vwzq
	2Y/W0ngCQNcaYui6ZdOew==
X-ME-Sender: <xms:tPKQZsDR-wmYFg7MIczctzGLNXIg6jYekOWPBAT2oOYzOgmMIKfXtA>
    <xme:tPKQZujqoKOXxeixBmlq_wWrG20-7I5PX6o1IAasYCOnLRcrQWPaioJkPDCSXXEcY
    0tjiQB1LzzzPzvF32A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeigddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:tPKQZvnM0POoj8h13xHmxb_HKBiaQZefN_oNtqRHbw4JDgxKnPxd9A>
    <xmx:tPKQZixofpA8v3Gue5nkhh60aW_mzdzZJE689uqiwWZsm0JkKizC7A>
    <xmx:tPKQZhSnPYREvuE2yvUVgs7XB7xgq8KM2oeEU38DYPogz8EKybqKvg>
    <xmx:tPKQZta3spHoTBC_qk6-TiezbpzzI7noO1wvjB0mBLDEKDwWuROD3A>
    <xmx:t_KQZhwIZzgBoFR5lfyh56NGNRguMKKXxXb63UdfFG80E_XGEKAnPekG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1B788B6008F; Fri, 12 Jul 2024 05:09:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <b8fa2389-e666-4631-a872-d0144fb7b3ac@app.fastmail.com>
In-Reply-To: <CAK7LNARpWB6Pqa80KDmpdJ_Rf5FZc71_bX9eSy3fFVCAyg8CAg@mail.gmail.com>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-2-arnd@kernel.org>
 <CAK7LNARpWB6Pqa80KDmpdJ_Rf5FZc71_bX9eSy3fFVCAyg8CAg@mail.gmail.com>
Date: Fri, 12 Jul 2024 11:07:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 01/17] syscalls: add generic scripts/syscall.tbl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_020912_903141_EA21F90E 
X-CRM114-Status: UNSURE (   9.20  )
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

T24gRnJpLCBKdWwgMTIsIDIwMjQsIGF0IDEwOjQzLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4g
T24gVGh1LCBKdWwgNCwgMjAyNCBhdCAxMTozNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBJIGtub3cgdGhpcyBpcyBhbHJlYWR5IHdyaXR0ZW4gaW4gdGhp
cyB3YXkKPiBpbiBpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvdW5pc3RkLmgsIGJ1dAo+IHRoZSBu
YXRpdmUgYW5kIGNvbXBhdCBoYXZlIHRoZSBzYW1lIGZ1bmN0aW9uIG5hbWUuCj4KPgo+IENhbiB3
ZSBzaW1wbGlmeSBpdCBsaWtlIHRoaXM/Cj4KPiA2NSAgICAgY29tbW9uICByZWFkdiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN5c19yZWFkdgo+IDY2ICAgICBjb21tb24gIHdyaXRldiAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3lzX3dyaXRldgoKR29vZCBpZGVhLiBJdCBsb29rcyBsaWtl
IHRoaXMgY2FtZSBmcm9tIDVmNzY0ZDYyNGE4OSAoImZzOgpyZW1vdmUgdGhlIGNvbXBhdCByZWFk
di93cml0ZXYgc3lzY2FsbHMiKSwgYW5kIEknbGwgZml4IGl0IHVwCmluIG15IGZvbGxvdy11cCBz
ZXJpZXMsIHdoaWNoIGhhcyBhIGxvdCBvZiBvdGhlciBjbGVhbnVwcwpsaWtlIHRoaXMgb25lIGFj
cm9zcyBhcmNoaXRlY3R1cmVzLgoKVGhhbmtzLAoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
