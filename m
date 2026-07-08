Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2E5C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 21:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IG9YK6vm3qcz/7+Nyv6ltzBnYgOO08d+NQTpJmxPEzc=; b=3roufr6toXZyJn
	nU3g7ZGxu69vGi0QRQgmAX7ZGVJiKXsloJ9EluUXhy1Zy1luffugemXaMHx7jNzTgoDwq3nFhuY8u
	qOeAZR0IPnWJTQG5lYH1GFfEyMUC6wp0wh17ExfLpWPccwZNNRQMI4AzH4ilo8jxP+7/J6WhraaXE
	6Azc3I13sR+CtTnNJGhjq5N+TY879tY1dIhdFnRRC76ARm7c9hoUWas7y+4UznJGdqjys/Dd7ZJfD
	/dDNhBYovfBO5zFO9w3iE6tc2UC/h6RCRlT5XBjSsIS/fGGRxOCxIYXqTvv6WEuatRXtxFQld/Byb
	ueMOZb9JCavmQQL0+HQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wha0I-00000000SWk-0XTZ;
	Wed, 08 Jul 2026 21:40:26 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wha0E-00000000SVt-10mJ;
	Wed, 08 Jul 2026 21:40:23 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 362D5C2A88;
	Thu,  9 Jul 2026 00:39:55 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 362D5C2A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783546818;
	bh=vh8LzxdSEB6LZ5YWToq98HafI55oS8+SMbKFy7UAtCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vxaj5QTrZmnMb8kgo0DAnYKLpgF1VNrrEnZhf9ONVOiUDzl0XehMr6So/mzP7wSyL
	 f/bqBaPzsa1UU5XOryNPd/7wb5rGQ7IwzXh6waI3HHJA4HLb35t2X+7MMwejCU49/V
	 wyf2N0EPqZ3qOvz85kyJv8Z4VVG4eamp/AsyfiC+iferCPdwrWRhhI2Gihi8EYWMG6
	 w9oTc7WxIT/1nxUO9bTb5BDnYHc4NJdQoeD9M4hXia3YTHnUvNPgR3MY/vwUlZnDJN
	 KsGLwDIHTElRb68oeRo724l+p50zYouaHMInNxEVvF4Rx2YclHGHsHkUSx9MW9gMJA
	 BLbx/jCYTxmsw==
Message-ID: <0f3a6ccaadc1d330215416d9cec13263d71b685e.camel@rendec.net>
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>,  Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
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
Date: Wed, 08 Jul 2026 17:39:50 -0400
In-Reply-To: <20260707190254.181086755@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190254.181086755@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_144022_458680_F1CFFA97 
X-CRM114-Status: GOOD (  13.24  )
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
Cj4gcnNlcV9zeXNjYWxsX2VudGVyX3dvcmsoKSBpcyBpbnZva2VkIGJlZm9yZSB0aGUgc3lzY2Fs
bCBudW1iZXIgY2FuIGJlCj4gbW9kaWZpZWQuIFNvIHRoZXJlIGlzIG5vIHBvaW50IGluIHJlcmVh
ZGluZyBpdCBmcm9tIHB0X3JlZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBpbmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5o
IHzCoMKgwqAgOSArKysrKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gLS0tIGEvaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvZW50cnktY29tbW9uLmgKPiBAQCAtNzAsOSArNzAsMTAgQEAg
c3RhdGljIGlubGluZSB2b2lkIHN5c2NhbGxfZW50ZXJfYXVkaXQocwo+IMKgCX0KPiDCoH0KPiDC
oAo+IC1zdGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgc3lzY2FsbF90cmFjZV9lbnRlcihzdHJ1
Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyB3b3JrKQo+ICtzdGF0aWMgX19hbHdheXNf
aW5saW5lIGxvbmcgc3lzY2FsbF90cmFjZV9lbnRlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5z
aWduZWQgbG9uZyB3b3JrLAo+ICsJCQkJCQlsb25nIHN5c2NhbGwpCj4gwqB7Cj4gLQlsb25nIHN5
c2NhbGwsIHJldCA9IDA7Cj4gKwlsb25nIHJldCA9IDA7Cj4gwqAKPiDCoAkvKgo+IMKgCSAqIEhh
bmRsZSBTeXNjYWxsIFVzZXIgRGlzcGF0Y2guwqAgVGhpcyBtdXN0IGNvbWVzIGZpcnN0LCBzaW5j
ZQo+IEBAIC05MCw3ICs5MSw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgbG9uZyBzeXNjYWxs
X3RyYWMKPiDCoAkgKiB0aHJvdWdoIGhydGltZXJfaW50ZXJydXB0KCkuCj4gwqAJICovCj4gwqAJ
aWYgKHdvcmsgJiBTWVNDQUxMX1dPUktfU1lTQ0FMTF9SU0VRX1NMSUNFKQo+IC0JCXJzZXFfc3lz
Y2FsbF9lbnRlcl93b3JrKHN5c2NhbGxfZ2V0X25yKGN1cnJlbnQsIHJlZ3MpKTsKPiArCQlyc2Vx
X3N5c2NhbGxfZW50ZXJfd29yayhzeXNjYWxsKTsKPiDCoAo+IMKgCS8qIEhhbmRsZSBwdHJhY2Ug
Ki8KPiDCoAlpZiAod29yayAmIChTWVNDQUxMX1dPUktfU1lTQ0FMTF9UUkFDRSB8IFNZU0NBTExf
V09SS19TWVNDQUxMX0VNVSkpIHsKPiBAQCAtMTQ1LDcgKzE0Niw3IEBAIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgbG9uZyBzeXNjYWxsX2VudGUKPiDCoAl1bnNpZ25lZCBsb25nIHdvcmsgPSBSRUFE
X09OQ0UoY3VycmVudF90aHJlYWRfaW5mbygpLT5zeXNjYWxsX3dvcmspOwo+IMKgCj4gwqAJaWYg
KHdvcmsgJiBTWVNDQUxMX1dPUktfRU5URVIpCj4gLQkJc3lzY2FsbCA9IHN5c2NhbGxfdHJhY2Vf
ZW50ZXIocmVncywgd29yayk7Cj4gKwkJc3lzY2FsbCA9IHN5c2NhbGxfdHJhY2VfZW50ZXIocmVn
cywgd29yaywgc3lzY2FsbCk7Cj4gwqAKPiDCoAlyZXR1cm4gc3lzY2FsbDsKPiDCoH0KClJldmll
d2VkLWJ5OiBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
