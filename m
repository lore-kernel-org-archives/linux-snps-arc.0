Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9DFC7EE2A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OGLdxA8Zd58iOKhuCJ/1A110J0U6w6hEZJwcGKfYhg=; b=nIknmfcNtd1dpj
	3WoYTEzuzYcufY6FxwDuizKjF8yJ2EhZyK4atLuySYFiqTyfO0MtrUepMnjA0l9CHCBkpRj03kIv1
	xaU7Pgc3WiHkYqf9ZX6kdKMrYoy3r6zqjblFkAytvg1sufhokxbFUI6uYL6BMg8gk33c70EefXUGV
	66+QvPu5Qd9rw23fEUQMFvWhKFTSclSNyJ0H4xbyJR87hdLfK8/Eow4AnT83UgKPXHTptZyYwFKQe
	4nwrr22DzdcQmEfcR8LA6JRUcuy5pyankz4sUAGDK/MaqNwoLvNnhFQMyio8pxVVk2cHdK1du0S++
	jNuVcVTIGzsyJCSn2sJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5jh-008m6H-0i;
	Thu, 11 May 2023 12:49:33 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px5jd-008m4H-0u;
	Thu, 11 May 2023 12:49:30 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id A028D2B069A3;
	Thu, 11 May 2023 08:49:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 08:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683809360; x=1683816560; bh=d2I3MJoGb9Q0k1pggTIspxukMh9F288HwWB
	EZkJydBM=; b=EaT8QDsGJiHFxT+LJIqn2fEflreLZWqKGpVDwbrPLYvL1wt4nLg
	Wa1WNW+6odEbrT8vWG4Kqkt+XnHCbupWK6S+GXNiSev5T5S8qdVptnwvrdvaaypO
	DxjOXrlGw3MTnH2SHlm0saVDo2Vd/MH+coOuqnxVibh+pIY7tCYKM91yc2+lwfAY
	8Uc2AImEQiSqaPkFH2OZMZZ6uXWu/+4L6TrxtkbPQuvAgmwNbIpat8dyWeE65WLr
	FepOVjK9s4dKMRV4F5hYmRYR+t6pmOJCCfLHN3yAKTmYYofcqSRReJX/58keVUGZ
	/qacxa7dNgui0WGS51SJYWw3o+gkd4E/o3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683809360; x=1683816560; bh=d2I3MJoGb9Q0k1pggTIspxukMh9F288HwWB
	EZkJydBM=; b=jB9XvrdWPUTvwh1iDY/3NDQnzSrog8ELb1h9L6ikkVOhDtmVDz3
	UXAE5Lfnsb1qGvgzMXsuGMtW7DAOXrZUF0n3em0sgcghRqYnzwQRhIBzcvAHtYIC
	dz7ZcosF3AQPao+lh5E5QQNhIUKMyozAL6w1I/BEh06mRkVMXxyIKxgQjVFOBQJs
	+qn35bkU+cxGHXhW0HPtsju+GE+7hIaFH7AtuAcdjCwDuIBXfwJgaXumToGqAG9v
	sbHIo24d/eBn7IIu6FJKuWDyuFr9H2c8qDhKBrLkmoqiDvXdpn6+vGeMFizRdU44
	I9XCsw3OdQRl8ibPdLeZecXx1RH0d+WvXTQ==
X-ME-Sender: <xms:TuRcZA4pAKPMmi7NEPfI-jLSQXmHRDtm7W6A9M2gFiJw_2zwTZ9fKA>
    <xme:TuRcZB4r0tClLPdVZMNorjPuw_9H3qKfjnEZHs0h_BMh80peLqqeNakHDRm_wYK_v
    C2p3s5VZ5IB8O7TQ28>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:TuRcZPenQXcfeUqmz-DfyRWxTt2mOy2jd9F75_W0kvLW9Zg0R_GJjg>
    <xmx:TuRcZFLacxJD9zWaXSC8lel2meoqhOP82JKYSavCgBWS3l9n_bXBbA>
    <xmx:TuRcZEJlVY3mEQHhFeaLrOMkszBMbmlk-SePu_RRbt-YzeFdA5a8jw>
    <xmx:UORcZBYC0UB6UD24jDdNcFRC8O72IQAijFL3Wl-pXlCc3rY08CNRqgVB5t4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A9369B60086; Thu, 11 May 2023 08:49:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Mime-Version: 1.0
Message-Id: <4976d32d-b73f-49e5-9e15-78786d77dc8f@app.fastmail.com>
In-Reply-To:  <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
 <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Date: Thu, 11 May 2023 14:48:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "kernel test robot" <lkp@intel.com>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Vineet Gupta" <vgupta@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, suijingfeng@loongson.cn,
 oe-kbuild-all@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "Artur Rojek" <contact@artur-rojek.eu>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_054929_817634_FB8F5489 
X-CRM114-Status: GOOD (  10.67  )
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

T24gVGh1LCBNYXkgMTEsIDIwMjMsIGF0IDE0OjM1LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gQ0MgQXJ0dXIsIHdobydzIHdvcmtpbmcgb24gSFAgSm9ybmFkYSA2ODAuCj4KPiBPbiBXZWQs
IE1heSAxMCwgMjAyMyBhdCA1OjU14oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4g
d3JvdGU6Cj4+IE9uIFdlZCwgTWF5IDEwLCAyMDIzLCBhdCAxNjoyNywgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4+ID4gQW0gMTAuMDUuMjMgdW0gMTY6MTUgc2NocmllYiBBcm5kIEJlcmdtYW5u
Ogo+PiA+PiBPbiBXZWQsIE1heSAxMCwgMjAyMywgYXQgMTY6MDMsIGtlcm5lbCB0ZXN0IHJvYm90
IHdyb3RlOgo+Cj4gU2VlIGFsc28gY29tbWl0IDRhYWZhZTI3ZDBjZTczZjggKCJzaDogaGQ2NDQ2
MSB0aWR5aW5nLiIpLCB3aGljaAo+IGNsYWltcyB0aGV5IGFyZSBubyBsb25nZXIgbmVlZGVkLgo+
Cj4gRG9uJ3QgdGhlIEkvTyBwb3J0IG1hY3JvcyBqdXN0IHRyZWF0IHRoZSBwb3J0IGFzIGFuIGFi
c29sdXRlIGJhc2UgYWRkcmVzcwo+IHdoZW4gc2hfaW9fcG9ydF9iYXNlIGlzbid0IHNldD8KCkFz
IGZhciBhcyBJIGNhbiB0ZWxsLCBzaF9pb19wb3J0X2Jhc2UgZ2V0cyBpbml0aWFsaXplZCB0byAn
LTEnCnNwZWNpZmljYWxseSB0byBwcmV2ZW50IHRoYXQgZnJvbSB3b3JraW5nIGJ5IGFjY2lkZW50
LiBTbyBpdCdzCmFsbW9zdCB0cmVhdGVkIGFzIGFuIGFic29sdXRlIGJhc2UgYWRkcmVzcywgYnV0
IHRoZSBvZmYtYnktb25lCm9mZnNldCBlbnN1cmVzIHRoaXMgbmV2ZXIgYWN0dWFsbHkgd29ya3Mg
dW5sZXNzIGl0IHdhcyBmaXJzdApzZXQgdG8gdGhlIGNvcnJlY3QgdmFsdWUuCgogICAgICBBcm5k
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
