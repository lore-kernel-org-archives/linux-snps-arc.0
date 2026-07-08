Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F80C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 20:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vufSkiUpiZt5/0jovGwL/2LOFXlumHlf1Y3gnogVVUw=; b=xmXOwKUv1IMaHE
	s5+gYvtzoxn96lp0160/8zZrrNPzfhoEYBv5iw5Rhuwa3jcQzfzOEJoSlLQyDb3BXTNd4DXiRTBkk
	Z/MO9bH5qw8Rp+HBoyAVW2M2AQ4THP1yIiiolzmzqpNGA51TREgi+A/o+HgSZ9apadvH/0TnF2GdE
	sAAY1iMHiqst5l5ugDavGqdmo8Rs4y1rLQ2U1I3Vs+tRQ05grrl21ZeCP21p00gPw7nz6grGMOpoH
	Gm6DAT7WYA5TwXsIAf81H1OHzOey//dtW3quw61jsXp1zX6R4gdb/GfmMWnwhHoKTPLl1RN5W2e1a
	+w62wCyq07pAQgk3xpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZN1-00000000PPF-04Gy;
	Wed, 08 Jul 2026 20:59:51 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZMy-00000000POA-2Sdk;
	Wed, 08 Jul 2026 20:59:49 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id EEAC6C3450;
	Wed,  8 Jul 2026 23:59:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro EEAC6C3450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783544386;
	bh=apD89r/ATd0i91X5PLxPXmWRbZb01NLEEn83tYTPdj8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QFBhNiYBGqyqIPaE0Z//h9Otg8dr2LXIHvr8YLUlcTh/kNU/NIbu5jC1lBV3pHdLh
	 Ytm1aPdmx5IPwKpmRwSjzNZATFEnv+SX4IQqX325g318JKX/ahM7OZftwyNPWkKh+8
	 Vevi8c0s6FZB90ZqbVizrkH3lX3FU2ik1T1I5Ls6uZhVB+87d+ps/uU5qQR8vbqmGm
	 WzIaaobCMK1Q68zS0EMjVKisaOGjotqeY2kfDArzrlfOxIAdRTtnnfA8P+I6Lpe81U
	 e7IwFFdqW2LVSX+vRtsYW7C8+F7/fgH4EcUIK6C4eJGLJR5jk9VqhbYq1bnaYAPt14
	 W5V6aNnbwuOcA==
Message-ID: <caeb49cd840279c9fcfae417d1cf239abde20f9e.camel@rendec.net>
Subject: Re: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Michael Ellerman	
 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Jinjie
 Ruan	 <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, Oleg
 Nesterov	 <oleg@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren	 <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, Yoshinori Sato	
 <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Chris
 Zankel	 <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta	
 <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain
 <bcain@kernel.org>,  Michal Simek <monstr@monstr.eu>, Dinh Nguyen
 <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>,  Andreas
 Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, 	linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org, 	linux-arch@vger.kernel.org, Michal
 =?ISO-8859-1?Q?Such=E1nek?=	 <msuchanek@suse.de>, Jonathan Corbet
 <corbet@lwn.net>, 	linux-doc@vger.kernel.org
Date: Wed, 08 Jul 2026 16:59:18 -0400
In-Reply-To: <20260707190254.079478122@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190254.079478122@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_135948_805159_B0C0C5D6 
X-CRM114-Status: GOOD (  18.63  )
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
Cj4gVGhlc2UgZnVuY3Rpb25zIGludGVncmF0ZSB0aGUgc3RhY2sgcmFuZG9taXphdGlvbi4KPiAK
PiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjaygpIGhhcyB0aGUg
YWR2YW50YWdlIHRoYXQgdGhlCj4gcmFuZG9taXphdGlvbiBoYXBwZW5zIGVhcmx5IHJpZ2h0IGFm
dGVyIGVudGVyX2Zyb21fdXNlcl9tb2RlKCkuCj4gCj4gSW4gYm90aCBjYXNlcyBhbHNvIHRoZSBv
dmVyaGVhZCBvZiBnZXQvcHV0X2NwdV92YXIoKSBpbgo+IGFkZF9yYW5kb21fa3N0YWNrX29mZnNl
dCgpIGlzIGF2b2lkZWQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4gQ2M6IHg4NkBrZXJuZWwu
b3JnCj4gLS0tCj4gwqBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzMyLmPCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDE5ICsrKysrLS0tLS0tLS0tLS0tLS0KPiDCoGFyY2gveDg2L2VudHJ5L3N5c2NhbGxf
NjQuY8KgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAzICstLQo+IMKgYXJjaC94ODYvaW5jbHVkZS9h
c20vZW50cnktY29tbW9uLmggfMKgwqDCoCAxIC0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAKPiAtLS0gYS9hcmNoL3g4Ni9lbnRyeS9zeXNj
YWxsXzMyLmMKPiArKysgYi9hcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzMyLmMKPiBAQCAtMTQyLDEw
ICsxNDIsOSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgaW50ODBfaXNfZXh0Cj4gwqAJ
ICogaW50ODBfaXNfZXh0ZXJuYWwoKSBiZWxvdyB3aGljaCBjYWxscyBpbnRvIHRoZSBBUElDIGRy
aXZlci4KPiDCoAkgKiBJZGVudGljYWwgZm9yIHNvZnQgYW5kIGV4dGVybmFsIGludGVycnVwdHMu
Cj4gwqAJICovCj4gLQllbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKPiArCWVudGVyX2Zyb21f
dXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayhyZWdzKTsKPiDCoAo+IMKgCWluc3RydW1lbnRhdGlv
bl9iZWdpbigpOwo+IC0JYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KCk7Cj4gwqAKPiDCoAkvKiBW
YWxpZGF0ZSB0aGF0IHRoaXMgaXMgYSBzb2Z0IGludGVycnVwdCB0byB0aGUgZXh0ZW50IHBvc3Np
YmxlICovCj4gwqAJaWYgKHVubGlrZWx5KGludDgwX2lzX2V4dGVybmFsKCkpKQo+IEBAIC0yMTAs
MTEgKzIwOSw5IEBAIERFRklORV9GUkVERU5UUllfUkFXKGludDgwX2VtdWxhdGlvbikKPiDCoHsK
PiDCoAlpbnQgbnI7Cj4gwqAKPiAtCWVudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+ICsJZW50
ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MpOwo+IMKgCj4gwqAJaW5zdHJ1
bWVudGF0aW9uX2JlZ2luKCk7Cj4gLQlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsKPiAtCj4g
wqAJLyoKPiDCoAkgKiBGUkVEIHB1c2hlZCAwIGludG8gcmVnczo6b3JpZ19heCBhbmQgcmVnczo6
YXggY29udGFpbnMgdGhlCj4gwqAJICogc3lzY2FsbCBudW1iZXIuCj4gQEAgLTI1MiwxMCArMjQ5
LDEwIEBAIERFRklORV9GUkVERU5UUllfUkFXKGludDgwX2VtdWxhdGlvbikKPiDCoAkgKiBvcmln
X2F4LCB0aGUgaW50IHJldHVybiB2YWx1ZSB0cnVuY2F0ZXMgaXQuIFRoaXMgbWF0Y2hlcwo+IMKg
CSAqIHRoZSBzZW1hbnRpY3Mgb2Ygc3lzY2FsbF9nZXRfbnIoKS4KPiDCoAkgKi8KPiAtCW5yID0g
c3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBucik7Cj4gKwluciA9IHN5c2NhbGxf
ZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MsIG5yKTsKPiArCj4gwqAJ
aW5zdHJ1bWVudGF0aW9uX2JlZ2luKCk7Cj4gwqAKPiAtCWFkZF9yYW5kb21fa3N0YWNrX29mZnNl
dCgpOwo+IMKgCWRvX3N5c2NhbGxfMzJfaXJxc19vbihyZWdzLCBucik7Cj4gwqAKPiDCoAlpbnN0
cnVtZW50YXRpb25fZW5kKCk7Cj4gQEAgLTI2OCwxNSArMjY1LDkgQEAgc3RhdGljIG5vaW5zdHIg
Ym9vbCBfX2RvX2Zhc3Rfc3lzY2FsbF8zMgo+IMKgCWludCBuciA9IHN5c2NhbGxfMzJfZW50ZXIo
cmVncyk7Cj4gwqAJaW50IHJlczsKPiDCoAo+IC0JLyoKPiAtCSAqIFRoaXMgY2Fubm90IHVzZSBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgYXMgaXQgaGFzIHRvCj4gLQkgKiBmZXRjaCBF
QlAgYmVmb3JlIGludm9raW5nIGFueSBvZiB0aGUgc3lzY2FsbCBlbnRyeSB3b3JrCj4gLQkgKiBm
dW5jdGlvbnMuCj4gLQkgKi8KPiAtCWVudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+ICsJZW50
ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MpOwo+IMKgCj4gwqAJaW5zdHJ1
bWVudGF0aW9uX2JlZ2luKCk7Cj4gLQlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsKPiDCoAls
b2NhbF9pcnFfZW5hYmxlKCk7Cj4gwqAJLyogRmV0Y2ggRUJQIGZyb20gd2hlcmUgdGhlIHZEU08g
c3Rhc2hlZCBpdC4gKi8KPiDCoAlpZiAoSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KSkgewo+IC0t
LSBhL2FyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYwo+ICsrKyBiL2FyY2gveDg2L2VudHJ5L3N5
c2NhbGxfNjQuYwo+IEBAIC04NiwxMCArODYsOSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJv
b2wgZG9fc3lzY2FsbF94Cj4gwqAvKiBSZXR1cm5zIHRydWUgdG8gcmV0dXJuIHVzaW5nIFNZU1JF
VCwgb3IgZmFsc2UgdG8gdXNlIElSRVQgKi8KPiDCoF9fdmlzaWJsZSBub2luc3RyIGJvb2wgZG9f
c3lzY2FsbF82NChzdHJ1Y3QgcHRfcmVncyAqcmVncywgaW50IG5yKQo+IMKgewo+IC0JbnIgPSBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIG5yKTsKPiArCW5yID0gc3lzY2FsbF9l
bnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2socmVncywgbnIpOwo+IMKgCj4gwqAJ
aW5zdHJ1bWVudGF0aW9uX2JlZ2luKCk7Cj4gLQlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsK
PiDCoAo+IMKgCWlmICghZG9fc3lzY2FsbF94NjQocmVncywgbnIpICYmICFkb19zeXNjYWxsX3gz
MihyZWdzLCBucikgJiYgbnIgIT0gLTEpIHsKPiDCoAkJLyogSW52YWxpZCBzeXN0ZW0gY2FsbCwg
YnV0IHN0aWxsIGEgc3lzdGVtIGNhbGwuICovCj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
ZW50cnktY29tbW9uLmgKPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24u
aAo+IEBAIC0yLDcgKzIsNiBAQAo+IMKgI2lmbmRlZiBfQVNNX1g4Nl9FTlRSWV9DT01NT05fSAo+
IMKgI2RlZmluZSBfQVNNX1g4Nl9FTlRSWV9DT01NT05fSAo+IMKgCj4gLSNpbmNsdWRlIDxsaW51
eC9yYW5kb21pemVfa3N0YWNrLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvdXNlci1yZXR1cm4tbm90
aWZpZXIuaD4KPiDCoAo+IMKgI2luY2x1ZGUgPGFzbS9ub3NwZWMtYnJhbmNoLmg+CgpSZXZpZXdl
ZC1ieTogUmFkdSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
