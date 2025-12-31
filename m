Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60853EE6428
	for <linux-snps-arc@archiver.kernel.org>; Wed, 31 Dec 2025 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6UYusjtinW1cQZY1iFp7GiwKE28UdhuWu7R6wsGPq0=; b=ZWMzP6sD6+Q04D
	nrEg66CvY+AvdqASujTCro/7TOFML6QA750dLTHtwMhhhvddIj9tolP0FEiZUHqmDTMYdkvhDp3Eq
	GQ8sUB++4ysMU7xtMaXIlZpZfOe0C8HYojXwYN8aZWIETTviHfdk+1JZMGDav8VL5C2UVg8AxLDQr
	IXkjX0U2qInl06TDFyUkXqRNnd3TTgIMlkNEtu+HWLVMyZrKqF3ExwzqpBrbrk4OZH5p3w6Kiculc
	yvZXTT3+3raLglZOz/hOo5dr7HfNHniGctRVu3MJhQeRk0Y15E/GYUGFKRKIMECGA4wNJunKLuJ3C
	ZOMhEm90cG6qCoKrLYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaySJ-000000066OC-3XAt;
	Wed, 31 Dec 2025 15:49:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaySH-000000066Mo-3T0z
	for linux-snps-arc@lists.infradead.org;
	Wed, 31 Dec 2025 15:49:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so15471428a12.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 31 Dec 2025 07:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767196183; x=1767800983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6r7yw9l553CBnZ0Oq6/Kvj3e3aIbXAlTRdm8Qc8sow=;
        b=QGFJM+5zzECLce/Ez4Hm9KA6Yf2GspnQLdjfiLnUsbTeaLIkdBKnz9eKXeAd01+4TB
         Rsl1Eg/dsnn+mN4bsUM0JR01/PqQDE/Zp8RhK9RpWiwT+ANY5tEVk4JNUDMU3oHuEvQ0
         dswALg0SwD518q5oPBa/UZJvodrqsY0GkjBGn5zxaQcaJYF/JEiqLEVXhBh8flXBd+/X
         WQYb+g0r50BvbK2zGN0pIEwE7tqemOTo9DqrxSo+A0PtVHLiHQIX+ezWSCoAml7dzPAR
         01jQrZB+6wHQsKClgyurzc3qcBZO0TQG9ky3ao6g3rHvsKzIhRX0QSPClWpndQgJ4BpD
         AO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767196183; x=1767800983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6r7yw9l553CBnZ0Oq6/Kvj3e3aIbXAlTRdm8Qc8sow=;
        b=Aux+KJ/jU99TS9HHukSi258flHol9myBqOzgCDRPcg5Q9xI1vXqSiPlAQK4Bw0lt/c
         OuAID+ocg8CxIzag44TfbstfeDlj/wkvNzFgp49Jw8srS3cd4xzd70/Hk0SvgBZih5Z5
         p0sSB7GJaG2w9btma3wm9ig24oNzYtednoTye8OvrtxXaLvF2e8mZMlTlCJ9GqHdSscq
         ItJk8ZYtXUG9y0wGC79E/uUtuuSENefeYxltP4ql869zbl1B6gkAqZzbTfrsLzjysBxP
         jcOOU9NrtRJs7k2QJu/fZ/42TksROQiAL/GT799Lo4J8F7Wsw4f05F4aUtt1Gl25Wi1i
         YQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7vktz3jbTzyCmUabJmg3l3vOn3L+w5K/sB5w1XvpT0ROuc28UnJmeZJNdxwVfB4NHKvIo0GtjBPdNyWebag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkcdQu3Pw2GstGIkBshbL1j7Us1vO7BFThF4aJSV4/MTf1qN1t
	IrN0wrip3+aB9JK5v2We1T6ejsIlQ98o4vvEMzh+/WZnpEyzxYf2EgPJGu/LxZIPPuzoZburx0O
	F0rRN6rtKBOE/QEH2WE28MpVHqomH1eI=
X-Gm-Gg: AY/fxX7YdXjS3+OC+qQJSrSH3f2lTFodhIV1LxerWq/4Knr0QYq1HC95KB0A+i5gZrE
	IS7CDrj3qeqKnNg8H93yQiwYs3WGtILpa9GKcyCELcPa/Aiyz3Q86IolhSNhYvyJHo9RSWfRpmY
	NWQMPWkuxZecT80h8bM8x79S2Ar1RxuML675p0ZUZS3EMtJ6/X++ZIJYpGuzVItkIv3VUIpYeJX
	KbZxydiazvBC5J7jNIyB/PYz35BXpklZ5BnDmKvQB8/HKQuEq0jQOr7eww/AL3gTCRK3hAD
X-Google-Smtp-Source: AGHT+IFWPXcZKnGq0Krk9SV9S7c2h0pNtpTmEWv1Brc1vDiv5zIRm5JUQPWxix5qBNEZM9fT8eFcchz/mGnlgfTZ7QQ=
X-Received: by 2002:a05:6402:430d:b0:64d:170:7976 with SMTP id
 4fb4d7f45d1cf-64d01707bacmr33060451a12.16.1767196183052; Wed, 31 Dec 2025
 07:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20251228124001.3624742-1-rppt@kernel.org> <20251228124001.3624742-2-rppt@kernel.org>
In-Reply-To: <20251228124001.3624742-2-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 31 Dec 2025 16:49:31 +0100
X-Gm-Features: AQt7F2rayRHt2K_8t_heYN2h4Fxse0t-QPEGBzoKWlAlrWu2fr6sWsAyLE9oYEU
Message-ID: <CA+=Fv5TDfwnu7Qf2y=PLWWN1EvNpNbr8habnTO7R4_caAySDzw@mail.gmail.com>
Subject: Re: [PATCH 01/28] alpha: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_074945_894905_4871F396 
X-CRM114-Status: GOOD (  19.85  )
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

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMTo0MOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSIgPHJw
cHRAa2VybmVsLm9yZz4KPgo+IE1vdmUgY2FsY3VsYXRpb25zIG9mIHpvbmUgbGltaXRzIHRvIGEg
ZGVkaWNhdGVkIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4gZnVuY3Rpb24uCj4KPiBMYXRlciBN
TSBjb3JlIHdpbGwgdXNlIHRoaXMgZnVuY3Rpb24gYXMgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmlj
IGNhbGxiYWNrCj4gZHVyaW5nIG5vZGVzIGFuZCB6b25lcyBpbml0aWFsaXphdGlvbiBhbmQgdGh1
cyB0aGVyZSB3b24ndCBiZSBhIG5lZWQgdG8KPiBjYWxsIGZyZWVfYXJlYV9pbml0KCkgZnJvbSBl
dmVyeSBhcmNoaXRlY3R1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNy
b3NvZnQpIDxycHB0QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvYWxwaGEvbW0vaW5pdC5jIHwg
MTUgKysrKysrKysrKy0tLS0tCj4gIGluY2x1ZGUvbGludXgvbW0uaCAgIHwgIDEgKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hbHBoYS9tbS9pbml0LmMgYi9hcmNoL2FscGhhL21tL2luaXQuYwo+IGluZGV4
IDRjNWFiOWNkOGEwYS4uY2QwY2IxYWJkZTVmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYWxwaGEvbW0v
aW5pdC5jCj4gKysrIGIvYXJjaC9hbHBoYS9tbS9pbml0LmMKPiBAQCAtMjA4LDEyICsyMDgsOCBA
QCBjYWxsYmFja19pbml0KHZvaWQgKiBrZXJuZWxfZW5kKQo+ICAgICAgICAgcmV0dXJuIGtlcm5l
bF9lbmQ7Cj4gIH0KPgo+IC0vKgo+IC0gKiBwYWdpbmdfaW5pdCgpIHNldHMgdXAgdGhlIG1lbW9y
eSBtYXAuCj4gLSAqLwo+IC12b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICt2b2lkIF9f
aW5pdCBhcmNoX3pvbmVfbGltaXRzX2luaXQodW5zaWduZWQgbG9uZyAqbWF4X3pvbmVfcGZuKQo+
ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJfWk9ORVNdID0g
ezAsIH07Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGRtYV9wZm47Cj4KPiAgICAgICAgIGRtYV9w
Zm4gPSB2aXJ0X3RvX3BoeXMoKGNoYXIgKilNQVhfRE1BX0FERFJFU1MpID4+IFBBR0VfU0hJRlQ7
Cj4gQEAgLTIyMSw4ICsyMTcsMTcgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKPgo+
ICAgICAgICAgbWF4X3pvbmVfcGZuW1pPTkVfRE1BXSA9IGRtYV9wZm47Cj4gICAgICAgICBtYXhf
em9uZV9wZm5bWk9ORV9OT1JNQUxdID0gbWF4X3BmbjsKPiArfQo+ICsKPiArLyoKPiArICogcGFn
aW5nX2luaXQoKSBzZXRzIHVwIHRoZSBtZW1vcnkgbWFwLgo+ICsgKi8KPiArdm9pZCBfX2luaXQg
cGFnaW5nX2luaXQodm9pZCkKPiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBtYXhfem9uZV9w
Zm5bTUFYX05SX1pPTkVTXSA9IHswLCB9Owo+Cj4gICAgICAgICAvKiBJbml0aWFsaXplIG1lbV9t
YXBbXS4gICovCj4gKyAgICAgICBhcmNoX3pvbmVfbGltaXRzX2luaXQobWF4X3pvbmVfcGZuKTsK
PiAgICAgICAgIGZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7Cj4KPiAgICAgICAgIC8qIElu
aXRpYWxpemUgdGhlIGtlcm5lbCdzIFpFUk9fUEdFLiAqLwo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCAxNTA3NjI2MWQwYzIuLjYy
OGMwZTBhYzMxMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNs
dWRlL2xpbnV4L21tLmgKPiBAQCAtMzU1Miw2ICszNTUyLDcgQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIGdldF9udW1fcGh5c3BhZ2VzKHZvaWQpCj4gICAqIGZyZWVfYXJlYV9pbml0KG1h
eF96b25lX3BmbnMpOwo+ICAgKi8KPiAgdm9pZCBmcmVlX2FyZWFfaW5pdCh1bnNpZ25lZCBsb25n
ICptYXhfem9uZV9wZm4pOwo+ICt2b2lkIGFyY2hfem9uZV9saW1pdHNfaW5pdCh1bnNpZ25lZCBs
b25nICptYXhfem9uZV9wZm4pOwo+ICB1bnNpZ25lZCBsb25nIG5vZGVfbWFwX3Bmbl9hbGlnbm1l
bnQodm9pZCk7Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGFic2VudF9wYWdlc19pbl9yYW5nZSh1
bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm4pOwo+IC0tCj4gMi41MS4wCj4K
ClRoaXMgbG9va3MgZmluZSB0byBtZSBmcm9tIHRoZSBBbHBoYSBzaWRlLgoKQWNrZWQtYnk6IE1h
Z251cyBMaW5kaG9sbSA8bGlubWFnN0BnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
