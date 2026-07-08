Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D42C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHBNAyFy7I/ot0s4qv8ca2i3KRSPAmCwoZn9F7phMsU=; b=0iTWshjEoFA/yV
	UiJX2dTMLr/K+3CiEVorMhxmIl6GvTMkIp8zXzaERo5T0vUGPhgt25Q/Nermj8aGBzCVshTmCvnvT
	EK6z4UDLDtSY/cMJWZ/i5aaCwa71cbYQgJJpVgauBMgrPMTOoywHGbLqZ4j4wJ2fZOB0W6SdA9bul
	qbw1i8GdFHcxjzYyg+1Eduwd2dxwfEkxaIUx8muQZaVMXhR6Vw1a94en71VnVWvt2KvthhN37vCsC
	aIHBKxRIsjI5QOul31hZmZhyWgj6fvoUA1vPNJ/lSjqrTQy+sEavqWya97MJ5RmoRaYafit/z0BXg
	v/HqGy8lU5pI4C+3jgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whW1K-000000006C2-0LZp;
	Wed, 08 Jul 2026 17:25:14 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whW1G-000000006Ak-0SDf;
	Wed, 08 Jul 2026 17:25:11 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1E89DC2B1F;
	Wed,  8 Jul 2026 20:24:38 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1E89DC2B1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783531507;
	bh=oMlf4rzg7sFMgtBO8f/rqo4QHF22NzBws1cUSUO+r80=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OJuzJLG2oJHC8E6/z6u4YL1brifg3n0KypZd9zeBUsdEd6uLxd+9vUKIXm8fNb+sD
	 40TB/onHyQSWEZ0oPdpje/xAjGna37MjawhgGr3bVxva9cjLjk1XfUhqToNdmtUx7z
	 YMvmViVzUq9/FTET4wtq/Yhx/L0ZlUxPuNUXmfoDanL5GBZtufQoF3ZbsskDV434aw
	 kxDRuhqvAGGem4j2hDVIoI59nXr2IxQ3aAqoNF0TEbKK88RSrx6CqBol40sxnwMfxK
	 rd7e4S6y5Zb6OYXlWmLIfxqvBAfINm0f8D7u03YVplchQ7tuJ84O05FoHalkh1Nik9
	 f0YRdybiCZuUQ==
Message-ID: <db4b8c27df9be997f935928f2624a863a1f998d6.camel@rendec.net>
Subject: Re: [patch 02/18] randomize_kstack: Provide
 add_random_kstack_offset_irqsoff()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,  Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>,  Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven	 <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Helge Deller	 <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, 	linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, 	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, 	linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta	 <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>,  Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>,  Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?ISO-8859-1?Q?Such=E1nek?=	
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Date: Wed, 08 Jul 2026 13:24:33 -0400
In-Reply-To: <20260707190253.768842729@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190253.768842729@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_102510_328407_D7EE7987 
X-CRM114-Status: GOOD (  14.46  )
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

T24gVHVlLCAyMDI2LTA3LTA3IGF0IDIxOjA2ICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4gYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KCkgdXNlcyBnZXQvcHV0X2NwdV92YXIoKSB3aGlj
aCBpcyBwb2ludGxlc3MKPiBvdmVyaGVhZCB3aGVuIGl0IGlzIGludm9rZWQgZnJvbSBsb3cgbGV2
ZWwgZW50cnkgY29kZSB3aXRoIGludGVycnVwdHMKPiBkaXNhYmxlZC4KPiAKPiBQcm92aWRlIGEg
aXJxc29mZigpIHZhcmlhbnQsIHdoaWNoIGF2b2lkcyB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBLZWVzIENvb2sgPGtlZXNA
a2VybmVsLm9yZz4KPiAtLS0KPiDCoGluY2x1ZGUvbGludXgvcmFuZG9taXplX2tzdGFjay5oIHzC
oMKgIDE5ICsrKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspCj4gCj4gLS0tIGEvaW5jbHVkZS9saW51eC9yYW5kb21pemVfa3N0YWNrLmgKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L3JhbmRvbWl6ZV9rc3RhY2suaAo+IEBAIC03Nyw4ICs3NywyNyBAQCBz
dGF0aWMgX19hbHdheXNfaW5saW5lIHUzMiBnZXRfa3N0YWNrX29mCj4gwqAJfQkJCQkJCQkJXAo+
IMKgfSB3aGlsZSAoMCkKPiDCoAo+ICsvKioKPiArICogYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0
X2lycXNvZmYgLSBJbmNyZWFzZSBzdGFjayB1dGlsaXphdGlvbiBieSBhIHJhbmRvbSBvZmZzZXQu
Cj4gKyAqCj4gKyAqIFRoaXMgc2hvdWxkIGJlIHVzZWQgaW4gdGhlIHN5c2NhbGwgZW50cnkgcGF0
aCBhZnRlciB1c2VyIHJlZ2lzdGVycyBoYXZlIGJlZW4KPiArICogc3RvcmVkIHRvIHRoZSBzdGFj
ay4gSW50ZXJydXB0cyBtdXN0IGJlIHN0aWxsIGRpc2FibGVkLgo+ICsgKi8KPiArI2RlZmluZSBh
ZGRfcmFuZG9tX2tzdGFja19vZmZzZXRfaXJxc29mZigpCQkJCQlcCj4gK2RvIHsJCQkJCQkJCQkJ
XAo+ICsJbG9ja2RlcF9hc3NlcnRfaXJxc19kaXNhYmxlZCgpOwkJCQkJCVwKPiArCWlmIChzdGF0
aWNfYnJhbmNoX21heWJlKENPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVF9ERUZBVUxULAkJ
XAo+ICsJCQkJJnJhbmRvbWl6ZV9rc3RhY2tfb2Zmc2V0KSkgewkJCVwKPiArCQl1MzIgb2Zmc2V0
ID0gcHJhbmRvbV91MzJfc3RhdGUocmF3X2NwdV9wdHIoJmtzdGFja19ybmRfc3RhdGUpKTsJXAo+
ICsJCXU4ICpwdHIgPSBfX2tzdGFja19hbGxvY2EoS1NUQUNLX09GRlNFVF9NQVgob2Zmc2V0KSk7
CQlcCj4gKwkJLyogS2VlcCBhbGxvY2F0aW9uIGV2ZW4gYWZ0ZXIgInB0ciIgbG9zZXMgc2NvcGUu
ICovCQlcCj4gKwkJYXNtIHZvbGF0aWxlKCIiIDo6ICJyIihwdHIpIDogIm1lbW9yeSIpOwkJCVwK
PiArCX0JCQkJCQkJCQlcCj4gK30gd2hpbGUgKDApCj4gKwo+IMKgI2Vsc2UgLyogQ09ORklHX1JB
TkRPTUlaRV9LU1RBQ0tfT0ZGU0VUICovCj4gwqAjZGVmaW5lIGFkZF9yYW5kb21fa3N0YWNrX29m
ZnNldCgpCQlkbyB7IH0gd2hpbGUgKDApCj4gKyNkZWZpbmUgYWRkX3JhbmRvbV9rc3RhY2tfb2Zm
c2V0X2lycXNvZmYoKQlkbyB7IH0gd2hpbGUgKDApCj4gwqAjZW5kaWYgLyogQ09ORklHX1JBTkRP
TUlaRV9LU1RBQ0tfT0ZGU0VUICovCj4gwqAKPiDCoCNlbmRpZgoKUmV2aWV3ZWQtYnk6IFJhZHUg
UmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
