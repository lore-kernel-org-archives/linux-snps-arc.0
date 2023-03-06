Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D0EC678D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Mar 2023 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyxjRjRr2P3EI1UyG0gINgjRfoda9qLSKgwufMxBYO8=; b=NORy15Xz/ohFUG
	DNdgMCBnYuAEzjirsxNRVHQQSpgvsU6WMpMSiWNkCou0kzxmpl4peVjsjyoZEA/9SBTlAy4C8xH1j
	hTzJAowkZI8n9TycEIRGsl44AllqEOybgsHtBvwWl8L/0+rP4GKAyuo1YKYEmMGgSRCNUSszJt8Cx
	9R3zIXqfMC8BRolVkAMfjKvgSIXRJ3Lp8S/yU3cpWfrgUkH9iJLUiwnWRVzLAO/lNyHMxfQfPMh+o
	PPr5p2kPjlUQUm8R4mx1gQMlipDi+LJChCzFd07jPrt2o8trh7M6zNeDy49048TGgCKAfU4M1fMVo
	sI7+TrAg4XjQo6oWMN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7GK-00C7Ot-4K; Mon, 06 Mar 2023 09:36:08 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7Fq-00C77U-0u; Mon, 06 Mar 2023 09:35:45 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id D7AAE60017;
	Mon,  6 Mar 2023 09:35:17 +0000 (UTC)
Message-ID: <caaed678-4a5a-70e5-2ee7-cb2c8042afc0@ghiti.fr>
Date: Mon, 6 Mar 2023 10:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 gor@linux.ibm.com, Alexander Gordeev <agordeev@linux.ibm.com>,
 borntraeger@linux.ibm.com, Sven Schnelle <svens@linux.ibm.com>,
 ysato@users.osdn.me, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, chris@zankel.net, Max Filippov <jcmvbkbc@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
 <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
 <674bc31e-e4ed-988f-820d-54213d83f9c7@ghiti.fr>
 <c500840b-b57d-47f2-a3d9-41465b10ffae@app.fastmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c500840b-b57d-47f2-a3d9-41465b10ffae@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_013538_559438_5B668D58 
X-CRM114-Status: GOOD (  29.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Ck9uIDMvMy8yMyAxNzo0MCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBGcmksIE1hciAzLCAy
MDIzLCBhdCAxMjo1OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBPbiAzLzIvMjMgMjA6NTAs
IEguIFBldGVyIEFudmluIHdyb3RlOgo+Pj4gT24gTWFyY2ggMSwgMjAyMyA3OjE3OjE4IFBNIFBT
VCwgUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4+Pj4+PiBDb21t
aXQgNjIyMDIxY2Q2YzU2MGNlNyAoInMzOTA6IG1ha2UgY29tbWFuZCBsaW5lIGNvbmZpZ3VyYWJs
ZSIpLAo+Pj4+Pj4gSSBhc3N1bWU/Cj4+Pj4+IFllcywgc29ycnkgZm9yIHRoYXQuIEkgZ290IGRp
c3RyYWN0ZWQgd2hpbGUgd3JpdGluZyBhbmQgdXNlZCB0aGUgd3JvbmcKPj4+Pj4gYnJhbmNoIHRv
IGxvb2sgdGhpcyB1cC4KPj4+PiBBbGV4OiBQcm9iYWJseSB3b3J0aCBhZGRpbmcgdGhhdCB0byB0
aGUgbGlzdCBpbiB0aGUgY292ZXIgbGV0dGVyIGFzIGl0IGxvb2tzIGxpa2UgeW91IHdlcmUgcGxh
bm5pbmcgb24gYSB2NCBhbnl3YXkgKHdoaWNoIEkgZ3Vlc3MgeW91IG5vdyBoYXZlIHRvIGRvLCBn
aXZlbiB0aGF0IEkganVzdCBhZGRlZCB0aGUgaXNzdWUgdG8gUklTQy1WKS4KPj4+IFRoZSBvbmx5
IHVzZSB0aGF0IGlzIHVhcGkgaXMgdGhlICpkZWZhdWx0KiBsZW5ndGggb2YgdGhlIGNvbW1hbmQg
bGluZSBpZiB0aGUga2VybmVsIGhlYWRlciBkb2Vzbid0IGluY2x1ZGUgaXQgKGluIHRoZSBjYXNl
IG9mIHg4NiwgaXQgaXMgaW4gdGhlIGJ6SW1hZ2UgaGVhZGVyLCBidXQgdGhhdCBpcyBhdGNoaXRl
Y3R1cmUtIG9yIGV2ZW4gYm9vdCBmb3JtYXQtc3BlY2lmaWMuKQo+PiBJcyBDT01NQU5EX0xJTkVf
U0laRSB3aGF0IHlvdSBjYWxsIHRoZSBkZWZhdWx0IGxlbmd0aD8gRG9lcyB0aGF0IG1lYW4KPj4g
dGhhdCB0byB5b3UgdGhlIHBhdGNoc2V0IGlzIHdyb25nPwo+IE9uIHg4NiwgdGhlIENPTU1BTkRf
TElORV9TSVpFIHZhbHVlIGlzIGFscmVhZHkgbm90IHBhcnQgb2YgYSB1YXBpIGhlYWRlciwKPiBi
dXQgaW5zdGVhZCAoc2luY2UgYnpJbWFnZSBmb3JtYXQgdmVyc2lvbiAyLjA2KSBpcyBjb21tdW5p
Y2F0ZWQgZnJvbQo+IHRoZSBrZXJuZWwgdG8gdGhlIGJvb3QgbG9hZGVyLCB3aGljaCB0aGVuIGtu
b3dzIGhvdyBtdWNoIGRhdGEgdGhlCj4ga2VybmVsIHdpbGwgcmVhZCAoYXQgbW9zdCkgZnJvbSB0
aGUgY29tbWFuZCBsaW5lLgo+Cj4gTW9zdCB4ODYga2VybmVscyB0aGVzZSBkYXlzIGFyZSBib290
ZWQgdXNpbmcgVUVGSSwgd2hpY2ggSSB0aGluayBoYXMKPiBubyBzdWNoIGludGVyZmFjZSwgdGhl
IGZpcm13YXJlIGp1c3QgcGFzc2VzIHRoZSBjb21tYW5kIGxpbmUgYW5kIGEKPiBsZW5ndGgsIGJ1
dCBoYXMgbm8gd2F5IG9mIGtub3dpbmcgaWYgdGhlIGtlcm5lbCB3aWxsIHRydW5jYXRlIHRoaXMu
Cj4gSSB0aGluayB0aGF0IGlzIHRoZSBzYW1lIGFzIHdpdGggYW55IG90aGVyIGFyY2hpdGVjdHVy
ZSB0aGF0IHBhc3Nlcwo+IHRoZSBjb21tYW5kIGxpbmUgdGhyb3VnaCBVRUZJLCBEVCBvciBBVEFH
UywgYWxsIG9mIHdoaWNoIHVzZQo+IGxlbmd0aC92YWx1ZSBwYWlycy4KPgo+IFJ1c3NlbGwgYXJn
dWVkIG9uIElSQyB0aGF0IHRoaXMgY2FuIGJlIGNvbnNpZGVyZWQgYW4gQUJJIHNpbmNlIGEKPiBi
b290IGxvYWRlciBtYXkgdXNlIGl0cyBrbm93bGVkZ2Ugb2YgdGhlIGtlcm5lbCdzIGNvbW1hbmQg
bGluZSBzaXplCj4gbGltaXQgdG8gcmVqZWN0IGxvbmcgY29tbWFuZCBsaW5lcy4gT24gdGhlIG90
aGVyIGhhbmQsIEkgZG9uJ3QKPiB0aGluayB0aGF0IGFueSBib290IGxvYWRlciBhY3R1YWxseSBk
b2VzLCB0aGV5IGp1c3QgdHJ1c3QgdGhhdCBpdAo+IGZpdHMgYW5kIGRvbid0IGhhdmUgYSBnb29k
IHdheSBvZiByZWplY3RpbmcgaW52YWxpZCBjb25maWd1cmF0aW9uCj4gb3RoZXIgdGhhbiB0cnVu
Y2F0aW5nIGFuZC9vciB3YXJuaW5nLgo+Cj4gT25lIG5vdGFibGUgZXhjZXB0aW9uIEkgZm91bmQg
d2hpbGUgbG9va2luZyB0aHJvdWdoIGlzIHRoZSBvbGQKPiAocHJlLUFUQUdTKSBwYXJhbWV0ZXIg
c3RydWN0dXJlIG9uIEFybSwgd2hpY2ggdXNlcyBDT01NQU5EX0xJTkVfU0laRQo+IGFzIHBhcnQg
b2YgdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9uLiBBcHBhcmVudGx5IHRoaXMgd2FzIGRlcHJlY2F0
ZWQKPiAyMiB5ZWFycyBhZ28sIHNvIGhvcGVmdWxseSB0aGUgcmVtYWluaW5nIHJpc2NwYyBhbmQg
Zm9vdGJyaWRnZQo+IHVzZXJzIGhhdmUgYWxsIHVwZ3JhZGVkIHRoZWlyIGJvb3Rsb2FkZXJzLgo+
Cj4gVGhlIG9ubHkgb3RoZXIgY2FzZSBJIGNvdWxkIGZpbmQgdGhhdCBtaWdodCBnbyB3cm9uZyBp
cwo+IG02OGtub21tdSB3aXRoIGEgZmV3IGZpbGVzIGNvcHlpbmcgYSBDT01NQU5EX0xJTkVfU0la
RSBzaXplZAo+IGJ1ZmZlciBmcm9tIGZsYXNoIGludG8gYSBrZXJuZWwgYnVmZmVyOgo+Cj4gYXJj
aC9tNjhrL2NvbGRmaXJlL201MjA2LmM6dm9pZCBfX2luaXQgY29uZmlnX0JTUChjaGFyICpjb21t
YW5kcCwgaW50IHNpemUpCj4gYXJjaC9tNjhrL2NvbGRmaXJlL201MjA2LmMtewo+IGFyY2gvbTY4
ay9jb2xkZmlyZS9tNTIwNi5jLSNpZiBkZWZpbmVkKENPTkZJR19ORVR0ZWwpCj4gYXJjaC9tNjhr
L2NvbGRmaXJlL201MjA2LmMtICAgICAvKiBDb3B5IGNvbW1hbmQgbGluZSBmcm9tIEZMQVNIIHRv
IGxvY2FsIGJ1ZmZlci4uLiAqLwo+IGFyY2gvbTY4ay9jb2xkZmlyZS9tNTIwNi5jLSAgICAgbWVt
Y3B5KGNvbW1hbmRwLCAoY2hhciAqKSAweGYwMDA0MDAwLCBzaXplKTsKPiBhcmNoL202OGsvY29s
ZGZpcmUvbTUyMDYuYy0gICAgIGNvbW1hbmRwW3NpemUtMV0gPSAwOwo+IGFyY2gvbTY4ay9jb2xk
ZmlyZS9tNTIwNi5jLSNlbmRpZiAvKiBDT05GSUdfTkVUdGVsICovCgoKSSBzZWUsIHRoYW5rcyB5
b3VyIHRob3JvdWdoIGV4cGxhbmF0aW9uOiBJIGRvbid0IHNlZSB0aGlzIG02NGsgaXNzdWUgYXMg
CmEgYmxvY2tlciAodW5sZXNzIEdlZXJ0IGRpc2FncmVlcyBidXQgaGUgYWxyZWFkeSByZXZpZXdl
ZCB0aGUgbTY0ayAKcGF0Y2hlcykswqAgc28gSSdsbCBzZW5kIHRoZSB2NSBub3cuCgpUaGFua3Mg
YWdhaW4sCgpBbGV4CgoKPgo+ICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
