Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C982C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cQ/kkzQAG4SlJu5vRtWc27hjcCojz85WyAdBJgNvyc=; b=DjQBvFKraoaKE3
	EOmNy3mvzjTzEviaY0ZfnifM66zqGOpP2jM9+21orP9XCHvWhusq44xV8dJ2ueKWwF5PV7ePO0lno
	ydjBoKKoNGUEN51+/jaj1/GXH2bh/kcUJOXRzb7CLcZsFFlmZ67GCHzjWWcJDv1iUMVkTft6+z69w
	fjX+odczzrrkRrQlH4dulht6lctzautaaWFutkcnFuV6wcBDZBS2p3cHG6qJdRSFi1a0OEBoa+bNI
	+uusKxtlff4VjvbflSkmeOtnbOxHBzQFjqLuKcQBpK96LWRGSX23Gs9gofbxyPJ/S9tkwMA3by/03
	ZGSmrfDNiIinYi4jK9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whX9V-00000000CPv-0zPA;
	Wed, 08 Jul 2026 18:37:45 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whX9R-00000000COs-4B1x;
	Wed, 08 Jul 2026 18:37:43 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id BD677C343E;
	Wed,  8 Jul 2026 21:37:17 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro BD677C343E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783535859;
	bh=J8eh6Rp71aMkUZPGbdf4HwpQyZ/mRcCB+VtPzFZfm0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MYg2quQsJUR7e8ayAFMJcRvjHsrwKzUQqkhrJdU4nanpzL1jX14m8Z+Ds91DdqoKn
	 QJReaLyNa/iLaBx/8t9LaIJgpO/V9u0Qk+ctVFHOLXc1PsNN77To6wbQLDR/wbO2Jd
	 LI7Oyckd8G3uDywiL3AEPP+/6veZtLhQL8vDm8MBdhsqbXlk1PXB64z0Yki4BQsRic
	 1MYR+Jrgudnmn+eQyNCJp23VAJq+mVC5zubA5AQHg1rSP6wds0PtsFuUt0GISnCwHY
	 EbF0YrfTMJrddRnwe6si6lyEajabery7sEfS+bc1aT49zcfePemMerT/qsFH4wmqB6
	 HEkaGc5AmP+eg==
Message-ID: <335387752ace30084a3f709acf34556443300d1f.camel@rendec.net>
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Huacai Chen
 <chenhuacai@kernel.org>, 	loongarch@lists.linux.dev, Michael Ellerman
 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,  Paul Walmsley	
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
Date: Wed, 08 Jul 2026 14:37:13 -0400
In-Reply-To: <20260707190253.865955911@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190253.865955911@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_113742_208515_3B97F359 
X-CRM114-Status: GOOD (  12.66  )
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
Cj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKSByZXBsYWNl
cwo+IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSBhbmQgdGhlIHN1YnNlcXVlbnQgaW52
b2NhdGlvbiBvZgo+IGFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpLgo+IAo+IFRoZSBhZHZhbnRh
Z2UgaXMgdGhhdCBpdCBhcHBsaWVzIHRoZSBzdGFjayByYW5kb21pemF0aW9uIHJpZ2h0IGFmdGVy
Cj4gZW50ZXJfZnJvbV91c2VyX21vZGUoKSBhbmQgdGhlcmVieSBhdm9pZHMgdGhlIG92ZXJoZWFk
IG9mIGdldC9wdXRfY3B1X3ZhcigpCj4gYXMgdGhhdCBjb2RlIGlzIGludm9rZWQgd2l0aCBpbnRl
cnJ1cHRzIGRpc2FibGVkLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBIdWFjYWkgQ2hl
biA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgo+IENjOiBsb29uZ2FyY2hAbGlzdHMubGludXguZGV2
Cj4gLS0tCj4gwqBhcmNoL2xvb25nYXJjaC9rZXJuZWwvc3lzY2FsbC5jIHzCoMKgwqAgNSArLS0t
LQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+
IC0tLSBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9zeXNjYWxsLmMKPiArKysgYi9hcmNoL2xvb25n
YXJjaC9rZXJuZWwvc3lzY2FsbC5jCj4gQEAgLTExLDcgKzExLDYgQEAKPiDCoCNpbmNsdWRlIDxs
aW51eC9saW5rYWdlLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+Cj4gwqAjaW5jbHVk
ZSA8bGludXgvb2JqdG9vbC5oPgo+IC0jaW5jbHVkZSA8bGludXgvcmFuZG9taXplX2tzdGFjay5o
Pgo+IMKgI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvdW5p
c3RkLmg+Cj4gwqAKPiBAQCAtNzAsOSArNjksNyBAQCB2b2lkIG5vaW5zdHIgX19ub19zdGFja19w
cm90ZWN0b3IgZG9fc3lzCj4gwqAJcmVncy0+b3JpZ19hMCA9IHJlZ3MtPnJlZ3NbNF07Cj4gwqAJ
cmVncy0+cmVnc1s0XSA9IC1FTk9TWVM7Cj4gwqAKPiAtCW5yID0gc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZShyZWdzLCBucik7Cj4gLQo+IC0JYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KCk7
Cj4gKwluciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKHJl
Z3MsIG5yKTsKPiDCoAo+IMKgCWlmIChuciA8IE5SX3N5c2NhbGxzKSB7Cj4gwqAJCXN5c2NhbGxf
Zm4gPSBzeXNfY2FsbF90YWJsZVthcnJheV9pbmRleF9ub3NwZWMobnIsIE5SX3N5c2NhbGxzKV07
CgpSZXZpZXdlZC1ieTogUmFkdSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
