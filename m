Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3CDEE499B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Aug 2023 23:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpB0Qsn/01k7HrJXYcFQsbQ76s8eEKTk/A4fwCIsbns=; b=4JbJSKcp6CMqgY
	64gkbsxdUjizDwMePrus4nlJaaZvnMhYV5YlewFq093RSgL6XvStri1ds4qhytke+tbBaCSJSpz49
	ASmGqHztqjPEwdLA4NP5+NZ26l0f6UccFoBNnKvf+WZ1laWed+HL0H773f0s540U29kLPnzLtx4y4
	VEbmUTTYJmp9FR/ENosx3K4qxBnaYuVUOtZFFfHTsqopvLCTkzIQrofi8qyl5vdigHJJicKvMiL3X
	4IbyHsRXbKd2n9Ab6NLcQFKoP3tuvnmqiAMOZ7x0uECsLXQdKEZoH6MIQtavF8ktS2+WOzuLph1sv
	Tl7YmZ8aJVd5VfuEILEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX992-00ABOJ-1h;
	Fri, 18 Aug 2023 23:44:44 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qX98o-00ABNX-07;
	Fri, 18 Aug 2023 23:44:30 +0000
Message-ID: <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
Date: Fri, 18 Aug 2023 16:44:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@quicinc.com>,
 linux-hexagon@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
 <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
In-Reply-To: <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
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

SGkgSmVzc2UsCgpJIHJlcGxpZWQgdG8geW91ciBjb21tZW50IGEgZmV3IGRheXMgYWdvLCBidXQg
Zm9yIHNvbWUgcmVhc29uCnlvdXIgZW1haWwgdG8gbWUgY29udGFpbnM6ClJlcGx5LVRvOiAyMDIz
MDgxNjA1NTAxMC4zMTUzNC0xLXJkdW5sYXBAaW5mcmFkZWFkLm9yZwpzbyBpdCB3YXNuJ3Qgc2Vu
dCBkaXJlY3RseSB0byB5b3UuCgpNeSBmb3JtZXIgcmVwbHkgaXMgYmVsb3cuCgpPbiA4LzE2LzIz
IDIwOjE1LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gSGkgSmVzc2UsCj4gCj4gT24gOC8xNi8yMyAx
NTo0NSwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4+IEhpLCBSYW5keQo+Pgo+Pj4gZGlmZiAtLSBhL2lu
aXQvS2NvbmZpZyBiL2luaXQvS2NvbmZpZwo+Pj4gLS0tIGEvaW5pdC9LY29uZmlnCj4+PiArKysg
Yi9pbml0L0tjb25maWcKPj4+IEBAIC0xNzkwLDE0ICsxNzkwLDYgQEAgY29uZmlnIERFQlVHX1JT
RVEKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoCBJZiB1bnN1cmUsIHNheSBOLgo+Pj4KPj4+IC1jb25m
aWcgRU1CRURERUQKPj4+IC3CoMKgwqAgYm9vbCAiRW1iZWRkZWQgc3lzdGVtIgo+Pj4gLcKgwqDC
oCBzZWxlY3QgRVhQRVJUCj4+PiAtwqDCoMKgIGhlbHAKPj4+IC3CoMKgwqDCoMKgIFRoaXMgb3B0
aW9uIHNob3VsZCBiZSBlbmFibGVkIGlmIGNvbXBpbGluZyB0aGUga2VybmVsIGZvcgo+Pj4gLcKg
wqDCoMKgwqAgYW4gZW1iZWRkZWQgc3lzdGVtIHNvIGNlcnRhaW4gZXhwZXJ0IG9wdGlvbnMgYXJl
IGF2YWlsYWJsZQo+Pj4gLcKgwqDCoMKgwqAgZm9yIGNvbmZpZ3VyYXRpb24uCj4+Cj4+IFdvdWxk
bid0IHJlbW92aW5nIHRoaXMgYnJlYWsgbWFueSBvdXQgb2YgdHJlZSBjb25maWdzPwo+IAo+IEkn
bSBub3QgZmFtaWxpYXIgd2l0aCBvdXQtb2YtdHJlZSBjb25maWdzLgo+IERvIHlvdSBoYXZlIHNv
bWUgZXhhbXBsZXMgb2Ygc29tZSB0aGF0IHVzZSBDT05GSUdfRU1CRURERUQ/Cj4gKG5vdCBkaXN0
cm9zKQo+IAo+PiBTaG91bGQgdGhlcmUgYmUgYSB3YXJuaW5nIGhlcmUgdG8gdXBkYXRlIGNoYW5n
ZSBpdCBpbnN0ZWFkIG9mIHJlbW92YWw/Cj4gCj4ga2NvbmZpZyBkb2Vzbid0IGhhdmUgYSB3YXJu
aW5nIG1lY2hhbmlzbSBBRkFJSy4KPiBEbyB5b3UgaGF2ZSBhbiBpZGVhIG9mIGhvdyB0aGlzIHdv
dWxkIHdvcms/Cj4gCj4gV2UgY291bGQgbWFrZSBhIHNtYWxsZXIgY2hhbmdlIHRvIGluaXQvS2Nv
bmZpZywgbGlrZSBzbzoKPiAKPiAgY29uZmlnIEVNQkVEREVECj4gLQlib29sICJFbWJlZGRlZCBz
eXN0ZW0iCj4gKwlib29sICJFbWJlZGRlZCBzeXN0ZW0gKERFUFJFQ0FURUQpIgo+ICAJc2VsZWN0
IEVYUEVSVAo+ICAJaGVscAo+IC0JICBUaGlzIG9wdGlvbiBzaG91bGQgYmUgZW5hYmxlZCBpZiBj
b21waWxpbmcgdGhlIGtlcm5lbCBmb3IKPiAtCSAgYW4gZW1iZWRkZWQgc3lzdGVtIHNvIGNlcnRh
aW4gZXhwZXJ0IG9wdGlvbnMgYXJlIGF2YWlsYWJsZQo+IC0JICBmb3IgY29uZmlndXJhdGlvbi4K
PiArCSAgVGhpcyBvcHRpb24gaXMgYmVpbmcgcmVtb3ZlZCBhZnRlciBMaW51eCA2LjYuCj4gKwkg
IFVzZSBFWFBFUlQgaW5zdGVhZCBvZiBFTUJFRERFRC4KPiAKPiBidXQgdGhlcmUgaXMgbm8gd2F5
IHRvIHByb2R1Y2UgYSB3YXJuaW5nIG1lc3NhZ2UuIEkuZS4sIGV2ZW4gd2l0aCB0aGlzCj4gY2hh
bmdlLCB0aGUgbWVzc2FnZSB3aWxsIHByb2JhYmx5IGJlIG92ZXJsb29rZWQuCj4gCj4gLS0tCj4g
flJhbmR5CgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
