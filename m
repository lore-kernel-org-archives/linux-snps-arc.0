Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C521DC43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqTLZen+Kr4pkmLFNwMe5Gtx8NGXte82fl6lU6CBsNU=; b=gm+MZeU+Xw0oLj
	K8gGbERRT/RaJGhx7zmgLsST8eLKwf5BnfNqk1BQ4gglQ17ThxyCb5ffPKO33vnDK2GwXwlvEDtV2
	MFmALzlz/myh/W6HC4vc0HzAOcWqFd3xTBSg4VcpeuJSss5ODjL4eAh15ELxwyZIwKSlGn6Px7kma
	6x8cX/dBQcMa7XtcGpZHLVd+MiOsPyT/K3e9YOz59c5KoXOAGNjPP/tvq7aqxF2oOiLtVwAXDEl5h
	m0Xhl5gvNgiQfa3klkoeC24n2o/4v0pnuu8RWggcFLiGR1ekbEOLrihXjjAOZtDOHEwV9td+Nwaah
	eqnI9F5XeITHtWhgAPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whW31-000000006Tz-2HOF;
	Wed, 08 Jul 2026 17:26:59 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whW2y-000000006TB-0N1r;
	Wed, 08 Jul 2026 17:26:57 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1B198C343D;
	Wed,  8 Jul 2026 20:26:25 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1B198C343D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783531613;
	bh=1gcsmXz67IjQqMY0eBQ3O8esAmywA90IGOEUSqxZHJQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z6pyfRb1XnNrJb7Iy5l8RXt+U4vqsGvqqzStbhN7435vjpK29RR4S8ie2UFwESgWv
	 CcSG+nZyfqWkQNIiMihfXIe5SU5d9xFxuT/FVpIkY2si8YfqZBiGdxwpOgc4+v6GTu
	 NSt9pFgzwrUImE/LpJy0sei+Lk+GBqVAsmPsiJ8VtpU8nMjFtYkmKduWX13Ouy9uBJ
	 1ENXVXzDYQWjK4BhPh/7z7U3FCNNVQhlgPxqvAWAfKgmRqCj2sxf9iIIgCC2PgpYcH
	 RSMOv3KD/QpK9l25WlQ3grvgf5R2LttSDjfKaawhSgxe9j5XVHCFPDPCqOj6a4P2dQ
	 eMxeS2+WglD9w==
Message-ID: <8b21dbb1e167b4a50b72613f09fdbb800a420fb8.camel@rendec.net>
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
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
Date: Wed, 08 Jul 2026 13:26:19 -0400
In-Reply-To: <20260707190253.816918647@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190253.816918647@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_102656_305113_9BC8A24B 
X-CRM114-Status: GOOD (  22.08  )
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
Cj4gUmFuZG9taXppbmcgdGhlIHN5c2NhbGwgc3RhY2sgY2FuIG9ubHkgaGFwcGVuIGFmdGVyIHN0
YXRlIGlzIGVzdGFibGlzaGVkCj4gdmlhIGVudGVyX2Zyb21fdXNlcl9tb2RlKCkgb3Igc3lzY2Fs
bF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpLiBUaGUgZWFybGllcgo+IGl0IGhhcHBlbnMgdGhlIGJl
dHRlci4KPiAKPiBQcm92aWRlIHR3byBuZXcgbWFjcm9zIHRvIGNvbnNvbGlkYXRlIHRoYXQ6Cj4g
Cj4gwqAgLSBlbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKQo+IAllbnRlcl9m
cm9tX3VzZXJfbW9kZSgpOwo+IAlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXRfaXJxc29mZigpOwo+
IAo+IMKgIC0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKQo+
IAllbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKTsKPiAJc3lzY2FsbF9lbnRl
cl9mcm9tX3VzZXJfbW9kZV93b3JrKCk7Cj4gwqDCoMKgIAo+IHRvIHJlZHVjZSBib2lsZXIgcGxh
dGUgY29kZS4KPiAKPiBUaG9zZSBhcmUgbWFjcm9zIGFuZCBub3QgaW5saW5lIGZ1bmN0aW9ucyBh
cyB0aGUgbGF0dGVyIHdvdWxkIGxpbWl0IHRoZQo+IHN0YWNrIHJhbmRvbWl6YXRpb24gc2NvcGUg
dG8gdGhlIGlubGluZSBmdW5jdGlvbiBpdHNlbGYuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBpbmNsdWRlL2xpbnV4L2VudHJ5
LWNvbW1vbi5oIHzCoMKgIDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gCj4gLS0tIGEvaW5j
bHVkZS9saW51eC9lbnRyeS1jb21tb24uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZW50cnktY29t
bW9uLmgKPiBAQCAtNiw2ICs2LDcgQEAKPiDCoCNpbmNsdWRlIDxsaW51eC9pcnEtZW50cnktY29t
bW9uLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvbGl2ZXBhdGNoLmg+Cj4gwqAjaW5jbHVkZSA8bGlu
dXgvcHRyYWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yYW5kb21pemVfa3N0YWNrLmg+Cj4gwqAj
aW5jbHVkZSA8bGludXgvcmVzdW1lX3VzZXJfbW9kZS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L3Nl
Y2NvbXAuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+IEBAIC0xNTAsNiArMTUxLDYx
IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgbG9uZyBzeXNjYWxsX2VudGUKPiDCoH0KPiDCoAo+
IMKgLyoqCj4gKyAqIGVudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayAtIEVzdGFi
bGlzaCBzdGF0ZSBhbmQgYWRkIHN0YWNrIHJhbmRvbWl6YXRpb24KPiArICoJCQkJCcKgIGJlZm9y
ZSBpbnZva2luZyBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3dvcmsoKQo+ICsgKiBAcmVn
czoJUG9pbnRlciB0byBjdXJyZW50cyBwdF9yZWdzCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5eXl5eXl5eCgpOaXQ6IGN1cnJlbnQKCj4gKyAqCj4gKyAqIEludm9rZWQgZnJvbSBhcmNoaXRl
Y3R1cmUgc3BlY2lmaWMgc3lzY2FsbCBlbnRyeSBjb2RlIHdpdGggaW50ZXJydXB0cwo+ICsgKiBk
aXNhYmxlZC4gVGhlIGNhbGxpbmcgY29kZSBoYXMgdG8gYmUgbm9uLWluc3RydW1lbnRhYmxlLiBX
aGVuIHRoZSBmdW5jdGlvbgo+ICsgKiByZXR1cm5zIGFsbCBzdGF0ZSBpcyBjb3JyZWN0LCBpbnRl
cnJ1cHRzIGFyZSBzdGlsbCBkaXNhYmxlZCBhbmQgdGhlCj4gKyAqIHN1YnNlcXVlbnQgZnVuY3Rp
b25zIGNhbiBiZSBpbnN0cnVtZW50ZWQuCj4gKyAqCj4gKyAqIEltcGxlbWVudGVkIGFzIGEgbWFj
cm8gc28gdGhhdCB0aGUgc3RhY2sgcmFuZG9taXphdGlvbiBpcyBlZmZlY3RpdmUKPiArICogdGhy
b3VnaG91dCB0aGUgZnVuY3Rpb24gaW4gd2hpY2ggaXQgaXMgaW52b2tlZC4gQW4gaW5saW5lIHdv
dWxkIG9ubHkgbWFrZSBpdAo+ICsgKiBlZmZlY3RpdmUgaW4gdGhlIHNjb3BlIG9mIHRoZSBpbmxp
bmUgZnVuY3Rpb24uCj4gKyAqLwo+ICsjZGVmaW5lIGVudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRv
bWl6ZV9zdGFjayhyZWdzKQkJCVwKPiArZG8gewkJCQkJCQkJCVwKPiArCWVudGVyX2Zyb21fdXNl
cl9tb2RlKHJlZ3MpOwkJCQkJXAo+ICsJaW5zdHJ1bWVudGF0aW9uX2JlZ2luKCk7CQkJCQlcCj4g
KwlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXRfaXJxc29mZigpOwkJCQlcCj4gKwlpbnN0cnVtZW50
YXRpb25fZW5kKCk7CQkJCQkJXAo+ICt9IHdoaWxlICgwKQo+ICsKPiArLyoqCj4gKyAqIHN5c2Nh
bGxfZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrIC0gRXN0YWJsaXNoIHN0YXRl
IGFuZCBjaGVjayBhbmQgaGFuZGxlIHdvcmsKPiArICoJCQkJCQnCoCBiZWZvcmUgaW52b2tpbmcg
YSBzeXNjYWxsCj4gKyAqIEByZWdzOglQb2ludGVyIHRvIGN1cnJlbnRzIHB0X3JlZ3MKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl4KClNhbWUgaGVyZS4KCj4gKyAqIEBzeXNjYWxs
OglUaGUgc3lzY2FsbCBudW1iZXIKPiArICoKPiArICogSW52b2tlZCBmcm9tIGFyY2hpdGVjdHVy
ZSBzcGVjaWZpYyBzeXNjYWxsIGVudHJ5IGNvZGUgd2l0aCBpbnRlcnJ1cHRzCj4gKyAqIGRpc2Fi
bGVkLiBUaGUgY2FsbGluZyBjb2RlIGhhcyB0byBiZSBub24taW5zdHJ1bWVudGFibGUuIFdoZW4g
dGhlCj4gKyAqIGZ1bmN0aW9uIHJldHVybnMgYWxsIHN0YXRlIGlzIGNvcnJlY3QsIGludGVycnVw
dHMgYXJlIGVuYWJsZWQgYW5kIHRoZQo+ICsgKiBzdWJzZXF1ZW50IGZ1bmN0aW9ucyBjYW4gYmUg
aW5zdHJ1bWVudGVkLgo+ICsgKgo+ICsgKiBUaGlzIGlzIHRoZSBjb21iaW5hdGlvbiBvZiBlbnRl
cl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKSBhbmQKPiArICogc3lzY2FsbF9lbnRl
cl9mcm9tX3VzZXJfbW9kZV93b3JrKCkgdG8gYmUgdXNlZCB3aGVuIHRoZXJlIGlzIG5vCj4gKyAq
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyB3b3JrIHRvIGJlIGRvbmUgYmV0d2VlbiB0aGUgdHdvLgo+
ICsgKgo+ICsgKiBSZXR1cm5zOiBUaGUgb3JpZ2luYWwgb3IgYSBtb2RpZmllZCBzeXNjYWxsIG51
bWJlci4gU2VlCj4gKyAqIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfd29yaygpIGZvciBm
dXJ0aGVyIGV4cGxhbmF0aW9uLgo+ICsgKgo+ICsgKiBJbXBsZW1lbnRlZCBhcyBhIG1hY3JvIHRv
IG1ha2Ugc3RhY2sgcmFuZG9taXphdGlvbiBlZmZlY3RpdmUgaW4gdGhlIGNhbGxpbmcKPiArICog
c2NvcGUuCj4gKyAqLwo+ICsjZGVmaW5lIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfcmFu
ZG9taXplX3N0YWNrKHJlZ3MsIHN5c2NhbGwpCVwKPiArKHsJCQkJCQkJCQlcCj4gKwllbnRlcl9m
cm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2socmVncyk7CQkJXAo+ICsJCQkJCQkJCQlcCj4g
KwlpbnN0cnVtZW50YXRpb25fYmVnaW4oKTsJCQkJCVwKPiArCWxvY2FsX2lycV9lbmFibGUoKTsJ
CQkJCQlcCj4gKwlsb25nIF9yZXQgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3dvcmso
cmVncywgc3lzY2FsbCk7CVwKPiArCWluc3RydW1lbnRhdGlvbl9lbmQoKTsJCQkJCQlcCj4gKwkJ
CQkJCQkJCVwKPiArCV9yZXQ7CQkJCQkJCQlcCj4gK30pCj4gKwo+ICsvKioKPiDCoCAqIHN5c2Nh
bGxfZW50ZXJfZnJvbV91c2VyX21vZGUgLSBFc3RhYmxpc2ggc3RhdGUgYW5kIGNoZWNrIGFuZCBo
YW5kbGUgd29yawo+IMKgICoJCQkJwqAgYmVmb3JlIGludm9raW5nIGEgc3lzY2FsbAo+IMKgICog
QHJlZ3M6CVBvaW50ZXIgdG8gY3VycmVudHMgcHRfcmVncwoKV2l0aCB0aGUgYWJvdmUgbml0cywK
ClJldmlld2VkLWJ5OiBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
