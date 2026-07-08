Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BCAC43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bF7VnO4itaOzfXTXXdMBpzZq+Z6fx+AJP/z2u6adFc=; b=IUvVaBdi/0rdO4
	ylMqt9/tJEA35DC7BF8WDfNcesqhPraBh0XcT0zalbfZcQhGVfYmV/vNmPtanEf1/d25YRZeZU/hw
	9v3svOKbBXi2eJ5II2Zw/7Ttsh3d95nEXXtWmHNrvYCkfkaryNeqBbWiMqxTn700QzuiXELYkR4D6
	OYevTkv/WffYog65ZdCPQo1MNfxjBP25LDPhkIlDS0OGCEQy5E09CaSOI2ZhdaOClq6IgWn2io/UF
	THHTAwggimAyU1aaVG1dgtUXFEHYK3JRw5QuoPcFDbhC+zIoihOjB8hbliG1NdCReJt6TLGRvl9/t
	5hkmHi646VxVGWDVXzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaRE-00000000WP5-0VLA;
	Wed, 08 Jul 2026 22:08:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaRD-00000000WOl-0IpH;
	Wed, 08 Jul 2026 22:08:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 137E040751;
	Wed,  8 Jul 2026 22:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A72C1F000E9;
	Wed,  8 Jul 2026 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548494;
	bh=6Cz8BOTHw08E9NcS2yyN9pfUWQWxwh/AbZG3/5oSlNo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FHRxCIVTukQAG3miFmDwBEU6I209sFjCARp6kEzFqtKLvTVeoIbUSsC2eSN9qIdnR
	 VQXn9bZShPRC0JvYyhaNRqG/HqxM+0wwkl21YMKvZbZEbwDcCKokdsns9i9ZzyHYbj
	 JPwH4nZrvGyAqtNPEHE5kgl0uyruw7Hao0EDZtv1yI13czTm2pC4iPHCUKvnl9ttoA
	 FQw80n5mm74fyWAHSi+eqhPD70ioINDjajTGwworQYlA/8+7sT+AhOFmASXWzYgLLf
	 IhREvhCoeEVhqiVsSYxwG/avxpiZWCQ9oe9o7pb6I/zkL58DG4nCbi8UNCb/vvui/f
	 nhrMJDrJBHLcg==
From: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
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
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 09/18] entry: Remove syscall_enter_from_user_mode()
In-Reply-To: <28fb0a8fd840bbf5223c60fea156584cb0f0f208.camel@rendec.net>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.132654198@kernel.org>
 <28fb0a8fd840bbf5223c60fea156584cb0f0f208.camel@rendec.net>
Date: Thu, 09 Jul 2026 00:08:11 +0200
Message-ID: <87mrw1qgms.ffs@fw13>
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

T24gV2VkLCBKdWwgMDggMjAyNiBhdCAxNzoyMSwgUmFkdSBSZW5kZWMgd3JvdGU6Cgo+IE9uIFR1
ZSwgMjAyNi0wNy0wNyBhdCAyMTowNiArMDIwMCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBB
bGwgYXJjaGl0ZWN0dXJlIHVzZSBlaXRoZXI6Cj4+IAo+PiDCoMKgwqAgbnIgPSBlbnRlcl9mcm9t
X3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2socmVncywgbnIpOwo+Cj4gWW91IHByb2JhYmx5IG1l
YW4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2suCgpEdWguIEkg
b2J2aW91c2x5IGdvdCB0aGF0IHdyb25nIGluIGEgaHVycnkuIFRoYW5rcyBmb3IgcG9pbnRpbmcg
aXQgb3V0IQo+PiDCoHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByZXBvcnRfc2luZ2xlX3N0
ZXAodW5zaWduZWQgbG9uZyB3b3JrKQo+PiDCoHsKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnEt
ZW50cnktY29tbW9uLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9pcnEtZW50cnktY29tbW9uLmgK
Pj4gQEAgLTQ5LDkgKzQ5LDkgQEAKPj4gwqAgKiBEZWZhdWx0cyB0byBhbiBlbXB0eSBpbXBsZW1l
bnRhdGlvbi4gQ2FuIGJlIHJlcGxhY2VkIGJ5IGFyY2hpdGVjdHVyZQo+PiDCoCAqIHNwZWNpZmlj
IGNvZGUuCj4+IMKgICoKPj4gLSAqIEludm9rZWQgZnJvbSBzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlKCkgaW4gdGhlIG5vbi1pbnN0cnVtZW50YWJsZQo+PiAtICogc2VjdGlvbi4gVXNlIF9f
YWx3YXlzX2lubGluZSBzbyB0aGUgY29tcGlsZXIgY2Fubm90IHB1c2ggaXQgb3V0IG9mIGxpbmUK
Pj4gLSAqIGFuZCBtYWtlIGl0IGluc3RydW1lbnRhYmxlLgo+PiArICogSW52b2tlZCBmcm9tIGVu
dGVyX2Zyb21fdXNlcl9tb2RlX3N5c2NhbGxfYW5kX3JhbmRvbWl6ZV9zdGFjaygpIGluIHRoZQo+
ICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl4KPgo+IFByb2JhYmx5IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGVfcmFu
ZG9taXplX3N0YWNrKCk/IEJ1dCB0aGUKPiByZWFsaXR5IGlzIGl0J3Mgb25seSBldmVyIGludm9r
ZWQgZnJvbSBlbnRlcl9mcm9tX3VzZXJfbW9kZSgpLCB3aGljaCBpcwo+IGJlbG93IGluIHRoZSBz
YW1lIGZpbGUgKGluY2x1ZGUvbGludXgvaXJxLWVudHJ5LWNvbW1vbi5oKS4KClllcy4gSW5kZWVk
LgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
