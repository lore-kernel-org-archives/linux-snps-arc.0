Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC86ECD5BA4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 06:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3zGTrCguyUihnBRIJ0Y32//z/2vJBZaAMRyz29iSJo=; b=PaMUoaxXETm95H
	Eg6ixu76t2qkeij2hWa+TmTLJ3dEZsltbx/uZ9eunKrKlFXyM68JoAceMIF5irPZ1MO+nYO/sKKcO
	+voZyxfF/omuUGW0jZMVRve2V0BXjGR9koxLd1JWcn9PKhveO1aispSn/1j5bOke6zh2Uz+anesqe
	9QXz1rUIcBv1quc6PTkjbWgsX2HmuAEt5r5d2uRmurUcKsCgsJxaSlL2NxUyycPOrKdZqw6xtUJkP
	R5OsXRccSaBKIN2GUqD1qIAGbpvFJ9+pDIhq5wAzbChwSnAOUF1WbJKB08DGbrJukjNnkHWAEbUuk
	bM1UE0rl7CUSHf0NQw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smS9U-0000000AoNx-0XV0;
	Fri, 06 Sep 2024 06:09:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smS9Q-0000000AoLW-1bWP;
	Fri, 06 Sep 2024 06:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09F4DA446EC;
	Fri,  6 Sep 2024 06:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4CEC4CEDB;
	Fri,  6 Sep 2024 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725602934;
	bh=imDUvx1Hii43SnkhK8GwTQs26eTyhJYRfhTDRAtZziQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mMW64gLmWYwNHxfzlvaoGMBLGF0ueWOxcjrWhSUrtIlP4vdUd7xae5JPy3JKqIExz
	 HFuiZx6oWJmovq63/cl+v1ZU19PDWFCuqMas6d7gV33rwhbsIjf/6jKgtDJi0CjkaM
	 nAyscQokSqYPIUNn+/TkhSXvtu24dJ3kiLF2CEDvIPyPBbHH7uk6zFOptSZYge3L0P
	 rhjznSkw4UEu9OgtKgG+WNoivArvnTJTCqu9mRUL1aD6wfECi7osbo4z5PCvKLIQRB
	 x3CsUjPvuNXAShUQV2Y5AaW8FjjBy+AWygG7+uu3f9QIpIxTL3VXFknAtoxQuKUuS7
	 CI+n8mob5I75g==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso233313266b.0;
        Thu, 05 Sep 2024 23:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2nbCx2D2q/oC15r3K78GEKjMjA/XKUbeMifXH0b05Wi6eO2AqLajMhObzgOnMyRs0bVlz6v5O6ZBRpy9Am4A=@lists.infradead.org, AJvYcCUUvVbyaq6tnZaS4tW1oOylvQNjwAV4TqdspyRBoyg3MPNnXV2yt44U+Rf59lzV9BX/YFvFI0+d4KFdqk5QYi40@lists.infradead.org
X-Gm-Message-State: AOJu0YyeEUI+tARYJr3fy90QDe1iFzcb0TMZFKz2zkYWHlThdUtSUhv+
	bfpULLQDutBiFE1XOgb7ZRoBMplaMcBAGKNC8O4Fu8qlW2VidKd82b+McQnk0UNDyum+n5lhJMJ
	NnRtRWq4IbfxS7esr7rUoPNNSu3U=
X-Google-Smtp-Source: AGHT+IHmDTwta2M/ptJ8I+HJGlz0i22zQ861L/VtKZzzihvpyO7sN1xzTAGALtM9rjMcOlsIyxzfNUzFUkdZe9E/qYg=
X-Received: by 2002:a17:907:7d94:b0:a86:beb2:1d6d with SMTP id
 a640c23a62f3a-a8a431c7214mr876305366b.26.1725602932791; Thu, 05 Sep 2024
 23:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
In-Reply-To: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Sep 2024 14:08:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS4=8dMypnWe2dpuQfdfV3+XLq5fZeGbJWZPDN_ypfuvQ@mail.gmail.com>
Message-ID: <CAJF2gTS4=8dMypnWe2dpuQfdfV3+XLq5fZeGbJWZPDN_ypfuvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/2] mm: Introduce ADDR_LIMIT_47BIT personality flag
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_230856_580442_8AD9E968 
X-CRM114-Status: GOOD (  34.93  )
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

T24gRnJpLCBTZXAgNiwgMjAyNCBhdCA1OjE24oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTb21lIGFwcGxpY2F0aW9ucyByZWx5IG9uIHBsYWNp
bmcgZGF0YSBpbiBmcmVlIGJpdHMgYWRkcmVzc2VzIGFsbG9jYXRlZAo+IGJ5IG1tYXAuIFZhcmlv
dXMgYXJjaGl0ZWN0dXJlcyAoZWcuIHg4NiwgYXJtNjQsIHBvd2VycGMpIHJlc3RyaWN0IHRoZQo+
IGFkZHJlc3MgcmV0dXJuZWQgYnkgbW1hcCB0byBiZSBsZXNzIHRoYW4gdGhlIDQ4LWJpdCBhZGRy
ZXNzIHNwYWNlLAo+IHVubGVzcyB0aGUgaGludCBhZGRyZXNzIHVzZXMgbW9yZSB0aGFuIDQ3IGJp
dHMgKHRoZSA0OHRoIGJpdCBpcyByZXNlcnZlZAo+IGZvciB0aGUga2VybmVsIGFkZHJlc3Mgc3Bh
Y2UpLgo+Cj4gVGhlIHJpc2N2IGFyY2hpdGVjdHVyZSBuZWVkcyBhIHdheSB0byBzaW1pbGFybHkg
cmVzdHJpY3QgdGhlIHZpcnR1YWwKPiBhZGRyZXNzIHNwYWNlLiBPbiB0aGUgcmlzY3YgcG9ydCBv
ZiBPcGVuSkRLIGFuIGVycm9yIGlzIHRocm93biBpZgo+IGF0dGVtcHRlZCB0byBydW4gb24gdGhl
IDU3LWJpdCBhZGRyZXNzIHNwYWNlLCBjYWxsZWQgc3Y1NyBbMV0uICBnb2xhbmcKPiBoYXMgYSBj
b21tZW50IHRoYXQgc3Y1NyBzdXBwb3J0IGlzIG5vdCBjb21wbGV0ZSwgYnV0IHRoZXJlIGFyZSBz
b21lCj4gd29ya2Fyb3VuZHMgdG8gZ2V0IGl0IHRvIG1vc3RseSB3b3JrIFsyXS4KPgo+IFRoZXNl
IGFwcGxpY2F0aW9ucyB3b3JrIG9uIHg4NiBiZWNhdXNlIHg4NiBkb2VzIGFuIGltcGxpY2l0IDQ3
LWJpdAo+IHJlc3RyaWN0aW9uIG9mIG1tYXAoKSBhZGRyZXNzIHRoYXQgY29udGFpbiBhIGhpbnQg
YWRkcmVzcyB0aGF0IGlzIGxlc3MKPiB0aGFuIDQ4IGJpdHMuCj4KPiBJbnN0ZWFkIG9mIGltcGxp
Y2l0bHkgcmVzdHJpY3RpbmcgdGhlIGFkZHJlc3Mgc3BhY2Ugb24gcmlzY3YgKG9yIGFueQo+IGN1
cnJlbnQvZnV0dXJlIGFyY2hpdGVjdHVyZSksIHByb3ZpZGUgYSBmbGFnIHRvIHRoZSBwZXJzb25h
bGl0eSBzeXNjYWxsCj4gdGhhdCBjYW4gYmUgdXNlZCB0byBlbnN1cmUgYW4gYXBwbGljYXRpb24g
d29ya3MgaW4gYW55IGFyYml0cmFyeSBWQQo+IHNwYWNlLiBBIHNpbWlsYXIgZmVhdHVyZSBoYXMg
YWxyZWFkeSBiZWVuIGltcGxlbWVudGVkIGJ5IHRoZSBwZXJzb25hbGl0eQo+IHN5c2NhbGwgaW4g
QUREUl9MSU1JVF8zMkJJVC4KPgo+IFRoaXMgZmxhZyB3aWxsIGFsc28gYWxsb3cgc2VlbWxlc3Mg
Y29tcGF0aWJpbGl0eSBiZXR3ZWVuIGFsbAo+IGFyY2hpdGVjdHVyZXMsIHNvIGFwcGxpY2F0aW9u
cyBsaWtlIEdvIGFuZCBPcGVuSkRLIHRoYXQgdXNlIGJpdHMgaW4gYQo+IHZpcnR1YWwgYWRkcmVz
cyBjYW4gcmVxdWVzdCB0aGUgZXhhY3QgbnVtYmVyIG9mIGJpdHMgdGhleSBuZWVkIGluIGEKPiBn
ZW5lcmljIHdheS4gVGhlIGZsYWcgY2FuIGJlIGNoZWNrZWQgaW5zaWRlIG9mIHZtX3VubWFwcGVk
X2FyZWEoKSBzbwo+IHRoYXQgdGhpcyBmbGFnIGRvZXMgbm90IGhhdmUgdG8gYmUgaGFuZGxlZCBp
bmRpdmlkdWFsbHkgYnkgZWFjaAo+IGFyY2hpdGVjdHVyZS4KQWNrZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgoKU3Y1NydzIHBhaW4gZmluZHMgaXRzIGN1cmUgaW4gdGhpcyBhbnRp
ZG90ZS4KCj4KPiBMaW5rOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuamRrL2pkay9ibG9iL2Yw
ODBiNGJiOGE3NTI4NGRiMWI2MDM3ZjhjMDBlZjNiMWVmMWFkZDEvc3JjL2hvdHNwb3QvY3B1L3Jp
c2N2L3ZtX3ZlcnNpb25fcmlzY3YuY3BwI0w3OQo+IFsxXQo+IExpbms6Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL2dvbGFuZy9nby9ibG9iLzllOGVhNTY3YzgzODU3NGEwZjE0NTM4YzBiYmJkODNjMzIx
NWFhNTUvc3JjL3J1bnRpbWUvdGFncHRyXzY0Yml0LmdvI0w0Nwo+IFsyXQo+Cj4gVG86IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gVG86IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnPgo+IFRvOiBJdmFuIEtva3NoYXlza3kgPGlua0BqdXJhc3Np
Yy5wYXJrLm1zdS5ydT4KPiBUbzogTWF0dCBUdXJuZXIgPG1hdHRzdDg4QGdtYWlsLmNvbT4KPiBU
bzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAa2VybmVsLm9yZz4KPiBUbzogUnVzc2VsbCBLaW5nIDxs
aW51eEBhcm1saW51eC5vcmcudWs+Cj4gVG86IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
IFRvOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgo+IFRvOiBXQU5HIFh1ZXJ1
aSA8a2VybmVsQHhlbjBuLm5hbWU+Cj4gVG86IFRob21hcyBCb2dlbmRvZXJmZXIgPHRzYm9nZW5k
QGFscGhhLmZyYW5rZW4uZGU+Cj4gVG86IEphbWVzIEUuSi4gQm90dG9tbGV5IDxKYW1lcy5Cb3R0
b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgo+IFRvOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+Cj4gVG86IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBUbzog
TmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4KPiBUbzogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+IFRvOiBOYXZlZW4gTiBSYW8gPG5hdmVl
bkBrZXJuZWwub3JnPgo+IFRvOiBBbGV4YW5kZXIgR29yZGVldiA8YWdvcmRlZXZAbGludXguaWJt
LmNvbT4KPiBUbzogR2VyYWxkIFNjaGFlZmVyIDxnZXJhbGQuc2NoYWVmZXJAbGludXguaWJtLmNv
bT4KPiBUbzogSGVpa28gQ2Fyc3RlbnMgPGhjYUBsaW51eC5pYm0uY29tPgo+IFRvOiBWYXNpbHkg
R29yYmlrIDxnb3JAbGludXguaWJtLmNvbT4KPiBUbzogQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIDxi
b3JudHJhZWdlckBsaW51eC5pYm0uY29tPgo+IFRvOiBTdmVuIFNjaG5lbGxlIDxzdmVuc0BsaW51
eC5pYm0uY29tPgo+IFRvOiBZb3NoaW5vcmkgU2F0byA8eXNhdG9AdXNlcnMuc291cmNlZm9yZ2Uu
anA+Cj4gVG86IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+Cj4gVG86IEpvaG4gUGF1bCBB
ZHJpYW4gR2xhdWJpdHogPGdsYXViaXR6QHBoeXNpay5mdS1iZXJsaW4uZGU+Cj4gVG86IERhdmlk
IFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiBUbzogQW5kcmVhcyBMYXJzc29uIDxh
bmRyZWFzQGdhaXNsZXIuY29tPgo+IFRvOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KPiBUbzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4gVG86IEJvcmlzbGF2
IFBldGtvdiA8YnBAYWxpZW44LmRlPgo+IFRvOiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPgo+IFRvOiB4ODZAa2VybmVsLm9yZwo+IFRvOiBILiBQZXRlciBBbnZpbiA8
aHBhQHp5dG9yLmNvbT4KPiBUbzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+Cj4g
VG86IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KPiBUbzogTXVjaHVuIFNv
bmcgPG11Y2h1bi5zb25nQGxpbnV4LmRldj4KPiBUbzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KPiBUbzogTGlhbSBSLiBIb3dsZXR0IDxMaWFtLkhvd2xldHRAb3Jh
Y2xlLmNvbT4KPiBUbzogVmxhc3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4KPiBUbzogTG9y
ZW56byBTdG9ha2VzIDxsb3JlbnpvLnN0b2FrZXNAb3JhY2xlLmNvbT4KPiBUbzogU2h1YWggS2hh
biA8c2h1YWhAa2VybmVsLm9yZz4KPiBUbzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRl
YWQub3JnPgo+IFRvOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBUbzogIktpcmls
bCBBLiBTaHV0ZW1vdiIgPGtpcmlsbEBzaHV0ZW1vdi5uYW1lPgo+IFRvOiBDaHJpcyBUb3JlayA8
Y2hyaXMudG9yZWtAZ21haWwuY29tPgo+IENjOiBsaW51eC1hcmNoQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWFscGhhQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1jc2t5QHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsb29uZ2FyY2hAbGlzdHMubGludXguZGV2Cj4gQ2M6IGxpbnV4
LW1pcHNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXBhcmlzY0B2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPiBDYzogbGludXgtczM5MEB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHNwYXJjbGlu
dXhAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBsaW51eC1r
c2VsZnRlc3RAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWFiaS1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPgo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEFkZGVkIG11Y2ggZ3JlYXRlciBkZXRh
aWwgdG8gY292ZXIgbGV0dGVyCj4gLSBSZW1vdmVkIGFsbCBjb2RlIHRoYXQgdG91Y2hlZCBhcmNo
aXRlY3R1cmUgc3BlY2lmaWMgY29kZSBhbmQgd2FzIGFibGUKPiAgIHRvIGZhY3RvciB0aGlzIG91
dCBpbnRvIGFsbCBnZW5lcmljIGZ1bmN0aW9ucywgZXhjZXB0IGZvciBmbGFncyB0aGF0Cj4gICBu
ZWVkZWQgdG8gYmUgYWRkZWQgdG8gdm1fdW5tYXBwZWRfYXJlYV9pbmZvCj4gLSBNYWRlIHRoaXMg
YW4gUkZDIHNpbmNlIEkgaGF2ZSBvbmx5IHRlc3RlZCBpdCBvbiByaXNjdiBhbmQgeDg2Cj4gLSBM
aW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwODI3LXBhdGNoZXMtYmVs
b3dfaGludF9tbWFwLXYxLTAtNDZmZjJlYjkwMjJkQHJpdm9zaW5jLmNvbQo+Cj4gQ2hhbmdlcyBp
biB2MzoKPiAtIFVzZSBhIHBlcnNvbmFsaXR5IGZsYWcgaW5zdGVhZCBvZiBhbiBtbWFwIGZsYWcK
PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA4MjktcGF0Y2hl
cy1iZWxvd19oaW50X21tYXAtdjItMC02MzhhMjhkOWVhZTBAcml2b3NpbmMuY29tCj4KPiAtLS0K
PiBDaGFybGllIEplbmtpbnMgKDIpOgo+ICAgICAgIG1tOiBBZGQgcGVyc29uYWxpdHkgZmxhZyB0
byBsaW1pdCBhZGRyZXNzIHRvIDQ3IGJpdHMKPiAgICAgICBzZWxmdGVzdHMvbW06IENyZWF0ZSBB
RERSX0xJTUlUXzQ3QklUIHRlc3QKPgo+ICBpbmNsdWRlL3VhcGkvbGludXgvcGVyc29uYWxpdHku
aCAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgbW0vbW1hcC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9tbS8uZ2l0aWdub3JlICAgICAgICAgICAgICB8ICAxICsKPiAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbW0vTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgMSArCj4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL21tL21hcF80N2JpdF9wZXJzb25hbGl0eS5jIHwgMzQgKysrKysrKysrKysrKysr
KysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNl
LWNvbW1pdDogNWJlNjNmYzE5ZmNhYTRjMjM2YjMwNzQyMDQ4MzU3OGE1Njk4NmEzNwo+IGNoYW5n
ZS1pZDogMjAyNDA4MjctcGF0Y2hlcy1iZWxvd19oaW50X21tYXAtYjEzZDc5YWUxYzU1Cj4gLS0K
PiAtIENoYXJsaWUKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
