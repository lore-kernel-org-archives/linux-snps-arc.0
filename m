Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A7BE9D827
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Apr 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuESBxGRfKUfYGv8fUQx/BiS8F0tLQAk0LTseDeK9nE=; b=zpDa8dAsYYRe8Z
	wLMdqHAPJcJYr1cqOe08ZIAsREhZRLWDELDk4G01etIWSSwPAJ8wVDy2DBNufQ6RYSv6EUuecnu4z
	ZE2cnZZFvcFrhrlLZC0DvgNs2a1ARnH6+v8cU5bSGS31U+belDRHPszlK/7rmVeEtD6OT7ltgFeAE
	MDGszm3XZD5Lwgi9wotnE225dAvUUl4mF8KMH9bxOa3WVdQc3eoflir5tUL84ykYnEP+GDD48rvNq
	nubg0cE26/Ks8telSIwV8c6XKcGYeUyL4Hg67djJBAbdEB9uUQwkbB/eA1kmOikL/G7rDBAyoJUrZ
	DECUuYqdx9Q8LLb5ApjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9WId-00000004XLp-0YOq;
	Sun, 05 Apr 2026 22:50:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9WIb-00000004XLT-0DiP
	for linux-snps-arc@lists.infradead.org;
	Sun, 05 Apr 2026 22:50:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b9c1da7ac63so594263766b.0
        for <linux-snps-arc@lists.infradead.org>; Sun, 05 Apr 2026 15:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775429431; x=1776034231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=Xl7YdlTjGrxVhH8IohlqzTD2iwaO2NIK/J47SzH9ktN4b5g3HSQ/ZEUwRfUZ5eb7EQ
         +fOcmQYKBxfnlBc9gSpiC4lDWd/SoaLCkNkK+6/hNNfqG8kcwY7DTZgkjlVIrFbU+GlP
         mgUWPQ+ODe/VYZki+KCZFk0s1sxH/i8leq8/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775429431; x=1776034231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=Ce3YW9y4de8NbIjWpXkdNAol9RlmHj45XWUQcng/+re+gAIHqeu/bp+fJ6X6JfSCqO
         iNYGxxf55Nbgqj8H/2j/HhSdIEgTFA+Xl6Zj/r74qTV0uanVSucJz+X4CT2biVKei3jB
         FRUgj8UzGRYkxgmpWzvDHMA4FiVcKmtMtsf0hnLBsIrBdDfx33onj6IIESYxyD0P7SQw
         xAeWZqLkyueGbvSaU7QAHneBhCdKwiBlt49eyBfGu3jMG202KQSqzfBfFRtZWTNPFdtN
         HzOD4q+d8c20qKkoHoB2Uc+33dc5A9dOEwC6dqt9qhk8G9gLqSnLCziert5ymevZ7R0r
         novA==
X-Forwarded-Encrypted: i=1; AJvYcCV9/bAj23loDnr8H+hTfXBgyv/Nx50gDrKMksmF99yasxfphAONFuhCjBSFI41NFnrjRFEmowDBUoM6pSNUdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKX+fncJCaPwTkGhis3X+gEEFPiM+o2bXd/gOye26wF2QBN55q
	++5o6v4mOBYn3FaJSy17QLTJ5qbGA8GCzzLze1NnfGq4Dd+McpWmfgKpeZE/bi+x7pWP4htuQmk
	3ycx+MDl0
X-Gm-Gg: AeBDieusvRTIZ8sjKhs+UIk6xvZORydcQnIy4kT0hSjJJUDwL20lFjHSvCA/dhmapgX
	W1owcfHh9RLF2jJGfKjjpVJPvZd4zBHMokoRNBAMVZOEr7x47sy5SIDf9ZTW6WQAdCrDabmZXDp
	PUzhikT3xnEE8crJ+Ra/ehQePfu7VUjmxwhtDmLEuoQhIMgQ2p2cn0gW9F547/w1DcREtA+DLFO
	jUffkQigSdwWVdd8xekoOdyPzUtiBJEP6UI0QTGlgnCE8P4WVHnzYZW1l6TZmA7sHLbuHDEsePg
	TeEM2t86yKyriGs0Sk4xZRASUvZbiYMrn35kKB/v/l6F9sVjLi+PnkbdbrG4gN/EanSPgG9yyfU
	z8CxPllK/b6E++nWMmk4+CNcNSA/cr4vnXRfak3NZ9cVSQkoL81E5du3UTbgkxvMAV1PLD3yK6D
	tjMgbuFlojAFi32A73aF+1duUYfuTCZCoyZ147//HhnK3t6Z3oqB77+Dp7K67toQ==
X-Received: by 2002:a17:907:3d4b:b0:b98:128e:23d1 with SMTP id a640c23a62f3a-b9c67696ed2mr554776466b.22.1775429430606;
        Sun, 05 Apr 2026 15:50:30 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm422810966b.1.2026.04.05.15.50.30
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:50:30 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so544435666b.1
        for <linux-snps-arc@lists.infradead.org>; Sun, 05 Apr 2026 15:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvQ8G4DOBbjWrwzicgzT+fDeRfJGb88rpwZzeJ70y9U85XWQYWlIqqemv2Nygknb0G6HCTWKoIdAk9pg86bQ==@lists.infradead.org
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id
 ffacd0b85a97d-43d292d34e1mr14051064f8f.29.1775429026066; Sun, 05 Apr 2026
 15:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org> <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
X-Gm-Features: AQROBzBHjVedWun0AWH98b5RajBbraAAaRvLQSenEhaNEY8p1Czch8mAczvPiQQ
Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_155033_137293_E75710AA 
X-CRM114-Status: GOOD (  27.31  )
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

SGksCgpPbiBTYXQsIEFwciA0LCAyMDI2IGF0IDEwOjI44oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFu
CjxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAwMywg
MjAyNiBhdCAwNTowNDo1NFBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gTk9U
RTogb25lIHBvdGVudGlhbGx5ICJjb250cm92ZXJzaWFsIiBjaG9pY2UgSSBtYWRlIGluIHNvbWUg
cGF0Y2hlcwo+ID4gd2FzIHRvIGFsd2F5cyByZXNlcnZlIGEgZmxhZyBJRCBldmVuIGlmIGEgZmxh
ZyBpcyBvbmx5IHVzZWQgdW5kZXIKPiA+IGNlcnRhaW4gQ09ORklHXyBzZXR0aW5ncy4gVGhpcyBp
cyBhIGNoYW5nZSBmcm9tIGhvdyB0aGluZ3Mgd2VyZQo+ID4gYmVmb3JlLiBLZWVwaW5nIHRoZSBu
dW1iZXJpbmcgY29uc2lzdGVudCBhbmQgYWxsb3dpbmcgZWFzeQo+ID4gY29tcGlsZS10ZXN0aW5n
IG9mIGJvdGggQ09ORklHIHNldHRpbmdzIHNlZW1lZCB3b3J0aCBpdCwgZXNwZWNpYWxseQo+ID4g
c2luY2UgaXQgd29uJ3QgdGFrZSB1cCBhbnkgZXh0cmEgc3BhY2UgdW50aWwgd2UndmUgYWRkZWQg
YSBsb3QgbW9yZQo+ID4gZmxhZ3MuCj4KPiBOYWgsIHRoaXMgaXMgZmluZSwgSSBkb24ndCBzZWUg
YW55IHByb2JsZW1zIHdpdGggdGhpcyBhcyB0aGUgb3JpZ2luYWwKPiBjb2RlIGtpbmQgb2Ygd2Fz
IGRvaW5nIHRoZSBzYW1lIHRoaW5nIHdpdGggdGhlICJob2xlIiBpbiB0aGUgc3RydWN0dXJlCj4g
aWYgdGhvc2Ugb3B0aW9ucyB3ZXJlIG5vdCBlbmFibGVkLgo+Cj4gPiBJIG9ubHkgbWFya2VkIHRo
ZSBmaXJzdCBwYXRjaCBhcyBhICJGaXgiIHNpbmNlIGl0IGlzIHRoZSBvbmx5IG9uZQo+ID4gZml4
aW5nIG9ic2VydmVkIHByb2JsZW1zLiBPdGhlciBwYXRjaGVzIGNvdWxkIGJlIGNvbnNpZGVyZWQg
Zml4ZXMgdG9vCj4gPiBpZiBmb2xrcyB3YW50Lgo+ID4KPiA+IEkgdGVzdGVkIHRoZSBmaXJzdCBw
YXRjaCBpbiB0aGUgc2VyaWVzIGJhY2twb3J0ZWQgdG8ga2VybmVsIDYuNiBvbiB0aGUKPiA+IFBp
eGVsIHBob25lIHRoYXQgd2FzIGV4cGVyaWVuY2luZyB0aGUgcmFjZS4gSSBhZGRlZCBleHRyYSBw
cmludG91dHMgdG8KPiA+IG1ha2Ugc3VyZSB0aGF0IHRoZSBwcm9ibGVtIHdhcyBoaXR0aW5nIC8g
YWRkcmVzc2VkLiBUaGUgcmVzdCBvZiB0aGUKPiA+IHBhdGNoZXMgYXJlIHRlc3RlZCB3aXRoIGFs
bG1vZGNvbmZpZyB3aXRoIGFybTMyLCBhcm02NCwgcHBjLCBhbmQKPiA+IHg4Ni4gSSBib290IHRl
c3RlZCBvbiBhbiBhcm02NCBDaHJvbWVib29rIHJ1bm5pbmcgbWFpbmxpbmUuCj4KPiBJJ20gZ3Vl
c3NpbmcgeW91ciB0ZXN0cyBwYXNzZWQ/ICA6KQoKWXVwLCBhbGwgdGhlIHRlc3RzIHRoYXQgSSd2
ZSBydW4gaGF2ZSBwYXNzZWQuIEkgYWxzbyB0aHJldyBpbiBhbgoiYWxsbm9jb25maWciIGNvbXBp
bGUgdGVzdCBqdXN0IGZvciBnb29kIG1lYXN1cmUuCgoKPiBBbnl3YXksIHRoaXMgbG9va3MgZ3Jl
YXQsIHVubGVzcyB0aGVyZSBhcmUgYW55IG9iamVjdGlvbnMsIG90aGVyIHRoYW4KPiB0aGUgIm5l
ZWRzIHRvIGJlIHVuZGVmaW5lZCIsIHdoaWNoIGEgZm9sbG93LW9uIHBhdGNoIGNhbiBoYW5kbGUs
IEknbGwKPiBxdWV1ZSB0aGVtIHVwIG5leHQgd2VlayBmb3IgNy4xLXJjMS4KClRoYW5rcy4gQXMg
cGVyIHRoZSBvdGhlciB0aHJlYWQsIEknbSBoYXBweSBpZiB5b3Ugb3IgRGFuaWxvIHdhbnQgdG8K
YXBwbHkgaXQsIGFuZCBJJ20gaGFwcHkgaWYgeW91IHdhbnQgdG8gbWFrZSBtaW5vciBmaXh1cHMg
d2hlbgphcHBseWluZy4KCldoZW4gSSBzZWUgdGhlIHBhdGNoZXMgYXBwbGllZCwgSSdsbCBzZW5k
IGEgZm9sbG93dXAgcGF0Y2ggdG8gYWRkcmVzcwp0aGUgIm5lZWRzIHRvIGJlIHVuZGVmaW5lZCIg
Y29tbWVudCwgdW5sZXNzIERhbmlsbyBtYWtlcyB0aGF0IGNoYW5nZQpoaW1zZWxmIHdoZW4gYXBw
bHlpbmcuCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
