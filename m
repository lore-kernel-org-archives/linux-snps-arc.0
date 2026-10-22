Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C35606A31B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Oct 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrvVn8lN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tGPqmIoU;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lrzd8ZGd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8H2ixdgBqy6lOfDs+MXCa0ORHmZVFgc0t3z2wd+M/Gc=; b=GrvVn8lNtXWXF5WXQbrJT1dw+C
	A3/S3P7jPiRlDTor6r23ezxZf1DDD42hGsUQbSyOFsuLIasIzRzMlmF9RDv1FfEQXqSV7dDdO8i/u
	6OH+CAzCzT2Sh6Sd4cMI0Xq77+K2I9eY5/R1VIAL9JuQZ8qqRR2LngkbFDr38YmN6SLzyepV2+O+Q
	stW18XKwlxC5AEn+0FrBp/RcJR6HzEjfG/HCtFIaTbkFFvT1ahHjQzNbDB7yq1of7MRTdK5ks3/zr
	ryY4w3xLIfau4Qgxc/IOVZ7y8nTCdv37K2X5TgngkWMxV0druqzM5ZAQgoGK8GipwtY22fYuu/dtD
	+b1m4fEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtih-0000000EILE-03A0;
	Thu, 22 Oct 2026 14:24:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtid-0000000EIKF-3lx3;
	Thu, 22 Oct 2026 14:24:37 +0000
Date: Thu, 22 Oct 2026 16:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792679067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijcqFl4YNaIiVHZ0kMDDzDit0eQZX1zIOl9C/1G18QI=;
	b=tGPqmIoU7flznKuVvSgOzo2yd+DVKg7D73Wllg9sFRm9CC/iaoJaE55c3a0xpncefiwTWe
	D0DcbKw7j7YI7N9iAD68KUbumDWDB4zuYjNIkgHfr2v+H6DCtaJTi+ZtcPVrTjX8s8nNNi
	XYrPBSHr+CwiWmUAbayRxd1rMqP3P1fTDl5O65hszJdwi1iKQ6myUH0U2igUoTF8eZn+8r
	G1OdblBxDgssdpqEoIOChx+/YLJ7ntbq+IsNh3ReV+JtcimJTFUP2numV2/sYLdIC+zwnD
	aAZ46jrqFXnXLMoMGXtXmyYgRF8JauAVkMkAXxtjJDC2ZDnhWCO79rWsa0e06A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792679067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijcqFl4YNaIiVHZ0kMDDzDit0eQZX1zIOl9C/1G18QI=;
	b=lrzd8ZGdzEWmJjZ9aZOFY32BVENA3ocTIaS/QQU0/Sv8YYe+ynbKZ/LG3OiCiXRqC6uBBI
	wYJIr0JLNWZ7aTBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Weinberger <richard@nod.at>,
	Chris Zankel <chris@zankel.net>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
Message-ID: <20261022142425.3Wx-RrU5@linutronix.de>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.493733289@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_072436_128224_A45173A9 
X-CRM114-Status: GOOD (  14.96  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAyNi0wNy0wNyAyMTowNzowMSBbKzAyMDBdLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4g
SW52b2tpbmcgc3lzX25pX3N5c2NhbGwoKSBmcm9tIGEgY29kZSBwYXRoLCB3aGljaCBhbHJlYWR5
IGtub3dzIHRoYXQgdGhlCj4gc3lzY2FsbCBudW1iZXIgaXMgaW52YWxpZCBqdXN0IHRvIGFzc2ln
biAtRU5PU1lTIHRvIHJlZ3MtPmF4IGlzIGEgcG9pbnRsZXNzCj4gZXhlcmNpc2UuIEl0J3MgZXZl
biByZWR1bmRhbnQgYXMgdGhlIGxvdyBsZXZlbCBlbnRyeSBjb2RlIGFscmVhZHkgaGFzIHNldAo+
IHJlZ3MtPmF4IHRvIC1FTk9TWVMgb24gZW50cnkuCj4gCj4gUmVtb3ZlIHRoZSBleHRyYSBjb25k
aXRpb25hbHMgYW5kIHRoZSBmdW5jdGlvbiBjYWxscy4KClNpbmNlIHRoaXMgcGF0Y2gsIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNjYWxsX251bWJlcmluZ182NAp0aHJvd3MgaW4gdGhp
czoKfFtSVU5dICAgUnVubmluZyB0ZXN0cyB1bmRlciBwdHJhY2U6IG1vZGlmeWluZyB0aGUgZGVm
YXVsdCByZXR1cm4KfFtSVU5dICAgICAgIENoZWNraW5nIHN5c3RlbSBjYWxscyB3aXRoIG1zYiA9
IDAgKDB4MCkKfFtSVU5dICAgICAgICAgICBDaGVja2luZyBzb21lIGNvbW1vbiBzeXNjYWxscyBh
cyA2NCBiaXQKfFtPS10gICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDowIHJldHVybmVkIDAg
YXMgZXhwZWN0ZWQKfFtPS10gICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDoxIHJldHVybmVk
IDAgYXMgZXhwZWN0ZWQKfFtSVU5dICAgICAgICAgICBDaGVja2luZyBzb21lIDY0LWJpdCBvbmx5
IHN5c2NhbGxzIGFzIDY0IGJpdAp8W09LXSAgICAgICAgICAgICAgICB4NjQgc3lzY2FsbCAwOjE5
IHJldHVybmVkIDAgYXMgZXhwZWN0ZWQKfFtPS10gICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwg
MDoyMCByZXR1cm5lZCAwIGFzIGV4cGVjdGVkCnxbUlVOXSAgICAgICAgICAgQ2hlY2tpbmcgb3V0
IG9mIHJhbmdlIHN5c3RlbSBjYWxscwp8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDMyIHN5c2Nh
bGwgMDotNjQgcmV0dXJuZWQgLTk5OTksIGJ1dCBpdCBzaG91bGQgaGF2ZSByZXR1cm5lZCAtRU5P
U1lTCuKApgp8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDMyIHN5c2NhbGwgMDotMiByZXR1cm5l
ZCAtOTk5OSwgYnV0IGl0IHNob3VsZCBoYXZlIHJldHVybmVkIC1FTk9TWVMKfFtGQUlMXSAgICAg
ICAgICAgICAgeDMyIHN5c2NhbGxzIDA6LTY0Li4tMiBoYWQgNjMgZmFpbHVyZQp8W09LXSAgICAg
ICAgICAgICAgICB4MzIgc3lzY2FsbCAwOi0xIHJldHVybmVkIE1PRElGSUVEX0JZX1BUUkFDRSBh
cyBleHBlY3RlZAp8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDoxMDczNzQx
NzYwIHJldHVybmVkIC05OTk5LCBidXQgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgLUVOT1NZUwri
gKYKfFtGQUlMXSAgICAgICAgICAgICAgICAgIHg2NCBzeXNjYWxsIDA6MTA3Mzc0MTgyMyByZXR1
cm5lZCAtOTk5OSwgYnV0IGl0IHNob3VsZCBoYXZlIHJldHVybmVkIC1FTk9TWVMKfFtGQUlMXSAg
ICAgICAgICAgICAgeDY0IHN5c2NhbGxzIDA6MTA3Mzc0MTc2MC4uMTA3Mzc0MTgyMyBoYWQgNjQg
ZmFpbHVyZQp8W0ZBSUxdICAgICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDotNjQgcmV0dXJu
ZWQgLTk5OTksIGJ1dCBpdCBzaG91bGQgaGF2ZSByZXR1cm5lZCAtRU5PU1lTCuKApgp8W0ZBSUxd
ICAgICAgICAgICAgICAgICAgeDY0IHN5c2NhbGwgMDo1NDcgcmV0dXJuZWQgLTk5OTksIGJ1dCBp
dCBzaG91bGQgaGF2ZSByZXR1cm5lZCAtRU5PU1lTCnxbRkFJTF0gICAgICAgICAgICAgIHg2NCBz
eXNjYWxscyAwOjUxMi4uNTQ3IGhhZCAzNiBmYWlsdXJlCnxbUlVOXSAgICAgICAgICAgQ2hlY2tp
bmcgc29tZSBjb21tb24gc3lzY2FsbHMgYXMgeDMyCnxbT0tdICAgICAgICAgICAgICAgIHgzMiBz
eXNjYWxsIDA6MCByZXR1cm5lZCAwIGFzIGV4cGVjdGVkCuKApgp8W1JVTl0gICAgICAgICAgIENo
ZWNraW5nIG91dCBvZiByYW5nZSBzeXN0ZW0gY2FsbHMKfFtGQUlMXSAgICAgICAgICAgICAgICAg
IHgzMiBzeXNjYWxsIDE6LTY0IHJldHVybmVkIC05OTk5LCBidXQgaXQgc2hvdWxkIGhhdmUgcmV0
dXJuZWQgLUVOT1NZUwp8W0ZBSUxdICAgICAgICAgICAgICB4MzIgc3lzY2FsbHMgMTotNjQuLi0y
IGhhZCA2MyBmYWlsdXJlCnxbT0tdICAgICAgICAgICAgICAgIHgzMiBzeXNjYWxsIDE6LTEgcmV0
dXJuZWQgTU9ESUZJRURfQllfUFRSQUNFIGFzIGV4cGVjdGVkCnxbRkFJTF0gICAgICAgICAgICAg
ICAgICB4NjQgc3lzY2FsbCAxOjEwNzM3NDE3NjAgcmV0dXJuZWQgLTk5OTksIGJ1dCBpdCBzaG91
bGQgaGF2ZSByZXR1cm5lZCAtRU5PU1lTCuKApgoKYW5kIHNvIG9u4oCmIFRoZSB0ZXN0IGhhcwoK
fCAjZGVmaW5lIE1PRElGSUVEX0JZX1BUUkFDRSAgICAgIC05OTk5CgphbmQgdGhlIHB0cmFjZXIg
bW9kaWZpZXMgdGhlIHJldHVybiBjb2RlLiBIb3dldmVyIG5vdCBhbHdheXMuIE5vdCBzdXJlCmlm
IHRoaXMgd2FzIGluZGVlZCBhIHBvaW50bGVzcyBleGVyY2lzZSBvciBub3QuCgpUaGUgdGVzdCBj
b3VsZCBiZSB1cGRhdGVkIHZpYSB0aGUgaHVuayBiZWxvdyBpbiBjYXNlIHRoZSBuZXcgYmVoYXZp
b3VyCmlzIHdoYXQgaXMgZXhwZWN0ZWQuIGhwYSBtYWRlIHRoZSBleHRlbnNpb24gdG8gdGhlIHRl
c3QgaW4gY29tbWl0Cjc5NWUyYTAyM2I4MDggKCJzZWxmdGVzdHMveDg2L3N5c2NhbGw6IEFkZCB0
ZXN0cyB1bmRlciBwdHJhY2UgdG8Kc3lzY2FsbF9udW1iZXJpbmdfNjQiKS4KCmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy94ODYvc3lzY2FsbF9udW1iZXJpbmcuYyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNjYWxsX251bWJlcmluZy5jCmluZGV4IGNhMGVjYTdi
OWRjZWQuLjE0MzUzOTRmYmEwMjIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3g4Ni9zeXNjYWxsX251bWJlcmluZy5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4
Ni9zeXNjYWxsX251bWJlcmluZy5jCkBAIC0yNTAsNiArMjUwLDcgQEAgc3RhdGljIGJvb2wgdGVz
dF94MzIodm9pZCkKIHN0YXRpYyB2b2lkIHRlc3Rfc3lzY2FsbHNfY29tbW9uKGludCBtc2IpCiB7
CiAJZW51bSBwdHJhY2VfcGFzcyBwYXNzID0gc2gtPnB0cmFjZV9wYXNzOworCWludCBleHBlY3Rl
ZF9yZXQgPSAtRU5PU1lTOwogCiAJcnVuKCJDaGVja2luZyBzb21lIGNvbW1vbiBzeXNjYWxscyBh
cyA2NCBiaXRcbiIpOwogCWNoZWNrX3plcm8obXNiLCBTWVNfUkVBRCk7CkBAIC0yNjAsMTggKzI2
MSwyMiBAQCBzdGF0aWMgdm9pZCB0ZXN0X3N5c2NhbGxzX2NvbW1vbihpbnQgbXNiKQogCWNoZWNr
X3plcm8obXNiLCBYNjRfV1JJVEVWKTsKIAogCXJ1bigiQ2hlY2tpbmcgb3V0IG9mIHJhbmdlIHN5
c3RlbSBjYWxsc1xuIik7Ci0JY2hlY2tfZm9yKG1zYiwgLTY0LCAtMiwgLUVOT1NZUyk7CiAJaWYg
KHBhc3MgPj0gUFRQX0ZVWlpSRVQpCi0JCWNoZWNrX2Zvcihtc2IsIC0xLCAtMSwgTU9ESUZJRURf
QllfUFRSQUNFKTsKLQllbHNlCi0JCWNoZWNrX2Zvcihtc2IsIC0xLCAtMSwgLUVOT1NZUyk7Ci0J
Y2hlY2tfZm9yKG1zYiwgWDMyX0JJVC02NCwgWDMyX0JJVC0xLCAtRU5PU1lTKTsKLQljaGVja19m
b3IobXNiLCAtNjQtWDMyX0JJVCwgLTEtWDMyX0JJVCwgLUVOT1NZUyk7Ci0JY2hlY2tfZm9yKG1z
YiwgSU5UX01BWC02NCwgSU5UX01BWC0xLCAtRU5PU1lTKTsKKwkJZXhwZWN0ZWRfcmV0ID0gTU9E
SUZJRURfQllfUFRSQUNFOworCWNoZWNrX2Zvcihtc2IsIC02NCwgLTIsIGV4cGVjdGVkX3JldCk7
CisJY2hlY2tfZm9yKG1zYiwgLTEsIC0xLCBleHBlY3RlZF9yZXQpOworCWNoZWNrX2Zvcihtc2Is
IFgzMl9CSVQtNjQsIFgzMl9CSVQtMSwgZXhwZWN0ZWRfcmV0KTsKKwljaGVja19mb3IobXNiLCAt
NjQtWDMyX0JJVCwgLTEtWDMyX0JJVCwgZXhwZWN0ZWRfcmV0KTsKKwljaGVja19mb3IobXNiLCBJ
TlRfTUFYLTY0LCBJTlRfTUFYLTEsIGV4cGVjdGVkX3JldCk7CiB9CiAKIHN0YXRpYyB2b2lkIHRl
c3Rfc3lzY2FsbHNfd2l0aF94MzIoaW50IG1zYikKIHsKKwllbnVtIHB0cmFjZV9wYXNzIHBhc3Mg
PSBzaC0+cHRyYWNlX3Bhc3M7CisJaW50IGV4cGVjdGVkX3JldCA9IC1FTk9TWVM7CisKKwlpZiAo
cGFzcyA+PSBQVFBfRlVaWlJFVCkKKwkJZXhwZWN0ZWRfcmV0ID0gTU9ESUZJRURfQllfUFRSQUNF
OwogCS8qCiAJICogU3lzY2FsbHMgNTEyLTU0NyBhcmUgIngzMiIgc3lzY2FsbHMuICBUaGV5IGFy
ZQogCSAqIGludGVuZGVkIHRvIGJlIGNhbGxlZCB3aXRoIHRoZSB4MzIgKDB4NDAwMDAwMDApIGJp
dApAQCAtMjc5LDcgKzI4NCw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc3lzY2FsbHNfd2l0aF94MzIo
aW50IG1zYikKIAkgKiBub25zZW5zZSBhbmQgc2hvdWxkIG5vdCB3b3JrLgogCSAqLwogCXJ1bigi
Q2hlY2tpbmcgeDMyIHN5c2NhbGxzIGFzIDY0IGJpdFxuIik7Ci0JY2hlY2tfZm9yKG1zYiwgNTEy
LCA1NDcsIC1FTk9TWVMpOworCWNoZWNrX2Zvcihtc2IsIDUxMiwgNTQ3LCBleHBlY3RlZF9yZXQp
OwogCiAJcnVuKCJDaGVja2luZyBzb21lIGNvbW1vbiBzeXNjYWxscyBhcyB4MzJcbiIpOwogCWNo
ZWNrX3plcm8obXNiLCBTWVNfUkVBRCAgIHwgWDMyX0JJVCk7CgpTZWJhc3RpYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
