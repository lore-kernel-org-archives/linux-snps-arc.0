Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584FCC3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 Jul 2024 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvP7DO+7i4WAlVYLUJdRc+2JkM8tWsTbg1uZaUCVupU=; b=r8rhaUZej9Zcb1
	88VNXFqvFMEqn4QcBPd6l8gbwPCIi9qITWSPY+kXnl330v59gwaJnqQ3ay8+IIXaLmhhsLORSY2+K
	WmYAPHO+BgNS+TaeMvIHRs8W/6dFek+3Tk+RD5dqsJny8x8GJo46L1LPMMVayMIiPfEtxwFciGew/
	17NcYYc3ZizbkXOLxGRgfjrcCAFU2UYg1ipVZJbOpQ2hWlE1P/fJteaqDshJjkDjNwNClsL9lPCgR
	gmdC8cqCVNm+MCZ3vyxoMxJaOjgJ8BpS9zycBkO9WEXlGXooLa7QX3VO/k4M49oKrElkOAri0VXiu
	oOJ+ROZr82GvuzafUe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCLq-0000000H2jm-3UDT;
	Fri, 12 Jul 2024 09:14:02 +0000
Received: from fout2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCLW-0000000H2bg-2meg;
	Fri, 12 Jul 2024 09:13:44 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 093B913886AE;
	Fri, 12 Jul 2024 05:13:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 12 Jul 2024 05:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1720775622;
	 x=1720862022; bh=+8/B7nnlva+5zNPi7sf2bUE6DcSx2Ml3WIXcjT3v0KM=; b=
	cMt4P0GrPCayVfGKqZ04Oldr7Mq6E4vJI+T0BQYmDKIDYEHrhuOriDb2sn8s1KAi
	LzNn1/Ct3iNJHUj/9LKX/q5T+aPnWSU7HdJcQpfMzPrfFAubBhErxvUuy1P+kRh3
	Kj28fPCP/bx/RANmMJOBlO81H2asQTcOtXF+xF5ATeo4o3qkokNXPtv3pTzE9sn9
	2xy+j/kytN8CnYTQKueMwZdbAwZATfI+ZVxRd/0W7AmjdWmO9PW3UAbQyXY6/IYp
	eraDlJ3tZEnbEj9QY4mUUhTOv9r5NABuy+DSOu58NXQVjkNkOs93daRnA4NzJ+i6
	p3J3ei0lSuRTNcfUct143A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720775622; x=
	1720862022; bh=+8/B7nnlva+5zNPi7sf2bUE6DcSx2Ml3WIXcjT3v0KM=; b=M
	gYDcZkamVp0txdHnMyaS7XkhFzNUlFoQzSTIyWZAj9H0avUirl9gdX5gYdz6XQ7Z
	qC1CVsA2OHkEHJ5dPG3Y9/IlJBydnLypw2NP0jTgRp0vVGxMNT/F+GYe71li4sAw
	KkXYBrpStP+OLQ6Igrv6lXWSxxyFj3Mfi8HvKhOVu7aDHGzfMwpWP8aPphGLveY1
	0yxvR57ylk+qoUnc9ngMgO6svFMtGH8TEr+JdIp+XB2GuLJApzLN8ocObuI3RPjm
	8oAW99cy5eFWAiK2kDQhrWzhogGOXGFnqfVrBW6dTz5CFt7kRPqZpUz/03sruZVI
	06s5Pn7JCEWojOtFmbaMQ==
X-ME-Sender: <xms:xPOQZt-gkPmGrHIkjqeUNvcRdLZEQU_Jz8dQ0G-CNop-bWBhKDU2Gw>
    <xme:xPOQZhv1pioHUTjgPWVTQkPz0BGoB_PmdRozC5XLrsMXXBQWtRdymnz4I_DdIiusV
    snjitaKeOOyhNgD2wY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeigddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xPOQZrD2kH8otN3RHA4viULvGsXy6rh7LGueObOJ9FDelSl8S_oLUQ>
    <xmx:xPOQZheVft2_07Rj9pEC1MUxQxSs1cKPU-CmR23h62f6VdXf7xLXeA>
    <xmx:xPOQZiPpT6jkGVO7I3U5rxli4mDgimMarQvFMF6WpzzJDuvXO4Xqcg>
    <xmx:xPOQZjlSpjww5SK-qGAGKRrkYnivx7JEazxU2Eq_z1bUBgXoi4Q2Xw>
    <xmx:xvOQZosARBHlClwP4SI8f_7F32uxnt7h-kjJ5tyGMWjYdClF6iIiL_9w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 62E5BB6008D; Fri, 12 Jul 2024 05:13:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <1d998e37-926c-473f-a58a-1d47b96f882a@app.fastmail.com>
In-Reply-To: <CAK7LNAS=h6dML-06ox1dje_bxF2+R-Gq7Yw-s73Vi-FW39L9eg@mail.gmail.com>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-4-arnd@kernel.org>
 <CAK7LNAS=h6dML-06ox1dje_bxF2+R-Gq7Yw-s73Vi-FW39L9eg@mail.gmail.com>
Date: Fri, 12 Jul 2024 11:13:16 +0200
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
Subject: Re: [PATCH 03/17] um: don't generate asm/bpf_perf_event.h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_021342_792164_ED6AD6B9 
X-CRM114-Status: GOOD (  12.69  )
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

T24gRnJpLCBKdWwgMTIsIDIwMjQsIGF0IDEwOjM3LCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4g
T24gVGh1LCBKdWwgNCwgMjAyNCBhdCAxMTozN+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4+IC0tLSBhL2FyY2gvdW0vaW5jbHVkZS9hc20vS2J1aWxkCj4+ICsr
KyBiL2FyY2gvdW0vaW5jbHVkZS9hc20vS2J1aWxkCj4+IEBAIC0xLDUgKzEsNCBAQAo+PiAgIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+PiAtZ2VuZXJpYy15ICs9IGJwZl9wZXJm
X2V2ZW50LmgKPj4gIGdlbmVyaWMteSArPSBidWcuaAo+PiAgZ2VuZXJpYy15ICs9IGNvbXBhdC5o
Cj4+ICBnZW5lcmljLXkgKz0gY3VycmVudC5oCj4+IGRpZmYgLS1naXQgYS9hcmNoL3VtL2luY2x1
ZGUvYXNtL2JwZl9wZXJmX2V2ZW50LmggYi9hcmNoL3VtL2luY2x1ZGUvYXNtL2JwZl9wZXJmX2V2
ZW50LmgKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wYTMw
NDIwYzgzZGUKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9hcmNoL3VtL2luY2x1ZGUvYXNtL2Jw
Zl9wZXJmX2V2ZW50LmgKPj4gQEAgLTAsMCArMSwzIEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCAqLwo+PiArCj4+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvYnBmX3Bl
cmZfZXZlbnQuaD4KPgo+IEkgZ3Vlc3MgdGhpcyBpcyBhIHN0ZXAgYmFja3dhcmQuCj4KPiBUZWNo
bmljYWxseSwga2VybmVsLXNwYWNlIGFzbS8qLmggZmlsZXMgYXJlIGFsbG93ZWQgdG8KPiB3cmFw
IFVBUEkgPGFzbS1nZW5lcmljLyouaD4uCj4gVGhlcmUgaXMgbm8gcmVhc29uIHdoeSB3ZSBiYW4g
Z2VuZXJpYy15IGZvciBkb2luZyB0aGlzLAo+IHdoZXJlYXMgY2hlY2staW4gc291cmNlIGlzIGFs
bG93ZWQuCgpJIHRoaW5rIGluIHRoaXMgY2FzZSwgdGhlIHNpbXBsaWNpdHkgaXMgdGhlIG1vcmUg
aW1wb3J0YW50CmFyZ3VtZW50OiB0aGlzIGlzIHRoZSBvbmx5IGNhc2Ugd2UgaGF2ZSBvZiB3cmFw
cGluZyBhCnVhcGkgaGVhZGVyIGZyb20gYSBub24tdWFwaSBoZWFkZXIsIGFuZCBubyBvdGhlciBh
cmNoaXRlY3R1cmUKd291bGQgbmVlZCB0byBkbyB0aGlzLgoKVGhlIHdheSB0aGUgc3lzY2FsbC15
IHJ1bGUgd29ya3MgcmVsaWVzIG9uIGVuZm9yY2luZyBzb21lCmNoZWNraW5nIGZvciBleGlzdGlu
ZyBhc20tZ2VuZXJpYyBoZWFkZXJzLCBhbmQgSSBjb3VsZCBleHRlbmQKaXQgdG8gYWxsb3cgdGhp
cyBzcGVjaWFsIGNhc2UsIGJ1dCB0aGF0IHdvdWxkIG1ha2UgdGhlCk1ha2VmaWxlIHJ1bGUgbGVz
cyByZWFkYWJsZSAgaW4gZXhjaGFuZ2UgZm9yIGF2b2lkaW5nCmVmZmVjdGl2ZWx5IGEgb25lLWxp
bmUgZmlsZS4KCiAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
