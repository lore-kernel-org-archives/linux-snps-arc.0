Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A15CA5FE4
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Jan 2026 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQ0Asp5TPw71I+x8zdbgKJezR5HIwxy31NVEpT+2bsk=; b=2xiIeFTIYfzkCp
	yy8Jk7zYUabc1/mNxlpHX8QITM48uYSfCaCKxOmSrIyTAQUtLexnLXzx0038bbfJhAURer3LHLHqL
	Bq+1f817fOnXNiQSm7cfbGgn1YCO8D42jqgzBv7XJLhc+MM5P4OCQlleTtn2nxErc/WAwd00mjIyV
	gPWSM+N5uLoYbFJDJttDhS7H1rM7OEsQndHOpIQaZy8FCqvby1frjItKRoK/vNTiOCPE31mBo4Hgn
	WurbIXUmxPdEb63fomuRs9vYsN+xWcHzQJ3+f9f4LcVMxZWbIv6b0/ryzd5INac5orOPLxiNnKlne
	aiQkKDzS/vrqrSaljrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNvO-0000000H5aI-0cHp;
	Sun, 18 Jan 2026 08:14:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNvJ-0000000H5YY-2WpS
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 Jan 2026 08:14:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a2ea96930cso19804805ad.2
        for <linux-snps-arc@lists.infradead.org>; Sun, 18 Jan 2026 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768724052; x=1769328852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+fhLmMt6EbvGWzllqZJVhmHGvaT37bdUz8irugZaMU=;
        b=mU+yxHr+cs7p+mnYYyAR67ePoxH2KjFbekYPdDW5HzqTPCNJCaJAIJKuTIOgyw/14F
         Sl6egsypqhKFAYPPifLxVfELFX4JmSPpPOu4ui+KfOd7QzD99yUKX6XxX4f7+NkGHdWa
         YGN44ui1Vw7p7zTD2++X3ti0kwoFN5cfaOBfJjwSfXSuVrHDpifLKt/by64lllzzFrd4
         yrn+QsQMdX8MdOYRIJX1cPcXWPJ+bRzxe5+8mnFpLQXCMNQEmIgkIQI6UN9sj/NcM7Uj
         2HiS+ccGEZHY18C/f3ruZBwpkTqpJlWYGFg38vre+M688uPl0fGTlyrTe795NJ20ePWO
         2Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768724052; x=1769328852;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+fhLmMt6EbvGWzllqZJVhmHGvaT37bdUz8irugZaMU=;
        b=VUhhYa7JysEfakjwERBzkZ2iwh6fO0lMRbmXnhHJntDJ+JkeSfF87cgyDQvpN+lDn3
         KrMGQyfXMw2H7TfTsJGRhltzg/NAeqrz/UZNPpeYa+SFZg7ZhPTdDEckDR66U/mKoA4j
         CYzE4oryFoWAtObbaQ+lN0HjBBtD+Nyb2S/4NPvE+edznBR6y9t77gp6qcCsxP6/e0eM
         tDVS/nUluST0oc/H424ICONG90mD+0EOTbQ8dFagpuPVCJ/geU5Jhd8b+R7nW7wg4+8H
         c8ca/u6nQJvZB9ZZ7Ee1/TX8nBe8uCNnO8dnRvbvgOERQkqGSvXWurDeNte7Fz6ts2Fw
         Bc/A==
X-Forwarded-Encrypted: i=1; AJvYcCUif0FpeK2MTu7uRNQg+1WEXmjZGlX1+1RIAAWNwQifs1XAUKAtetqGrD0/o6IQQaintOpy5DgkAjTNhwZ4Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBFwiRVLf31bYGzdLnmtsRXT9pdNBZYKL/OQMJb0IRJ4FH9jHW
	XNtJ6h0tKAoBAtLskIrZW0uqeShOZI3WO22ReXxniw9wy7/G+KN8xvG8
X-Gm-Gg: AY/fxX4B1ICUba3c6VdcNNBrAOXoGFnaq4yyVHH5bSIgGassDjINic+DDMrf+fTiEsW
	cIuFy4Cz9VXdpVAzWATnVOytYcv0ozgmQPQxzZntZTU0px0r9fOYrpq5QMLlSVTJ/EG1/PFXToo
	w5m1RC8OdLbfqlgrofiOhIOnqmKaBwjRpfzxY3Pnb/N6/cYUzAzJiBQRb6/8QEsPYUJXp8tcdjl
	5lnL+Wzmes998GBA6albRT4+DoFy6UOA/1RhOzGuhGjAyvmZMrOd97U5h6uzB/yFLYC9sC7I/N9
	vjLkb9dQhLCKmhQj8HcpMnBp/jDCFaWxuo0jLWC5Fu7jDcWZF94RKoS1mSar8jmFA4hQGbezhdt
	6xDoHzgiPeKc/gSOddbiaW+9iQmXtXBsTI4pphUwwuuKQYUP3WdjA2yjPZqSHaVTEeMIZ7I8B6L
	jpbSVS+o1d
X-Received: by 2002:a17:903:40c5:b0:2a7:3dae:de9b with SMTP id d9443c01a7336-2a73daedf5fmr2287485ad.44.1768724051933;
        Sun, 18 Jan 2026 00:14:11 -0800 (PST)
Received: from [192.168.2.226] ([114.92.45.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190abcf0sm63240195ad.12.2026.01.18.00.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 00:14:11 -0800 (PST)
Message-ID: <85a0be43-3598-435d-a50e-9403b7e963f7@gmail.com>
Date: Sun, 18 Jan 2026 16:13:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
From: Alex Shi <seakeel@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
 <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
 <aV5yIuGi9Ni5YP5E@casper.infradead.org>
 <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Content-Language: en-US
In-Reply-To: <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_001413_729476_C21D2420 
X-CRM114-Status: GOOD (  20.36  )
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

CgpPbiAyMDI2LzEvOCAxMDoyMywgQWxleCBTaGkgd3JvdGU6Cj4gCj4gCj4gT24gMjAyNi8xLzcg
MjI6NDgsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+PiBPbiBXZWQsIEphbiAwNywgMjAyNiBhdCAw
NToyODozNlBNICswODAwLCBBbGV4IFNoaSB3cm90ZToKPj4+IFJpZ2h0LCBJIHdpbGwgZml4IHRo
aXMuIGFuZCBzZW50IHRoZSAybmQgdmVyc2lvbi4KPj4gTm8sIHRoZSBwYXRjaCBpcyBzdHVwaWQg
YW5kIHdyb25nLsKgIERvbid0IHNlbmQgYSB2Mi7CoCBZb3Ugc2VlbSB0byBoYXZlIGEKPj4gaGFp
cnRyaWdnZXIgcmVzZW5kLCBzbyBJJ20gdHJ5aW5nIHRvIHByZXZlbnQgYSB2MiBiZWluZyBzZW50
IGluc3RlYWQgb2YKPj4gc2VuZGluZyBhIHBhdGllbnQgcmVwbHkuCj4gCj4gSGkgTWF0dGhldywK
PiAKPiBJIGhlYXIgeW914oCUbm8gdjIgd2lsbCBiZSBzZW50Lgo+IGJ1dCBzb3JyeSBmb3IgYSBi
aXQgY29uZnVzaW5nLCB3aGF0J3MgeW91ciBleHBlY3RlZCBmaXg/IGlzIHRoZSB0b28gCj4gcXVp
Y2sgcmVzZW50aW5nPyBvciB0aGUgZGlyZWN0aW9uIHRvIGFsaWdubWVudCBwZ3RhYmxlX3Qgd2l0
aCBwdGRlc2MgaXMgCj4gd3Jvbmc/CgpIaSBXaWxseSwgRG8geW91IG1pbmQgdG8gc2hhcmUgdGhl
IGRldGFpbGVkIGNvbmNlcm4gZm9yIHRoaXMgcGF0Y2g/CgpUaGFua3MKCj4gCj4gSWYgaXQncyB0
aGUgZmlyc3QuIHRoZSBuZXcgY2hhbmdlIGZvciByZXZpZXcgYWRkcmVzcyBNaWtlJ3MgY29uY2Vy
bi4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vcGdhbGxvYy5oIGIvYXJjaC9h
cm0vaW5jbHVkZS9hc20vIAo+IHBnYWxsb2MuaAo+IGluZGV4IGExN2YwMTIzNWMyOS4uYTIwNGMz
YWM4MDBhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+ICsr
KyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+IEBAIC05NCwxMyArOTQsMTMgQEAg
cHRlX2FsbG9jX29uZV9rZXJuZWwoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gIMKgc3RhdGljIGlu
bGluZSBwZ3RhYmxlX3QKPiAgwqBwdGVfYWxsb2Nfb25lKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+
ICDCoHsKPiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICpwdGU7Cj4gK8KgwqDCoMKgwqDCoCBz
dHJ1Y3QgcHRkZXNjICpwdGU7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHB0ZSA9IF9fcHRlX2FsbG9j
X29uZShtbSwgR0ZQX1BHVEFCTEVfVVNFUiB8IFBHVEFCTEVfSElHSE1FTSk7Cj4gIMKgwqDCoMKg
wqDCoMKgIGlmICghcHRlKQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IE5VTEw7Cj4gLcKgwqDCoMKgwqDCoCBpZiAoIVBhZ2VIaWdoTWVtKHB0ZSkpCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xlYW5fcHRlX3RhYmxlKHBhZ2VfYWRkcmVzcyhwdGUpKTsK
PiArwqDCoMKgwqDCoMKgIGlmICghUGFnZUhpZ2hNZW0ocHRkZXNjX3BhZ2UocHRlKSkpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xlYW5fcHRlX3RhYmxlKHB0ZGVzY19hZGRyZXNz
KHB0ZSkpOwo+ICDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcHRlOwo+ICDCoH0KPiAKPiBAQCAtMTQx
LDcgKzE0MSw3IEBAIHBtZF9wb3B1bGF0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcG1kX3QgKnBt
ZHAsIAo+IHBndGFibGVfdCBwdGVwKQo+ICDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm90ID0gX1BBR0VfVVNFUl9UQUJMRTsKPiAKPiAtwqDC
oMKgwqDCoMKgIF9fcG1kX3BvcHVsYXRlKHBtZHAsIHBhZ2VfdG9fcGh5cyhwdGVwKSwgcHJvdCk7
Cj4gK8KgwqDCoMKgwqDCoCBfX3BtZF9wb3B1bGF0ZShwbWRwLCBwYWdlX3RvX3BoeXMocHRkZXNj
X3BhZ2UocHRlcCkpLCBwcm90KTsKPiAgwqB9Cj4gCj4gIMKgI2VuZGlmIC8qIENPTkZJR19NTVUg
Ki8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
