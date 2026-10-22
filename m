Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E9B606A31A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Oct 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ohCCxtch;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=wS32jOje
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SFIoBE5OAj+5GxdBjORsnrnT6IGLBRrDPW1Z3TI1OjA=; b=ohCCxtchb5Ta7cjaZGvIir3BLl
	JCHsfASwt+hnHRB/1MSXPDINJDowvb8meiIn1guI8wZe/jGWQB7+Fn584vuMyGJteD2gb368/ORzA
	sDASrYfIIGZQIGi2ok4GKg0icg2zZEqHxXrqPwgU4qasnuOm/9hIgVPOhkgJMMP5WKoWd0BCcoK/b
	tlOHPj+R8M3tSMx8yhmO0K8nJ8GQb7OAUDRW1roa0MdRGndWnJs+Syr3yqUn9re7llXywXN/Vd6BS
	ZHudkmZ9N9iZBzbuy9Zg+PwUfhSsEqaaj6yhNHQVdITTIVJ3DGNLvEfwWBpEcLzB2LIz3jcRmHtgm
	c9eZar1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJx9M-0000000Eg0N-2ie5;
	Thu, 22 Oct 2026 18:04:24 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJx9I-0000000Efyr-3LQ2;
	Thu, 22 Oct 2026 18:04:22 +0000
Received: from [172.27.3.124] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69MI2jre822700
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 22 Oct 2026 11:02:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69MI2jre822700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1792692174;
	bh=RhnfvKmfoxy+HUbDsORpInOXf0Z9ck2xlJJLmjkZQrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wS32jOjeFWsFEs7/XC2lmhjx+vaso38Aa1yvVUAkT9A1W3myWjPjlKJ97J5iL0Ywq
	 bPF69gGCe7jooHw6vT1puqfAAMWwIenPVsBB0BtjXDHBnYwO13DlDPhjiEozTqjEHM
	 Tnne7bJIubMKnpcLaITiN/m+5GZf8SNZmR76JFs4RsiRgOXjXb7KnOu57Xbk4+jf0R
	 res/2bYXDI5YQACu5N7auw0s2PeA2biV4pFQrygkfChnNdCyphEU5uiDFSgPKPiKVV
	 mrz+yPrxO0ZpIXSlYj8frGR29U2PsHFm2Ceilf5VQYeo3Indd2RWAuBubWzuARjG4V
	 DyvcySggronVQ==
Message-ID: <9d875fab-fdad-413e-9737-6160fac2a406@zytor.com>
Date: Thu, 22 Oct 2026 11:00:24 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra
 <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@vger.kernel.org,
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
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org> <20261022142425.3Wx-RrU5@linutronix.de>
 <20261022150235.V2CSdtmu@linutronix.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20261022150235.V2CSdtmu@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_110420_942789_DEE0DD55 
X-CRM114-Status: GOOD (  13.75  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAyNi0xMC0yMiAwODowMiwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToKPiBP
biAyMDI2LTEwLTIyIDE2OjI0OjMwIFsrMDIwMF0sIFRvIFRob21hcyBHbGVpeG5lciB3cm90ZToK
Pj4gVGhlIHRlc3QgY291bGQgYmUgdXBkYXRlZCB2aWEgdGhlIGh1bmsgYmVsb3cgaW4gY2FzZSB0
aGUgbmV3IGJlaGF2aW91cgo+PiBpcyB3aGF0IGlzIGV4cGVjdGVkLiBocGEgbWFkZSB0aGUgZXh0
ZW5zaW9uIHRvIHRoZSB0ZXN0IGluIGNvbW1pdAo+PiA3OTVlMmEwMjNiODA4ICgic2VsZnRlc3Rz
L3g4Ni9zeXNjYWxsOiBBZGQgdGVzdHMgdW5kZXIgcHRyYWNlIHRvCj4+IHN5c2NhbGxfbnVtYmVy
aW5nXzY0IikuCj4+Cj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy94ODYv
c3lzY2FsbF9udW1iZXJpbmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNjYWxs
X251bWJlcmluZy5jCj4+IGluZGV4IGNhMGVjYTdiOWRjZWQuLjE0MzUzOTRmYmEwMjIgMTAwNjQ0
Cj4+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNjYWxsX251bWJlcmluZy5j
Cj4+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNjYWxsX251bWJlcmluZy5j
Cj4gCj4gTm93IEkgbm90aWNlIHRoZSBmaXggZGVwZW5kcyBvbiBDT05GSUdfWDg2X1gzMl9BQkk9
eSAoZmFpbHMgZm9yID1uKS4KPiBCdXQgd2Ugd2FudCB0byBnZXQgcmlkIG9mIGl0IGFueXdheSBz
b+KApgo+IENPTkZJR19JQTMyX0VNVUxBVElPTiBpcyBub3QgYWZmZWN0ZWQgKHdpdGggdGhlIGZp
eCkuCj4gCkl0IHdvdWxkIGJlIHZlcnkgc2ltcGxlIHRvIHByb2JlIGZvciBieSBpc3N1aW5nIGEg
c2ltcGxlIHN5c3RlbSBjYWxsIGxpa2UKZ2V0cHBpZCgpIHdpdGggdGhlIHgzMiBiaXQgc2V0LgoK
CS1ocGEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
