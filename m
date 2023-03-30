Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8197BC761A6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Mar 2023 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFvj9G4MPL21rPd2YCTAONAp5AM+4IhlTcGUzQAKVso=; b=RfY44jr0ilSJKB
	BnA7fHmzJulF7lW/dOpvtIDVahzfP30JYVBw4lUzDttFEOGv26hxcgT6L9GxPMZ9sQlKzH/zziqfS
	Pcfcy20xEBaXLt2rS7ckW3Cmv9tPoLM7THywgZKF9Mof8Ic9fOEmoSVfAhP8ZKBN88wi4Ri1qmnwT
	/woDGSHOcA+suKsQif9zar0YjcWjs/sv6FpD6KMcW0frzQY5wHSlkX5x/XjZUuYOkBePSYUQm3tdS
	Do+2gY9QXgkpipsxBsHACVblhRSfwZ40CV0CKWe7dZ58348gBpRcjvxEwLJecJHgZf4y5iPFLGuXt
	0ZwA5GjB7YD2O0ESDIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvKX-004Vv6-0M;
	Thu, 30 Mar 2023 16:40:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvKT-004Vt0-1w
	for linux-snps-arc@lists.infradead.org;
	Thu, 30 Mar 2023 16:40:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso12210737wmo.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 30 Mar 2023 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680194444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kz/2H/BTIuKLAKXpo3BrU6LM5Cbhbn/nr7Y/43JgHBo=;
        b=ZlHh9rnbOioBf3nV/3JYjFE5Qh/bXo4StWdfNEsfuVogmTWridktEfoOhrvWpVNNhE
         0z/X0MYaJjK/QYT4ITLVIUdplXX/DuXksJC0IpeVKtHOrPLMJe9eSvHXtK4aOFvf4tZs
         /AbEoXyA7m4P/L9dHHblxxWiEqpMvlOY5GomHTzf+A7mUydBq8mvV4Xac+jQ3DUw+m7d
         M7bxCvgbaGFMHEPdtiAa6ky4qk4LVn0KlYFTszccyx+U9QZE1gLR26fPAJN9gaLHkJpX
         WQORjeI04LW5T5Q3kvDg17MPl5M4+c/QRypn5gBwOkQH/rvgvQ4KM27LU9sBhn9IdM+7
         8UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680194444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kz/2H/BTIuKLAKXpo3BrU6LM5Cbhbn/nr7Y/43JgHBo=;
        b=IPlasZlgFzvMtK1t1EJinISWiZI7MnyrETZwgCUisodLWq47fC1ZK8Vuf3cGWgqEFU
         H14dBAF/x79h0tVuptCIAH4dIcGBUTew90g26VGbx8H+hIJZ5PUUF/DCwf6o6V6DsUQJ
         lLwB4Pdtvivk0zlmhF+iPeXI9SQi/FWiFXj7oaWCy6bRYU0HPrZrDySjIAYpe/qZ4FqQ
         DzFRbA1+954FSzZkTlaY6y7efVgsxMqrPXwrO6aKIlxfupR+T31tisdbnDhJARymVnRn
         MdCznzqGyLpzJCVhRvLTS9xCPx4D9upDu2exu+6Us2RQ8ygisTGUK2LcKwKbeoCnXbMH
         IsgQ==
X-Gm-Message-State: AO0yUKWOt1hjkywaLtyL793f5IGxa4YB43VDnaWAndMuYdDC5/vMDZNW
	AY+NEeyjFNH2K3s9jSayVN1rQw==
X-Google-Smtp-Source: AK7set+T5+LX8G1drB7duDYdeQf04Abk5u9lOdEbqBzlttJPRn/c1AIIE43phBoZUQBtKJJiVWYC7Q==
X-Received: by 2002:a7b:c8d0:0:b0:3eb:39e7:35fe with SMTP id f16-20020a7bc8d0000000b003eb39e735femr17905942wml.30.1680194443891;
        Thu, 30 Mar 2023 09:40:43 -0700 (PDT)
Received: from [172.20.10.2] ([37.166.66.243])
        by smtp.gmail.com with ESMTPSA id w20-20020a05600c475400b003f034c76e85sm3545852wmo.38.2023.03.30.09.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:40:43 -0700 (PDT)
Message-ID: <cad25e0a-9594-3d5e-79e7-fd00a80f67ac@linaro.org>
Date: Thu, 30 Mar 2023 18:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 guoren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-19-arnd@kernel.org>
 <d7f36a28-0cae-a035-791b-363754aefeee@linaro.org>
 <6a5bd3a3-87e0-4a24-89ca-d265b0817a95@app.fastmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <6a5bd3a3-87e0-4a24-89ca-d265b0817a95@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_094049_671751_873F1A97 
X-CRM114-Status: GOOD (  22.81  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

TGUgMzAvMDMvMjAyMyDDoCAxMjowMywgQXJuZCBCZXJnbWFubiBhIMOpY3JpdMKgOgo+IE9uIFRo
dSwgTWFyIDMwLCAyMDIzLCBhdCAwOTo0OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IE9uIDI3
LzAzLzIwMjMgMTQ6MTMsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+PiBGcm9tOiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+Pj4KPj4+IFRoZSBjYWNoZSBtYW5hZ2VtZW50IG9wZXJhdGlv
bnMgZm9yIG5vbmNvaGVyZW50IERNQSBvbiBBUk12NiB3b3JrCj4+PiBpbiB0d28gZGlmZmVyZW50
IHdheXM6Cj4+Pgo+Pj4gICAgKiBXaGVuIENPTkZJR19ETUFfQ0FDSEVfUldGTyBpcyBzZXQsIHNw
ZWN1bGF0aXZlIHByZWZldGNoZXMgb24gaW4tZmxpZ2h0Cj4+PiAgICAgIERNQSBidWZmZXJzIGxl
YWQgdG8gZGF0YSBjb3JydXB0aW9uIHdoZW4gdGhlIHByZWZldGNoZWQgZGF0YSBpcyB3cml0dGVu
Cj4+PiAgICAgIGJhY2sgb24gdG9wIG9mIGRhdGEgZnJvbSB0aGUgZGV2aWNlLgo+Pj4KPj4+ICAg
ICogV2hlbiBDT05GSUdfRE1BX0NBQ0hFX1JXRk8gaXMgZGlzYWJsZWQsIGEgY2FjaGUgZmx1c2gg
b24gb25lIENQVQo+Pj4gICAgICBpcyBub3Qgc2VlbiBieSB0aGUgb3RoZXIgY29yZShzKSwgbGVh
ZGluZyB0byBpbmNvbnNpc3RlbnQgY29udGVudHMKPj4+ICAgICAgYWNjcm9zcyB0aGUgc3lzdGVt
Lgo+Pj4KPj4+IEFzIGEgY29uc2VxdWVuY2UsIG5laXRoZXIgY29uZmlndXJhdGlvbiBpcyBhY3R1
YWxseSBzYWZlIHRvIHVzZSBpbiBhCj4+PiBnZW5lcmFsLXB1cnBvc2Uga2VybmVsIHRoYXQgaXMg
dXNlZCBvbiBib3RoIE1QQ29yZSBzeXN0ZW1zIGFuZCBBUk0xMTc2Cj4+PiB3aXRoIHByZWZldGNo
aW5nIGVuYWJsZWQuCj4+Pgo+Pj4gV2UgY291bGQgYWRkIGZ1cnRoZXIgd29ya2Fyb3VuZHMgdG8g
bWFrZSB0aGUgYmVoYXZpb3IgbW9yZSBkeW5hbWljIGJhc2VkCj4+PiBvbiB0aGUgc3lzdGVtLCBi
dXQgcmVhbGlzdGljYWxseSwgdGhlcmUgYXJlIGNsb3NlIHRvIHplcm8gcmVtYWluaW5nCj4+PiB1
c2VycyBvbiBhbnkgQVJNMTFNUENvcmUgYW55d2F5LCBhbmQgbm9ib2R5IHNlZW1zIHRvbyBpbnRl
cmVzdGVkIGluIGl0LAo+Pj4gY29tcGFyZWQgdG8gdGhlIG1vcmUgcG9wdWxhciBBUk0xMTc2IHVz
ZWQgaW4gQk1DMjgzNSBhbmQgQVNUMjUwMC4KPj4+Cj4+PiBUaGUgT3huYXMgcGxhdGZvcm0gaGFz
IHNvbWUgbWluaW1hbCBzdXBwb3J0IGluIE9wZW5XUlQsIGJ1dCBtb3N0IG9mIHRoZQo+Pj4gZHJp
dmVycyBhbmQgZHRzIGZpbGVzIG5ldmVyIG1hZGUgaXQgaW50byB0aGUgbWFpbmxpbmUga2VybmVs
LCB3aGlsZSB0aGUKPj4+IEFybSBWZXJzYXRpbGUvUmVhbHZpZXcgcGxhdGZvcm0gbWFpbmx5IHNl
cnZlcyBhcyBhIHJlZmVyZW5jZSBzeXN0ZW0gYnV0Cj4+PiBpcyBub3QgbmVjZXNzYXJ5IHRvIGJl
IGtlcHQgd29ya2luZyBvbmNlIGFsbCBvdGhlciBBUk0xMU1QQ29yZSBhcmUgZ29uZS4KPj4KPj4g
QWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+Pgo+
PiBJdCdzIHNhZCBidXQgaXQncyB0aGUgcmVhbGl0eSwgdGhlcmUncyBubyBjaGFuY2UgZnVsbCBP
WE5BUyBzdXBwb3J0IHdpbGwKPj4gZXZlciBjb21lIHVwc3RyZWFtIGFuZCBubyByZWFsIHdvcmsg
aGFzIGJlZW4gZG9uZSBmb3IgeWVhcnMuCj4+Cj4+IEkgdGhpbmsgT1hOQVMgc3VwcG9ydCBjYW4g
YmUgcHJvZ3JhbW1lZCBmb3IgcmVtb3ZhbCBmb3IgbmV4dCByZWxlYXNlLAo+PiBpdCB3b3VsZCBu
ZWVkIHNpZ25pZmljYW50IHdvcmsgdG8gcmV3b3JrIGN1cnJlbnQgc3VwcG9ydCB0byBtYWtlIGl0
IGFjY2VwdGFibGUKPj4gYmVmb3JlIHRyeWluZyB0byB1cHN0cmVhbSBtaXNzaW5nIGJpdHMgYW55
d2F5Lgo+IAo+IE9rLCB0aGFua3MgZm9yIHlvdXIgcmVwbHkhCj4gCj4gVG8gY2xhcmlmeSwgZG8g
eW91IHRoaW5rIHdlIHNob3VsZCBwbGFuIGZvciByZW1vdmFsIGFmdGVyIHRoZSBuZXh0Cj4gc3Rh
YmxlIHJlbGVhc2UgKDYuMywgcmVtb3ZlZCBpbiA2LjQpLCBvciBhZnRlciB0aGUgbmV4dCBMVFMK
PiByZWxlYXNlIChwcm9iYWJseSA2LjYsIHJlbW92ZWQgaW4gNi43KT8gQXMgZmFyIGFzIEkgdW5k
ZXJzdGFuZCwKPiB0aGUgbmV4dCBPcGVuV1JUIHJlbGVhc2UgKDIzLngpIHdpbGwgYmUgYmFzZWQg
b24gbGludXgtNS4xNSwKPiBhbmQgdGhlIG9uZSBhZnRlciB0aGF0ICgyNC54KSB3b3VsZCBsaWtl
bHkgc3RpbGwgdXNlIDYuMSwgdW5sZXNzCj4gdGhleSBza2lwIGFuIExUUyBrZXJuZWwuCgpJIHRo
aW5rIGl0J3Mgb2sgdG8gcmVtb3ZlIGl0IEFTQVAsIG9yIGF0IGxlYXN0IGJlZm9yZSB0aGUgbmV4
dCBMVFMsCm5vdCBoYXZpbmcgU01QIG1ha2VzIHRoZSBwbGF0Zm9ybSBiYXJlbHkgdXNhYmxlIHNv
IHRoZSBlYXJsaWVzdCBpcyB0aGUgYmVzdC4KCk5laWwKCj4gCj4gICAgICAgQXJuZAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
