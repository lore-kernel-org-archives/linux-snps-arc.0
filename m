Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF8DC43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QRnaF4xyRysdrTjRLb6ppI6yIA8ypdq/CQleqDlybg=; b=bBFjM9jwHUNXea
	vlng1pUXh0CsKXemY/QcMuDyuxh2XVXH4NfQxFtfSYBObJPYX4eaPxF9HbhDQyBRTO+i0EWdUHtzD
	JB63D/m/VVElF5k4EopGnr/tV9WTNzrkUUbfSIGS8Y8EIUYm58z+wEqyE0DAvfJtfi9XbRXKRWCnI
	XOX9MKXDnqHEu1s9VD8m2FWs1mQKXBq6Mkty7p85XlmVyJbRhrfqym3gJw+a70G4uoEc6Wh7C1WO1
	ZqARYMhi2d/r+Qwd0rI+XdUDknu1B3EVIZOrd7Mhe0R6N/QA6/pjYRSN6tBqHYcjQjCPWj4/tlOVe
	WiL96NOkBfl0x56ZHi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZiL-00000000RHp-2ymQ;
	Wed, 08 Jul 2026 21:21:53 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZiH-00000000RGw-3qkZ;
	Wed, 08 Jul 2026 21:21:51 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 861B2C343F;
	Thu,  9 Jul 2026 00:21:24 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 861B2C343F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783545706;
	bh=kcBzFv6UQNpvLv0B/9fxsmBCsaF3luDIfOX4WPfJ0LI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=H73P2hvfJZwIoqeJMs+L8qKs84L6aXmcpvOfF+kp0m/siC+vpb3dmh5/rQGzQvZb1
	 KAdLUM9HsIAVBSvQjur23GoqyvDR1vgkeRT+zXhGdund4eNITGlrejtsuhMxfFKCAR
	 IZ2RR1YudeVpqiP4/BJTXsJStEaItfFAHRrFL/MeBdH47TYEEwHpIXXyM29AJ0RJba
	 vDIsPAjX9g3lfxQFYB1UHQ6gSu4bIZDX60YvEcwW27AO+k2CzGxaM5EC7xOeYYIbCf
	 SQX7lGJfXcy7EYovUwRvpU/bXxv/k8y5ltB87qAr3f6aIyyUbl73d4R/VmW3qRZE22
	 yV9hYRdOWZEFg==
Message-ID: <28fb0a8fd840bbf5223c60fea156584cb0f0f208.camel@rendec.net>
Subject: Re: [patch 09/18] entry: Remove syscall_enter_from_user_mode()
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
Date: Wed, 08 Jul 2026 17:21:19 -0400
In-Reply-To: <20260707190254.132654198@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190254.132654198@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_142150_134240_6C1A02EE 
X-CRM114-Status: GOOD (  28.23  )
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
Cj4gQWxsIGFyY2hpdGVjdHVyZSB1c2UgZWl0aGVyOgo+IAo+IMKgwqDCoCBuciA9IGVudGVyX2Zy
b21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayhyZWdzLCBucik7CgpZb3UgcHJvYmFibHkgbWVh
biBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjay4KCj4gCj4gb3IK
PiAKPiDCoMKgwqAgZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MpOwo+
IMKgwqDCoCBuciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfd29yayhyZWdzLCBucik7
Cj4gCj4gUmVtb3ZlIHRoZSBub3cgdW51c2VkIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IC0tLQo+IMKgRG9jdW1lbnRhdGlv
bi9jb3JlLWFwaS9lbnRyeS5yc3QgfMKgwqAgMTcgKysrKysrKysrLS0tLS0tLQo+IMKgaW5jbHVk
ZS9saW51eC9lbnRyeS1jb21tb24uaMKgwqDCoMKgIHzCoMKgIDQwICsrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IMKgaW5jbHVkZS9saW51eC9pcnEtZW50cnktY29tbW9u
LmggfMKgwqDCoCA2ICsrLS0tCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyks
IDQ2IGRlbGV0aW9ucygtKQo+IAo+IC0tLSBhL0RvY3VtZW50YXRpb24vY29yZS1hcGkvZW50cnku
cnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9lbnRyeS5yc3QKPiBAQCAtNjgsNyAr
NjgsNyBAQCBsb3ctbGV2ZWwgQyBjb2RlIG11c3Qgbm90IGJlIGluc3RydW1lbnRlCj4gwqDCoCBu
b2luc3RyIHZvaWQgc3lzY2FsbChzdHJ1Y3QgcHRfcmVncyAqcmVncywgaW50IG5yKQo+IMKgwqAg
ewo+IMKgCWFyY2hfc3lzY2FsbF9lbnRlcihyZWdzKTsKPiAtCW5yID0gc3lzY2FsbF9lbnRlcl9m
cm9tX3VzZXJfbW9kZShyZWdzLCBucik7Cj4gKwluciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2Vy
X21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MsIG5yKTsKPiDCoAo+IMKgCWluc3RydW1lbnRhdGlv
bl9iZWdpbigpOwo+IMKgCWlmICghaW52b2tlX3N5c2NhbGwocmVncywgbnIpICYmIG5yICE9IC0x
KQo+IEBAIC03OCwxMiArNzgsMTQgQEAgbG93LWxldmVsIEMgY29kZSBtdXN0IG5vdCBiZSBpbnN0
cnVtZW50ZQo+IMKgCXN5c2NhbGxfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4gwqDCoCB9Cj4g
wqAKPiAtc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIGZpcnN0IGludm9rZXMgZW50ZXJf
ZnJvbV91c2VyX21vZGUoKSB3aGljaAo+IC1lc3RhYmxpc2hlcyBzdGF0ZSBpbiB0aGUgZm9sbG93
aW5nIG9yZGVyOgo+ICtzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFj
aygpIGZpcnN0IGludm9rZXMKPiArZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNr
KCkgd2hpY2ggZXN0YWJsaXNoZXMgc3RhdGUgaW4gdGhlCj4gK2ZvbGxvd2luZyBvcmRlcjoKPiDC
oAo+IMKgwqAgKiBMb2NrZGVwCj4gwqDCoCAqIFJDVSAvIENvbnRleHQgdHJhY2tpbmcKPiDCoMKg
ICogVHJhY2luZwo+ICvCoCAqIEFwcGx5IHN0YWNrIHJhbmRvbWl6YXRpb24KPiDCoAo+IMKgYW5k
IHRoZW4gaW52b2tlcyB0aGUgdmFyaW91cyBlbnRyeSB3b3JrIGZ1bmN0aW9ucyBsaWtlIHB0cmFj
ZSwgc2VjY29tcCwgYXVkaXQsCj4gwqBzeXNjYWxsIHRyYWNpbmcsIGV0Yy4gQWZ0ZXIgYWxsIHRo
YXQgaXMgZG9uZSwgdGhlIGluc3RydW1lbnRhYmxlIGludm9rZV9zeXNjYWxsCj4gQEAgLTk5LDEw
ICsxMDEsMTEgQEAgdGhhdCBpdCBpbnZva2VzIGV4aXRfdG9fdXNlcl9tb2RlKCkgd2hpYwo+IMKg
wqAgKiBSQ1UgLyBDb250ZXh0IHRyYWNraW5nCj4gwqDCoCAqIExvY2tkZXAKPiDCoAo+IC1zeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgYW5kIHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUo
KSBhcmUgYWxzbwo+IC1hdmFpbGFibGUgYXMgZmluZSBncmFpbmVkIHN1YmZ1bmN0aW9ucyBpbiBj
YXNlcyB3aGVyZSB0aGUgYXJjaGl0ZWN0dXJlIGNvZGUKPiAtaGFzIHRvIGRvIGV4dHJhIHdvcmsg
YmV0d2VlbiB0aGUgdmFyaW91cyBzdGVwcy4gSW4gc3VjaCBjYXNlcyBpdCBoYXMgdG8KPiAtZW5z
dXJlIHRoYXQgZW50ZXJfZnJvbV91c2VyX21vZGUoKSBpcyBjYWxsZWQgZmlyc3Qgb24gZW50cnkg
YW5kCj4gK3N5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKCkgYW5k
Cj4gK3N5c2NhbGxfZXhpdF90b191c2VyX21vZGUoKSBhcmUgYWxzbyBhdmFpbGFibGUgYXMgZmlu
ZSBncmFpbmVkIHN1YmZ1bmN0aW9ucwo+ICtpbiBjYXNlcyB3aGVyZSB0aGUgYXJjaGl0ZWN0dXJl
IGNvZGUgaGFzIHRvIGRvIGV4dHJhIHdvcmsgYmV0d2VlbiB0aGUKPiArdmFyaW91cyBzdGVwcy4g
SW4gc3VjaCBjYXNlcyBpdCBoYXMgdG8gZW5zdXJlIHRoYXQKPiArZW50ZXJfZnJvbV91c2VyX21v
ZGVfcmFuZG9taXplX3N0YWNrKCkgaXMgY2FsbGVkIGZpcnN0IG9uIGVudHJ5IGFuZAo+IMKgZXhp
dF90b191c2VyX21vZGUoKSBpcyBjYWxsZWQgbGFzdCBvbiBleGl0Lgo+IMKgCj4gwqBEbyBub3Qg
bmVzdCBzeXNjYWxscy4gTmVzdGVkIHN5c2NhbGxzIHdpbGwgY2F1c2UgUkNVIGFuZC9vciBjb250
ZXh0IHRyYWNraW5nCj4gLS0tIGEvaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaAo+ICsrKyBi
L2luY2x1ZGUvbGludXgvZW50cnktY29tbW9uLmgKPiBAQCAtMTksNyArMTksNyBAQAo+IMKgI2Vu
ZGlmCj4gwqAKPiDCoC8qCj4gLSAqIFNZU0NBTExfV09SSyBmbGFncyBoYW5kbGVkIGluIHN5c2Nh
bGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKQo+ICsgKiBTWVNDQUxMX1dPUksgZmxhZ3MgaGFuZGxl
ZCBpbiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3dvcmsoKQo+IMKgICovCj4gwqAjZGVm
aW5lIFNZU0NBTExfV09SS19FTlRFUgkoU1lTQ0FMTF9XT1JLX1NFQ0NPTVAgfAkJCVwKPiDCoAkJ
CQkgU1lTQ0FMTF9XT1JLX1NZU0NBTExfVFJBQ0VQT0lOVCB8CVwKPiBAQCAtMjA1LDQyICsyMDUs
MTAgQEAgZG8gewkJCQkJCQkJCVwKPiDCoAlfcmV0OwkJCQkJCQkJXAo+IMKgfSkKPiDCoAo+IC0v
KioKPiAtICogc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSAtIEVzdGFibGlzaCBzdGF0ZSBh
bmQgY2hlY2sgYW5kIGhhbmRsZSB3b3JrCj4gLSAqCQkJCcKgIGJlZm9yZSBpbnZva2luZyBhIHN5
c2NhbGwKPiAtICogQHJlZ3M6CVBvaW50ZXIgdG8gY3VycmVudHMgcHRfcmVncwo+IC0gKiBAc3lz
Y2FsbDoJVGhlIHN5c2NhbGwgbnVtYmVyCj4gLSAqCj4gLSAqIEludm9rZWQgZnJvbSBhcmNoaXRl
Y3R1cmUgc3BlY2lmaWMgc3lzY2FsbCBlbnRyeSBjb2RlIHdpdGggaW50ZXJydXB0cwo+IC0gKiBk
aXNhYmxlZC4gVGhlIGNhbGxpbmcgY29kZSBoYXMgdG8gYmUgbm9uLWluc3RydW1lbnRhYmxlLiBX
aGVuIHRoZQo+IC0gKiBmdW5jdGlvbiByZXR1cm5zIGFsbCBzdGF0ZSBpcyBjb3JyZWN0LCBpbnRl
cnJ1cHRzIGFyZSBlbmFibGVkIGFuZCB0aGUKPiAtICogc3Vic2VxdWVudCBmdW5jdGlvbnMgY2Fu
IGJlIGluc3RydW1lbnRlZC4KPiAtICoKPiAtICogVGhpcyBpcyB0aGUgY29tYmluYXRpb24gb2Yg
ZW50ZXJfZnJvbV91c2VyX21vZGUoKSBhbmQKPiAtICogc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJf
bW9kZV93b3JrKCkgdG8gYmUgdXNlZCB3aGVuIHRoZXJlIGlzIG5vCj4gLSAqIGFyY2hpdGVjdHVy
ZSBzcGVjaWZpYyB3b3JrIHRvIGJlIGRvbmUgYmV0d2VlbiB0aGUgdHdvLgo+IC0gKgo+IC0gKiBS
ZXR1cm5zOiBUaGUgb3JpZ2luYWwgb3IgYSBtb2RpZmllZCBzeXNjYWxsIG51bWJlci4gU2VlCj4g
LSAqIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfd29yaygpIGZvciBmdXJ0aGVyIGV4cGxh
bmF0aW9uLgo+IC0gKi8KPiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBsb25nIHN5c2NhbGxfZW50
ZXJfZnJvbV91c2VyX21vZGUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGxvbmcgc3lzY2FsbCkKPiAt
ewo+IC0JbG9uZyByZXQ7Cj4gLQo+IC0JZW50ZXJfZnJvbV91c2VyX21vZGUocmVncyk7Cj4gLQo+
IC0JaW5zdHJ1bWVudGF0aW9uX2JlZ2luKCk7Cj4gLQlsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gLQly
ZXQgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3dvcmsocmVncywgc3lzY2FsbCk7Cj4g
LQlpbnN0cnVtZW50YXRpb25fZW5kKCk7Cj4gLQo+IC0JcmV0dXJuIHJldDsKPiAtfQo+IC0KPiDC
oC8qCj4gLSAqIElmIFNZU0NBTExfRU1VIGlzIHNldCwgdGhlbiB0aGUgb25seSByZWFzb24gdG8g
cmVwb3J0IGlzIHdoZW4KPiAtICogU0lOR0xFU1RFUCBpcyBzZXQgKGkuZS4gUFRSQUNFX1NZU0VN
VV9TSU5HTEVTVEVQKS7CoCBUaGlzIHN5c2NhbGwKPiAtICogaW5zdHJ1Y3Rpb24gaGFzIGJlZW4g
YWxyZWFkeSByZXBvcnRlZCBpbiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkuCj4gKyAq
IElmIFNZU0NBTExfRU1VIGlzIHNldCwgdGhlbiB0aGUgb25seSByZWFzb24gdG8gcmVwb3J0IGlz
IHdoZW4gU0lOR0xFU1RFUCBpcwo+ICsgKiBzZXQgKGkuZS4gUFRSQUNFX1NZU0VNVV9TSU5HTEVT
VEVQKS7CoCBUaGlzIHN5c2NhbGwgaW5zdHJ1Y3Rpb24gaGFzIGJlZW4KPiArICogYWxyZWFkeSBy
ZXBvcnRlZCBpbiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3dvcmsoKS4KPiDCoCAqLwo+
IMKgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJlcG9ydF9zaW5nbGVfc3RlcCh1bnNpZ25l
ZCBsb25nIHdvcmspCj4gwqB7Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnEtZW50cnktY29tbW9u
LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2lycS1lbnRyeS1jb21tb24uaAo+IEBAIC00OSw5ICs0
OSw5IEBACj4gwqAgKiBEZWZhdWx0cyB0byBhbiBlbXB0eSBpbXBsZW1lbnRhdGlvbi4gQ2FuIGJl
IHJlcGxhY2VkIGJ5IGFyY2hpdGVjdHVyZQo+IMKgICogc3BlY2lmaWMgY29kZS4KPiDCoCAqCj4g
LSAqIEludm9rZWQgZnJvbSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgaW4gdGhlIG5v
bi1pbnN0cnVtZW50YWJsZQo+IC0gKiBzZWN0aW9uLiBVc2UgX19hbHdheXNfaW5saW5lIHNvIHRo
ZSBjb21waWxlciBjYW5ub3QgcHVzaCBpdCBvdXQgb2YgbGluZQo+IC0gKiBhbmQgbWFrZSBpdCBp
bnN0cnVtZW50YWJsZS4KPiArICogSW52b2tlZCBmcm9tIGVudGVyX2Zyb21fdXNlcl9tb2RlX3N5
c2NhbGxfYW5kX3JhbmRvbWl6ZV9zdGFjaygpIGluIHRoZQogICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCgpQcm9iYWJseSBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjaygpPyBCdXQgdGhlCnJl
YWxpdHkgaXMgaXQncyBvbmx5IGV2ZXIgaW52b2tlZCBmcm9tIGVudGVyX2Zyb21fdXNlcl9tb2Rl
KCksIHdoaWNoIGlzCmJlbG93IGluIHRoZSBzYW1lIGZpbGUgKGluY2x1ZGUvbGludXgvaXJxLWVu
dHJ5LWNvbW1vbi5oKS4KCkdyYW50ZWQsIHRoYXQncyBhbiBhbHdheXMgaW5saW5lIGZ1bmN0aW9u
LCBhbmQgaXQncyB1c2VkIGJ5IGJvdGggbWFjcm9zCnlvdSBhZGRlZCAoc2luY2UgdGhlIHNlY29u
ZCBvbmUgdXNlcyB0aGUgZmlyc3Qgb25lKS4KCj4gKyAqIG5vbi1pbnN0cnVtZW50YWJsZSBzZWN0
aW9uLiBVc2UgX19hbHdheXNfaW5saW5lIHNvIHRoZSBjb21waWxlciBjYW5ub3QgcHVzaAo+ICsg
KiBpdCBvdXQgb2YgbGluZSBhbmQgbWFrZSBpdCBpbnN0cnVtZW50YWJsZS4KPiDCoCAqLwo+IMKg
c3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGFyY2hfZW50ZXJfZnJvbV91c2VyX21vZGUoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpOwo+IMKgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
