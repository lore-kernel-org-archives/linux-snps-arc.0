Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60677C4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Nov 2023 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Nye0Z2rEZ45yvbxyexbZ0m0s9VI1r1KKxh5Km/RgpA=; b=O0ZKSnWp4K+4UD
	8u8tVh+Mx61aloxlii8rlWvTPyzymibCmZHNWblRwO2SmZwJ6/m0KB+iMiiJ3eleXUT047jSFlmJR
	UHc8ckVCsQEK97RPxYTRuYoPvOUuB7xnBIPYW9sWmw1v9g07gv1NJ9Pqxa0nytvCMQi06oHKDjFTN
	44XAkUhXzlhqOYaKXJcO1jiAuLfXcXI6sM/G1YUf83O6iMz8kfkz5w4hQhSWZncaBftyAHczaH4qq
	PRq2IMLM1TWn3PHJfwO4a3Ha+NvWiTEEu+Xu+85XSYUuASd5mpZaae0iXLcbDGo+V5xO3EdHSElSN
	sp1CZq2HuOetT2VTrXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r00f8-00Gr8C-1I;
	Mon, 06 Nov 2023 14:33:10 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r00f4-00Gr5x-1I;
	Mon, 06 Nov 2023 14:33:07 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-582a82e6d10so1012457eaf.0;
        Mon, 06 Nov 2023 06:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699281182; x=1699885982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdHOkDDDq2uDsqnfkV1g2ITyJ/uBNt8L8qaNucWn9Lg=;
        b=gGe3XtfTZGgmXJcb+3vMhjgJl/6EJxwhaO8ChdezehSCXrFC5ro9FszrOt5ACBpu5I
         ONzG97YmM2RIfk1E4Jy6ESHQPezlXYUmmhI17BUcmoRobRjgtnlnIO35rkc2LtsO71P3
         1dorQDmUDS5PaemvkQyXQvVN7xKM8ZhT7hu14C+7HIEQtFw1StUUaqvO0vSQbV1g54kG
         DBsz/hoUuj76Q9ir7C1qumXJQqqNP09sBr9PW4yG+b1d6tIRs/E1qXMeNwKP73m3LdEN
         Vi6xDrfeAkEohZ+lZdt0dvzY6i/13KYsKRzuL7pfnAekicXOd52IWuCOeROAUM24DYpI
         PItQ==
X-Gm-Message-State: AOJu0YyoUexiUTklwLu9CJtW2mIsDKFyuIOrCMLKzVIZmwjQ8TkAN6D0
	PSpQivy7Ap60/IqUPNsGYorIpsZXYuAbVLNS3Mo=
X-Google-Smtp-Source: AGHT+IHyHB4kzvcjkEhTb+3sUVIPXXX0cO5Y7IiQxSg2gu4OXnnfVIuOscNqmkEqJcDtSiyYa7NRTI4+Cg8Mb+uLm9Y=
X-Received: by 2002:a4a:d68a:0:b0:584:1080:f0a5 with SMTP id
 i10-20020a4ad68a000000b005841080f0a5mr31132550oot.1.1699281182420; Mon, 06
 Nov 2023 06:33:02 -0800 (PST)
MIME-Version: 1.0
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com> <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
In-Reply-To: <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 6 Nov 2023 15:32:51 +0100
Message-ID: <CAJZ5v0hepKO0QKuBF3d38r=7nG0tjTtEwXdPNPv_2jYPnToUsg@mail.gmail.com>
Subject: Re: [PATCH RFC 04/17] acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Krishna Reddy <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, 
	virtualization@lists.linux-foundation.org, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, Zhenhua Huang <quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_063306_441368_78405B4E 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgMywgMjAyMyBhdCA1OjQ14oCvUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZp
ZGlhLmNvbT4gd3JvdGU6Cj4KPiBOb3RoaW5nIG5lZWRzIHRoaXMgcG9pbnRlci4gUmV0dXJuIGEg
bm9ybWFsIGVycm9yIGNvZGUgd2l0aCB0aGUgdXN1YWwKPiBJT01NVSBzZW1hbnRpYyB0aGF0IEVO
T0RFViBtZWFucyAndGhlcmUgaXMgbm8gSU9NTVUgZHJpdmVyJy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9hY3Bp
L3NjYW4uYyB8IDI0ICsrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2FjcGkvc2Nhbi5jIGIvZHJpdmVycy9hY3BpL3NjYW4uYwo+IGluZGV4IGE2ODkxYWQwY2VlZTJj
Li5mYmFiZGUwMDFhMjNhMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gKysr
IGIvZHJpdmVycy9hY3BpL3NjYW4uYwo+IEBAIC0xNTYyLDggKzE1NjIsNyBAQCBzdGF0aWMgaW5s
aW5lIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmFjcGlfaW9tbXVfZndzcGVjX29wcyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gICAgICAgICByZXR1cm4gZndzcGVjID8gZndzcGVjLT5vcHMgOiBOVUxM
Owo+ICB9Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKmFjcGlfaW9tbXVfY29u
ZmlndXJlX2lkKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdTMyICppZF9pbikKPiArc3RhdGlj
IGludCBhY3BpX2lvbW11X2NvbmZpZ3VyZV9pZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHUz
MiAqaWRfaW4pCj4gIHsKPiAgICAgICAgIGludCBlcnI7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qg
aW9tbXVfb3BzICpvcHM7Cj4gQEAgLTE1NzQsNyArMTU3Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaW9tbXVfb3BzICphY3BpX2lvbW11X2NvbmZpZ3VyZV9pZChzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4gICAgICAgICAgKi8KPiAgICAgICAgIG9wcyA9IGFjcGlfaW9tbXVfZndzcGVjX29wcyhkZXYp
Owo+ICAgICAgICAgaWYgKG9wcykKPiAtICAgICAgICAgICAgICAgcmV0dXJuIG9wczsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAgICAgICAgIGVyciA9IGlvcnRfaW9tbXVfY29uZmln
dXJlX2lkKGRldiwgaWRfaW4pOwo+ICAgICAgICAgaWYgKGVyciAmJiBlcnIgIT0gLUVQUk9CRV9E
RUZFUikKPiBAQCAtMTU4OSwxMiArMTU4OCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11
X29wcyAqYWNwaV9pb21tdV9jb25maWd1cmVfaWQoc3RydWN0IGRldmljZSAqZGV2LAo+Cj4gICAg
ICAgICAvKiBJZ25vcmUgYWxsIG90aGVyIGVycm9ycyBhcGFydCBmcm9tIEVQUk9CRV9ERUZFUiAq
Lwo+ICAgICAgICAgaWYgKGVyciA9PSAtRVBST0JFX0RFRkVSKSB7Cj4gLSAgICAgICAgICAgICAg
IHJldHVybiBFUlJfUFRSKGVycik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gICAg
ICAgICB9IGVsc2UgaWYgKGVycikgewo+ICAgICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgIkFk
ZGluZyB0byBJT01NVSBmYWlsZWQ6ICVkXG4iLCBlcnIpOwo+IC0gICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gICAgICAgICB9Cj4g
LSAgICAgICByZXR1cm4gYWNwaV9pb21tdV9md3NwZWNfb3BzKGRldik7Cj4gKyAgICAgICBpZiAo
IWFjcGlfaW9tbXVfZndzcGVjX29wcyhkZXYpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVO
T0RFVjsKPiArICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAgI2Vsc2UgLyogIUNPTkZJR19JT01N
VV9BUEkgKi8KPiBAQCAtMTYyMyw3ICsxNjI0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpb21t
dV9vcHMgKmFjcGlfaW9tbXVfY29uZmlndXJlX2lkKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgaW50
IGFjcGlfZG1hX2NvbmZpZ3VyZV9pZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gZGV2X2RtYV9h
dHRyIGF0dHIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1MzIgKmlucHV0X2lk
KQo+ICB7Cj4gLSAgICAgICBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICppb21tdTsKPiArICAgICAg
IGludCByZXQ7Cj4KPiAgICAgICAgIGlmIChhdHRyID09IERFVl9ETUFfTk9UX1NVUFBPUlRFRCkg
ewo+ICAgICAgICAgICAgICAgICBzZXRfZG1hX29wcyhkZXYsICZkbWFfZHVtbXlfb3BzKTsKPiBA
QCAtMTYzMiwxMCArMTYzMywxNSBAQCBpbnQgYWNwaV9kbWFfY29uZmlndXJlX2lkKHN0cnVjdCBk
ZXZpY2UgKmRldiwgZW51bSBkZXZfZG1hX2F0dHIgYXR0ciwKPgo+ICAgICAgICAgYWNwaV9hcmNo
X2RtYV9zZXR1cChkZXYpOwo+Cj4gLSAgICAgICBpb21tdSA9IGFjcGlfaW9tbXVfY29uZmlndXJl
X2lkKGRldiwgaW5wdXRfaWQpOwo+IC0gICAgICAgaWYgKFBUUl9FUlIoaW9tbXUpID09IC1FUFJP
QkVfREVGRVIpCj4gKyAgICAgICByZXQgPSBhY3BpX2lvbW11X2NvbmZpZ3VyZV9pZChkZXYsIGlu
cHV0X2lkKTsKPiArICAgICAgIGlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBI
aXN0b3JpY2FsbHkgdGhpcyByb3V0aW5lIGRvZXNuJ3QgZmFpbCBkcml2ZXIgcHJvYmluZyBkdWUg
dG8gZXJyb3JzCj4gKyAgICAgICAgKiBpbiBhY3BpX2lvbW11X2NvbmZpZ3VyZSgpCj4gKyAgICAg
ICAgKi8KPiArCj4gICAgICAgICBhcmNoX3NldHVwX2RtYV9vcHMoZGV2LCAwLCBVNjRfTUFYLCBh
dHRyID09IERFVl9ETUFfQ09IRVJFTlQpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIu
NDIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
