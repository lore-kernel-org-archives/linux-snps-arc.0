Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350860A2623
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Oct 2026 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oGK12eBY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N5BvSZtD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IkpWTWR+1GkdIViJlxpYfBgaPftvmJPUB8gYxjz41wY=; b=oGK12eBYemCJ+YxkvFHcDXauXY
	qCyaf//rhlgttPqILHlO0VTnp+FMLj5QsN61KqWowsSVRqSmkrvJjYLSi0JVsU9rId1UcjjsL8avk
	fU7ETxKxfFHnI1NEaufNCjgyykplbIqd8nuRkTf0UFTmCpg9gJq57DJ0+GtaAA4guybW3xi34oLNV
	5xGIs6INcFHgwJvdczfIkynoHwwxnUHyyl3cFvCsmQEzSODc1ClCdES+cP+XlADbgkwxLUCS6bHIv
	avzPLYTH7MZrs101ub5cz+r9eqMCWd8xDyl4/5ImlYDksZxA4D+AGlPF4t2weLQ65Bje4ubmvAcU4
	59BcL8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyGl-0000000Enq1-0SYv;
	Thu, 22 Oct 2026 19:16:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyGi-0000000EnpX-2HY4;
	Thu, 22 Oct 2026 19:16:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68628601F8;
	Thu, 22 Oct 2026 19:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE1F1F01825;
	Thu, 22 Oct 2026 19:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792696563;
	bh=zfF/h5yN+JN0JXoERjM1UOmD6YL51qlegqbjQ5IjJaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N5BvSZtDsOnevI6N7z+hpnuDFwgb+Za20bBfcyPl1zdZ/RUM/vhVGgooCl8EukmyB
	 v951DfxEQIGKmPlqDa47vEV9oOJpjd3jTdFHzFJ8cGbv5Ec+77S428dvBazQLk752d
	 8oijRTx04uvdE5t0WJ3hFRzAydPhPUU1uC5jEb9/jBb3UCG/5+2vXEPMQ0qv3aaJy/
	 fDrmEd5ydsQk2Juig/QI4K6qM7Xm060UN2bTZPYYJFIjTdDkBvnz/aEeUGpDN6dDMG
	 QYnQUY/lk7t3H2ZOK5q9Ex67PolYwOb50JpOTpWf5Zn6NIH8OuYBLaiHmJRlGX+jMg
	 L4eC2BtuFHQ4g==
From: Thomas Gleixner <tglx@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
In-Reply-To: <20261022142425.3Wx-RrU5@linutronix.de>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org>
 <20261022142425.3Wx-RrU5@linutronix.de>
Date: Thu, 22 Oct 2026 21:15:59 +0200
Message-ID: <87fqxx1r80.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIgMjAyNiBhdCAxNjoyNCwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3
cm90ZToKPiBPbiAyMDI2LTA3LTA3IDIxOjA3OjAxIFsrMDIwMF0sIFRob21hcyBHbGVpeG5lciB3
cm90ZToKPj4gSW52b2tpbmcgc3lzX25pX3N5c2NhbGwoKSBmcm9tIGEgY29kZSBwYXRoLCB3aGlj
aCBhbHJlYWR5IGtub3dzIHRoYXQgdGhlCj4+IHN5c2NhbGwgbnVtYmVyIGlzIGludmFsaWQganVz
dCB0byBhc3NpZ24gLUVOT1NZUyB0byByZWdzLT5heCBpcyBhIHBvaW50bGVzcwo+PiBleGVyY2lz
ZS4gSXQncyBldmVuIHJlZHVuZGFudCBhcyB0aGUgbG93IGxldmVsIGVudHJ5IGNvZGUgYWxyZWFk
eSBoYXMgc2V0Cj4+IHJlZ3MtPmF4IHRvIC1FTk9TWVMgb24gZW50cnkuCj4+IAo+PiBSZW1vdmUg
dGhlIGV4dHJhIGNvbmRpdGlvbmFscyBhbmQgdGhlIGZ1bmN0aW9uIGNhbGxzLgo+Cj4gU2luY2Ug
dGhpcyBwYXRjaCwgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3N5c2NhbGxfbnVtYmVyaW5n
XzY0Cj4gdGhyb3dzIGluIHRoaXM6Cj4gfFtSVU5dICAgUnVubmluZyB0ZXN0cyB1bmRlciBwdHJh
Y2U6IG1vZGlmeWluZyB0aGUgZGVmYXVsdCByZXR1cm4KPiB8W1JVTl0gICAgICAgQ2hlY2tpbmcg
c3lzdGVtIGNhbGxzIHdpdGggbXNiID0gMCAoMHgwKQo+IHxbUlVOXSAgICAgICAgICAgQ2hlY2tp
bmcgc29tZSBjb21tb24gc3lzY2FsbHMgYXMgNjQgYml0Cj4gfFtPS10gICAgICAgICAgICAgICAg
eDY0IHN5c2NhbGwgMDowIHJldHVybmVkIDAgYXMgZXhwZWN0ZWQKPiB8W09LXSAgICAgICAgICAg
ICAgICB4NjQgc3lzY2FsbCAwOjEgcmV0dXJuZWQgMCBhcyBleHBlY3RlZAo+IHxbUlVOXSAgICAg
ICAgICAgQ2hlY2tpbmcgc29tZSA2NC1iaXQgb25seSBzeXNjYWxscyBhcyA2NCBiaXQKPiB8W09L
XSAgICAgICAgICAgICAgICB4NjQgc3lzY2FsbCAwOjE5IHJldHVybmVkIDAgYXMgZXhwZWN0ZWQK
PiB8W09LXSAgICAgICAgICAgICAgICB4NjQgc3lzY2FsbCAwOjIwIHJldHVybmVkIDAgYXMgZXhw
ZWN0ZWQKPiB8W1JVTl0gICAgICAgICAgIENoZWNraW5nIG91dCBvZiByYW5nZSBzeXN0ZW0gY2Fs
bHMKPiB8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDMyIHN5c2NhbGwgMDotNjQgcmV0dXJuZWQg
LTk5OTksIGJ1dCBpdCBzaG91bGQgaGF2ZSByZXR1cm5lZCAtRU5PU1lTCj4g4oCmCj4gfFtGQUlM
XSAgICAgICAgICAgICAgICAgIHgzMiBzeXNjYWxsIDA6LTIgcmV0dXJuZWQgLTk5OTksIGJ1dCBp
dCBzaG91bGQgaGF2ZSByZXR1cm5lZCAtRU5PU1lTCj4gfFtGQUlMXSAgICAgICAgICAgICAgeDMy
IHN5c2NhbGxzIDA6LTY0Li4tMiBoYWQgNjMgZmFpbHVyZQo+IHxbT0tdICAgICAgICAgICAgICAg
IHgzMiBzeXNjYWxsIDA6LTEgcmV0dXJuZWQgTU9ESUZJRURfQllfUFRSQUNFIGFzIGV4cGVjdGVk
Cj4gfFtGQUlMXSAgICAgICAgICAgICAgICAgIHg2NCBzeXNjYWxsIDA6MTA3Mzc0MTc2MCByZXR1
cm5lZCAtOTk5OSwgYnV0IGl0IHNob3VsZCBoYXZlIHJldHVybmVkIC1FTk9TWVMKPiDigKYKPiB8
W0ZBSUxdICAgICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDoxMDczNzQxODIzIHJldHVybmVk
IC05OTk5LCBidXQgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgLUVOT1NZUwo+IHxbRkFJTF0gICAg
ICAgICAgICAgIHg2NCBzeXNjYWxscyAwOjEwNzM3NDE3NjAuLjEwNzM3NDE4MjMgaGFkIDY0IGZh
aWx1cmUKPiB8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDotNjQgcmV0dXJu
ZWQgLTk5OTksIGJ1dCBpdCBzaG91bGQgaGF2ZSByZXR1cm5lZCAtRU5PU1lTCj4g4oCmCj4gfFtG
QUlMXSAgICAgICAgICAgICAgICAgIHg2NCBzeXNjYWxsIDA6NTQ3IHJldHVybmVkIC05OTk5LCBi
dXQgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgLUVOT1NZUwo+IHxbRkFJTF0gICAgICAgICAgICAg
IHg2NCBzeXNjYWxscyAwOjUxMi4uNTQ3IGhhZCAzNiBmYWlsdXJlCj4gfFtSVU5dICAgICAgICAg
ICBDaGVja2luZyBzb21lIGNvbW1vbiBzeXNjYWxscyBhcyB4MzIKPiB8W09LXSAgICAgICAgICAg
ICAgICB4MzIgc3lzY2FsbCAwOjAgcmV0dXJuZWQgMCBhcyBleHBlY3RlZAo+IOKApgo+IHxbUlVO
XSAgICAgICAgICAgQ2hlY2tpbmcgb3V0IG9mIHJhbmdlIHN5c3RlbSBjYWxscwo+IHxbRkFJTF0g
ICAgICAgICAgICAgICAgICB4MzIgc3lzY2FsbCAxOi02NCByZXR1cm5lZCAtOTk5OSwgYnV0IGl0
IHNob3VsZCBoYXZlIHJldHVybmVkIC1FTk9TWVMKPiB8W0ZBSUxdICAgICAgICAgICAgICB4MzIg
c3lzY2FsbHMgMTotNjQuLi0yIGhhZCA2MyBmYWlsdXJlCj4gfFtPS10gICAgICAgICAgICAgICAg
eDMyIHN5c2NhbGwgMTotMSByZXR1cm5lZCBNT0RJRklFRF9CWV9QVFJBQ0UgYXMgZXhwZWN0ZWQK
PiB8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMToxMDczNzQxNzYwIHJldHVy
bmVkIC05OTk5LCBidXQgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgLUVOT1NZUwo+IOKApgo+Cj4g
YW5kIHNvIG9u4oCmIFRoZSB0ZXN0IGhhcwo+Cj4gfCAjZGVmaW5lIE1PRElGSUVEX0JZX1BUUkFD
RSAgICAgIC05OTk5Cj4KPiBhbmQgdGhlIHB0cmFjZXIgbW9kaWZpZXMgdGhlIHJldHVybiBjb2Rl
LiBIb3dldmVyIG5vdCBhbHdheXMuIE5vdCBzdXJlCj4gaWYgdGhpcyB3YXMgaW5kZWVkIGEgcG9p
bnRsZXNzIGV4ZXJjaXNlIG9yIG5vdC4KCkhybW0uIFRoYXQncyB3ZWlyZC4gTGV0IG1lIGhhdmUg
YSBsb29rLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
