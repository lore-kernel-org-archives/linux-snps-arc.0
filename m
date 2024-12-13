Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E1E7717F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wnaYhSwag2iVFYftMMeUbfSDRWDevrvqo/4BdJbvcUk=; b=Glb3PbQcoHrp/VNK3uLKpUagYq
	Uw2hT3oK7IDB8zRn2Q81ZsXgXWgRSSnXyZqPrnRIifoxrBysBh/Ddqu+YQS7m/3QcD5IJjLhDSzRq
	RDRAoG/3dbCL6lf9oOEf9NZlPFpoq8ph2WSa+PU+e1z7dVKCpzzekdxcYmOXXXwZ6CgX+3lxcvpj9
	6z/mH83I7gSWP1zJvbrSAVUlnnrv8SzbFlrWU65xT0UL8HfkU9kKlXzQdTTFMy03t4TpCYltkNsPL
	heAVwp/l9c5/y3vh6HJH623w2Gj24eMgAmRxQCm4nVOVgDijA7VVwQ58bDr/RCsPWsjYAvXLqMrEb
	uEpQj+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9Bf-00000004Wlh-2ZPM;
	Fri, 13 Dec 2024 17:10:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM99Y-00000004WNm-2WFA
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 17:08:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so10821a12.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Dec 2024 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734109715; x=1734714515; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=GNDMXH/6ufb07FhrVasMj+zWyXrs7758N953UBwX4aULf+8fy5dIJeqbQa9KIBtAwy
         WF++XMHGO0iDWmCYBdssJUjz/ZI0JLnzJXBNDrdDwAWC8LPjTttpBRRl0OKEqc8AA/1w
         ZvZmz1pcTWjg7eKno0Vb2mT1+czXkVwtouzSrbELwN6g0hN8g/4fLmXyLEjoiqb4Ctem
         7KHvVejm3fntfop6/XXPpZyL29v4fqVuhq1pkzLXeFdSjIESW1N8c8WPrfACkPihsxDM
         3qOwv8xaKoOSUeIyzrqyyWKAogZh9fDkyNSTz0VlLNEVN32mOJZdCWgj/rF5/BNJ53BM
         QE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109715; x=1734714515;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=Qt1KyEolatKMvQQNlXyV6PN0zqLIHgF8bUxFhEW+UJRmg7YmfBff221ZGegUTK2oJG
         xBlFMPqabIiSFs63EmzrizaUZ0HgZTPbZJ3uvBnhuSn/ljmfpuTH79LODxKMxr5iQ/Jh
         m1YIvUpAxYw9RgJ+DB4j7DDpo+XvlQmppB6KXtbqGkZ/vqJuJ/78MElVMh+56WqHOwSy
         U3PsS5BNvek4FWEcJyF4KoEpjbatIH+XWYZXmHRFAPL8bU01ASL3nV8PPInPK57y3slH
         IMMwnk/VMamQNlK6D7LPcFF7W+P64wvvAfZb3yrqk47Mxa8zU+VXqp9Q7ICAK0F4B+xN
         N1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCU3kV+GepcJOkgsJgzhl+8Vyj1QiSJ2Ap2P3j6P0M1GDXfMxX8kyyeKN8ue3jy+nOmD2H0heRs1gV3R+FsGcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1pa8VnZAgdk+J9rUBlA+FktcBwuRk4JWSnmUM4Yn/PdAZaJQv
	MiV1qGvWoRWESqw0ZILfTfj1E1HjUh9qTvlL3JNqf1oAU8m+WdyO2lWnQHvhhXKVSaf00DF2GWw
	5iL9IIB7NTMnqCl1o6clM+d4fhrCfceUJo70J
X-Gm-Gg: ASbGnctcIZs0EPXkklNmzTtPnwhNcF7AX3GFMqkudVi/aZqLS32B+fa7PR76odl64L5
	/IAs26S7Nmn2HxoqGQmCuhgdhDlHGmCnkqHqBXA==
X-Google-Smtp-Source: AGHT+IE0pzRAvhpWcDoHVTc25a7VJDPqOoxFfUFUvV3kZNJPG0d3Y6hVFQO+pd+M5jbFDlDiTJn/R0kKY+NzL+UHXcQ=
X-Received: by 2002:a05:6402:1517:b0:5d0:b20c:2063 with SMTP id
 4fb4d7f45d1cf-5d63c09e36emr92135a12.7.1734109713373; Fri, 13 Dec 2024
 09:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local> <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
 <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local> <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
In-Reply-To: <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 12:08:18 -0500
Message-ID: <CAC_TJvdZxQ0-O3Y1bzH0-XdjQYuJPkkpn-umVan--Z6As-tSow@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_090836_637850_2425EED9 
X-CRM114-Status: GOOD (  32.74  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMTE6NDXigK9BTSAnTGlhbSBSLiBIb3dsZXR0JyB2aWEg
a2VybmVsLXRlYW0KPGtlcm5lbC10ZWFtQGFuZHJvaWQuY29tPiB3cm90ZToKPgo+ICogTG9yZW56
byBTdG9ha2VzIDxsb3JlbnpvLnN0b2FrZXNAb3JhY2xlLmNvbT4gWzI0MTIxMyAxMDoxNl06Cj4g
PiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAxMDowNjo1NUFNIC0wNTAwLCBLYWxlc2ggU2luZ2gg
d3JvdGU6Cj4gPiA+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0IDQ6MDDigK9BTSBMb3JlbnpvIFN0
b2FrZXMKPiA+ID4gPGxvcmVuem8uc3RvYWtlc0BvcmFjbGUuY29tPiB3cm90ZToKPgo+IC4uLgo+
Cj4gPiA+Cj4gPiA+IE9uIHRoZSB0ZWNobmljYWwgc2lkZSwgTGlhbSBpcyByaWdodCB0aGF0IHRo
ZSBjb3B5LXBhc3RlZCBhcmNoIGNvZGUKPiA+ID4gaGFzIGluY29uc2lzdGVuY2llcyAobWlzc2lu
ZyBjaGVja3MsIG9yZGVyIG9mIGNoZWNrcywgLi4uKS4gSSBhZ3JlZQo+ID4gPiB0aGVyZeKAmXMg
cm9vbSBmb3IgZnVydGhlciBjb25zb2xpZGF0aW9uLiBJ4oCZbGwgdGFrZSBhbm90aGVyIHN0YWIg
YXQgaXQKPiA+ID4gYW5kIHJlc2VuZCBpdCBhcyBhbiBSRkMgd2l0aCBhbiB1cGRhdGVkIGNvdmVy
IGxldHRlciwgYXMgTG9yZW56byBhbmQKPiA+ID4gb3RoZXJzIHN1Z2dlc3RlZC4KPgo+IFRoYW5r
cy4gIENhbiB5b3UgcGxlYXNlIGluY2x1ZGUgd2hhdCBwbGF0Zm9ybXMgeW91IGhhdmUgdGVzdGVk
IGluIHlvdXIKPiBjb3ZlciBsZXR0ZXIgKGFuZCBsZXZlbCBvZiB0ZXN0aW5nIC0gYm9vdGluZywg
cnVubmluZyBzb21ldGhpbmcsIGV0YykuCj4KPiBJZiB5b3UgaGF2ZSBub3QgdGVzdGVkIHRoZW0s
IHRoZW4gaXQgbWlnaHQgYmUgd29ydGggaXQgdG8gaGF2ZSBpdCBhcyBhbgo+IFJGQyB0byBwb2lu
dCB0aGlzIG91dCAtIGF0IGxlYXN0IGluaXRpYWxseS4gIFNvbWUgb2YgdGhlc2UgYXJlIHZlcnkK
PiBkaWZmaWN1bHQgdG8gc2V0IHVwIGZvciB0ZXN0aW5nLCBidXQgaXQgaXMgYWxzbyBwb3NzaWJs
ZSB0aGF0IHlvdSBkaWQKPiB0aGF0IGFuZCB0aGUgbWFpbnRhaW5lcnMvcGVvcGxlIHdobyB1c3Vh
bGx5IHRlc3QgdGhlc2UgdGhpbmdzIHdpbGwKPiBhc3N1bWUgaXQncyBmaW5lIGlmIHlvdSBkb24n
dCBzcGVsbCBvdXQgd2hhdCdzIGdvaW5nIG9uLgo+CgpJIGJ1aWxkLXRlc3RlZCBtb3N0IG9mIHRo
ZXNlIGV4Y2VwdCAoY3NreSBhbmQgbG9vbmdhcmNoKSBhbmQgcmFuCmFuZHJvaWQgcnVudGltZSAo
QVJUKSB0ZXN0cyBvbiBhcm02NCBhbmQgeDg2LiBJIGNhbiB0cnkgdG8gc3BpbiB1cCBhCmZldyBv
ZiB0aGUgb3RoZXJzIGFuZCB3aWxsIGFkZCBpdCB0byB0aGUgZGVzY3JpcHRpb24uCgo+ID4KPiA+
IFRoZSBtb3N0IHVzZWZ1bCB0aGluZyBoZXJlIGFzIHdlbGwgdG8gaGVscCB1cyB1bmRlcnN0YW5k
IHdvdWxkIGJlIHRvIHdyaXRlCj4gPiBtb3JlIGluIHRoZSBjb3ZlciBsZXR0ZXIgdG8gZXhwYW5k
IG9uIHdoYXQgaXQgaXMgeW91IHVsdGltYXRlbHkgd2hhdCB0bwo+ID4gYWNoaWV2ZSBoZXJlIC0g
aXQgc2VlbXMgbGlrZSBhbiBleHRlbnNpb24gb24gdGhlIGV4aXN0aW5nIFRIUCB3b3JrIG9uIGEK
PiA+IHBlci1hcmNoIGJhc2lzIChJIG1heSBiZSB3cm9uZyk/IFNvIGFkZGluZyBtb3JlIGRldGFp
bCB3b3VsZCBiZSBzdXBlcgo+ID4gdXNlZnVsIGhlcmUhIDopCj4gPgo+ID4gV2UgZG8gaG9wZSB0
byBhdm9pZCBhcmNoIGhvb2tzIGlmIGF0IGFsbCBwb3NzaWJsZSBleHBsaWNpdGx5IGZvciB0aGUg
cmVhc29uCj4gPiB0aGF0IHRoZXkgY2FuIGJlIGFwcGxpZWQgYXQgdW5mb3J0dW5hdGUgdGltZXMg
aW4gdGVybXMgb2YgbG9ja2luZy93aGV0aGVyCj4gPiB0aGUgb2JqZWN0cyBpbiBxdWVzdGlvbiBh
cmUgZnVsbHkvcGFydGlhbGx5IGluc3RhbnRpYXRlZCwgVk1BIHZpc2liaWxpdHkKPiA+IGV0Yy4g
ZXRjLiBiYXNlZCBvbiBoYXZpbmcgaGFkIGlzc3VlcyBpbiB0aGVzZSBhcmVhcyBiZWZvcmUuCj4g
Pgo+ID4gQWxzbyBpZiBhIGhvb2sgbWVhbnMgJ2FueXRoaW5nJyBjYW4gaGFwcGVuIGF0IGEgY2Vy
dGFpbiBwb2ludCwgaXQgbWVhbnMgd2UKPiA+IGNhbid0IG1ha2UgYW55IGFzc3VtcHRpb25zIGFi
b3V0IHdoYXQgaGFzL2hhc24ndCBhbmQgaGF2ZSB0byBhY2NvdW50IGZvcgo+ID4gYW55dGhpbmcg
d2hpY2ggc2VyaW91c2x5IGNvbXBsaWNhdGVzIHRoaW5ncy4KPiA+Cj4gPiBJZGVhbGx5IHdlJ2Qg
ZmluZCBhIG1lYW5zIHRvIGFjaGlldmUgdGhlIHNhbWUgdGhpbmcgd2hpbGUgYWxzbyBleHBvc2lu
ZyB1cwo+ID4gYXMgbGl0dGxlIGFzIHBvc3NpYmxlIHRvIHdoYXQgbWF5IGJlIG11dGF0ZWQuCj4K
Pgo+IFllcywgSSdtIG5vdCBzdXJlIG9mIHdoYXQgeW91ciBwbGFucyBhcmUsIGJ1dCBJIHdvdWxk
IGxpa2UgdG8gc2VlIGFsbCBvZgo+IHRoZXNlIGN1c3RvbSBmdW5jdGlvbnMgcmVtb3ZlZCwgaWYg
YXQgYWxsIHBvc3NpYmxlLgoKSW5pdGlhbGx5IEkgdGhpbmsgd2UgY2FuIHJlbW92ZSB0aGUgbW1h
cCBoaW50IHBvcnRpb24gb2YgdGhlIGxvZ2ljOwphbmQgZm9sbG93IHVwIHdpdGggcmVtb3Zpbmcg
YXJjaF9nZXRfdW5tYXBwZWRfYXJlYVtfdG9wZG93bl0oKS4gU29tZQpvZiB0aG9zZSBtYXkgbm90
IG1ha2Ugc2Vuc2UgdG8gY29uc29saWRhdGUgZS5nLiBwb3dlcnBjJ3MKc2xpY2VfZ2V0X3VubWFw
cGVkX2FyZWEoKSB3aGljaCBkb2Vzbid0IHNoYXJlIG11Y2ggaW4gY29tbW9uIHdpdGggdGhlCnJl
c3QuCgpUaGFua3MsCkthbGVzaAoKPgo+IFRoYW5rcywKPiBMaWFtCj4KPiBUbyB1bnN1YnNjcmli
ZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5k
IGFuIGVtYWlsIHRvIGtlcm5lbC10ZWFtK3Vuc3Vic2NyaWJlQGFuZHJvaWQuY29tLgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
