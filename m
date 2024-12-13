Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2157E7717D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MjeN4SgHg6iFaWR9cPKYIY4fx6gShNIe0wr/1dClx4=; b=RoiMqkbt85aguF
	NIrZ3vFOqe5Y6CcI8GrFtTuAfxTLHp4M1emfS4yq65V2K/jqJ9F0VIQY4G1hIPO/imyIiEMWCo7IG
	YK/ODHKqsRABrfhY7sQ2danJQar90lbG2nG0po4ziaOr2uC668s+9peKVZ4RUTIdOgOTYoPhK2FQx
	GUdNd5v0nrRYW09D8nicUXLZ2mgfOk2Qc4ii2ReXFxgZpgxZkePJRmbD9t2B9GK6HQjBmm1Glj9kY
	kaiKsL/eq6mQG/mwhIfXC95nA/krX1JUwRUOHVEugWNna0V6ppNrqlGwotXhZYB0Id+A7ERq5Ickq
	DEx3hyMHWbD2eZR2KisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Iw-00000004E6f-1MSn;
	Fri, 13 Dec 2024 15:10:10 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7G1-00000004DJp-42Ys
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 15:07:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2163affd184so114855ad.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Dec 2024 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734102428; x=1734707228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=OYRpgGcb9H/1GDW0CJ2wqEe9GKTqdQz8Ku5Ib1b4mVlVKnVHvR8bay11Ka3jCk4ATt
         rZ2bwxZQ2uLPb18D5SpAJJGBq73caivxANeil3oT4rxvZI6laWH8VqxoOQmQ5Dz22rp+
         f02tghCNqnQHU0j+zfzsS73B/ZAT5zXNVMXAR4y6cgQInLBh5oxgL4scxgvBk92fBf4C
         P/Qb/DOxPsuQkrzKX8rJhhgQY6gbg7naqmj6OMftw6TSZ79gWPGRzv8XCIFhturbdEAv
         cF3JEGvz+6MwgdMOLG91X41Ltm0F5FJTVEpQ7seSDEkSfmoyPEDwNSOTaVKF1y+l9lNw
         maSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102428; x=1734707228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=CXMFgdK7xasidi51+uZAD6SubCqdT33769ccwSFaaFm1hU/2/lzjJdiu3I7B4AC/65
         EVrXCzmlm4UjAqihISjEtyQnIOiIIKF+Y4g1eFOhoGiAg5Ptgklo/mUylTPjkk3dWhs9
         CGk0VlZmaJtuBrcZ2rXgLTRchGMhOi0Ha/cYvIpVRBeg4ehIGV2G9i4vsQ3Kf8rRFlzo
         JiipdYWKJV0ieq1ax/ZyH6H9mfYB7ctFjD0fKPprymP+l/w/hEzjEjU9qT0V4ExdwTgM
         RXsuaTppn3qIRS510TPpbSw/t9qtT25rfUzAXT9TTX8+KoD7W4/xcpnJkazKGDt6f0j/
         miNg==
X-Forwarded-Encrypted: i=1; AJvYcCVleC8+Jwe52EmkV/WZb95WvvOiN4pjITS4XtvIVio1m3kKg3dQLlElw+hnOMYPcWPCUfA+rRwg/KsQBz4xvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrwgNlcLFbiCBzma//3cF5q8Myoi6+CeezCJlduKCS4GLPUaK0
	LY277dNZg1yZAkekdHKAIg6IsU9JE1H5MTL8Swbd8rU5aVDql/bB87ntuA7D8OY+L+SJwoX6yjF
	0RoF8h6LKESQAuy04UhRTBi4U5OG76D0xHK70
X-Gm-Gg: ASbGncuAjIwiVsAWbDLed79KWCrfIKRf9qmSddj3OrQprMPBkB1uWriv6/wqz7BHPAO
	eXx5VBLUow1Cdcm4K6mqKAMA52867Lu4XYYLkuQ==
X-Google-Smtp-Source: AGHT+IEFkkLrbUVuE/cQvOQQfUpzDKI51xwKn+aUa2wuLKN/e2/s4qkcLn7DHuV9QVymd56Ir4cx8C6BN8kJhz8qssU=
X-Received: by 2002:a17:902:da82:b0:215:44af:313b with SMTP id
 d9443c01a7336-21891d3ead6mr2786695ad.0.1734102427757; Fri, 13 Dec 2024
 07:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
In-Reply-To: <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 10:06:55 -0500
Message-ID: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz, 
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
X-CRM114-CacheID: sfid-20241213_070710_003003_781A910D 
X-CRM114-Status: GOOD (  21.55  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgNDowMOKAr0FNIExvcmVuem8gU3RvYWtlcwo8bG9yZW56
by5zdG9ha2VzQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMTIsIDIwMjQgYXQg
MDU6MzY6MDlQTSAtMDgwMCwgQW5kcmV3IE1vcnRvbiB3cm90ZToKPiA+IE9uIFRodSwgMTIgRGVj
IDIwMjQgMjI6NTE6MzQgKzAwMDAgTG9yZW56byBTdG9ha2VzIDxsb3JlbnpvLnN0b2FrZXNAb3Jh
Y2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBZb3UndmUgZnVuZGFtZW50YWxseSB2aW9sYXRlZCBr
ZXJuZWwgcHJvY2VzcyBhbmQgZXRpcXVldHRlLiBJJ2QgYmUgbW9yZQo+ID4gPiBmb3JnaXZpbmcs
IGJ1dCB0aGlzIGlzIGF0IHYyIGFuZCB5b3UndmUgbm90IGNjJ2QgS0VZIHBlb3BsZS4gVHdpY2Uu
IFRoaXMgaXMKPiA+ID4gdG90YWxseSB1bmFjY2VwdGFibGUuIFNlZSBbMF0gaWYgeW91IGFyZSB1
bnN1cmUgb2YgaG93IHRvIGRvIHNvLgo+ID4KPiA+IFRoaXMgZmVlbHMgZXhjZXNzaXZlIHRvIG1l
LiAgbGludXgtbW0gYXZlcmFnZXMgYSBtZXJlIDE0MCBtZXNhZ2VzL2RheQo+ID4gYW5kIGl0IHNl
ZW1zIHJlYXNvbmFibGUgdG8gYXNzdW1lIHRoYXQga2V5IHBlb3BsZSBhcmUgc3BlbmRpbmcgdGhl
aXIgNQo+ID4gbWludXRlcyB0byBzY3JvbGwgdGhyb3VnaCB0aGUgZW1haWwgc3ViamVjdHMuCj4K
PiBJbiBwcmFjdGljZSB3ZSBkaWQgYWxsIG1pc3MgaXQsIGFuZCBJIGRvbid0IHRoaW5rIGl0J3Mg
dW5yZWFzb25hYmxlIHRvIGFzawo+IHBlb3BsZSB0byBydW4gZ2V0X21haW50YWluZXJzLnBsIHRv
IGF2b2lkIHRoaXMuCj4KPiBJbiBhbnkgY2FzZSwgSSB0cnVseSBkbyB0aGluayB0aGlzIHNlcmll
cyB3b3JrcyBiZXR0ZXIgYXMgUkZDLCBJIG1lYW4gTGlhbQo+IGhhcyBhbHJlYWR5IHZvaWNlZCB0
aGUga2luZCBvZiBkaXNhZ3JlZW1lbnRzIEkgc2hhcmUgd2l0aCBpdCwgYW5kIHdlIG5lZWQKPiB0
byByZXRoaW5rIGhvdyB0byBhcHByb2FjaCBpdCBpbiBnZW5lcmFsLgo+Cj4gU28gaWYgdGhpcyBp
cyBzaW1wbHkgc2VudCBhcyBSRkMgd2l0aCB0aGUgY29ycmVjdCBjYydzIChhbmQgaWRlYWxseSB3
aXRoCj4gc29tZSByZXZpZXcgZmVlZGJhY2sgYXBwbGllZCAtIGEgYmV0dGVyIGNvdmVyIGxldHRl
ciwgZXRjLikgdGhlbiBpdCBtYWtlcwo+IGV2ZXJ5dGhpbmcgZWFzaWVyLgo+Cj4gQXMgbWVudGlv
bmVkIHRoZSB0aW1pbmcgaXMgdW5mb3J0dW5hdGUgaGVyZSwgdGhpcyBpcyBhIHNlcmllcyB3ZSBy
ZWFsbHkKPiB3YW50IHRvIG1ha2Ugc3VyZSBpcyBwcm9wZXJseSByZXZpZXdlZCBiZWZvcmUgYW55
IGNoYW5jZSBvZiBtZXJnZSBzbyBhZ2Fpbgo+IHRoaXMgcG9pbnRzIHRvIFJGQyBiZWluZyB0aGUg
d2F5IGZvcndhcmQuCgpIaSBldmVyeW9uZSwKClNvcnJ5IGZvciB0aGUgZGVsYXllZCByZXNwb25z
ZSAtLSBJIHdhcyB0cmF2ZWxpbmcgYW5kIGRpZG7igJl0IGhhdmUKYWNjZXNzIHRvIGVtYWlsLgoK
VGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suIEkgcmVhbGl6ZSBJIG1pc3NlZCBzb21lIGtleSBy
ZXZpZXdlcnMgaW4KdGhlIENDIGxpc3QgZm9yIHRoaXMgcGF0Y2guCldoZW4gSSByYW4gZ2V0X21h
aW50YWluZXIucGwsIGl0IHJldHVybmVkIGEgbGFyZ2UgbGlzdCBvZiByZWNpcGllbnRzLgpUbyBh
dm9pZCBvdmVyLUND4oCZaW5nIHBlb3BsZSAod2hpY2ggaGFzIGJlZW4gYW4gaXNzdWUgZm9yIG1l
IGluIHRoZQpwYXN0KSwgSSB0cmllZCB0byB0cmltIGl0IGRvd24gdG8gbWFpbnRhaW5lcnMgYW5k
IGEgZmV3IG90aGVycyBJCnRob3VnaHQgd291bGQgYmUgaW50ZXJlc3RlZC4gQ2xlYXJseSwgSSBn
b3QgaXQgd3JvbmcgYW5kIG1pc3NlZCBzb21lCmtleSBmb2xrcy4gVGhhdCB3YXMgbm90IG15IGlu
dGVudGlvbiwgYW5kIEnigJlsbCBtYWtlIHN1cmUgdG8gZml4IGl0CndoZW4gSSByZXNlbmQgdGhl
IHBhdGNoIGFzIGFuIFJGQy4KCk9uIHRoZSB0ZWNobmljYWwgc2lkZSwgTGlhbSBpcyByaWdodCB0
aGF0IHRoZSBjb3B5LXBhc3RlZCBhcmNoIGNvZGUKaGFzIGluY29uc2lzdGVuY2llcyAobWlzc2lu
ZyBjaGVja3MsIG9yZGVyIG9mIGNoZWNrcywgLi4uKS4gSSBhZ3JlZQp0aGVyZeKAmXMgcm9vbSBm
b3IgZnVydGhlciBjb25zb2xpZGF0aW9uLiBJ4oCZbGwgdGFrZSBhbm90aGVyIHN0YWIgYXQgaXQK
YW5kIHJlc2VuZCBpdCBhcyBhbiBSRkMgd2l0aCBhbiB1cGRhdGVkIGNvdmVyIGxldHRlciwgYXMg
TG9yZW56byBhbmQKb3RoZXJzIHN1Z2dlc3RlZC4KClRoYW5rcywKS2FsZXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
