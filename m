Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9BBCF58CC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Sep 2024 05:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6BJE4GQcGxIjISTA+PxurwCtDbPwGg8RgUzc/AC7wU=; b=gQ5fTnCc46ttfg
	p8l5GodlhaDPfRrG5QdiV+63I1Vuyjw2USrCh5k7KFH0FpsjKeeE+t7QoU/KP2w9eO21zys+MmyWi
	nXyfwJu1ZvMXP77bZp3zqhgOAOFbcbScstUrsOHfwtSU6Vut96t7jrSUOLDFzkHUy3PDZvL9eug1I
	ZX5D3ISJk4NJHXILpzw4coItfp875f/eSF/ZNfn1Lgwx1iYc0xWHdOgIcZAYkj+5sZ20dsLIxJMk3
	R6iNVE0KIY3rzUqxq3YEyUvCynM+cpKFY3RVMti9/fqsj92vtuFE1J2a9SkRZDyX4zUkQJhBhMh/e
	k+mjtlI8zc4j5CsSfdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srVuq-0000000BSfH-1VuL;
	Fri, 20 Sep 2024 05:10:48 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srVun-0000000BSeJ-0sII;
	Fri, 20 Sep 2024 05:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726809043;
	bh=rRnqIQfUKl5hMqMziAAuyLYljr0XWCtIu8tELgZL7Kk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SMnj41MDT0Lf3PfeIXIT3YwHOI0uAuuDLjE0t47tRZRaNTFGPp7CmsiqP5xtDHrve
	 GQpxRf3WsppyZZ4VsMpffig95QUjZAZcDTfAYoQRqb1kT/tFerPynOIHTZHPuzrIZ0
	 6IUod3m4WM+YcquTxyACp+qQoBmzjqHxZaUgk+jSzmb/iMutuZKenA1h2ctddPY4VB
	 zq+UuDefISa1ohGSToaZ++xjvfQUbK1tokALiwcAwa1KGWQEeHrE7fds5GO8aUidii
	 ZlBYq9K3KPr01kqIlLozoiNa0r5uQQx7O30KTZoarDO3+tCBmjhV32YlfcEEOMpICG
	 jWz/PZdm+HR7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X90nx2nGtz4xD3;
	Fri, 20 Sep 2024 15:10:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Arnd Bergmann <arnd@arndb.de>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek
 <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <ZuKIMz7U8rDrq8jA@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
 <8734m6s428.fsf@mail.lhotse> <ZuKIMz7U8rDrq8jA@ghost>
Date: Fri, 20 Sep 2024 15:10:28 +1000
Message-ID: <87y13mnc57.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_221045_553686_2B05AAE3 
X-CRM114-Status: GOOD (  18.70  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+IE9uIFdlZCwg
U2VwIDExLCAyMDI0IGF0IDExOjM4OjU1UE0gKzEwMDAsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6
Cj4+IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyaXRlczoKPj4g
PiBIaSBDaHJpc3RvcGhlLAo+PiA+Cj4+ID4gT24gVHVlLCBTZXAgMTAsIDIwMjQgYXQgMTE6MjHi
gK9BTSBDaHJpc3RvcGhlIExlcm95Cj4+ID4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4g
d3JvdGU6Cj4+ID4+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3BlcnNvbmFs
aXR5LmggYi9pbmNsdWRlL3VhcGkvbGludXgvcGVyc29uYWxpdHkuaAo+PiA+PiA+Pj4gaW5kZXgg
NDk3OTZiNzc1NmFmLi5jZDNiOGMxNTRkOWIgMTAwNjQ0Cj4+ID4+ID4+PiAtLS0gYS9pbmNsdWRl
L3VhcGkvbGludXgvcGVyc29uYWxpdHkuaAo+PiA+PiA+Pj4gKysrIGIvaW5jbHVkZS91YXBpL2xp
bnV4L3BlcnNvbmFsaXR5LmgKPj4gPj4gPj4+IEBAIC0yMiw2ICsyMiw3IEBAIGVudW0gewo+PiA+
PiA+Pj4gICAgIFdIT0xFX1NFQ09ORFMgPSAgICAgICAgIDB4MjAwMDAwMCwKPj4gPj4gPj4+ICAg
ICBTVElDS1lfVElNRU9VVFMgPSAgICAgICAweDQwMDAwMDAsCj4+ID4+ID4+PiAgICAgQUREUl9M
SU1JVF8zR0IgPSAgICAgICAgMHg4MDAwMDAwLAo+PiA+PiA+Pj4gKyAgIEFERFJfTElNSVRfNDdC
SVQgPSAgICAgIDB4MTAwMDAwMDAsCj4+ID4+ID4+PiAgIH07Cj4+ID4+ID4+Cj4+ID4+ID4+IEkg
d29uZGVyIGlmIEFERFJfTElNSVRfMTI4VCB3b3VsZCBiZSBjbGVhcmVyPwo+PiA+PiA+Pgo+PiA+
PiA+Cj4+ID4+ID4gSSBkb24ndCBmb2xsb3csIHdoYXQgZG9lcyAxMjhUIHJlcHJlc2VudD8KPj4g
Pj4KPj4gPj4gMTI4VCBpcyAxMjggVGVyYWJ5dGVzLCB0aGF0J3MgdGhlIG1heGltdW0gc2l6ZSBh
Y2hpZXZhYmxlIHdpdGggYSA0N0JJVAo+PiA+PiBhZGRyZXNzLCB0aGF0IG5hbWluZyB3b3VsZCBi
ZSBtb3JlIGNvbnNpc3RhbnQgd2l0aCB0aGUgQUREUl9MSU1JVF8zR0IKPj4gPj4ganVzdCBhYm92
ZSB0aGF0IG1lYW5zIGEgMyBHaWdhYnl0ZXMgbGltaXQuCj4+ID4KPj4gPiBIZW5jZSBBRERSX0xJ
TUlUXzEyOFRCPwo+PiAKPj4gWWVzIGl0IHNob3VsZCBiZSAxMjhUQi4gVHlwbyBieSBtZS4KPgo+
IDQ3QklUIHdhcyBzZWxlY3RlZCBiZWNhdXNlIHRoZSB1c2VjYXNlIGZvciB0aGlzIGZsYWcgaXMg
Zm9yIGFwcGxpY2F0aW9ucwo+IHRoYXQgd2FudCB0byBzdG9yZSBkYXRhIGluIHRoZSB1cHBlciBi
aXRzIG9mIGEgdmlydHVhbCBhZGRyZXNzIHNwYWNlLiBJbgo+IHRoaXMgY2FzZSwgaG93IGxhcmdl
IHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgaXMgaXJyZWxldmFudCwgYW5kIG9ubHkKPiB0aGUg
bnVtYmVyIG9mIGJpdHMgdGhhdCBhcmUgYmVpbmcgdXNlZCwgYW5kIGhlbmNlIHRoZSBudW1iZXIg
b2YgYml0cwo+IHRoYXQgYXJlIGZyZWUuCgpZZWFoIEkgdW5kZXJzdGFuZCB0aGF0J3MgaG93IHlv
dSBjYW1lIHRvIHRoZSBwcm9ibGVtLgoKQnV0IGZvciB0aGUgdXNlciBBUEkgSSB0aGluayB1c2lu
ZyB0aGUgc2l6ZSBvZiB0aGUgYWRkcmVzcyBzcGFjZSBpcwpjbGVhcmVyLCBlYXNpZXIgdG8gZXhw
bGFpbiwgYW5kIG1hdGNoZXMgdGhlIGV4aXN0aW5nIEFERFJfTElNSVRfM0dCLgoKY2hlZXJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBz
LWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
