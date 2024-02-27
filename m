Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D04EC54798
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkhHkmBK4YQbGWLDWMyzp0w4Q9S0JY8DKvKfV4+4uzs=; b=ziZ0OET2X3/Q2A
	SLlYECFZiW3eUqeUIHGvZJkmM3nZXUIADDUXxYoyEeSrw0yUJXndCxQHhzpRPSZB0hAr2eflZx+f+
	/yFFEYiKoGbh9oBo8Y6dcppmP8iuG7Xjo3nCxHrzdO27fBeE0LsgraVOxTz7cd7Hfy4zcYugJVwl0
	QOSc2qriy5ISYpQ3t87iVnw8n6jdFoMEfh4tc5p2s/EFrFwMUDdP1LeM2lBk99WOyTOPf0DmgAvEz
	T2izIWQNETWuxYDmzKXZH3scT7HCBG/ZvMV5Bu6NcYXwGojFpWS/wK1VGuVcTfvsimpz9VNWDRty1
	qIjI+PhIKlROJhmiyrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezbq-00000005pFS-0wTv;
	Tue, 27 Feb 2024 15:43:10 +0000
Received: from flow5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rezbm-00000005pCv-0FAg;
	Tue, 27 Feb 2024 15:43:07 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id F2D5720008F;
	Tue, 27 Feb 2024 10:43:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 10:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709048583;
	 x=1709055783; bh=rCK/UfqbDu4ldnegzmSK0UKvclJAYdVrTkCZN4NB1xI=; b=
	rDZztf+EZEmbYIIZ7K/BZsGWztOvaw0wL+R1NkEaGPDWSws5dUN+RIpfm1kT9ymI
	ows+zMsmMVnXCAO8Pzidm6a++lXC/Ten//T66Ew2JODUoNckYQNa9HTdBG8kKzyf
	Suej1YRfWtmbrV1ZODw4orTErVizwvwJmRcOC7CWmQVrBkqwrKRbDsUHJZYoDIze
	XKPwfs+Fh03PV0sivL4vKav0n4NzCW4fuNNRtiZf6cUtds9qey1Xef4aEXJwkba8
	xLl6wEAa488pjmfGf8D1AN6iPSngdkkfhqwWz2TCBv+rzUkVoby7hEYUXTLfmyS8
	SsjkHFi66V+ZqoeoMFeVyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709048583; x=
	1709055783; bh=rCK/UfqbDu4ldnegzmSK0UKvclJAYdVrTkCZN4NB1xI=; b=S
	y6F6rzybn9EGdSOYXZNXjq9Jc08BcyWDVLk5vtfltqR/0N3QejLBvtuH1nM61fB/
	IpxgH5KgpJ/goepKpnHxdwuGRVsuDrcCX1H4gPQWgRJoNbFmpcyfCmoyZeAIT+Px
	e2jmbnjPrwHxEK7UsLFt/0pzARlBBj2xO1hKShLE3owgixW9wRybOa7Jmi+zD7/5
	wrgeY6P3WATH6wneKFBpQ59A1ZEeGzGbkNFXebbVdc5nkEAO/2kPx47NpcIHD1sz
	r1UEtZnsz/CRAFLkaE9NR5PTmwRoxMZTi7HCro+oB8aZqqOydQ+HgAQtqRiN5Wr+
	+g2GTOK/SO4LXnM3FOlvw==
X-ME-Sender: <xms:BwPeZS47SiblYbq7KodBAl_Vc4Q9Y5qZlFxO6xcw7TfMbjq8SYvnPg>
    <xme:BwPeZb6iJLmH3mKw8HMCI9wL5vjkcISz55DV2rBlEfop_Dhd351GNWpdWcaduCc_F
    4h6LT4oizGD01noD2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:BwPeZRdXWIE5kOTCERrtcwBtgdmrzQx7Zxk1nJMXDnP15whFzvolnw>
    <xmx:BwPeZfIq8_C9BA8eTIRSxwKMtaC4-DCaunMnbd1Z7sOfTzTyzfNmJA>
    <xmx:BwPeZWJ5er8j5CGFNjxyS-0pKZukwg0k31oFVMfRzmxPIG9heixJsw>
    <xmx:BwPeZcVl_5_jsCSftcKQxQLVmz2VxDWr5GmFcuI1KfH_6G4hprdKi3j4jWg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 897ACB6008D; Tue, 27 Feb 2024 10:43:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <e49232e2-9fa9-4f83-9471-a3852b83c113@app.fastmail.com>
In-Reply-To: <9aae81d0-dfaf-423c-8ceb-72829a98420d@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <9aae81d0-dfaf-423c-8ceb-72829a98420d@csgroup.eu>
Date: Tue, 27 Feb 2024 16:42:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>
Cc: "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Richard Weinberger" <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Jan Kiszka" <jan.kiszka@siemens.com>,
 "Kieran Bingham" <kbingham@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_074306_196871_DB3912BD 
X-CRM114-Status: GOOD (  15.29  )
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

T24gTW9uLCBGZWIgMjYsIDIwMjQsIGF0IDIwOjAyLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDI2LzAyLzIwMjQgw6AgMTc6MTQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4gRnJv
bTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+IFRoYXQncyBhIG5pY2UgcmUtZmFj
dG9yLgo+Cj4gVGhlIG9ubHkgZHJhd2JhY2sgSSBzZWUgaXMgdGhhdCB3ZSBhcmUgbG9vc2luZyBz
ZXZlcmFsIGludGVyZXN0aW5nIAo+IGFyY2gtc3BlY2lmaWMgY29tbWVudHMvaGVscCB0ZXh0LiBE
b24ndCBrbm93IGlmIHRoZXJlIGNvdWxkIGJlIGFuIGVhc3kgCj4gd2F5IHRvIGtlZXAgdGhlbS4K
ClRoaXMgaXMgd2hhdCBJIGhhdmUgbm93LCB0cnlpbmcgdG8gd3JpdGUgaXQgYXMgZ2VuZXJpYyBh
cwpwb3NzaWJsZSB3aGlsZSBzdGlsbCBnaXZpbmcgdXNlZnVsIGFkdmljZToKCmNvbmZpZyBQQUdF
X1NJWkVfNEtCCiAgICAgICAgYm9vbCAiNEtpQiBwYWdlcyIKICAgICAgICBkZXBlbmRzIG9uIEhB
VkVfUEFHRV9TSVpFXzRLQgogICAgICAgIGhlbHAKICAgICAgICAgIFRoaXMgb3B0aW9uIHNlbGVj
dCB0aGUgc3RhbmRhcmQgNEtpQiBMaW51eCBwYWdlIHNpemUgYW5kIHRoZSBvbmx5CiAgICAgICAg
ICBhdmFpbGFibGUgb3B0aW9uIG9uIG1hbnkgYXJjaGl0ZWN0dXJlcy4gVXNpbmcgNEtpQiBwYWdl
IHNpemUgd2lsbAogICAgICAgICAgbWluaW1pemUgbWVtb3J5IGNvbnN1bXB0aW9uIGFuZCBpcyB0
aGVyZWZvcmUgcmVjb21tZW5kZWQgZm9yIGxvdwogICAgICAgICAgbWVtb3J5IHN5c3RlbXMuCiAg
ICAgICAgICBTb21lIHNvZnR3YXJlIHRoYXQgaXMgd3JpdHRlbiBmb3IgeDg2IHN5c3RlbXMgbWFr
ZXMgaW5jb3JyZWN0CiAgICAgICAgICBhc3N1bXB0aW9ucyBhYm91dCB0aGUgcGFnZSBzaXplIGFu
ZCBvbmx5IHJ1bnMgb24gNEtpQiBwYWdlcy4KCmNvbmZpZyBQQUdFX1NJWkVfOEtCCiAgICAgICAg
Ym9vbCAiOEtpQiBwYWdlcyIKICAgICAgICBkZXBlbmRzIG9uIEhBVkVfUEFHRV9TSVpFXzhLQgog
ICAgICAgIGhlbHAKICAgICAgICAgIFRoaXMgb3B0aW9uIGlzIHRoZSBvbmx5IHN1cHBvcnRlZCBw
YWdlIHNpemUgb24gYSBmZXcgb2xkZXIKICAgICAgICAgIHByb2Nlc3NvcnMsIGFuZCBjYW4gYmUg
c2xpZ2h0bHkgZmFzdGVyIHRoYW4gNEtpQiBwYWdlcy4KCmNvbmZpZyBQQUdFX1NJWkVfMTZLQgog
ICAgICAgIGJvb2wgIjE2S2lCIHBhZ2VzIgogICAgICAgIGRlcGVuZHMgb24gSEFWRV9QQUdFX1NJ
WkVfMTZLQgogICAgICAgIGhlbHAKICAgICAgICAgIFRoaXMgb3B0aW9uIGlzIHVzdWFsbHkgYSBn
b29kIGNvbXByb21pc2UgYmV0d2VlbiBtZW1vcnkKICAgICAgICAgIGNvbnN1bXB0aW9uIGFuZCBw
ZXJmb3JtYW5jZSBmb3IgdHlwaWNhbCBkZXNrdG9wIGFuZCBzZXJ2ZXIKICAgICAgICAgIHdvcmts
b2Fkcywgb2Z0ZW4gc2F2aW5nIGEgbGV2ZWwgb2YgcGFnZSB0YWJsZSBsb29rdXBzIGNvbXBhcmVk
CiAgICAgICAgICB0byA0S0IgcGFnZXMgYXMgd2VsbCBhcyByZWR1Y2luZyBUTEIgcHJlc3N1cmUg
YW5kIG92ZXJoZWFkIG9mCiAgICAgICAgICBwZXItcGFnZSBvcGVyYXRpb25zIGluIHRoZSBrZXJu
ZWwgYXQgdGhlIGV4cGVuc2Ugb2YgYSBsYXJnZXIKICAgICAgICAgIHBhZ2UgY2FjaGUuCgpjb25m
aWcgUEFHRV9TSVpFXzMyS0IKICAgICAgICBib29sICIzMktpQiBwYWdlcyIKICAgICAgICBkZXBl
bmRzIG9uIEhBVkVfUEFHRV9TSVpFXzMyS0IKICAgICAgICAgIFVzaW5nIDMyS2lCIHBhZ2Ugc2l6
ZSB3aWxsIHJlc3VsdCBpbiBzbGlnaHRseSBoaWdoZXIgcGVyZm9ybWFuY2UKICAgICAgICAgIGtl
cm5lbCBhdCB0aGUgcHJpY2Ugb2YgaGlnaGVyIG1lbW9yeSBjb25zdW1wdGlvbiBjb21wYXJlZCB0
bwogICAgICAgICAgMTZLaUIgcGFnZXMuICBUaGlzIG9wdGlvbiBpcyBhdmFpbGFibGUgb25seSBv
biBjbk1JUFMgY29yZXMuCiAgICAgICAgICBOb3RlIHRoYXQgeW91IHdpbGwgbmVlZCBhIHN1aXRh
YmxlIExpbnV4IGRpc3RyaWJ1dGlvbiB0bwogICAgICAgICAgc3VwcG9ydCB0aGlzLgoKY29uZmln
IFBBR0VfU0laRV82NEtCCiAgICAgICAgYm9vbCAiNjRLaUIgcGFnZXMiCiAgICAgICAgZGVwZW5k
cyBvbiBIQVZFX1BBR0VfU0laRV82NEtCCiAgICAgICAgICBVc2luZyA2NEtpQiBwYWdlIHNpemUg
d2lsbCByZXN1bHQgaW4gc2xpZ2h0bHkgaGlnaGVyIHBlcmZvcm1hbmNlCiAgICAgICAgICBrZXJu
ZWwgYXQgdGhlIHByaWNlIG9mIG11Y2ggaGlnaGVyIG1lbW9yeSBjb25zdW1wdGlvbiBjb21wYXJl
ZCB0bwogICAgICAgICAgNEtpQiBvciAxNktpQiBwYWdlcy4KICAgICAgICAgIFRoaXMgaXMgbm90
IHN1aXRhYmxlIGZvciBnZW5lcmFsLXB1cnBvc2Ugd29ya2xvYWRzIGJ1dCB0aGUKICAgICAgICAg
IGJldHRlciBwZXJmb3JtYW5jZSBtYXkgYmUgd29ydGggdGhlIGNvc3QgZm9yIGNlcnRhaW4gdHlw
ZXMgb2YKICAgICAgICAgIHN1cGVyY29tcHV0aW5nIG9yIGRhdGFiYXNlIGFwcGxpY2F0aW9ucyB0
aGF0IHdvcmsgbW9zdGx5IHdpdGgKICAgICAgICAgIGxhcmdlIGluLW1lbW9yeSBkYXRhIHJhdGhl
ciB0aGFuIHNtYWxsIGZpbGVzLgoKY29uZmlnIFBBR0VfU0laRV8yNTZLQgogICAgICAgIGJvb2wg
IjI1NktpQiBwYWdlcyIKICAgICAgICBkZXBlbmRzIG9uIEhBVkVfUEFHRV9TSVpFXzI1NktCCiAg
ICAgICAgaGVscAogICAgICAgICAgMjU2S0IgcGFnZXMgaGF2ZSBsaXR0bGUgcHJhY3RpY2FsIHZh
bHVlIGR1ZSB0byB0aGVpciBleHRyZW1lCiAgICAgICAgICBtZW1vcnkgdXNhZ2UuCgpMZXQgbWUg
a25vdyBpZiB5b3UgdGhpbmsgc29tZSBvZiB0aGlzIHNob3VsZCBiZSBhZGFwdGVkIGZ1cnRoZXIu
Cgo+PiAgIAo+PiArI2RlZmluZSBQQUdFX1NISUZUIENPTkZJR19QQUdFX1NISUZUCj4+ICAgI2Rl
ZmluZSBQQUdFX1NJWkUgICgxVUwgPDwgUEFHRV9TSElGVCkKPj4gICAjZGVmaW5lIFBBR0VfTUFT
SyAgKH4oKDEgPDwgUEFHRV9TSElGVCkgLSAxKSkKPj4gICAKPgo+IENvdWxkIHdlIG1vdmUgUEFH
RV9TSVpFIGFuZCBQQUdFX01BU0sgaW4gYSBnZW5lcmljL2NvcmUgaGVhZGVyIGluc3RlYWQgCj4g
b2YgaGF2aW5nIGl0IGR1cGxpY2F0ZWQgZm9yIGVhY2ggYXJjaCA/CgpZZXMsIGJ1dCBJJ20gbGVh
dmluZyB0aGlzIGZvciBhIGZvbGxvdy11cCBzZXJpZXMsIHNpbmNlIEkgaGFkCnRvIHN0b3Agc29t
ZXdoZXJlIGFuZCB0aGVyZSBpcyBhbHdheXMgcm9vbSBmb3IgY2xlYW51cCB1cCBoZWFkZXJzCmZ1
cnRoZXIgOy0pCgogICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
