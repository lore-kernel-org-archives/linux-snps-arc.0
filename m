Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2FAC9832F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Jan 2026 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RrkN/zPiu6lPMTGyx2fcxpSl5Erbxz0YR6AqqtUXkM=; b=BWX7b5chfqX42S
	N65wuoFMjEFwbV+og45p1SdWyQ99k127SfhMPsmFsUwpA22HlXBb1kLbUazuzenI8ZrfyWbkvraUX
	kcKLOrnPoQYxlkY5jNOrZnjF9GkHZd8K2kWAGinQQwQJW9snRQil/dAwZc/4dnjP5qaaJyrjXp4YJ
	UcZhXNONPxqU3o13J/neYvLIuFQ3fmtm7/ANwv0So8u8mqYcZ9OBc7zklvZW9zJahgy1gVbMSis0u
	zvEs8gCr3sjBZvgBoXvLRs5QUyZq+LOQ0Z7i2/+PM3FcML+pd9vOshA9LgtrjBqYcXtEeQ3p9eXPZ
	npdv4vbjfwkVrvSfSIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTV6-00000000D6k-3dsc;
	Sun, 18 Jan 2026 14:11:32 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTV0-00000000D4T-44ug
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 Jan 2026 14:11:29 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso1894327a12.3
        for <linux-snps-arc@lists.infradead.org>; Sun, 18 Jan 2026 06:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768745486; x=1769350286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqDJGvudyOS3k99PpLPEmecPUls9OZTpXwxY9UHrGPM=;
        b=mBVyIC6wb/WjByrdzSYZIAHkAIcNsGWBrFYRp6GIchZm7ixehNN2lNmeMC6jWp5D6O
         w7uZmBWVochKGrqhmmpZiq/7+cjBsA64Pg88WuwOpKeZiPgCYWKjO1PfzbXxwbZM273M
         SS6N9CKvo3GFKdpRn1sNa++EBEGNYqAjhqojY/CUFIZGNnBJ7oygd/4dKpDZmp2nqgB2
         int6DfXSQjDWs1TvBcj+z8ghIgy8XojVB2P68n+X47OdZeuWeXv65caOYidLALB1ieJ0
         tM4StHMCxObcRwnW75LLRcEahIN6Y1XBtH0Gqnc5hYlVctnH40vaA40jMOHWXyPhqX0x
         Iwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768745486; x=1769350286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqDJGvudyOS3k99PpLPEmecPUls9OZTpXwxY9UHrGPM=;
        b=dFuYszMzDPjxOth9WF/0uViLbGRuhTcV0fQfwEGSNm68Y9J1AD/NozINll4Zf01a6f
         nuBx8Q/iGQVT7tAB7kuiQFg60wxO8bJVunYCn1afjsdnPc/App8fGhnaSXhFqHkUP/Oa
         cxvrOpN55LV1Wu3QN9/0laHE2cuWUnoas1E/u69L9mKTotEBZzLhz3eNxRnJotB2phb8
         HvM+K4rqb0vbP2PUdi2ppjHPnw0G2SSNyBw/CdiQy/NDtC6IEHLqPvrXv1lDoeFsOyWU
         luNreJqIyZ8Vn7cf1saB5OgkIuARDukB0YmcwgmBsK0VBzFMZhKTbnFQ5gX4CdQo9t56
         eYsA==
X-Forwarded-Encrypted: i=1; AJvYcCXlb14xf/0IcgLm1Pj4vTwfJKrmn5NBT4hssCLCdfaRs4UlYFGqxQts39AfWkR55Tn5mA/HD3RDjoE6nJMp4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8yuUX83sihFQ2PTPW8FgfR64/In/3EpxosvlLFk8tj21t4wIj
	NM78DVF2AfG1xymCXoo55nIucOaPAgj4RJafvc45EqvMs7HMa6dWBks5
X-Gm-Gg: AY/fxX4JA6Xc3+UIyIVrl6SaBV0vl2mSONViHZnBiq2U5/KK7KZI28g/KZ3iKr68iKb
	xllRM9C2xIrSLThSfkzepZMcLKqNRu3Gd8i9MjlWlN/PdYNR4WdD27oEaT3rMi9nT+X2Op6rHor
	XxgpKn3uAgf8QxG7wpeO1dFqHcg8DkYN00WrQAlAadUsKN6aX511SrumQJFiGy2jy1hvIm0QNSZ
	ai/arESKYpP1aUCAr2Ql57nwo+ps5MEPQ5zFP0dmfICtrHN4XFNty/K69gkxf/WhPejuJNnNrpn
	GWCXH4HAIHpxAjGVsdOO0L037V6lmCvMwTeTcse28KGakXl3kamDe9OvEEYmqSzqjZm4qRMxaEt
	A5MtIdcACvHerfObnmu05Nn9lGAQL4e/oXsSh/Md+REGcIbC83F5dYLcqnI8+jm7nYLeYJGUF10
	FtDG+YOImC
X-Received: by 2002:a05:6a20:a122:b0:37e:61fc:a896 with SMTP id adf61e73a8af0-38dfe7c3042mr7636975637.66.1768745485767;
        Sun, 18 Jan 2026 06:11:25 -0800 (PST)
Received: from [192.168.2.226] ([114.92.45.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d1f1sm6549138a12.22.2026.01.18.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 06:11:25 -0800 (PST)
Message-ID: <b27b8bc4-8730-4ce8-bf39-0ca8459feecc@gmail.com>
Date: Sun, 18 Jan 2026 22:10:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
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
 Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
 <85a0be43-3598-435d-a50e-9403b7e963f7@gmail.com>
 <4fd1610b-acc5-4c17-a227-4d63272d3718@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <4fd1610b-acc5-4c17-a227-4d63272d3718@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_061127_483862_DDE73BCD 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDI2LzEvMTggMTg6NTEsIERhdmlkIEhpbGRlbmJyYW5kIChSZWQgSGF0KSB3cm90ZToK
PiBPbiAxLzE4LzI2IDA5OjEzLCBBbGV4IFNoaSB3cm90ZToKPj4KPj4KPj4gT24gMjAyNi8xLzgg
MTA6MjMsIEFsZXggU2hpIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMDI2LzEvNyAyMjo0OCwgTWF0
dGhldyBXaWxjb3ggd3JvdGU6Cj4+Pj4gT24gV2VkLCBKYW4gMDcsIDIwMjYgYXQgMDU6Mjg6MzZQ
TSArMDgwMCwgQWxleCBTaGkgd3JvdGU6Cj4+Pj4+IFJpZ2h0LCBJIHdpbGwgZml4IHRoaXMuIGFu
ZCBzZW50IHRoZSAybmQgdmVyc2lvbi4KPj4+PiBObywgdGhlIHBhdGNoIGlzIHN0dXBpZCBhbmQg
d3JvbmcuwqAgRG9uJ3Qgc2VuZCBhIHYyLsKgIFlvdSBzZWVtIHRvIAo+Pj4+IGhhdmUgYQo+Pj4+
IGhhaXJ0cmlnZ2VyIHJlc2VuZCwgc28gSSdtIHRyeWluZyB0byBwcmV2ZW50IGEgdjIgYmVpbmcg
c2VudCBpbnN0ZWFkIG9mCj4+Pj4gc2VuZGluZyBhIHBhdGllbnQgcmVwbHkuCj4+Pgo+Pj4gSGkg
TWF0dGhldywKPj4+Cj4+PiBJIGhlYXIgeW914oCUbm8gdjIgd2lsbCBiZSBzZW50Lgo+Pj4gYnV0
IHNvcnJ5IGZvciBhIGJpdCBjb25mdXNpbmcsIHdoYXQncyB5b3VyIGV4cGVjdGVkIGZpeD8gaXMg
dGhlIHRvbwo+Pj4gcXVpY2sgcmVzZW50aW5nPyBvciB0aGUgZGlyZWN0aW9uIHRvIGFsaWdubWVu
dCBwZ3RhYmxlX3Qgd2l0aCBwdGRlc2MgaXMKPj4+IHdyb25nPwo+Pgo+PiBIaSBXaWxseSwgRG8g
eW91IG1pbmQgdG8gc2hhcmUgdGhlIGRldGFpbGVkIGNvbmNlcm4gZm9yIHRoaXMgcGF0Y2g/Cj4g
Cj4gSSB0aGluayB3ZSByZWNlbnRseSBoYWQgYSBkaXNjdXNzaW9uIHRoYXQgd2Ugc2hvdWxkIG11
Y2ggcmF0aGVyIHJld29yayAKPiBjb3JlIGNvZGUgdG8gY29uc2lzdGVudGx5IG1ha2UgcGd0YWJs
ZV90IGEgcG9pbnRlciB0byB0aGUgc3RhcnQgb2YgdGhlIAo+IHBhZ2UgdGFibGUgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KPiAKPiBCZWNhdXNlIHRoZSB3YXkgeW91IGNoYW5nZSB0aGUgY29kZSBq
dXN0IG1lYW5zIHRoYXQgd2Ugd2lsbCBub3QgYmUgYWJsZSAKPiB0byBoYW5kbGUgY29kZSB0aGF0
IGZpdHMgbXVsdGlwbGUgcGFnZXMgdGFibGVzIGludG8gYSBzaW5nbGUgcGFnZSAKPiAoczM5MHgs
IHBwYykgY29uc2lzdGVudGx5Lgo+IAo+ICDCoMKgwqDCoGFyY2gvczM5MC9pbmNsdWRlL2FzbS9w
YWdlLmg6dHlwZWRlZiBwdGVfdCAqcGd0YWJsZV90Owo+IAoKR290IGl0LiBUaGFua3MgYSBsb3Qg
Zm9yIHRoZSBleHBsYW5hdGlvbiEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
