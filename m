Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08401C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 23:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/JsGP3cfb2YeW+7CAKyZ98I4erhdWQ4Xt/VVU/pIuE=; b=LOOwX3j87PtKjb
	OD7UEt3bdemVD3l5fn1iSaoYvTr9bamTsIxOedLJsKjJLeiAxkqCX7ud7GIfNkmdjP78dJgFE6m8C
	oC4Lrfod4EJEhWLWSjBreXwWIjJEYh/1SdGvfRaN1BhAGkcmoPsstfd7DsA+BJfgrs8WpXZIUSwJr
	EGWJkh+AUnmsxIL3cNWzNd6kRZoPnw30O3AO8PYfyJtQyr8mXAVmg7XiRxzd1lmomUxf9hOR9sKvC
	/Wl9AiBiF7Lvd17mD3ogkIVhugt0Rs487QhTnXf7DHnBVIsfmTZqaZQhf5RiPYU2EU138c9EiwenC
	8rfwtXZcId+aG4wXec0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbTL-00000000aG9-36dM;
	Wed, 08 Jul 2026 23:14:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbTJ-00000000aFl-0hp8;
	Wed, 08 Jul 2026 23:14:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4A506001A;
	Wed,  8 Jul 2026 23:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FD11F000E9;
	Wed,  8 Jul 2026 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783552467;
	bh=znSNM+MGjR1fppYrLy7qoTqjpqFxQICpffN75ccsbrI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=U7j9DuQ2nc8ydd23uGNZv2p9cQUiXygCkAVxSq71mj+NkX2cdLrmoGsFASFGg4Ml0
	 bDwc3/JpNMt1iiuBfO2+u2t8OwVWEKPRBEqFojt4WTEHrS5dyU+Rrl+iHhRZJ43XFU
	 Tp4PiEAswwCoD7KapE0e4aTY0MQO/lRQruojDYgw6tkvWRm9BrYDb1Uy0bxO7Zv6Ig
	 NQWzkZJfqj2mxHN2D5QfuxwgKNzrkIccqqWhDuluZJB6zK0q7BbhRN+Pi08TxExqdC
	 M1JIWRaFxQmoW8FElnvw5Vst8d3UaIMnUJuT2C8niIgtq2a4qubF9EJ5FQZPKi1rPF
	 fpIGbT8HGVkAQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
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
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type bool
In-Reply-To: <87se5tqkyp.ffs@fw13>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org> <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13>
Date: Thu, 09 Jul 2026 01:14:24 +0200
Message-ID: <87ik6pqdkf.ffs@fw13>
MIME-Version: 1.0
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

T24gV2VkLCBKdWwgMDggMjAyNiBhdCAyMjozNCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9u
IFdlZCwgSnVsIDA4IDIwMjYgYXQgMTc6NTIsIE1pY2hhbCBTdWNow6FuZWsgd3JvdGU6Cj4gUTog
SXMgaXQgcGVyZmVjdD8KPiBBOiBObwo+Cj4gUTogQ2FuIGl0IGJlIG1hZGUgcGVyZmVjdD8KPiBB
OiBObywgYmVjYXVzZSB5b3UgY2FuJ3QgY2hhbmdlIGhpc3RvcnkgYW5kIGVzdGFibGlzaGVkIHBy
YWN0aWNlLgo+Cj4gSnVzdCBmb3IgaWxsdXN0cmF0aW9uLiBDaGFuZ2luZyB0aGUgbG9naWMgaW4g
dHJhY2Vfc3lzY2FsbF9lbnRlcigpIHRvOgo+Cj4gLS0tIGEva2VybmVsL2VudHJ5L3N5c2NhbGwt
Y29tbW9uLmMKPiArKysgYi9rZXJuZWwvZW50cnkvc3lzY2FsbC1jb21tb24uYwo+IEBAIC05LDEz
ICs5LDE1IEBACj4gIAo+ICBib29sIHRyYWNlX3N5c2NhbGxfZW50ZXIoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MsIGxvbmcgKnN5c2NhbGwpCj4gIHsKPiArCWxvbmcgb3JpZ19zeXNjYWxsID0gKnN5c2Nh
bGw7Cj4gKwo+ICAJdHJhY2Vfc3lzX2VudGVyKHJlZ3MsICpzeXNjYWxsKTsKPiAgCS8qCj4gIAkg
KiBQcm9iZXMgb3IgQlBGIGhvb2tzIGluIHRoZSB0cmFjZXBvaW50IG1heSBoYXZlIGNoYW5nZWQg
dGhlCj4gIAkgKiBzeXN0ZW0gY2FsbCBudW1iZXIuIFJlcmVhZCBpdC4KPiAgCSAqLwo+ICAJKnN5
c2NhbGwgPSBzeXNjYWxsX2dldF9ucihjdXJyZW50LCByZWdzKTsKPiAtCXJldHVybiAqc3lzY2Fs
bCAhPSAtMUw7Cj4gKwlyZXR1cm4gKnN5c2NhbGwgPT0gb3JpZ19zeXNjYWxsIHx8ICpzeXNjYWxs
ICE9IC0xTDsKPiAgfQo+ICAKPiAgdm9pZCB0cmFjZV9zeXNjYWxsX2V4aXQoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MsIGxvbmcgcmV0KQo+Cj4gZG9lcyBub3QgbWFrZSAjMiBtYWdpY2FsbHkgZ28gYXdh
eS4gSXQncyBzdGlsbCB0aGUgc2FtZSBwcm9ibGVtIHdoZXRoZXIKPiB5b3UgbGlrZSBpdCBvciBu
b3QuCgpBbmQganVzdCB0byBiZSBlbnRpcmVseSBjbGVhciwgdGhlIHN5c2NhbGwoKSBpbnRlcmZh
Y2UgaGFzIHRvIGJlIGNvcnJlY3QKaW4gdGhlIGZpcnN0IHBsYWNlLCBidXQgdGhlbiBpdCdzIGFs
bCBhYm91dCBwZXJmb3JtYW5jZS4KClNvIHRoZSBzZXF1ZW5jZSBvZjoKCiAgIHB0X3JlZ3MgPSBQ
VVNIX1JFR1MoKTsKICAgc3lzY2FsbCA9IHB0X3JlZ3MtPnN5c2NhbGxfcmVnOwogICBwdF9yZWdz
LT5yZXN1bHQgPSAtRU5PU1lTOwoKICAgYXJjaF9zeXNjYWxsKHB0X3JlZ3MsIHN5c2NhbGwpIHsK
ICAgICAgaWYgKGxpa2VseShzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHB0X3JlZ3MsICZz
eXNjYWxsKSB7CiAgICAgICAgIGlmIChzeXNjYWxsIDwgU1lTQ0FMTF9tYXgpCiAgICAgICAgICAg
IHB0X3JlZ3MtPnJlc3VsdCA9IGludm9rZV9zeXNjYWxsKHB0X3JlZ3MsIHN5c2NhbGwpOwogICAg
ICB9CiAgICAgICwsLCwKICAgfQogICBwdF9yZWdzLT4oJFJFVFVSTl9WQUxVRSkgPSBwdF9yZWdz
LT5yZXN1bHQ7CiAgIFBPUF9SRUdTKCk7CiAgIHJldHVybjsKCmlzIHRoZSBjb3JyZWN0IGFuZCBv
YnZpdW9zbHkgbW9zdCBlZmZpY2llbnQgd2F5IGlkZXBlbmRlbnQgb2YgdGhlIC0xTApyZXR1cm4g
dmFsdWUgb3ZlcmxvYWQgaW4gdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uLCB3aGljaCB0aGlz
IHNlcmllcwpnZXRzIHJpZCBvZiBmb3IgY2xhcml0eS4KCklmIGFuIGFyY2hpdGVjdHVyZSBkZWNp
ZGVbc2RdIHRvIGRvIG90aGVyd2lzZSBhbmQgbWFrZXMgdXAgaXQncyBvd24gcnVsZXMKd2hpY2gg
b25seSBjb3ZlciBwYXJ0cyBvZiB0aGUgcHJvYmxlbSB0aGVuIGl0IF9pc18gYW4gYXJjaGl0ZWN0
dXJlCnByb2JsZW0gYW5kIG5vdCBzb21ldGhpbmcgd2hpY2ggaGFzIHRvIGJlIHNvbHZlZCBieSBj
bGFpbWluZyB0aGF0IGV2ZXJ5CmFyY2hpdGVjdHVyZSBoYXMgdG8gaW1wbGVtZW50IHRoZSBzYW1l
IG5vbnNlbnNlIGFzIHlvdSBmYWxzZWx5IGNsYWltZWQKaW4geW91ciBSRkNeV1BPQ15XaGFjayB0
aHJlYWQ6CgogICJIb3dldmVyLCB0aGUgQVBJIHNob3VsZCBiZSBzcGVjaWZpZWQgaW4gYSB3YXkg
dGhhdCBkb2VzIG5vdCByZXF1aXJlCiAgIGV2ZXJ5b25lIGltcGxlbWVudGluZyBzdWNoIGZsYWcu
IgoKVGhlcmUgaXMgX1pFUk9fIHJlcXVpcmVtZW50IGZvciBhbnkgYXJjaGl0ZWN0dXJlIHRvIGlt
cGxlbWVudCB0aGF0CmZsYWcuIEp1c3QgYmVjYXVzZSBTMzkwIGRlY2lkZWQgaXQncyBhIGJyaWxs
aWFudCBpZGVhIHRvIGRvIHNvIGRvZXMgbm90Cm1ha2UgaXQgYSByZXF1aXJlbWVudCBmb3IgZXZl
cnlvbmUuCgpOby4gRXZlcnkgb3RoZXIgYXJjaGl0ZWN0dXJlIGdvdCBpdCByaWdodCBiZWNhdXNl
IHRoZXkgbG9va2VkIGF0IHRoZQpoaXN0b3JpY2FsIHBhdHRlcm5zIGRlc3BpdGUgaGF2aW5nIGNv
cnJlY3QgZG9jdW1lbnRhdGlvbiBhdCBoYW5kLgoKRmVlbCBmcmVlIHRvIHByb3ZlIG1lIHdyb25n
IHdpdGggYWN0dWFsIGZhY3RzLgoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
