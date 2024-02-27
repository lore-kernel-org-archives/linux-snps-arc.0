Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB0CC54798
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJNk6xTTheobRLi+n6hA3dQy1PhPO0iGyXn8aeU8NLo=; b=pkg2iv/i2HW//n
	uepxZCaLyRrSPPC5sTnIt1DqxJnclLNFm+xThBmDkTIYlnmo4fUVcPFWd2xukIuVwrClvwSXThSEV
	dGPCrUf0qaPK9cJmGGM9vPWZwRUqmKR7sWUDjXXTYGsDl0kgJO0Cjmk9BCgHQYnbiexhu2f3n7rDb
	0tUDOLHL30r857C74UUPn9alnemUqhHPj9WAgoRr5Rm84oyyN9a45bZ0nEipGMiXnSXHHYyi21rR1
	fSjD93k6UVtth8wqGMvfnQ5t5fUB6rNKrlQexa4u81p13AttlNRJOvW518AYuXlY4DU/wTT7d+xbT
	MzkzQIALymp60p+OlCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reyIY-00000005Ycm-461N;
	Tue, 27 Feb 2024 14:19:10 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reyIT-00000005YYO-3qHr;
	Tue, 27 Feb 2024 14:19:08 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8717758176A;
	Tue, 27 Feb 2024 09:19:00 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 09:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709043540;
	 x=1709050740; bh=lgwXV027qrMgBZRGGg484htOjeaxN2ck0Zcve0Dmzhs=; b=
	lPUTGKxSZWT3KviA8nwQtQixUNSRKDoofN2NivSWKtva1+uopGcYEEr4RC46c0a4
	vwDyryLlG3/SO1o0IgHaIAKElGDgOIftHdg/t1LowfBfp6kWJ/02DSeWOd9gO01Y
	i2xNDAt65lcr61a9rbStiacnnPLSzVXxNfz+qirJEOwE6l4Mjsb9FPSq6beDfONs
	IfFnZ9bxqqqY3xHHTJ0xelGfB0mkN5vK/R1PlQWSfAeazO2LUPLczof7Is+mk4YY
	dS7xeAUB8mFbzZwvSoSrgsd+tbYj/Jm83Sm5bzumIEzMe8eZVlLb2zqJj5ACbn1Q
	xHdhr1utw0PFFSmpN8T17A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709043540; x=
	1709050740; bh=lgwXV027qrMgBZRGGg484htOjeaxN2ck0Zcve0Dmzhs=; b=N
	PNMT8iDaqBhcmripVnSD6nS3Lv42kN3UYBW99FRUWa3TpEGbwqC5etBXkzZPJQ97
	b46+HgX1sO+sVYOqI7WWoftMMpP1d6mFgSc+COHXzownsJ7ep9c7luzipVKN/JSm
	WvBS91t32eqhnz4okM6kGJHX7ja6nxAsDWD2f8/n1iyXi5CXN1O8cRQmzdP0MN3P
	lXLGSaSOyRMNG2Klv5JGjNbEL+jZ99PzUXZkK0dRYXnY7Sh9tCeVVIPOdKairDq/
	hVJllB8wVwsQCnLlNf4DWkeeaaUPJ42yyj0cK8PqRkYPiog+0wCNiowoUDAfMSZ0
	TxOSo3YO5XIRZlykzYViQ==
X-ME-Sender: <xms:Uu_dZWjk9CPDDtuHUq0spRBOyt_ieWSB_NQxrFGLmr24EkUFHc8YHg>
    <xme:Uu_dZXDMUFx8ZF-9sPWppPSzjc83i6I1db9CmveKWGMIeJFPSdAeNSa88BpcqoNFB
    jVJuLbK_PRbbcnDDkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Uu_dZeEDtHRL9UWe85NwoKrx0otX3SNqDfDiZ5hOf70Z6GsgUqDdIw>
    <xmx:Uu_dZfQ4cWIo6G3rC1HFzafsQ2XymenYLV7MaNYtE0ltPhY45Lm3AA>
    <xmx:Uu_dZTw8lPg-bwLBWej0tpp3R0mNAVRklOB_4I0L7nRbPx69459aug>
    <xmx:VO_dZbOruGZOL_Pr3S4l_raiy6WMSNlORBuJgrWys66FFVcptlS8dQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8FBCAB6008D; Tue, 27 Feb 2024 09:18:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <7b62e73d-d3fa-4432-807d-c2e667814b17@app.fastmail.com>
In-Reply-To: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
 <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
 <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Date: Tue, 27 Feb 2024 15:18:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Richard Weinberger" <richard@nod.at>, x86@kernel.org,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Jan Kiszka" <jan.kiszka@siemens.com>,
 "Kieran Bingham" <kbingham@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, "Greg Ungerer" <gerg@linux-m68k.org>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_061906_851091_C0CDF165 
X-CRM114-Status: GOOD (  19.85  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQsIGF0IDEyOjEyLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gT24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTE6NTnigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPiB3cm90ZToKPj4gT24gVHVlLCBGZWIgMjcsIDIwMjQsIGF0IDA5OjU0LCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+IEkgd2FzIGEgYml0IHVuc3VyZSBhYm91dCBob3cgdG8g
YmVzdCBkbyB0aGlzIHNpbmNlIHRoZXJlCj4+IGlzIG5vdCByZWFsbHkgYSBuZWVkIGZvciBhIGZp
eGVkIHBhZ2Ugc2l6ZSBvbiBub21tdSBrZXJuZWxzLAo+PiB3aGVyZWFzIHRoZSB0aHJlZSBNTVUg
Y29uZmlncyBjbGVhcmx5IHRpZSB0aGUgcGFnZSBzaXplIHRvCj4+IHRoZSBNTVUgcmF0aGVyIHRo
YW4gdGhlIHBsYXRmb3JtLgo+Pgo+PiBUaGVyZSBzaG91bGQgYmUgbm8gcmVhc29uIGZvciBjb2xk
ZmlyZSB0byBoYXZlIGEgZGlmZmVyZW50Cj4+IHBhZ2Ugc2l6ZSBmcm9tIGRyYWdvbmJhbGwgaWYg
bmVpdGhlciBvZiB0aGVtIGFjdHVhbGx5IHVzZXMKPj4gaGFyZHdhcmUgcGFnZXMsIHNvIG9uZSBv
ZiB0aGVtIGNvdWxkIGJlIGNoYW5nZWQgbGF0ZXIuCj4KPiBJbmRlZWQsIGluIHRoZW9yeSwgUEFH
RV9TSVpFIGRvZXNuJ3QgbWF0dGVyIGZvciBub21tdSwgYnV0IHRoZSBjb25jZXB0Cj4gb2YgcGFn
ZXMgaXMgdXNlZCBhbGwgb3ZlciB0aGUgcGxhY2UgaW4gTGludXguCj4KPiBJJ20gbW9zdGx5IHdv
cnJpZWQgYWJvdXQgc29tZSBDb2xkZmlyZSBjb2RlIHJlbHlpbmcgb24gdGhlIGFjdHVhbCB2YWx1
ZQo+IG9mIFBBR0VfU0laRSBpbiBzb21lIG90aGVyIGNvbnRleHQuIGUuZy4gZm9yIGNvbmZpZ3Vy
aW5nIG5vbi1jYWNoZWFibGUKPiByZWdpb25zLgoKUmlnaHQsIGFueSBjaGFuZ2UgaGVyZSB3b3Vs
ZCBoYXZlIHRvIGJlIGNhcmVmdWxseSB0ZXN0ZWQuIEkgd291bGQKZXhwZWN0IHRoYXQgYSA0SyBw
YWdlIHNpemUgd291bGQgcmVkdWNlIG1lbW9yeSBjb25zdW1wdGlvbiBldmVuIG9uCk5PTU1VIHN5
c3RlbXMgdGhhdCBzaG91bGQgaGF2ZSB0aGUgc2FtZSB0cmFkZW9mZnMgZm9yIHJlcHJlc2VudGlu
ZwpmaWxlcyBpbiB0aGUgcGFnZSBjYWNoZSBhbmQgaW4gbWVtX21hcFtdLgoKPiBBbmQgZG9lcyB0
aGlzIGltcGFjdCBydW5uaW5nIG5vbW11IGJpbmFyaWVzIG9uIGEgc3lzdGVtIHdpdGggTU1VPwo+
IEkuZS4gaWYgbm9tbXUgYmluYXJpZXMgd2VyZSBidWlsdCB3aXRoIGEgNCBLaUIgUEFHRV9TSVpF
LCBkbyB0aGV5Cj4gc3RpbGwgcnVuIG9uIE1NVSBzeXN0ZW1zIHdpdGggYW4gOCBLaUIgUEFHRV9T
SVpFIChjb2xkZmlyZSBhbmQgc3VuMyksCj4gb3IgYXJlIHRoZXJlIHNvbWUgc3VidGxldGllcyB0
byB0YWtlIGludG8gYWNjb3VudD8KCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIGJpbmFyaWVzIGhh
dmUgdG8gYmUgYnVpbHQgYW5kIGxpbmtlZCBmb3IKdGhlIGxhcmdlc3QgcGFnZSBzaXplIHRoZXkg
Y2FuIHJ1biBvbiwgc28gcnVubmluZyB0aGVtIG9uIGEga2VybmVsCndpdGggc21hbGxlciBwYWdl
IHNpemUgdXN1YWxseSB3b3Jrcy4KCk9uZSBub3RhYmxlIGV4Y2VwdGlvbiBpcyBzeXNfbW1hcDIo
KSwgd2hpY2ggb24gbW9zdCBhcmNoaXRlY3R1cmVzCnRha2VzIHVuaXRzIG9mIDRLaUIgYnV0IG9u
IG02OGsgaXMgYWN0dWFsbHkgd3JpdHRlbiB0byB0YWtlClBBR0VfU0laRSB1bml0cy4gQXMgQWwg
cG9pbnRlZCBvdXQgaW4gZjhiNzI1NjA5NmEyICgiVW5pZnkKc3lzX21tYXAqIiksIGl0IGhhcyBh
bHdheXMgYmVlbiB3cm9uZyBvbiBzdW4zLCBwcmVzdW1hYmx5CmJlY2F1c2UgdXNlcnMgb2YgdGhh
dCBwcmVkYXRlIG1vZGVybiBnbGliYy4gUnVubmluZyBjb2xkZmlyZQpub21tdSBiaW5hcmllcyBv
biBjb2xkZmlyZSBtbXUga2VybmVscyB3b3VsZCBydW4gaW50byB0aGUgc2FtZQpidWcgaWYgZWl0
aGVyIG9mIHRoZW0gY2hhbmdlcyBQQUdFX1NJWkUuIElmIHlvdSBjYW4gcnVuCmNvbGRmaXJlIG5v
bW11IGJpbmFyaWVzIG9uIGNsYXNzaWMgbTY4aywgdGhhdCBpcyBhbHJlYWR5CmJyb2tlbiBpbiB0
aGUgc2FtZSB3YXkuCgogICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
