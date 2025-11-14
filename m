Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AA1CE7B11
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRfFniv1mDCb0/Vr4XZUnn/z7D7kF2mFt13RhYNi5/k=; b=V/SbbQi0+I6FT9
	75+qTd9aW9d6W1/gTe3a0R3d05zRCPsiLS9RPnIyoD/7xjFsfQi3VeyKAh/y+JNK4DDnhPllzueG+
	I59ghAJ5BGeRToHJ9M2xE8fBOMS+2laetp3shI5GSaoszFfx3+J1MlPlJ5r0YrFQrVvWG3kPOLj8D
	zrAl8FGsB3KZG/lGroNK77V1bYmQIPftMfsCwFfCG7AyPFplQ8YD+RY3OqWA9T8kRTiYRJKI5Z9C2
	7OqjK9bex0SM+LVVK7GwOrp0pZZGAO3KkcOAjFMGZYqr2a/1Bux5zM6icn1VSO5hAHuqPMdSTlEqh
	PXFd4mRP66/TAOCNPU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJucv-0000000CLWp-3XPC;
	Fri, 14 Nov 2025 14:18:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJucs-0000000CLUp-3INQ
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 14:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BB2E41AB0
	for <linux-snps-arc@lists.infradead.org>; Fri, 14 Nov 2025 14:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0703DC2BC9E
	for <linux-snps-arc@lists.infradead.org>; Fri, 14 Nov 2025 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129889;
	bh=FAWHKTbojrVdbFJ8884Lh9DTaMatsBJR+ahGaIp46Mc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p6kGJMPGPO4zhpMUmlK1tkVdWLKi0QGIypBU+p95zDqcd+pZowWKhEf6ejWqW4yoZ
	 ppDZobHsg4oFBstR9nfLvP7LotZhd03W0gLFcgXkdbIl9gzSd8NzEtcmAKiX8JNkEq
	 AkfuN0V/0mNO/ac65VkYiv5phg2ILI8Y4QOjMVL4KPqgSEuDas+wGNlmtQk/xTdxZB
	 LAhoMr1qcbKLx+FqvqyKVAQfLmhOZ+LqeNleJvo7L9SmaaqrZwafDKouEuEOKyWY8A
	 bjynM/Z2VdSW/VCRw9yYO3zav1+Un7AYJtdn5oQHqA28L5S0Dgb0JOQortqUBXJCOk
	 6QZCfGCd7yKPQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b71397df721so266518166b.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 14 Nov 2025 06:18:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfXU5xH36u5u7qXYwUAujZfcaq09RiMboPoJCZ2/WeKQlUqQ2gLZgFW6X07BQYcMA3BtRq5oiLg+KOAx1khA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB+i/Eh1o25thgkLRNdJChknk2oDSK0AP4/apSSKdZGLZIvDKz
	A6qOYQMPovLjWqxyV0nq+0Qx6iRBrWIEK5fgm3CesU3bf5HZmkGAycd/qANfJCcyvOyR++ilGY4
	bI8j62i1sN+bCubi5Xu5OPfLIvbKt960=
X-Google-Smtp-Source: AGHT+IH2APpWlx01lvRmsEjk25T/BroXvRMmdJoqcqdhkk/l43ih7kDnYxsJFdqG1+mvDKp0yNH6Z0TrYw4LGkrxjmI=
X-Received: by 2002:a17:907:748:b0:b70:b661:cfcb with SMTP id
 a640c23a62f3a-b73678ee3a8mr261903966b.31.1763129887364; Fri, 14 Nov 2025
 06:18:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com> <146b5a0207052b38d04caac6b20756a61c2189b3.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <146b5a0207052b38d04caac6b20756a61c2189b3.1763117269.git.zhengqi.arch@bytedance.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Nov 2025 22:17:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
X-Gm-Features: AWmQ_bnB_yOPM8We43AKxCyF0R_mmEJVAbU9qloFW-YqOpGJ4QJ0yARhVtFDLLs
Message-ID: <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
Subject: Re: [PATCH 3/7] loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	WANG Xuerui <kernel@xen0n.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061810_870780_2AF4456B 
X-CRM114-Status: GOOD (  16.85  )
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

SGksIFFpIFpoZW5nLAoKV2UgdXN1YWxseSB1c2UgTG9vbmdBcmNoIHJhdGhlciB0aGFuIGxvb25n
YXJjaCwgYnV0IGlmIHlvdSB3YW50IHRvCmtlZXAgY29uc2lzdGVuY3kgZm9yIGFsbCBwYXRjaGVz
LCBqdXN0IGRvIGl0LgoKT24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgNzoxM+KAr1BNIFFpIFpoZW5n
IDxxaS56aGVuZ0BsaW51eC5kZXY+IHdyb3RlOgo+Cj4gRnJvbTogUWkgWmhlbmcgPHpoZW5ncWku
YXJjaEBieXRlZGFuY2UuY29tPgo+Cj4gT24gYSA2NC1iaXQgc3lzdGVtLCBtYWR2aXNlKE1BRFZf
RE9OVE5FRUQpIG1heSBjYXVzZSBhIGxhcmdlIG51bWJlciBvZgo+IGVtcHR5IFBURSBwYWdlIHRh
YmxlIHBhZ2VzIChzdWNoIGFzIDEwMEdCKykuIFRvIHJlc29sdmUgdGhpcyBwcm9ibGVtLAo+IGZp
cnN0IGVuYWJsZSBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFIHRvIHByZXBhcmUgZm9yIGVuYWJs
aW5nIHRoZQo+IFBUX1JFQ0xBSU0gZmVhdHVyZSwgd2hpY2ggcmVzb2x2ZXMgdGhpcyBwcm9ibGVt
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29t
Pgo+IENjOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgo+IENjOiBXQU5HIFh1
ZXJ1aSA8a2VybmVsQHhlbjBuLm5hbWU+Cj4gLS0tCj4gIGFyY2gvbG9vbmdhcmNoL0tjb25maWcg
ICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ2FsbG9j
LmggfCA2ICsrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9LY29uZmlnIGIvYXJjaC9s
b29uZ2FyY2gvS2NvbmZpZwo+IGluZGV4IDViMTExNjczM2Q4ODEuLjNiZjJmMmE5Y2Q2NDcgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+ICsrKyBiL2FyY2gvbG9vbmdhcmNo
L0tjb25maWcKPiBAQCAtMjEwLDYgKzIxMCw3IEBAIGNvbmZpZyBMT09OR0FSQ0gKPiAgICAgICAg
IHNlbGVjdCBVU0VSX1NUQUNLVFJBQ0VfU1VQUE9SVAo+ICAgICAgICAgc2VsZWN0IFZEU09fR0VU
UkFORE9NCj4gICAgICAgICBzZWxlY3QgWk9ORV9ETUEzMgo+ICsgICAgICAgc2VsZWN0IE1NVV9H
QVRIRVJfUkNVX1RBQkxFX0ZSRUUKUGxlYXNlIHVzZSBhbHBoYS1iZXRpY2FsIG9yZGVyLgoKPgo+
ICBjb25maWcgMzJCSVQKPiAgICAgICAgIGJvb2wKPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2Fy
Y2gvaW5jbHVkZS9hc20vcGdhbGxvYy5oIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vcGdh
bGxvYy5oCj4gaW5kZXggMWM2M2E5ZDlhNmQzNS4uMDUzOWQwNGJmMTUyNSAxMDA2NDQKPiAtLS0g
YS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiArKysgYi9hcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiBAQCAtNzksNyArNzksOCBAQCBzdGF0aWMgaW5s
aW5lIHBtZF90ICpwbWRfYWxsb2Nfb25lKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBs
b25nIGFkZHJlc3MpCj4gICAgICAgICByZXR1cm4gcG1kOwo+ICB9Cj4KPiAtI2RlZmluZSBfX3Bt
ZF9mcmVlX3RsYih0bGIsIHgsIGFkZHIpICAgcG1kX2ZyZWUoKHRsYiktPm1tLCB4KQo+ICsjZGVm
aW5lIF9fcG1kX2ZyZWVfdGxiKHRsYiwgeCwgYWRkcikgICBcCj4gKyAgICAgICB0bGJfcmVtb3Zl
X3B0ZGVzYygodGxiKSwgdmlydF90b19wdGRlc2MoeCkpCkkgdGhpbmsgd2UgY2FuIGRlZmluZSBp
dCBpbiBvbmUgbGluZS4KCj4KPiAgI2VuZGlmCj4KPiBAQCAtOTksNyArMTAwLDggQEAgc3RhdGlj
IGlubGluZSBwdWRfdCAqcHVkX2FsbG9jX29uZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZyBhZGRyZXNzKQo+ICAgICAgICAgcmV0dXJuIHB1ZDsKPiAgfQo+Cj4gLSNkZWZpbmUg
X19wdWRfZnJlZV90bGIodGxiLCB4LCBhZGRyKSAgIHB1ZF9mcmVlKCh0bGIpLT5tbSwgeCkKPiAr
I2RlZmluZSBfX3B1ZF9mcmVlX3RsYih0bGIsIHgsIGFkZHIpICAgXAo+ICsgICAgICAgdGxiX3Jl
bW92ZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHgpKQpUaGUgc2FtZS4KCk90aGVyIHBh
dGNoZXMgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtLgoKSHVhY2FpCgo+Cj4gICNlbmRpZiAvKiBfX1BB
R0VUQUJMRV9QVURfRk9MREVEICovCj4KPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
