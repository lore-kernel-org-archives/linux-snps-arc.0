Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE61FC6172
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Sep 2024 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdhiOn/Zh702NteGhBeHCsv4E61LASsmmOyi0+RqNAE=; b=2RHyUNoZG99yw9
	QvGcQIdfyKnlrt08/bQpVfOKze2e56BISMzbev0uwxXGlJKA/9FYKWUvgTVKY01LMJMbk1GDefSX4
	AtE1VTAk1KEsMF7VwmY22IEpJNisA+itjIeNbjmNuEMR8DrA6+zspGSdO5Nbb23KJkHel5q/O9nhd
	+LQPtQAQCl4ehPJQNpfWkBF86zEqnbwdo/eRwTn0W6T98LpiOLaUdsVthszbgJWHgQDW3j9PyaDqX
	lLnlUXSrlHEeKj2eqyuqs1ET8nmz4SalyO/16Cb+uNNT6gee2vLUqh62uzQiE0q6KkR2gf005zUZf
	fVj+aLYnJ/3nSQ2exalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spDSi-0000000H7qu-1SAs;
	Fri, 13 Sep 2024 21:04:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spDSf-0000000H7pW-22RA
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Sep 2024 21:04:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2068acc8a4fso13331705ad.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Sep 2024 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726261452; x=1726866252; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pGN098PfFZ1p39RZKtno/bb1iGOxyKkQDSILC8HyAbs=;
        b=zAfpY8wjNeTxsaS5OKIqraLAue3Tk40mdf+OG/Ctz+ya6tLlJWCtQVxi79395qIp72
         EOUv20zNbEJOg/SxdsvZzeJw/KO3xPhd1dYcOzICmh3+bBo5BDn99P61z6GEYLljpY/X
         GLS272cwcB4r0CCh/BxIeAEOLvztIDlFDN4O6Jjp5k/AjnNFdhjesUc2Uiaq4q+oEERU
         r0edz1Ssesb91jD3nl1gIwEExNQ7gVfG+dLcZ4oYysB6+nIkT7apfs543GMLql5VHKXI
         CgepQz7OgD1HmuimTbyJQ2i1Wqdp1SSH4vLZ4hYKZywQfedlJcrbB2JBsR2FyY/803RU
         RIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726261452; x=1726866252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGN098PfFZ1p39RZKtno/bb1iGOxyKkQDSILC8HyAbs=;
        b=RfeD5agt94Bw4GbGkCi7NCSUK47mUJq2mBwTcGOoyO8HsXUpqUhPKYl7YMZz3TpuIp
         uHFezSbk6s81Q4LuhZzcMGWNSpsIQCocIXWiwu90IUcyqNHM0zGRBYwvU7GWgyEf2k93
         IaTjQ2q5dDyJQ3SHNPO3/XxYjgP3mzv3PFZTDCk2TC6z53uDVQ3/Mm7AJjUN9fs4uN6F
         ic4QAnxpNz1zSRzw76cOIrvb5vGecerof95x7yRkSZv7ankt+DzwDydNb0sK2R720qBL
         0V9uRxj/bm0rwWvBt1/1FFpaS+HVvB1GVeu+V8YStGL5njjg3DHBCX14TsJcj+aoaQrK
         O0oA==
X-Forwarded-Encrypted: i=1; AJvYcCWdf7JrWFpLLDeQoaM6BzQNROdzGDwVnrhluJKsXpV8bqG8kDt8JOJejrYocjLBBxxjysjYvTlmFlL99G/06A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDyndnCNdSYO7ARGX28d0ivg06qRMr/dntHpb0xjQVz/WMd9a5
	MUKXx3BPl2LB68RhynczjBB8Qf1BZrCG4y7oOaMepq3BxP1YfiYFjQhuPvf/Z2o=
X-Google-Smtp-Source: AGHT+IHQy68+7/4em5wfAX0phJQ7a7VsNC8xlp5lvUp2N1zpKPOlth6aUECbhTSHxYBYBN7icOc/wA==
X-Received: by 2002:a17:902:f54f:b0:207:457f:b8a6 with SMTP id d9443c01a7336-2078262ccc1mr54571405ad.12.1726261452005;
        Fri, 13 Sep 2024 14:04:12 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da8c9sm608475ad.17.2024.09.13.14.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:04:11 -0700 (PDT)
Date: Fri, 13 Sep 2024 14:04:06 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, shuah <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuSoxh5U3Kj1XgGq@ghost>
References: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <d873a994-4efa-4d3a-bdae-5d9a3eff29f2@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d873a994-4efa-4d3a-bdae-5d9a3eff29f2@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_140413_560712_611C8B24 
X-CRM114-Status: GOOD (  62.77  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMDg6NDE6MzRBTSArMDEwMCwgTG9yZW56byBTdG9ha2Vz
IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDExOjE4OjEyUE0gR01ULCBDaGFybGll
IEplbmtpbnMgd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAwNzoyMToyN1BNICsw
MTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0
IDA1OjQ1OjA3UE0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gPiBPbiBUdWUs
IFNlcCAxMCwgMjAyNCBhdCAwMzowODoxNFBNIC0wNDAwLCBMaWFtIFIuIEhvd2xldHQgd3JvdGU6
Cj4gPiA+ID4gPiAqIENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IFsy
NDA5MDYgMDc6NDRdOgo+ID4gPiA+ID4gPiBPbiBGcmksIFNlcCAwNiwgMjAyNCBhdCAwOTo1NTo0
MkFNICswMDAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIEZyaSwgU2Vw
IDYsIDIwMjQsIGF0IDA5OjE0LCBHdW8gUmVuIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gRnJp
LCBTZXAgNiwgMjAyNCBhdCAzOjE44oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4g
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gPj4gSXQncyBhbHNvIHVuY2xlYXIgdG8gbWUgaG93IHdlIHdh
bnQgdGhpcyBmbGFnIHRvIGludGVyYWN0IHdpdGgKPiA+ID4gPiA+ID4gPiA+PiB0aGUgZXhpc3Rp
bmcgbG9naWMgaW4gYXJjaF9nZXRfbW1hcF9lbmQoKSwgd2hpY2ggYXR0ZW1wdHMgdG8KPiA+ID4g
PiA+ID4gPiA+PiBsaW1pdCB0aGUgZGVmYXVsdCBtYXBwaW5nIHRvIGEgNDctYml0IGFkZHJlc3Mg
c3BhY2UgYWxyZWFkeS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUbyBvcHRpbWl6
ZSBSSVNDLVYgcHJvZ3Jlc3MsIEkgcmVjb21tZW5kOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+IFN0ZXAgMTogQXBwcm92ZSB0aGUgcGF0Y2guCj4gPiA+ID4gPiA+ID4gPiBTdGVwIDI6
IFVwZGF0ZSBHbyBhbmQgT3BlbkpESydzIFJJU0MtViBiYWNrZW5kIHRvIHV0aWxpemUgaXQuCj4g
PiA+ID4gPiA+ID4gPiBTdGVwIDM6IFdhaXQgYXBwcm94aW1hdGVseSBzZXZlcmFsIGl0ZXJhdGlv
bnMgZm9yIEdvICYgT3BlbkpESwo+ID4gPiA+ID4gPiA+ID4gU3RlcCA0OiBSZW1vdmUgdGhlIDQ3
LWJpdCBjb25zdHJhaW50IGluIGFyY2hfZ2V0X21tYXBfZW5kKCkKPiA+ID4KPiA+ID4gUG9pbnQg
NCBpcyBhbiBBQkkgY2hhbmdlLiBXaGF0IGd1YXJhbnRlZXMgdGhhdCB0aGVyZSBpc24ndCBzdGls
bAo+ID4gPiBzb2Z0d2FyZSBvdXQgdGhlcmUgdGhhdCByZWxpZXMgb24gdGhlIG9sZCBiZWhhdmlv
dXI/Cj4gPgo+ID4gWWVhaCBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIGJlIGRlc2lyYWJsZSB0byBy
ZW1vdmUgdGhlIDQ3IGJpdAo+ID4gY29uc3RyYWludCBpbiBhcmNoaXRlY3R1cmVzIHRoYXQgYWxy
ZWFkeSBoYXZlIGl0Lgo+ID4KPiA+ID4KPiA+ID4gPiA+ID4gPiBJIHJlYWxseSB3YW50IHRvIGZp
cnN0IHNlZSBhIHBsYXVzaWJsZSBleHBsYW5hdGlvbiBhYm91dCB3aHkKPiA+ID4gPiA+ID4gPiBS
SVNDLVYgY2FuJ3QganVzdCBpbXBsZW1lbnQgdGhpcyB1c2luZyBhIDQ3LWJpdCBERUZBVUxUX01B
UF9XSU5ET1cKPiA+ID4gPiA+ID4gPiBsaWtlIGFsbCB0aGUgb3RoZXIgbWFqb3IgYXJjaGl0ZWN0
dXJlcyAoeDg2LCBhcm02NCwgcG93ZXJwYzY0KSwKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRldJ
VyBhcm02NCBhY3R1YWxseSBsaW1pdHMgREVGQVVMVF9NQVBfV0lORE9XIHRvIDQ4LWJpdCBpbiB0
aGUgZGVmYXVsdAo+ID4gPiA+ID4gPiBjb25maWd1cmF0aW9uLiBXZSBlbmQgdXAgd2l0aCBhIDQ3
LWJpdCB3aXRoIDE2SyBwYWdlcyBidXQgZm9yIGEKPiA+ID4gPiA+ID4gZGlmZmVyZW50IHJlYXNv
biB0aGF0IGhhcyB0byBkbyB3aXRoIExQQTIgc3VwcG9ydCAoSSBkb3VidCB3ZSBuZWVkIHRoaXMK
PiA+ID4gPiA+ID4gZm9yIHRoZSB1c2VyIG1hcHBpbmcgYnV0IHdlIG5lZWQgdG8gdW50YW5nbGUg
c29tZSBvZiB0aGUgbWFjcm9zIHRoZXJlOwo+ID4gPiA+ID4gPiB0aGF0J3MgZm9yIGEgc2VwYXJh
dGUgZGlzY3Vzc2lvbikuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQgc2FpZCwgd2UgaGF2
ZW4ndCBlbmNvdW50ZXJlZCBhbnkgdXNlciBzcGFjZSBwcm9ibGVtcyB3aXRoIGEgNDgtYml0Cj4g
PiA+ID4gPiA+IERFRkFVTFRfTUFQX1dJTkRPVy4gU28gSSBhbHNvIHRoaW5rIFJJU0MtViBzaG91
bGQgZm9sbG93IGEgc2ltaWxhcgo+ID4gPiA+ID4gPiBhcHByb2FjaCAoNDcgb3IgNDggYml0IGRl
ZmF1bHQgbGltaXQpLiBCZXR0ZXIgdG8gaGF2ZSBzb21lIEFCSQo+ID4gPiA+ID4gPiBjb25zaXN0
ZW5jeSBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMuIE9uZSBjYW4gc3RpbGwgYXNrIGZvciBhZGRyZXNz
ZXMgYWJvdmUKPiA+ID4gPiA+ID4gdGhpcyBkZWZhdWx0IGxpbWl0IHZpYSBtbWFwKCkuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gSSB0aGluayB0aGF0IGlzIGJlc3QgYXMgd2VsbC4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBDYW4gd2UgcGxlYXNlIGp1c3QgZG8gd2hhdCB4ODYgYW5kIGFybTY0IGRvZXM/Cj4g
PiA+ID4KPiA+ID4gPiBJIHJlc3BvbmRlZCB0byBBcm5kIGluIHRoZSBvdGhlciB0aHJlYWQsIGJ1
dCBJIGFtIHN0aWxsIG5vdCBjb252aW5jZWQKPiA+ID4gPiB0aGF0IHRoZSBzb2x1dGlvbiB0aGF0
IHg4NiBhbmQgYXJtNjQgaGF2ZSBzZWxlY3RlZCBpcyB0aGUgYmVzdCBzb2x1dGlvbi4KPiA+ID4g
PiBUaGUgc29sdXRpb24gb2YgZGVmYXVsdGluZyB0byA0NyBiaXRzIGRvZXMgYWxsb3cgYXBwbGlj
YXRpb25zIHRoZQo+ID4gPiA+IGFiaWxpdHkgdG8gZ2V0IGFkZHJlc3NlcyB0aGF0IGFyZSBiZWxv
dyA0NyBiaXRzLiBIb3dldmVyLCBkdWUgdG8KPiA+ID4gPiBkaWZmZXJlbmNlcyBhY3Jvc3MgYXJj
aGl0ZWN0dXJlcyBpdCBkb2Vzbid0IHNlZW0gcG9zc2libGUgdG8gaGF2ZSBhbGwKPiA+ID4gPiBh
cmNoaXRlY3R1cmVzIGRlZmF1bHQgdG8gdGhlIHNhbWUgdmFsdWUuIEFkZGl0aW9uYWxseSwgdGhp
cyBmbGFnIHdpbGwgYmUKPiA+ID4gPiBhYmxlIHRvIGhlbHAgdXNlcnMgYXZvaWQgcG90ZW50aWFs
IGJ1Z3Mgd2hlcmUgYSBoaW50IGFkZHJlc3MgaXMgcGFzc2VkCj4gPiA+ID4gdGhhdCBjYXVzZXMg
dXBwZXIgYml0cyBvZiBhIFZBIHRvIGJlIHVzZWQuCj4gPiA+Cj4gPiA+IFRoZSByZWFzb24gd2Ug
YWRkZWQgdGhpcyBsaW1pdCBvbiBhcm02NCBpcyB0aGF0IHdlIG5vdGljZWQgcHJvZ3JhbXMKPiA+
ID4gdXNpbmcgdGhlIHRvcCA4IGJpdHMgb2YgYSA2NC1iaXQgcG9pbnRlciBmb3IgYWRkaXRpb25h
bCBpbmZvcm1hdGlvbi4KPiA+ID4gSUlSQywgaXQgd2Fzbid0IGV2ZW4gb3BlbkpESyBidXQgc29t
ZSBKYXZhU2NyaXB0IEpJVC4gV2UgY291bGQgaGF2ZQo+ID4gPiB0YXVnaHQgdGhvc2UgcHJvZ3Jh
bXMgb2YgYSBuZXcgZmxhZyBidXQgc2luY2Ugd2UgY291bGRuJ3QgdGVsbCBob3cgbWFueQo+ID4g
PiBhcmUgb3V0IHRoZXJlLCBpdCB3YXMgdGhlIHNhZmVzdCB0byBkZWZhdWx0IHRvIGEgc21hbGxl
ciBsaW1pdCBhbmQgb3B0Cj4gPiA+IGluIHRvIHRoZSBoaWdoZXIgb25lLiBTdWNoIG9wdC1pbiBp
cyB2aWEgbW1hcCgpIGJ1dCBpZiB5b3UgcHJlZmVyIGEKPiA+ID4gcHJjdGwoKSBmbGFnLCB0aGF0
J3MgZmluZSBieSBtZSBhcyB3ZWxsICh0aG91Z2ggSSB0aGluayB0aGlzIHNob3VsZCBiZQo+ID4g
PiBvcHQtaW4gdG8gaGlnaGVyIGFkZHJlc3NlcyByYXRoZXIgdGhhbiBvcHQtb3V0IG9mIHRoZSBo
aWdoZXIgYWRkcmVzc2VzKS4KPiA+Cj4gPiBUaGUgbW1hcCgpIGZsYWcgd2FzIHVzZWQgaW4gcHJl
dmlvdXMgdmVyc2lvbnMgYnV0IHdhcyBkZWNpZGVkIGFnYWluc3QKPiA+IGJlY2F1c2UgdGhpcyBm
ZWF0dXJlIGlzIG1vcmUgdXNlZnVsIGlmIGl0IGlzIHByb2Nlc3Mtd2lkZS4gQQo+ID4gcGVyc29u
YWxpdHkoKSBmbGFnIHdhcyBjaG9zZW4gaW5zdGVhZCBvZiBhIHByY3RsKCkgZmxhZyBiZWNhdXNl
IHRoZXJlCj4gPiBleGlzdGVkIG90aGVyIGZsYWdzIGluIHBlcnNvbmFsaXR5KCkgdGhhdCB3ZXJl
IHNpbWlsYXIuIEkgYW0gdGVtcHRlZCB0bwo+ID4gdXNlIHByY3RsKCkgaG93ZXZlciBiZWNhdXNl
IHRoZW4gd2UgY291bGQgaGF2ZSBhbiBhZGRpdGlvbmFsIGFyZyB0bwo+ID4gc2VsZWN0IHRoZSBl
eGFjdCBudW1iZXIgb2YgYml0cyB0aGF0IHNob3VsZCBiZSByZXNlcnZlZCAocmF0aGVyIHRoYW4K
PiA+IGJlaW5nIGZpeGVkIGF0IDQ3IGJpdHMpLgo+IAo+IEkgYW0gdmVyeSBtdWNoIG5vdCBpbiBm
YXZvdXIgb2YgYSBwcmN0bCgpLCBpdCB3b3VsZCByZXF1aXJlIHVzIHRvIGFkZCBzdGF0ZQo+IGxp
bWl0aW5nIHRoZSBhZGRyZXNzIHNwYWNlIGFuZCB0aGUgdGltaW5nIG9mIGl0IGJlY29tZXMgY3Jp
dGljYWwuIFRoZW4gd2UKPiBoYXZlIHRoZSBzYW1lIGlzc3VlIHdlIGRvIHdpdGggdGhlIG90aGVy
IHByb3Bvc2FscyBhcyB0byAtIHdoYXQgaGFwcGVucyBpZgo+IHRoaXMgaXMgdG9vIGxvdz8KPiAK
PiBXaGF0IGlzICd0b28gbG93JyB2YXJpZXMgYnkgYXJjaGl0ZWN0dXJlLCBhbmQgZm9yIDMyLWJp
dCBhcmNoaXRlY3R1cmVzCj4gY291bGQgZ2V0IHF1aXRlLi4uIHByb2JsZW1hdGljLgo+IAo+IEFu
ZCBhZ2Fpbiwgd2hhIGlzIHRoZSBSb0kgaGVyZSAtIHdlIGludHJvZHVjaW5nIG1haW50ZW5hbmNl
IGJ1cmRlbiBhbmQgZWRnZQo+IGNhc2VzIHZzLiB0aGUgeDg2IHNvbHV0aW9uIGluIG9yZGVyIHRv
Li4uIGFjY29tbW9kYXRlIHRoaW5ncyB0aGF0IG5lZWQgbW9yZQo+IHRoYW4gMTI4IFRpQiBvZiBh
ZGRyZXNzIHNwYWNlPyBBIHByb2JsZW0gdGhhdCBkb2VzIG5vdCBhcHBlYXIgdG8gZXhpc3QgaW4K
PiByZWFsaXR5Pwo+IAo+IEkgc3VnZ2VzdGVkIHRoZSBwZXJzb25hbGl0eSBhcHByb2FjaCBhcyB0
aGUgbGVhc3QgaW1wYWN0ZnVsIGNvbXByb21pc2Ugd2F5Cj4gb2YgdGhpcyBzZXJpZXMgd29ya2lu
ZywgYnV0IEkgdGhpbmsgYWZ0ZXIgd2hhdCBBcm5kIGhhcyBzYWlkIChhbmQgcGxlYXNlCj4gZm9y
Z2l2ZSBtZSBpZiBJJ3ZlIG1pc3NlZCBmdXJ0aGVyIGRpc2N1c3Npb24gaGF2ZSBiZWVuIGRpcHBp
bmcgaW4gYW5kIG91dAo+IG9mIHRoaXMhKSAtIGFkYXB0aW5nIHJpc2MgdiB0byB0aGUgYXBwcm9h
Y2ggd2UgdGFrZSBlbHNld2hlcmUgc2VlbXMgdGhlCj4gbW9zdCBzZW5zaWJsZSBzb2x1dGlvbiB0
byBtZS4KPgo+IFRoaXMgcmVtYWlucyBzb21ldGhpbmcgd2UgY2FuIHJldmlzaXQgaW4gZnV0dXJl
IGlmIHRoaXMgdHVybnMgb3V0IHRvIGJlCj4gZWdyZWdpb3VzLgo+CgpJIGFwcHJlY2lhdGUgQXJu
ZCdzIGNvbW1lbnRzLCBidXQgSSBkbyBub3QgdGhpbmsgdGhhdCBtYWtpbmcgNDctYml0IHRoZQpk
ZWZhdWx0IGlzIHRoZSBiZXN0IHNvbHV0aW9uIGZvciByaXNjdi4gT24gcmlzY3YsIHN1cHBvcnQg
Zm9yIDQ4LWJpdAphZGRyZXNzIHNwYWNlcyB3YXMgbWVyZ2VkIGluIDUuMTcgYW5kIHN1cHBvcnQg
Zm9yIDU3LWJpdCBhZGRyZXNzIHNwYWNlcwp3YXMgbWVyZ2VkIGluIDUuMTggd2l0aG91dCBjaGFu
Z2luZyB0aGUgZGVmYXVsdCBhZGRyZXNzZXMgcHJvdmlkZWQgYnkKbW1hcCgpLiBJdCBjb3VsZCBi
ZSBhcmd1ZWQgdGhhdCB0aGlzIHdhcyBhIG1pc3Rha2UsIGhvd2V2ZXIgc2luY2UgYXQgdGhlCnRp
bWUgdGhlcmUgZGlkbid0IGV4aXN0IGhhcmR3YXJlIHdpdGggbGFyZ2VyIGFkZHJlc3Mgc3BhY2Vz
IGl0IHdhc24ndCBhbgppc3N1ZS4gVGhlIGFwcGxpY2F0aW9ucyB0aGF0IGV4aXN0ZWQgYXQgdGhl
IHRpbWUgdGhhdCByZWxpZWQgb24gdGhlCnNtYWxsZXIgYWRkcmVzcyBzcGFjZXMgaGF2ZSBub3Qg
YmVlbiBhYmxlIHRvIG1vdmUgdG8gbGFyZ2VyIGFkZHJlc3MKc3BhY2VzLiBNYWtpbmcgYSA0Ny1i
aXQgdXNlci1zcGFjZSBhZGRyZXNzIHNwYWNlIGRlZmF1bHQgc29sdmVzIHRoZQpwcm9ibGVtLCBi
dXQgdGhhdCBpcyBub3QgYXJjaCBhZ25vc3RpYywgYW5kIGNhbid0IGJlIHNpbmNlIG9mIHRoZQp2
YXJ5aW5nIGRpZmZlcmVuY2VzIGluIHBhZ2UgdGFibGUgc2l6ZXMgYWNyb3NzIGFyY2hpdGVjdHVy
ZXMsIHdoaWNoIGlzCnRoZSBvdGhlciBwYXJ0IG9mIHRoZSBwcm9ibGVtIEkgYW0gdHJ5aW5nIHRv
IHNvbHZlLgoKPiA+Cj4gPiBPcHRpbmctaW4gdG8gdGhlIGhpZ2hlciBhZGRyZXNzIHNwYWNlIGlz
IHJlYXNvbmFibGUuIEhvd2V2ZXIsIGl0IGlzIG5vdAo+ID4gbXkgcHJlZmVyZW5jZSwgYmVjYXVz
ZSB0aGUgcHVycG9zZSBvZiB0aGlzIGZsYWcgaXMgdG8gZW5zdXJlIHRoYXQKPiA+IGFsbG9jYXRp
b25zIGRvIG5vdCBleGNlZWQgNDctYml0cywgc28gaXQgaXMgYSBjbGVhcmVyIEFCSSB0byBoYXZl
IHRoZQo+ID4gYXBwbGljYXRpb25zIHRoYXQgd2FudCB0aGlzIGd1YXJhbnRlZSB0byBiZSB0aGUg
b25lcyBzZXR0aW5nIHRoZSBmbGFnLAo+ID4gcmF0aGVyIHRoYW4gdGhlIGFwcGxpY2F0aW9ucyB0
aGF0IHdhbnQgdGhlIGhpZ2hlciBiaXRzIHNldHRpbmcgdGhlIGZsYWcuCj4gCj4gUGVyZmVjdCBp
cyB0aGUgZW5lbXkgb2YgdGhlIGdvb2QgOikgYW5kIGFuIGlkZWFsaXNlZCBzb2x1dGlvbiBtYXkg
bm90IGVuZAo+IHVwIGJlaW5nIHNvbWV0aGluZyBldmVyeWJvZHkgY2FuIGFncmVlIG9uLgoKWWVz
IHlvdSBhcmUgdG90YWxseSByaWdodCEgQWx0aG91Z2ggdGhpcyBpcyBub3QgbXkgaWRlYWwgc29s
dXRpb24sIGl0CnN1ZmZpY2llbnRseSBhY2NvbXBsaXNoZXMgdGhlIGdvYWwgc28gSSB0aGluayBp
dCBpcyByZWFzb25hYmxlIHRvCmltcGxlbWVudCB0aGlzIGFzIGEgcGVyc29uYWxpdHkgZmxhZy4K
Cj4gCj4gPgo+ID4gLSBDaGFybGllCj4gPgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBDYXRhbGluCj4g
Pgo+ID4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
