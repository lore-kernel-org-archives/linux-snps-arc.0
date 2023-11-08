Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AAFC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 18:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/KFmGqiVZ/7LosbcDSIYq+GW8l/Gef6YqUTB/AzqYo=; b=iJ3w3Yqp2PeGkv
	2X/0Mn0PyzBafj7A6EVn/2BzZJ6Jx+GbUSJXl+KO0aB3Up6AIXUXT4TY8/PP16PQOoN6qyE7A3b8t
	CEMBJNAJ2t7vAZ19kZc6qlUKeFWiEdnNXRhe6ycCvUK28g+vW/6GsSDHevpmY7fF8BxfaqAfqAWcn
	q9SFhVRdmTTpagYZ4sGpInYPdBkutnVY0I4damKIW+K9RlZ8osjkUkQs9oG398E2Rsdv/bCEWnNM7
	BxHkggy/B0g0UqAO+iFL4lRsjOm4Eq35sKGxgXBMadDL5f/aJNWnJ2k4WqWxNFcDIayF+njjt1pEx
	dx6eZsns/KtdKnfA9j7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0n35-004T63-0i;
	Wed, 08 Nov 2023 18:13:07 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0n31-004T4N-2v
	for linux-snps-arc@lists.infradead.org;
	Wed, 08 Nov 2023 18:13:05 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso95416981fa.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 08 Nov 2023 10:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699467180; x=1700071980; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XyM6VQ+HEN7IzJJ5bMoPN5/yYHnG+EAx9sBxv2Z/Ai8=;
        b=ZRkUJXz8o687C1uzHcNdUCyGxWD2KRvByweO4Ma1FQKobaX0srkrtxbClihd4clEmM
         cFIcOLRuTqdGWc/RFSJhvNwUequzVFi/5Lr9OBtA3dJpuZIH9t1gqS2efeB/uvH4fZ58
         920CRVhbgeLSK2BMIwvAxzLni31xJyeIAo+aJKnpMsquXc9wbLa3lw5k0vhrwLepR4FT
         YFwbD7zhXwVLlh6piX/svpSvISFytPvyn9+xe0O9CdFBUx2hTWg8Royq67EiW/Do/irE
         lCaw7gFcLXy1g0xP+IFxYsIg06qtma8SFNcMe1CYBcSAlSspvqA5487SHEcjpa5MiCxQ
         0tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699467180; x=1700071980;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyM6VQ+HEN7IzJJ5bMoPN5/yYHnG+EAx9sBxv2Z/Ai8=;
        b=VxB6W+OMaG2eD6WXg5/mz0B0Ju0PYMdjZkYyhAHutbcdW9NMwn+nnXxpmt1wwZgO3K
         HHrrP41srQWNnbLmBN60ghG+GW3WbHFWB6w+kZBXv1AllWcJuFd1OebTgzykBUTdb6Ap
         4grEeYVawfEKcL629aIJiWI0vO6YdGKFMgpzluq65GGBv728HjsOcDemow7SGl5MeUiL
         9dJEgYo2prtlB36G3RgXNPI83bk9JtJCknNFYYKCMBz6G0qAlqX2bicHiwb0WWuTK9HX
         4poI8OAZBQeMsRk9H2bcRDHMoPCEw6aSN98PYcTH8ioDXB9fbCWy6L4P4qAVJQ5tQwLH
         vChQ==
X-Gm-Message-State: AOJu0YxHnY348BFXo6Llso09Uq2zQKyBVha/tva07wQpa6wQK32+rmLp
	w/FLPrOPWJSkRERHS0QswRDCqw==
X-Google-Smtp-Source: AGHT+IEAPIM/7orU2/kUz+9e+TY8CYDTNJKLdVzPi+Pze4e6FKjzPA1Tq2W37LpeXm1IyotL7oPMlg==
X-Received: by 2002:a2e:8e7b:0:b0:2c5:582:fd8d with SMTP id t27-20020a2e8e7b000000b002c50582fd8dmr2179335ljk.30.1699467179768;
        Wed, 08 Nov 2023 10:12:59 -0800 (PST)
Received: from [10.1.1.118] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id d20-20020a05600c4c1400b003fd2d3462fcsm739766wmp.1.2023.11.08.10.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:12:58 -0800 (PST)
Message-ID: <e57f11915745674521b8c73d88a198a0b9c32c21.camel@linaro.org>
Subject: Re: [PATCH RFC 12/17] iommu: Make iommu_ops_from_fwnode() static
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
 acpica-devel@lists.linuxfoundation.org,  Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>,  Dexuan Cui <decui@microsoft.com>,
 devicetree@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,  Frank
 Rowand <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Christoph Hellwig <hch@lst.de>,
 iommu@lists.linux.dev,  Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org,  linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org,  linux-snps-arc@lists.infradead.org,
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore
 <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>,  Robin Murphy
 <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter
 <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy
 <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, 
 virtualization@lists.linux-foundation.org, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Date: Wed, 08 Nov 2023 18:12:56 +0000
In-Reply-To: <12-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
References: <12-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
User-Agent: Evolution 3.48.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_101303_949130_D9B2088F 
X-CRM114-Status: GOOD (  13.32  )
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

SGkgSmFzb24sCgpPbiBGcmksIDIwMjMtMTEtMDMgYXQgMTM6NDQgLTAzMDAsIEphc29uIEd1bnRo
b3JwZSB3cm90ZToKPiBUaGVyZSBhcmUgbm8gZXh0ZXJuYWwgY2FsbGVycyBub3cuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4KPiAtLS0KPiDCoGRy
aXZlcnMvaW9tbXUvaW9tbXUuYyB8IDMgKystCj4gwqBpbmNsdWRlL2xpbnV4L2lvbW11LmggfCA2
IC0tLS0tLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYyBiL2RyaXZlcnMvaW9t
bXUvaW9tbXUuYwo+IGluZGV4IDYyYzgyYTI4Y2Q1ZGIzLi5iZWNkMWI4ODFlNjJkYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L2lvbW11
LmMKPiBAQCAtMjk0NSw3ICsyOTQ1LDggQEAgYm9vbCBpb21tdV9kZWZhdWx0X3Bhc3N0aHJvdWdo
KHZvaWQpCj4gwqB9Cj4gwqBFWFBPUlRfU1lNQk9MX0dQTChpb21tdV9kZWZhdWx0X3Bhc3N0aHJv
dWdoKTsKPiDCoAo+IC1jb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICppb21tdV9vcHNfZnJvbV9md25v
ZGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUKPiAqZndub2RlKQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGlvbW11X29wcyAqCj4gK2lvbW11X29wc19mcm9tX2Z3bm9kZShzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqZndub2RlKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgaW9tbXVfb3Bz
ICpvcHMgPSBOVUxMOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW9tbXVfZGV2aWNlICppb21t
dTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5oIGIvaW5jbHVkZS9saW51eC9p
b21tdS5oCj4gaW5kZXggMjdlNDYwNWQ0OTg4NTAuLjM3OTQ4ZWVlOGQ3Mzk0IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvaW9tbXUuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaW9tbXUuaAo+
IEBAIC03MDEsNyArNzAxLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGlvbW11X2Z3c3BlY19mcmVl
KHN0cnVjdAo+IGRldmljZSAqZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqBkZXYtPmlvbW11LT5md3Nw
ZWMgPSBOVUxMOwo+IMKgfQo+IMKgaW50IGlvbW11X2Z3c3BlY19hZGRfaWRzKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdTMyICppZHMsIGludCBudW1faWRzKTsKPiAtY29uc3Qgc3RydWN0IGlvbW11X29w
cyAqaW9tbXVfb3BzX2Zyb21fZndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlCj4gKmZ3bm9kZSk7
Cj4gwqBpbnQgaW9tbXVfZndzcGVjX2FwcGVuZF9pZHMoc3RydWN0IGlvbW11X2Z3c3BlYyAqZndz
cGVjLCB1MzIgKmlkcywKPiBpbnQgbnVtX2lkcyk7Cj4gwqAKPiDCoHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IGlvbW11X2Z3c3BlYyAqZGV2X2lvbW11X2Z3c3BlY19nZXQoc3RydWN0Cj4gZGV2aWNlICpk
ZXYpCj4gQEAgLTEwNDQsMTEgKzEwNDMsNiBAQCBzdGF0aWMgaW5saW5lIGludCBpb21tdV9md3Nw
ZWNfYWRkX2lkcyhzdHJ1Y3QKPiBkZXZpY2UgKmRldiwgdTMyICppZHMsCj4gwqB9Cj4gwqAKPiDC
oHN0YXRpYyBpbmxpbmUKPiAtY29uc3Qgc3RydWN0IGlvbW11X29wcyAqaW9tbXVfb3BzX2Zyb21f
Zndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlCj4gKmZ3bm9kZSkKPiAtewo+IC3CoMKgwqDCoMKg
wqDCoHJldHVybiBOVUxMOwo+IC19Cj4gLQo+IMKgc3RhdGljIGlubGluZSBpbnQKPiDCoGlvbW11
X2Rldl9lbmFibGVfZmVhdHVyZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gaW9tbXVfZGV2X2Zl
YXR1cmVzCj4gZmVhdCkKClRoaXMgbGVhdmVzIHRoZSBleHRyYSBsaW5lIHdpdGggJ3N0YXRpYyBp
bmxpbmUnLCBpdCBzaG91bGQgYWxzbyBiZQpyZW1vdmVkLgoKQ2hlZXJzLApBbmRyZScKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
