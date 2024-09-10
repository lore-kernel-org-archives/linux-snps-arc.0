Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDAEECE582
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Sep 2024 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV5b+YswIKO3cfiO2Skptepkg+jMpwexW+Vn7zR6Kyg=; b=Kb/lLOn0M5gYJ2
	XtzbonL3H9aBd4f74JcqFFHNbDj8upv3NRTCdor86GdN7CaD+50tQcRD4+ZJ3Ll6db3hi7Ja0Q1H5
	kZvB7wF6wkHWG06yCBy/lAUpMZWN0UBiYlZtn37nVThUxlGpdYq35Xpe35WMkyTkGQj1LoVmkgLHv
	+zV1F8xA4n8Aoi87VcJG0qyEiPUGtuyyRvRtW7X7h/V/UmBFl/6Z2w1nhunS9zitS02rDgs9RB6ql
	ct6XYWuWHGnJU4qsjB6nepsCCgNkd5eZEk0DcGsrli7Kcz7+pH5eVna3KKnsf5ZkQx0/bR7XMxq4e
	73CtzZ3+MjDIt/8TyVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxHp-000000052P5-3e9I;
	Tue, 10 Sep 2024 09:35:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxHm-000000052ND-1pH6
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Sep 2024 09:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF7005C0202
	for <linux-snps-arc@lists.infradead.org>; Tue, 10 Sep 2024 09:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235D3C4CECE
	for <linux-snps-arc@lists.infradead.org>; Tue, 10 Sep 2024 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725960945;
	bh=TBCYlvMv+CXUZRevJVyM0lQA/IZ4ZH4AmMprMHtYvlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AAIFUnbkEFTcQpSLieFiYjCtb2IxBMyXzOXGIdn9U2FRcJ8A+jQnl9/HvcZopeLrR
	 DYMRztJ3Gagf/QFSeAEGf1H6ytJhBqy8Cc+w8ioxpjas2VLD6v6a6StyiUQN6+ymaU
	 gACQTT5dM2T+6ejfsvw8ock+PQ4FueCsXFekx8kvxEN5ckO6VNrkYK4v4jT9PwQuYu
	 zAlwi4uBBYFi21BYgVSAkWFJQdhfgWpcvsL0/yYcfD0lGpru8VgYIplUM6mAFnB/Nu
	 CJPV2gtm35Uf3GxiJ2bNnSURUzKjpxH42jrbsmwLKTbjXx5qM4RPMebcz7djbUvYEu
	 FmjohxuyEBxjg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75c6ed428so32765461fa.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 10 Sep 2024 02:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDfd/EI/yCa4xmgZML7ixBCaEPGQWWMRiB24S4QnG0BBQFXf76h+Ac9KiMBfqdduPHQe20BIGSmLD2C4+8DQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNlkXxGpHTwk3jmBy9nCXKTFY19jRRPIF+pGby8ln+Mni4shzA
	POw7Q/1cnSUXRnzgLyESoWpG+yDZTEX+olOneCEh6N97/dA258M8Afhhl+V8AaaXEE008U8+VDv
	m/Ayd6fevq3esRYTP6dlIRoX3aLA=
X-Google-Smtp-Source: AGHT+IENtsmQg68T2Ng35CvFqHD8v1uFN5MIvWFG7psrbL/gymy/jagJsarSBmqhnENe7SHnrN02zL4FzfCwY+63Hyw=
X-Received: by 2002:a05:6512:2514:b0:536:5827:8778 with SMTP id
 2adb3069b0e04-536588130d9mr9715058e87.53.1725960943742; Tue, 10 Sep 2024
 02:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240904234803.698424-1-masahiroy@kernel.org> <20240904234803.698424-5-masahiroy@kernel.org>
 <20240905141723.GC1517132-robh@kernel.org>
In-Reply-To: <20240905141723.GC1517132-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Sep 2024 18:35:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnMn5fUbREnDx4XKVy9ssxVEaaZQsMtCb2a2KPZP=y=g@mail.gmail.com>
Message-ID: <CAK7LNAQnMn5fUbREnDx4XKVy9ssxVEaaZQsMtCb2a2KPZP=y=g@mail.gmail.com>
Subject: Re: [PATCH 04/15] kbuild: add generic support for built-in boot DTBs
To: Rob Herring <robh@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_023546_583680_C14345A4 
X-CRM114-Status: GOOD (  34.13  )
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

T24gVGh1LCBTZXAgNSwgMjAyNCBhdCAxMToxN+KAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMDUsIDIwMjQgYXQgMDg6NDc6NDBBTSArMDkw
MCwgTWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+ID4gU29tZSBhcmNoaXRlY3R1cmVzIGVtYmVkIGJv
b3QgRFRCcyBpbiB2bWxpbnV4LiBBIHBvdGVudGlhbCBpc3N1ZSBmb3IKPiA+IHRoZXNlIGFyY2hp
dGVjdHVyZXMgaXMgYSByYWNlIGNvbmRpdGlvbiBkdXJpbmcgcGFyYWxsZWwgYnVpbGRzIGJlY2F1
c2UKPiA+IEtidWlsZCBkZXNjZW5kcyBpbnRvIGFyY2gvKi9ib290L2R0cy8gdHdpY2UuCj4gPgo+
ID4gT25lIGJ1aWxkIHRocmVhZCBpcyBpbml0aWF0ZWQgYnkgdGhlICdkdGJzJyB0YXJnZXQsIHdo
aWNoIGlzIGEKPiA+IHByZXJlcXVpc2l0ZSBvZiB0aGUgJ2FsbCcgdGFyZ2V0IGluIHRoZSB0b3At
bGV2ZWwgTWFrZWZpbGU6Cj4gPgo+ID4gICBpZmRlZiBDT05GSUdfT0ZfRUFSTFlfRkxBVFRSRUUK
PiA+ICAgYWxsOiBkdGJzCj4gPiAgIGVuZGlmCj4gPgo+ID4gRm9yIGFyY2hpdGVjdHVyZXMgdGhh
dCBzdXBwb3J0IHRoZSBlbWJlZGRlZCBib290IGR0YiwgYXJjaC8qL2Jvb3QvZHRzLwo+ID4gaXMg
dmlzaXRlZCBhbHNvIGR1cmluZyB0aGUgb3JkaW5hcnkgZGlyZWN0b3J5IHRyYXZlcnNhbCBpbiBv
cmRlciB0bwo+ID4gYnVpbGQgb2JqLXkgb2JqZWN0cyB0aGF0IHdyYXAgRFRCcy4KPiA+Cj4gPiBT
aW5jZSB0aGVzZSBidWlsZCB0aHJlYWRzIGFyZSB1bmF3YXJlIG9mIGVhY2ggb3RoZXIsIHRoZXkg
Y2FuIHJ1bgo+ID4gc2ltdWx0YW5lb3VzbHkgZHVyaW5nIHBhcmFsbGVsIGJ1aWxkcy4KPiA+Cj4g
PiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgZ2VuZXJpYyBidWlsZCBydWxlIHRvIHNjcmlwdHMv
TWFrZWZpbGUudm1saW51eAo+ID4gdG8gc3VwcG9ydCBlbWJlZGRlZCBib290IERUQnMgaW4gYSBy
YWNlLWZyZWUgd2F5LiBBcmNoaXRlY3R1cmVzIHRoYXQKPiA+IHdhbnQgdG8gdXNlIHRoaXMgcnVs
ZSBuZWVkIHRvIHNlbGVjdCBDT05GSUdfR0VORVJJQ19CVUlMVElOX0RUQi4KPiA+Cj4gPiBBZnRl
ciB0aGUgbWlncmF0aW9uLCBNYWtlZmlsZXMgdW5kZXIgYXJjaC8qL2Jvb3QvZHRzLyB3aWxsIGJl
IHZpc2l0ZWQKPiA+IG9ubHkgb25jZSB0byBidWlsZCBvbmx5ICouZHRiIGZpbGVzLgo+ID4KPiA+
IFRoaXMgY2hhbmdlIGFsc28gYWltcyB0byB1bmlmeSB0aGUgQ09ORklHIG9wdGlvbnMgdXNlZCBm
b3IgZW1iZWRkZWQgRFRCcwo+ID4gc3VwcG9ydC4gQ3VycmVudGx5LCBkaWZmZXJlbnQgYXJjaGl0
ZWN0dXJlcyB1c2UgZGlmZmVyZW50IENPTkZJRyBvcHRpb25zCj4gPiBmb3IgdGhlIHNhbWUgcHVy
cG9zZXMuCj4gPgo+ID4gVGhlIENPTkZJRyBvcHRpb25zIGFyZSB1bmlmaWVkIGFzIGZvbGxvd3M6
Cj4gPgo+ID4gIC0gQ09ORklHX0dFTkVSSUNfQlVJTFRJTl9EVEIKPiA+Cj4gPiAgICBUaGlzIGVu
YWJsZXMgdGhlIGdlbmVyaWMgcnVsZSBmb3IgZW1iZWRkZWQgYm9vdCBEVEJzLiBUaGlzIHdpbGwg
YmUKPiA+ICAgIHJlbmFtZWQgdG8gQ09ORklHX0JVSUxUSU5fRFRCIGFmdGVyIGFsbCBhcmNoaXRl
Y3R1cmVzIG1pZ3JhdGUgdG8gdGhlCj4gPiAgICBnZW5lcmljIHJ1bGUuCj4gPgo+ID4gIC0gQ09O
RklHX0JVSUxUSU5fRFRCX05BTUUKPiA+Cj4gPiAgICBUaGlzIHNwZWNpZmllcyB0aGUgcGF0aCB0
byB0aGUgZW1iZWRkZWQgRFRCLgo+ID4gICAgKHJlbGF0aXZlIHRvIGFyY2gvKi9ib290L2R0cy8p
Cj4gPgo+ID4gIC0gQ09ORklHX0JVSUxUSU5fRFRCX0FMTAo+ID4KPiA+ICAgIElmIHRoaXMgaXMg
ZW5hYmxlZCwgYWxsIERUQiBmaWxlcyBjb21waWxlZCB1bmRlciBhcmNoLyovYm9vdC9kdHMvIGFy
ZQo+ID4gICAgZW1iZWRkZWQgaW50byB2bWxpbnV4LiBPbmx5IHVzZWQgYnkgTUlQUy4KPgo+IEkg
c3RhcnRlZCB0byBkbyB0aGlzIGEgbG9uZyB0aW1lIGFnbywgYnV0IHRoZW4gZGVjaWRlZCB3ZSBk
aWRuJ3Qgd2FudCB0bwo+IGVuY291cmFnZSB0aGlzIGZlYXR1cmUuIElNTyBpdCBzaG91bGQgb25s
eSBiZSBmb3IgbGVnYWN5IGJvb3Rsb2FkZXJzIG9yCj4gZGV2ZWxvcG1lbnQvZGVidWcuIEFuZCBy
ZWFsbHksIGFwcGVuZGVkIERUQiBpcyBtb3JlIGZsZXhpYmxlIGZvciB0aGUKPiBsZWdhY3kgYm9v
dGxvYWRlciBjYXNlLgo+Cj4gSW4gaGluZHNpZ2h0LCBhIGNvbW1vbiBjb25maWcgd291bGQgaGF2
ZSBiZWVuIGVhc2llciB0byBsaW1pdCBuZXcKPiBhcmNoZXMuLi4KPgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+
Cj4gPiAgTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrLQo+ID4gIGRyaXZlcnMv
b2YvS2NvbmZpZyAgICAgICB8ICA2ICsrKysrKwo+ID4gIHNjcmlwdHMvTWFrZWZpbGUudm1saW51
eCB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBzY3Jp
cHRzL2xpbmstdm1saW51eC5zaCAgfCAgNCArKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxl
IGIvTWFrZWZpbGUKPiA+IGluZGV4IDE0NTExMmJmMjgxYS4uMWM3NjVjMTJhYjllIDEwMDY0NAo+
ID4gLS0tIGEvTWFrZWZpbGUKPiA+ICsrKyBiL01ha2VmaWxlCj4gPiBAQCAtMTQxNyw2ICsxNDE3
LDEwIEBAIGlmZGVmIENPTkZJR19PRl9FQVJMWV9GTEFUVFJFRQo+ID4gIGFsbDogZHRicwo+ID4g
IGVuZGlmCj4gPgo+ID4gK2lmZGVmIENPTkZJR19HRU5FUklDX0JVSUxUSU5fRFRCCj4gPiArdm1s
aW51eDogZHRicwo+ID4gK2VuZGlmCj4gPiArCj4gPiAgZW5kaWYKPiA+Cj4gPiAgUEhPTlkgKz0g
c2NyaXB0c19kdGMKPiA+IEBAIC0xNDgzLDcgKzE0ODcsOCBAQCBlbmRpZiAjIENPTkZJR19NT0RV
TEVTCj4gPiAgQ0xFQU5fRklMRVMgKz0gdm1saW51eC5zeW12ZXJzIG1vZHVsZXMtb25seS5zeW12
ZXJzIFwKPiA+ICAgICAgICAgICAgICBtb2R1bGVzLmJ1aWx0aW4gbW9kdWxlcy5idWlsdGluLm1v
ZGluZm8gbW9kdWxlcy5uc2RlcHMgXAo+ID4gICAgICAgICAgICAgIGNvbXBpbGVfY29tbWFuZHMu
anNvbiBydXN0L3Rlc3QgXAo+ID4gLSAgICAgICAgICAgIHJ1c3QtcHJvamVjdC5qc29uIC52bWxp
bnV4Lm9ianMgLnZtbGludXguZXhwb3J0LmMKPiA+ICsgICAgICAgICAgICBydXN0LXByb2plY3Qu
anNvbiAudm1saW51eC5vYmpzIC52bWxpbnV4LmV4cG9ydC5jIFwKPiA+ICsgICAgICAgICAgICAg
ICAuYnVpbHRpbi1kdGJzLWxpc3QgLmJ1aWx0aW4tZHRiLlMKPiA+Cj4gPiAgIyBEaXJlY3Rvcmll
cyAmIGZpbGVzIHJlbW92ZWQgd2l0aCAnbWFrZSBtcnByb3BlcicKPiA+ICBNUlBST1BFUl9GSUxF
UyArPSBpbmNsdWRlL2NvbmZpZyBpbmNsdWRlL2dlbmVyYXRlZCAgICAgICAgICBcCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9vZi9LY29uZmlnIGIvZHJpdmVycy9vZi9LY29uZmlnCj4gPiBpbmRl
eCBkZDcyNmM3MDU2YmYuLjUxNDJlN2Q3ZmVmOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvb2Yv
S2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9vZi9LY29uZmlnCj4gPiBAQCAtMiw2ICsyLDEyIEBA
Cj4gPiAgY29uZmlnIERUQwo+ID4gICAgICAgYm9vbAo+ID4KPiA+ICtjb25maWcgR0VORVJJQ19C
VUlMVElOX0RUQgo+ID4gKyAgICAgYm9vbAo+Cj4gU28gdGhhdCB3ZSBkb24ndCBhZGQgbmV3IGFy
Y2hpdGVjdHVyZXMgdG8gdGhpcywgSSB3b3VsZCBsaWtlIHNvbWV0aGluZwo+IGxpa2U6Cj4KPiAj
IERvIG5vdCBhZGQgbmV3IGFyY2hpdGVjdHVyZXMgdG8gdGhpcyBsaXN0Cj4gZGVwZW5kcyBvbiBN
SVBTIHx8IFJJU0NWIHx8IE1JQ1JPQkxBWkUgLi4uCgoKVGhpcyB3aWxsIG5vdCB3b3JrIGFmdGVy
IDE0LzE1IGlzIGFwcGxpZWQuCgoKRm9yIGV4YW1wbGUsIGlmIGFyY2gvYXJtL0tjb25maWcgaGFz
CgoKY29uZmlnIEJVSUxUSU5fRFRCCiAgICAgIGJvb2wgImVuYWJsZSBCVUlMVElOX0RUQiIKCgpO
byB3YXJuaW5nIGlzIGRpc3BsYXllZC4KCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFt
YWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
