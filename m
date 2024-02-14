Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C14C4829D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Feb 2024 05:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/sPndxcPqq3/024fJdnx3xJLtzKulWHCD8tokjug4g=; b=XIbtQMYymqS7/8
	fHTsKF+KHv0lTI54iCDnVgG6/5whLuWmPsKHGjC68o52T9VpVKUywnTHmQKWEEbe0xE8KY0ReNIS4
	nOPNk8y5BWH+EghduM0SGhhH+aO7hHBzPdHCXvsFrEyXsKlauY2KZ8A/NiNh5yjDFoDVnX5T4WZT2
	wQLm7SdKCsX5dRYAz7qKVMaYcTKU6SWRPwAvyo3hlmnaSZMIZnnvkMxAj61ZJY+bbHFj/End2UstI
	h3Du8M3QfG19OH2G2gUcVHOcp/bBzTvFxxAidZUOQUmkiYd51cQYrA4VOpOen/J9bahpfBkg0eXBt
	6zK9WpJDemw+aegGsOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8D6-0000000BuWI-1n7a;
	Wed, 14 Feb 2024 05:53:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra8D3-0000000BuVI-1ghR
	for linux-snps-arc@lists.infradead.org;
	Wed, 14 Feb 2024 05:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBD516173D;
	Wed, 14 Feb 2024 05:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8255C433C7;
	Wed, 14 Feb 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707890007;
	bh=i+oBjkiIakyu8O+RQOZUmMkml3yTxI6Ats67urmuOxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NDl2HzV4PoDw40sxOZ2gUoBKvxAHJ5zt59qxYHDQSnzWV6D+6hSpYHJs1jmROnUaz
	 686MzwXSCvBGKqFob4GqAmxIWM5oIOVCTOHTC56gcHCbuAKS1E/gXZhXzL25VQAt3j
	 J/9zBO1vNms0DWXxlGd4Tm3LSRV+Qu69JHL3qrM/Z3tZXtzEnAJV+G2wQWfUhX+xqr
	 nXyryGUea5tOrN4vtCFbSurAHf5ZCDU0rqLFmqQHYXBLFUCiLvY1U+K5L0oTd4LEeQ
	 8VJHxWmeifr4DvDC4Sn3NDDLCANrDI5afXo14d4A0lnl8mV+wkSyNQBQ7iFkmiZWtn
	 bqKk+k8NDEKQA==
Message-ID: <fe094c1e-805d-4ab2-82f2-b311f1432e14@kernel.org>
Date: Tue, 13 Feb 2024 21:53:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v1] ARC: Add eBPF JIT support
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Shahab Vahedi <list+bpf@vahedi.org>
Cc: bpf <bpf@vger.kernel.org>, Shahab Vahedi <shahab@synopsys.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <20240213131946.32068-1-list+bpf@vahedi.org>
 <CAADnVQLvh3dd5tXcJnKJis9bJZNV-_dR203PXVyrubZHBuU2_Q@mail.gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <CAADnVQLvh3dd5tXcJnKJis9bJZNV-_dR203PXVyrubZHBuU2_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_215329_509368_2403637A 
X-CRM114-Status: GOOD (  11.72  )
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

K0NDIEJqb3JuCgpPbiAyLzEzLzI0IDE4OjM5LCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4g
T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgNToyMOKAr0FNIFNoYWhhYiBWYWhlZGkgPGxpc3QrYnBm
QHZhaGVkaS5vcmc+IHdyb3RlOgo+PiBGcm9tOiBTaGFoYWIgVmFoZWRpIDxzaGFoYWJAc3lub3Bz
eXMuY29tPgo+Pgo+PiBUaGlzIHdpbGwgYWRkIGVCUEYgSklUIHN1cHBvcnQgdG8gdGhlIDMyLWJp
dCBBUkN2MiBwcm9jZXNzb3JzLiBUaGUKPj4gaW1wbGVtZW50YXRpb24gaXMgcXVhbGlmaWVkIGJ5
IHJ1bm5pbmcgdGhlIEJQRiB0ZXN0cyBvbiBhIFN5bm9wc3lzIEhTREsKPj4gYm9hcmQgd2l0aCAi
QVJDIEhTMzggdjIuMWMgYXQgNTAwIE1IeiIgYXMgdGhlIDQtY29yZSBDUFUuCj4gLi4uCj4+IFNp
Z25lZC1vZmYtYnk6IFNoYWhhYiBWYWhlZGkgPHNoYWhhYkBzeW5vcHN5cy5jb20+Cj4+IC0tLQo+
PiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvbmV0LnJzdCB8ICAgIDEgKwo+PiAg
RG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2ZpbHRlci5yc3QgICAgICB8ICAgIDQgKy0KPj4gIGFy
Y2gvYXJjL0tidWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4gIGFyY2gv
YXJjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4gIGFyY2gvYXJj
L25ldC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgICA2ICsKPj4gIGFyY2gvYXJjL25l
dC9icGZfaml0LmggICAgICAgICAgICAgICAgICAgfCAgMTYxICsrCj4+ICBhcmNoL2FyYy9uZXQv
YnBmX2ppdF9hcmN2Mi5jICAgICAgICAgICAgIHwgMzAwMSArKysrKysrKysrKysrKysrKysrKysr
Cj4+ICBhcmNoL2FyYy9uZXQvYnBmX2ppdF9jb3JlLmMgICAgICAgICAgICAgIHwgMTQyNSArKysr
KysrKysrCj4+ICA4IGZpbGVzIGNoYW5nZWQsIDQ1OTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiBUaGlzIGlzIHByZXR0eSBjb29sIHRvIHNlZS4KPiBJJ20gYXNzdW1pbmcgdGhpcyB3
aWxsIGdldCByZXZpZXdlZCBhbmQgd2lsbCBnbyB0aHJvdWdoIGFyYy5naXQgdHJlZS4KCkknZCBi
ZSBoYXBweSB0byB0YWtlIGl0IHZpYSBBUkMgdHJlZSBhbmQgY2FuIHJldmlldyBzb21lIG9mIHRo
ZSBhcmNoCnNwZWNpZmljIGJpdHMsIGJ1dCBJJ2QgaG9wZSBCUEYgZm9sa3MgYWxzbyByZXZpZXcg
aXQgY3JpdGljYWxseS4KClRoeCwKLVZpbmVldAoKPiBDb3VsZCB5b3Ugc2hhcmUgcGVyZm9ybWFu
Y2UgbnVtYmVycyBpbnRlcnByZXRlciB2cyBKSVRlZCA/CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
