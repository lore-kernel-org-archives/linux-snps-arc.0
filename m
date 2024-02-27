Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4084C54798
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY2qyuX4IboenMobBqyAEhTC+NMyZs5pyuqNliRfMjk=; b=2K6sbwxM/OFJbo
	vb/rO6pDAE2HuFe38AUGkMD3GfkfAH6gtBOAYai0TIyfXna51jiHBCulp/aLipgn7iyMvyrUfp7Mh
	0J3ng8CVgMa5ef5Uo+06ptUQFeeXXa3GgRY0OwCITKNz/9CvGNGt8UnZieuhCK8IOWnxHBGRfwial
	9qMe6S2AocL6GY8X1wnBtoC7XR7xoqVjedZmKrK5aS+eS6hi+POQZ/vN3fpa8naL0S1AFRAPJkTEC
	fr1s4jrVwEjX+WVDxoESKJfNKbapFL6j8uTvM2Jgu7OuCHicoXZGgR55Z9ITnwZC/X1GG1H+7uKob
	YgbezOUOJsDqCaCrNdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezhS-00000005qqa-1iHh;
	Tue, 27 Feb 2024 15:48:58 +0000
Received: from flow5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezhN-00000005qoK-2L7G;
	Tue, 27 Feb 2024 15:48:54 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 0E22F200094;
	Tue, 27 Feb 2024 10:48:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 10:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709048931;
	 x=1709056131; bh=ybbnN0+SobfyxbHHH4ZELWrRQvYBzt/PThTgohkZVK8=; b=
	Uj8nTtuXWeEi/jXfJb5n+JbsF1HSR0x3KgfCm6wqbBwTdbvkhRqJ3Yq98CMAeG5r
	D/GO+gsxXcyWzUSYVXbRGbhBL/Z62QpHxQL4Nwm51CeelVfQrM0VsRmYU5oQiksk
	K0/XMoHjN3ofZ1Z5lt03aTV2rHIKloqb+z/hoNnTFtklsNNfr3RZjbgENs0es2gb
	IDGbBSGW0xc7Je2i9GyV0TikqeTQ8ZIH5rJ4x5Zc8k491PIy0z0afqdlN46J0Dyh
	GwV1UL/IypRhnck5jK4xrsxLBGUV4OhZP+DMMw5EqYb3GTEee00bKrSNOVOQW2Of
	C/8GqY9nA4ZbWGv/r1HmIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709048931; x=
	1709056131; bh=ybbnN0+SobfyxbHHH4ZELWrRQvYBzt/PThTgohkZVK8=; b=h
	Y1txy5S4iu4CgzO1d33RQRTVdIFEUhjhCu5bud7oeKr3YK+aS49Q7U3ClfbHqdDi
	1Qn/NXLKPd6IvD9u+mdo6jUi/KerXGwKqXU19Z54fEINfjHSApkWghFTcS4W/D9z
	bsuvJAFYYdOULYWSgsXdENf8NuVwaZV5nSsSdhul8qQvwBokhTpI/C4zH6thcdJh
	bnr/GHXwlUup2+3kPL1y1HI4RcBsijL0XYOj/FHZT6izdSVL9jmjE+Sv7hDo4FzA
	ReVIikHX+Zzdb6tpZ5dMHS/HBnj9HUKp1GKOSPqZGRRmEAJNIjOaV9BN4ViQqd2y
	/UEth2/MdcbGXPG2wRf0g==
X-ME-Sender: <xms:YgTeZTjQ2h_cNZ8jalaG9yLuQqXC07isf9GGcrOmBfNOKOEulyuU8A>
    <xme:YgTeZQAU0_LLiTKPpNYMDEOZ3KF4sj8-pyoo1S0mcZ4WuXW9vxRtrWSOshLIwEkGN
    rSu-Vae63C6tVsVR-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YgTeZTHcN2-Yez8UX5mfvZ1mSJnr_0tSCCXpqVxUG-IHqIPIoNvmcg>
    <xmx:YgTeZQQzrErr268F2CxBpd9lwv9mwfSPdqVRsNCxYMDirZwuyZpTug>
    <xmx:YgTeZQwVGz3Yu09b5df-6afMzKl0E5RnQicJLgSLEI6srfnAno_efg>
    <xmx:YwTeZaeeqww0pq-Uj1Spmu0Q0w5FIsyXzvjrxIQzMA-5KGL3vLMjzLwEdE0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 407DCB6008F; Tue, 27 Feb 2024 10:48:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <1b857914-bc1d-4b9a-b3f1-4eabd8db9810@app.fastmail.com>
In-Reply-To: <b737a088-c811-45eb-b143-d24e6cdf7eea@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
 <83450530-c908-4abc-bab7-88c50a3143ff@app.fastmail.com>
 <b737a088-c811-45eb-b143-d24e6cdf7eea@csgroup.eu>
Date: Tue, 27 Feb 2024 16:48:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>
Cc: "x86@kernel.org" <x86@kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Max Filippov" <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "Jan Kiszka" <jan.kiszka@siemens.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Helge Deller" <deller@gmx.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Vineet Gupta" <vgupta@kernel.org>, "Matt Turner" <mattst88@gmail.com>,
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "Kieran Bingham" <kbingham@kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Brian Cain" <bcain@quicinc.com>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_074853_682232_E1C3C9A9 
X-CRM114-Status: UNSURE (   9.91  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQsIGF0IDE2OjQ0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDI3LzAyLzIwMjQgw6AgMTY6NDAsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4gT24g
TW9uLCBGZWIgMjYsIDIwMjQsIGF0IDE3OjU1LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPgo+Cj4g
Rm9yIDI1NksgcGFnZXMsIHBvd2VycGMgaGFzIHRoZSBmb2xsb3dpbmcgaGVscC4gSSB0aGluayB5
b3Ugc2hvdWxkIGhhdmUgCj4gaXQgdG9vOgo+Cj4gCSAgVGhlIGtlcm5lbCB3aWxsIG9ubHkgYmUg
YWJsZSB0byBydW4gYXBwbGljYXRpb25zIHRoYXQgaGF2ZSBiZWVuCj4gCSAgY29tcGlsZWQgd2l0
aCAnLXptYXgtcGFnZS1zaXplJyBzZXQgdG8gMjU2SyAodGhlIGRlZmF1bHQgaXMgNjRLKSB1c2lu
Zwo+IAkgIGJpbnV0aWxzIGxhdGVyIHRoYW4gMi4xNy41MC4wLjMsIG9yIGJ5IHBhdGNoaW5nIHRo
ZSBFTEZfTUFYUEFHRVNJWkUKPiAJICBkZWZpbml0aW9uIGZyb20gMHgxMDAwMCB0byAweDQwMDAw
IGluIG9sZGVyIHZlcnNpb25zLgoKSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIG1lbnRpb24gcHJl
LTIuMTggYmludXRpbHMgYW55IG1vcmUsIGJ1dCB0aGUKcmVzdCBzZWVtcyB1c2VmdWwsIGNoYW5n
ZWQgdGhlIHRleHQgbm93IHRvCgpjb25maWcgUEFHRV9TSVpFXzI1NktCCiAgICAgICAgYm9vbCAi
MjU2S2lCIHBhZ2VzIgogICAgICAgIGRlcGVuZHMgb24gSEFWRV9QQUdFX1NJWkVfMjU2S0IKICAg
ICAgICBoZWxwCiAgICAgICAgICAyNTZLaUIgcGFnZXMgaGF2ZSBsaXR0bGUgcHJhY3RpY2FsIHZh
bHVlIGR1ZSB0byB0aGVpciBleHRyZW1lCiAgICAgICAgICBtZW1vcnkgdXNhZ2UuICBUaGUga2Vy
bmVsIHdpbGwgb25seSBiZSBhYmxlIHRvIHJ1biBhcHBsaWNhdGlvbnMKICAgICAgICAgIHRoYXQg
aGF2ZSBiZWVuIGNvbXBpbGVkIHdpdGggJy16bWF4LXBhZ2Utc2l6ZScgc2V0IHRvIDI1NktpQgog
ICAgICAgICAgKHRoZSBkZWZhdWx0IGlzIDY0S2lCIG9yIDRLaUIgb24gbW9zdCBhcmNoaXRlY3R1
cmVzKS4KCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
