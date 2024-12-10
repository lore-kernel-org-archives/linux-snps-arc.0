Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA61FE7717F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHeyC4DrWc1Ux4LwVp/C0260xGrH6zXnhgEyCzFxVoA=; b=b0HZmQvlw0LGRG
	gVszom5pkocNM5Vv1l4aFR3nTFf94JwiKFdJyc8sZkT2uIuFfhJiDIGqcHOckfMa10K2CqS68BJce
	cCuwrLciDqavW2hWFwJpkK4KmsYc+KoNvbxxCgdRrktl1xUaUG87ew/oE9xLDeZSfoMaCD+QlcB/g
	Hu/7JzmYzxl1jmezme2OcJBUb6++n1Oe/sDapuyYAco1i65Xo4O3kOzQKbufzbmCg7BJQ4WLGl6QI
	fKcXTU1KAfIpfByZzCdrbyQ1jp6hFhhXYGeePBwO9HSrhvJjpxTwdG0h1lDLM4UXs70VbwiUHaO9j
	ZcKGyAcy9IVyYYRjZb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4CB-0000000CJ06-2lN8;
	Tue, 10 Dec 2024 17:38:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL47j-0000000CI4j-3vVq
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 17:34:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-215740b7fb8so315ad.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 10 Dec 2024 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733852054; x=1734456854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
        b=sdo2bYjLIK7xF7V/+2ay6ZBCi+9MoLTzMACWSzpEaxuKyJVaVxWWGMrC8+NE+G9f1B
         Z4SNx04u4jDKygXklgec1uFxjf/liGcHBeWmuJXHq4WxunhppKHMQ96jqoYGCJWOyAcU
         nin++9dLDjsyYkdMFM4pmMAyDhlLjtJEXXAt7c+FoxELvzHT/jhqcrRSD4idu4ZGgwFx
         KCNTey3L9VxBa2QsujiguIJLfCX3c1qlmagMtoZytT/eNkKrl3BiK6TD0GCAYyaJHZJ5
         T3cSCqm9IIxelvrawZcz++NehoFnvVZPFJGeDaevOw6m8xCnOGtZrJPp8LNBQfhupSd9
         hn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733852054; x=1734456854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
        b=sJxSy1IdyeuY7eGc+aZlKuVfRlXqxcrT116cvyyt9Mo9kB7U2QDB1Jw8IEMn3psp/C
         vFdjEjPI2Tyvp6RxZhXc39syqq6yMhIGXrSU8h3acJbpidxw1Oe8VWmsD3krVsgN1YUE
         06QSwpTJBrUl53iFxpkBNdmza4aL0QL1EYOq5sX+lD8akDtI2ioDEoDLh/H0v1WsYJuP
         3CecS+lQ5g3VjoW7OPHGi/u6z6Al84B0fUaZWR4SN7a1zPVPev2WzEvgnor+iC1OH6g3
         1yAJaer3U/1YrnwbY5FN89CUGjVFr+r5+oYNGs2q8ZBT0RD6Sx3Frt3EEDWUi5IFP2jm
         IHOg==
X-Forwarded-Encrypted: i=1; AJvYcCUCwcIadBp209bw1dUUqaeAABpwP6z5K9ijuaEGfgNP1KGExhIwK0G9TduHeyIH9MBGPFrXMpLuxCK8cSdeHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTUIn4nO0CcTYtiWFgmt+K+LCPA3GGqhyXv0KivW9YXucBvfqG
	H50MoaFkw8+1xD+j03MIc+z2QsIYVCfj9x51NaiOxEZNiNpm1emaUH/j5pmYtTagM/p7OpQMtes
	1i/rC8x19gNxn4X8Dch8lmcl0Y4Ea2i5TmE/E
X-Gm-Gg: ASbGncu6FN3XbrIPCOptKf2J9x02o5HiATEEnZX4X/3b9CXg733uOkk96e/9tEsl4G5
	pJ85nj4WPYwd5fx/lAbeEzXoswvkDluaWS7jx8ACUXb30ghg8Pivf3BEyeVZNuI9S
X-Google-Smtp-Source: AGHT+IEDudBnir5+jttzQm+7tNnzRHUlcioRTO8j0Dis2V+coMoC8sfWSozH23fEnrYfZy4bwgZvjEwIXStM7LatHiM=
X-Received: by 2002:a17:903:4403:b0:215:9d29:1aba with SMTP id
 d9443c01a7336-21674cbdb12mr2775015ad.1.1733852054062; Tue, 10 Dec 2024
 09:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
In-Reply-To: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 10 Dec 2024 09:34:01 -0800
Message-ID: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Yang Shi <shy828301@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
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
	kernel-team@android.com, android-mm@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093415_969269_99794CA7 
X-CRM114-Status: GOOD (  32.76  )
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

T24gTW9uLCBEZWMgOSwgMjAyNCBhdCA3OjM34oCvUE0gWWFuZyBTaGkgPHNoeTgyODMwMUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBEZWMgOSwgMjAyNCBhdCA2OjQ14oCvUE0gS2FsZXNo
IFNpbmdoIDxrYWxlc2hzaW5naEBnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBDb21taXQgMjQ5
NjA4ZWU0NzEzICgibW06IHJlc3BlY3QgbW1hcCBoaW50IGFkZHJlc3Mgd2hlbiBhbGlnbmluZyBm
b3IgVEhQIikKPiA+IGZhbGxzYmFjayB0byBQQUdFX1NJWkUgYWxpZ25tZW50IGluc3RlYWQgb2Yg
VEhQIGFsaWdubWVudAo+ID4gZm9yIGFub255bW91cyBtYXBwaW5nIGFzIGxvbmcgYXMgYSBoaW50
IGFkZHJlc3MgaXMgcHJvdmlkZWQgYnkgdGhlIHVzZXIKPiA+IC0tIGV2ZW4gaWYgd2Ugd2VyZW4n
dCBhYmxlIHRvIGFsbG9jYXRlIHRoZSB1bm1hcHBlZCBhcmVhIGF0IHRoZSBoaW50Cj4gPiBhZGRy
ZXNzIGluIHRoZSBlbmQuCj4gPgo+ID4gVGhpcyB3YXMgZG9uZSB0byBhZGRyZXNzIHRoZSBpbW1l
ZGlhdGUgcmVncmVzc2lvbiBpbiBhbm9ueW1vdXMgbWFwcGluZ3MKPiA+IHdoZXJlIHRoZSBoaW50
IGFkZHJlc3Mgd2VyZSBiZWluZyBpZ25vcmVkIGluIHNvbWUgY2FzZXM7IGR1ZSB0byBjb21taXQK
PiA+IGVmYTdkZjNlM2JiNSAoIm1tOiBhbGlnbiBsYXJnZXIgYW5vbnltb3VzIG1hcHBpbmdzIG9u
IFRIUCBib3VuZGFyaWVzIikuCj4gPgo+ID4gSXQgd2FzIGxhdGVyIHBvaW50ZWQgb3V0IHRoYXQg
dGhpcyBpc3N1ZSBhbHNvIGV4aXN0ZWQgZm9yIGZpbGUtYmFja2VkCj4gPiBtYXBwaW5ncyBmcm9t
IGZpbGUgc3lzdGVtcyB0aGF0IHVzZSB0aHBfZ2V0X3VubWFwcGVkX2FyZWEoKSBmb3IgdGhlaXIK
PiA+IC5nZXRfdW5tYXBwZWRfYXJlYSgpIGZpbGUgb3BlcmF0aW9uLgo+ID4KPiA+IFRoZSBzYW1l
IGZpeCB3YXMgbm90IGFwcGxpZWQgZm9yIGZpbGUtYmFja2VkIG1hcHBpbmdzIHNpbmNlIGl0IHdv
dWxkCj4gPiBtZWFuIGFueSBtbWFwIHJlcXVlc3RzIHRoYXQgcHJvdmlkZSBhIGhpbnQgYWRkcmVz
cyB3b3VsZCBiZSBvbmx5Cj4gPiBQQUdFX1NJWkUtYWxpZ25lZCByZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgYWxsb2NhdGlvbiB3YXMgc3VjY2Vzc2Z1bCBhdAo+ID4gdGhlIGhpbnQgYWRkcmVzcyBvciBu
b3QuCj4gPgo+ID4gSW5zdGVhZCwgdXNlIGFyY2hfbW1hcF9oaW50KCkgdG8gZmlyc3QgYXR0ZW1w
dCBhbGxvY2F0aW9uIGF0IHRoZSBoaW50Cj4gPiBhZGRyZXNzIGFuZCBmYWxsYmFjayB0byBUSFAg
YWxpZ25tZW50IGlmIHRoYXQgZmFpbHMuCj4KPiBUaGFua3MgZm9yIHRha2luZyB0aW1lIHRvIHRy
eSB0byBmaXggdGhpcy4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEthbGVzaCBTaW5naCA8a2Fs
ZXNoc2luZ2hAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIG1tL2h1Z2VfbWVtb3J5LmMgfCAxNSAr
KysrKysrKy0tLS0tLS0KPiA+ICBtbS9tbWFwLmMgICAgICAgIHwgIDEgLQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9tbS9odWdlX21lbW9yeS5jIGIvbW0vaHVnZV9tZW1vcnkuYwo+ID4gaW5kZXggMTM3YWJl
ZGE4NjAyLi5mMDcwYzg5ZGFmYzkgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9odWdlX21lbW9yeS5jCj4g
PiArKysgYi9tbS9odWdlX21lbW9yeS5jCj4gPiBAQCAtMTA5Nyw2ICsxMDk3LDE0IEBAIHN0YXRp
YyB1bnNpZ25lZCBsb25nIF9fdGhwX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxw
LAo+ID4gICAgICAgICBsb2ZmX3Qgb2ZmX2FsaWduID0gcm91bmRfdXAob2ZmLCBzaXplKTsKPiA+
ICAgICAgICAgdW5zaWduZWQgbG9uZyBsZW5fcGFkLCByZXQsIG9mZl9zdWI7Cj4gPgo+ID4gKyAg
ICAgICAvKgo+ID4gKyAgICAgICAgKiBJZiBhbGxvY2F0aW9uIGF0IHRoZSBhZGRyZXNzIGhpbnQg
c3VjY2VlZHM7IHJlc3BlY3QgdGhlIGhpbnQgYW5kCj4gPiArICAgICAgICAqIGRvbid0IHRyeSB0
byBhbGlnbiB0byBUSFAgYm91bmRhcnkuCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICBhZGRy
ID0gYXJjaF9tbWFwX2hpbnQoZmlscCwgYWRkciwgbGVuLCBvZmYsIGZsYWdzKTsKPiA+ICsgICAg
ICAgaWYgKGFkZHIpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGFkZHI7Cj4gPiArCgpIaSBZ
YW5nLAoKVGhhbmtzIGZvciB0aGUgY29tbWVudHMuCgo+Cj4gSUlVQywgYXJjaF9tbWFwX2hpbnQo
KSB3aWxsIGJlIGNhbGxlZCBpbiBhcmNoX2dldF91bm1hcHBlZF9hcmVhKCkgYW5kCj4gYXJjaF9n
ZXRfdW5tYXBwZWRfYXJlYV90b3Bkb3duKCkgYWdhaW4uIFNvIHdlIHdpbGwgYWN0dWFsbHkgbG9v
ayB1cAo+IG1hcGxlIHRyZWUgdHdpY2UuIEl0IHNvdW5kcyBsaWtlIHRoZSBzZWNvbmQgaGludCBh
ZGRyZXNzIHNlYXJjaCBpcwo+IHBvaW50bGVzcy4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHNldCBh
ZGRyIHRvIDAgYmVmb3JlIGNhbGxpbmcKPiBtbV9nZXRfdW5tYXBwZWRfYXJlYV92bWZsYWdzKCkg
aW4gb3JkZXIgdG8gc2tpcCB0aGUgc2Vjb25kIGhpbnQKPiBhZGRyZXNzIHNlYXJjaC4KCllvdSBh
cmUgcmlnaHQgdGhhdCBpdCB3b3VsZCBjYWxsIGludG8gYXJjaF9tbWFwX2hpbnQoKSB0d2ljZSBi
dXQgaXQKb25seSBhdHRlbXB0cyB0aGUgbG9va3VwIG9uY2Ugc2luY2Ugb24gdGhlIHNlY29uZCBh
dHRlbXB0IGFkZHIgPT0gMC4KClRoYW5rcywKS2FsZXNoCj4KPiA+ICAgICAgICAgaWYgKCFJU19F
TkFCTEVEKENPTkZJR182NEJJVCkgfHwgaW5fY29tcGF0X3N5c2NhbGwoKSkKPiA+ICAgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiBAQCAtMTExNywxMyArMTEyNSw2IEBAIHN0YXRpYyB1
bnNpZ25lZCBsb25nIF9fdGhwX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxwLAo+
ID4gICAgICAgICBpZiAoSVNfRVJSX1ZBTFVFKHJldCkpCj4gPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gPgo+ID4gLSAgICAgICAvKgo+ID4gLSAgICAgICAgKiBEbyBub3QgdHJ5IHRvIGFs
aWduIHRvIFRIUCBib3VuZGFyeSBpZiBhbGxvY2F0aW9uIGF0IHRoZSBhZGRyZXNzCj4gPiAtICAg
ICAgICAqIGhpbnQgc3VjY2VlZHMuCj4gPiAtICAgICAgICAqLwo+ID4gLSAgICAgICBpZiAocmV0
ID09IGFkZHIpCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIGFkZHI7Cj4gPiAtCj4gPiAgICAg
ICAgIG9mZl9zdWIgPSAob2ZmIC0gcmV0KSAmIChzaXplIC0gMSk7Cj4gPgo+ID4gICAgICAgICBp
ZiAodGVzdF9iaXQoTU1GX1RPUERPV04sICZjdXJyZW50LT5tbS0+ZmxhZ3MpICYmICFvZmZfc3Vi
KQo+ID4gZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwo+ID4gaW5kZXggNTliZjdk
MTI3YWExLi42YmZlZWM4MDE1MmEgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9tbWFwLmMKPiA+ICsrKyBi
L21tL21tYXAuYwo+ID4gQEAgLTgwNyw3ICs4MDcsNiBAQCBfX2dldF91bm1hcHBlZF9hcmVhKHN0
cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgbGVuLAo+
ID4gICAgICAgICBpZiAoZ2V0X2FyZWEpIHsKPiA+ICAgICAgICAgICAgICAgICBhZGRyID0gZ2V0
X2FyZWEoZmlsZSwgYWRkciwgbGVuLCBwZ29mZiwgZmxhZ3MpOwo+ID4gICAgICAgICB9IGVsc2Ug
aWYgKElTX0VOQUJMRUQoQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFKSAmJiAhZmlsZQo+ID4g
LSAgICAgICAgICAgICAgICAgICYmICFhZGRyIC8qIG5vIGhpbnQgKi8KPiA+ICAgICAgICAgICAg
ICAgICAgICAmJiBJU19BTElHTkVEKGxlbiwgUE1EX1NJWkUpKSB7Cj4gPiAgICAgICAgICAgICAg
ICAgLyogRW5zdXJlcyB0aGF0IGxhcmdlciBhbm9ueW1vdXMgbWFwcGluZ3MgYXJlIFRIUCBhbGln
bmVkLiAqLwo+ID4gICAgICAgICAgICAgICAgIGFkZHIgPSB0aHBfZ2V0X3VubWFwcGVkX2FyZWFf
dm1mbGFncyhmaWxlLCBhZGRyLCBsZW4sCj4gPiAtLQo+ID4gMi40Ny4wLjMzOC5nNjBjY2ExNTgx
OS1nb29nCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
