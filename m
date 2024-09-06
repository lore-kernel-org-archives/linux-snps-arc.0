Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F34CE7AA6
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Sep 2024 00:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBcOcAQPuNj0Ko/iWxpKpRrWdfRdlk8OasTWmM6Pczs=; b=ar1Py6NJo9xB/U
	8ys8BanMBqP03XiGXp1QxegPZlM4/daVbWtngc7tOmqxOqT11cijrpu/29nUU058C3hKb3UyvTGZc
	PR+ZmXAd43g/YNysZXfnD+YkllmfOLexernaFDApHhI4p8YOuqG3wq9a2DMRH1auFkRaS5+DdsSJB
	Swi0wE3hJpaSo74u7TK1Mx08V5jTdX4pLOBISIRb1FALZGyX7lD3BnbaMsJSZ0pCeZe8EHriIIra0
	/XTXOUy/cGg68SmngHgk63Wmfg5yNM1dXvrN60sDzX101N9r8Dso+RtBD+H4hFsTSwFxH0V7QELek
	kyZxe1p1EcTWWfPqq9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smMpQ-0000000ACRi-3dQ0;
	Fri, 06 Sep 2024 00:27:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smMpN-0000000ACR8-2kem
	for linux-snps-arc@lists.infradead.org;
	Fri, 06 Sep 2024 00:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 639C3A43832
	for <linux-snps-arc@lists.infradead.org>; Fri,  6 Sep 2024 00:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F60AC4CEC5
	for <linux-snps-arc@lists.infradead.org>; Fri,  6 Sep 2024 00:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725582472;
	bh=K6wrMA4NMaFGP3Sp4vPuMOOJ9z42CsYsjU+yH0k9ZpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rOwVxMUDAoXw5SklKVcoMdydUgoE4tk0T3VLu7rhVnOSII9MTQcVpt3Mq6X4bZb7v
	 kPPu+HWw2WxGF6UXBpC1fYcQJutF4XD3aOFuan5GSAy529cwBq5zVYnkR+4D5IKnOO
	 e9MkFI1cRjZ6hUGQyqoPDKY0lZYN6sc8x/WafGh1wdi1HeK6e7LjylwpwqyIXvG0kQ
	 6RVVoymO+D6WddBCPvgSzjuK609lqstj+BXismhUT9t4LjLH+N83RdD+7DM0sJckxD
	 S5+vrNVSBlDc23DA3kJYxXe44ac1DgPer1vZCDMOehUT7w7r4NZGHb405u28pWxdTX
	 6jYGs3ZXqn7kA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so13492731fa.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 05 Sep 2024 17:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr8fljgZ9V//dySQB5CnaU4GJDR68AHkAn7hJeK8/2BFFsLDn848AqLn6V86Fsj6TjzOEvhg5LU6a8Mq1Png==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1pd264cYcfDgnjEvWWfX8Maa77iz7t7MRaG7O4oXjV7em0TKM
	9bL5QPFrcGy1nYhwoiEwkF3+Be3zkay9K9qhXFFhau2WIsOe7DQLgVvdp04jinaNhFYyM0+i4Fn
	BEx6gJljIinWaXl3Mf/2K1t6630Y=
X-Google-Smtp-Source: AGHT+IECEJXsJFKh8FBdQC2eV1kk62AdTyv6v0z/HVmN55+fHGg4x6UhGG8hEo+Rv28CTDwPO53RFRQNS5OnAybvF2s=
X-Received: by 2002:a05:651c:545:b0:2f5:66a:627 with SMTP id
 38308e7fff4ca-2f657a9793emr24818091fa.0.1725582471070; Thu, 05 Sep 2024
 17:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240904234803.698424-1-masahiroy@kernel.org> <20240904234803.698424-15-masahiroy@kernel.org>
 <20240905143850.GD1517132-robh@kernel.org>
In-Reply-To: <20240905143850.GD1517132-robh@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Sep 2024 09:27:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbhsgMyo--WrvLaUyaJQdAFrpS48L_E=T1MVgvZhB4Bw@mail.gmail.com>
Message-ID: <CAK7LNASbhsgMyo--WrvLaUyaJQdAFrpS48L_E=T1MVgvZhB4Bw@mail.gmail.com>
Subject: Re: [PATCH 14/15] kbuild: rename CONFIG_GENERIC_BUILTIN_DTB to CONFIG_BUILTIN_DTB
To: Rob Herring <robh@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_172753_844827_A03C0F78 
X-CRM114-Status: GOOD (  20.57  )
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

T24gVGh1LCBTZXAgNSwgMjAyNCBhdCAxMTozOOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMDUsIDIwMjQgYXQgMDg6NDc6NTBBTSArMDkw
MCwgTWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+ID4gTm93IHRoYXQgYWxsIGFyY2hpdGVjdHVyZXMg
aGF2ZSBtaWdyYXRlZCB0byB0aGUgZ2VuZXJpYyBidWlsdC1pbgo+ID4gRFRCIHN1cHBvcnQsIHRo
ZSBHRU5FUklDXyBwcmVmaXggaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgo+ID4gLS0tCj4g
Pgo+ID4gIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ICBh
cmNoL2FyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgYXJjaC9sb29u
Z2FyY2gvS2NvbmZpZyAgICAgICAgICAgICAgIHwgMSAtCj4gPiAgYXJjaC9taWNyb2JsYXplL0tj
b25maWcgICAgICAgICAgICAgIHwgMiArLQo+ID4gIGFyY2gvbWlwcy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICB8IDEgLQo+ID4gIGFyY2gvbmlvczIvcGxhdGZvcm0vS2NvbmZpZy5wbGF0Zm9y
bSB8IDEgLQo+ID4gIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgICAgICAgICAgICAgICB8IDIgKy0K
PiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAxIC0KPiA+ICBhcmNo
L3NoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiA+ICBhcmNoL3h0ZW5zYS9L
Y29uZmlnICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9vZi9LY29uZmlnICAg
ICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIHNjcmlwdHMvTWFrZWZpbGUudm1saW51eCAgICAg
ICAgICAgICB8IDIgKy0KPiA+ICBzY3JpcHRzL2xpbmstdm1saW51eC5zaCAgICAgICAgICAgICAg
fCAyICstCj4gPiAgMTMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcgYi9hcmNoL2xv
b25nYXJjaC9LY29uZmlnCj4gPiBpbmRleCBlMWQzZTVmYjZmZDIuLjcwZjE2OTIxMGI1MiAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKPiA+ICsrKyBiL2FyY2gvbG9vbmdh
cmNoL0tjb25maWcKPiA+IEBAIC0zODgsNyArMzg4LDYgQEAgZW5kY2hvaWNlCj4gPiAgY29uZmln
IEJVSUxUSU5fRFRCCj4gPiAgICAgICBib29sICJFbmFibGUgYnVpbHQtaW4gZHRiIGluIGtlcm5l
bCIKPiA+ICAgICAgIGRlcGVuZHMgb24gT0YKPiA+IC0gICAgIHNlbGVjdCBHRU5FUklDX0JVSUxU
SU5fRFRCCj4gPiAgICAgICBoZWxwCj4gPiAgICAgICAgIFNvbWUgZXhpc3Rpbmcgc3lzdGVtcyBk
byBub3QgcHJvdmlkZSBhIGNhbm9uaWNhbCBkZXZpY2UgdHJlZSB0bwo+ID4gICAgICAgICB0aGUg
a2VybmVsIGF0IGJvb3QgdGltZS4gTGV0J3MgcHJvdmlkZSBhIGRldmljZSB0cmVlIHRhYmxlIGlu
IHRoZQo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9wbGF0Zm9ybS9LY29uZmlnLnBsYXRm
b3JtIGIvYXJjaC9uaW9zMi9wbGF0Zm9ybS9LY29uZmlnLnBsYXRmb3JtCj4gPiBpbmRleCBjNzVj
YWRkOTIzODguLjVmMGNmNTUxYjVjYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvbmlvczIvcGxhdGZv
cm0vS2NvbmZpZy5wbGF0Zm9ybQo+ID4gKysrIGIvYXJjaC9uaW9zMi9wbGF0Zm9ybS9LY29uZmln
LnBsYXRmb3JtCj4gPiBAQCAtMzgsNyArMzgsNiBAQCBjb25maWcgTklPUzJfRFRCX1BIWVNfQURE
Ugo+ID4gIGNvbmZpZyBCVUlMVElOX0RUQgo+ID4gICAgICAgYm9vbCAiQ29tcGlsZSBhbmQgbGlu
ayBkZXZpY2UgdHJlZSBpbnRvIGtlcm5lbCBpbWFnZSIKPiA+ICAgICAgIGRlcGVuZHMgb24gIUNP
TVBJTEVfVEVTVAo+ID4gLSAgICAgc2VsZWN0IEdFTkVSSUNfQlVJTFRJTl9EVEIKPgo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBA
IC0xMTEwLDcgKzExMTAsNiBAQCBjb25maWcgUklTQ1ZfSVNBX0ZBTExCQUNLCj4gPiAgY29uZmln
IEJVSUxUSU5fRFRCCj4gPiAgICAgICBib29sICJCdWlsdC1pbiBkZXZpY2UgdHJlZSIKPiA+ICAg
ICAgIGRlcGVuZHMgb24gT0YgJiYgTk9OUE9SVEFCTEUKPgo+IEh1bW0sIG1heWJlIHRoaXMgTk9O
UE9SVEFCTEUgb3B0aW9uIGNvdWxkIGJlIGNvbW1vbiBhbmQgdXNlZCB0bwo+IGFjY29tcGxpc2gg
d2hhdCBJIHdhbnQgaGVyZS4uLgoKCgpJIGRvIG5vdCBrbm93IGhvdyB0aGlzIGNhbiBwcmV2ZW50
IG5ldyBhcmNoaXRlY3R1cmVzIGZyb20gZW5hYmxpbmcKQlVJTFRJTl9EVEIuCgpOZXcgYXJjaGl0
ZWN0dXJlcyBjYW4gc2VsZWN0IEJVSUxUSU5fRFRCIHRvZ2V0aGVyIHdpdGggTk9OUE9SVEFCTEUu
CgoKCj4gPiAtICAgICBzZWxlY3QgR0VORVJJQ19CVUlMVElOX0RUQgo+Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9zaC9LY29uZmlnIGIvYXJjaC9zaC9LY29uZmlnCj4gPiBpbmRleCAzYjc3MjM3ODc3
M2YuLmIwOTAxOWNkODdkNCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvc2gvS2NvbmZpZwo+ID4gKysr
IGIvYXJjaC9zaC9LY29uZmlnCj4gPiBAQCAtNjQ4LDcgKzY0OCw2IEBAIGNvbmZpZyBCVUlMVElO
X0RUQgo+ID4gICAgICAgYm9vbCAiVXNlIGJ1aWx0aW4gRFRCIgo+ID4gICAgICAgZGVmYXVsdCBu
Cj4gPiAgICAgICBkZXBlbmRzIG9uIFNIX0RFVklDRV9UUkVFCj4gPiAtICAgICBzZWxlY3QgR0VO
RVJJQ19CVUlMVElOX0RUQgo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9LY29uZmlnIGIv
ZHJpdmVycy9vZi9LY29uZmlnCj4gPiBpbmRleCA1MTQyZTdkN2ZlZjguLjUzYTIyN2NhM2EzYyAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvb2YvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9vZi9L
Y29uZmlnCj4gPiBAQCAtMiw3ICsyLDcgQEAKPiA+ICBjb25maWcgRFRDCj4gPiAgICAgICBib29s
Cj4gPgo+ID4gLWNvbmZpZyBHRU5FUklDX0JVSUxUSU5fRFRCCj4gPiArY29uZmlnIEJVSUxUSU5f
RFRCCj4gPiAgICAgICBib29sCj4KPiBJJ20gY29uZnVzZWQuIFdlIGNhbid0IGhhdmUgdGhlIHNh
bWUgY29uZmlnIG9wdGlvbiB0d2ljZSwgY2FuIHdlPwoKCldlIGNhbi4KCgpEb2N1bWVudGF0aW9u
L2tidWlsZC9rY29uZmlnLWxhbmd1YWdlLnJzdCBzYXlzOgoKICBBIGNvbmZpZyBvcHRpb24gY2Fu
IGJlIGRlZmluZWQgbXVsdGlwbGUgdGltZXMgd2l0aCB0aGUgc2FtZQogIG5hbWUsIGJ1dCBldmVy
eSBkZWZpbml0aW9uIGNhbiBoYXZlIG9ubHkgYSBzaW5nbGUgaW5wdXQgcHJvbXB0IGFuZCB0aGUK
ICB0eXBlIG11c3Qgbm90IGNvbmZsaWN0LgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlh
bWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
