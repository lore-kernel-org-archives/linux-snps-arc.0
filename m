Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249FAC77B7C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjWPlSc6eZT2uKQJz/jEKzZLRgdXnpHVqvAl+zWc1kg=; b=JfW8VHK0wjQDkJ
	t2IdJl6tHvX7P5s+r1GXwsSn4EhpbVaQKgYgh1B/iCFooQPxWq/5TQjjN53uRPeNnZx88DSofx8wn
	7eIZQYgviQxU5y1mS9vBCi0kCXtBw5Yp0HImEkpBvnYkSyp/kPzw7SwSDBrJ8ZRjcLIt+mGUqpq+Q
	juSmJHSh3tFFS4j1NgAyy6pTd6xlAZFzXl8UcUoCvGmRcCIysjrfx9Aq8XTXyu0v9hqST4VYqim5y
	vBsUZSTtPsTrwjrWzUpGAKSmKNty5bqzlOtpd+dyVT+KHY6ptRChrIn+rgCUCs0yvqymJ6pUxXv/G
	ElbLZxxiCj6Mbh7horQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPWf-00BWDM-2w;
	Fri, 12 May 2023 09:57:25 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPWc-00BWC1-2Y;
	Fri, 12 May 2023 09:57:24 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a44a2637bso143309227b3.2;
        Fri, 12 May 2023 02:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683885440; x=1686477440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27/Fbt6wOw+aeS9WaGgothEj3OntQ06F+YuUTxkvogA=;
        b=SNqHW+7RrvwsFvbhZ+lzQrtw0gFpUP5mpGr/7SVzM7sFpxgg5DgREqIxEY4ufJLXRZ
         1SaO3dM9egp4y+X+1MaBuFPcXt6YjUkK8gCFhnzKnPzVQU5hWJnzMJJTRIZbQ68u/9tT
         xnZ1pVGYhsyF/b+xrR4IQGknsmvsqgxcoFz67Ex2ZbXVDy6WaSrBv/pKkwrNiMIADZ2s
         wKQ96u73ss2YMH+lCYlIDX1SKSAbPwwelQeqSs+Pvqqc2jsSmgYxd8VdoBHVJyjyaxvy
         ZsO32m6ZnZ1+ppEEH4PQy34jEzj0rE9NcYXygJCmR7Kw8eGu3eMfUg7n7NgU7PH2lEjt
         ORtQ==
X-Gm-Message-State: AC+VfDzXIH2J2Tt49wMJE8yMYpMJX4VZueyekabwAPDOzqplaufG6Lmu
	xDgWG+653PqT7+Sgs/V9VjErWPPrTxhzzQ==
X-Google-Smtp-Source: ACHHUZ5SqCqp+GNndatTHXLzodHeQd1tb9F5bizcNXA6tfOQO0ZcoqLwBSzRwXcDatORQ/IpMrfleg==
X-Received: by 2002:a81:48c6:0:b0:55a:3ce9:dc3d with SMTP id v189-20020a8148c6000000b0055a3ce9dc3dmr24499804ywa.13.1683885440082;
        Fri, 12 May 2023 02:57:20 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id u124-20020a814782000000b00545a08184d0sm5555674ywa.96.2023.05.12.02.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 02:57:18 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55d2e87048cso143312407b3.1;
        Fri, 12 May 2023 02:57:18 -0700 (PDT)
X-Received: by 2002:a0d:e209:0:b0:555:cbdc:c6 with SMTP id l9-20020a0de209000000b00555cbdc00c6mr23583778ywe.9.1683885438128;
 Fri, 12 May 2023 02:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2023 11:57:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwusgUqBuERm1=y7fwC5CERuX8VPGdaKcJiu3fM1oNuw@mail.gmail.com>
Message-ID: <CAMuHMdVwusgUqBuERm1=y7fwC5CERuX8VPGdaKcJiu3fM1oNuw@mail.gmail.com>
Subject: Re: [PATCH 00/12] arch: Make virt_to_pfn into a static inline
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_025722_830227_99B43A63 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgTGludXMsCgpPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAxOjU54oCvUE0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBUaGlzIGlzIGFuIGF0dGVtcHQg
dG8gaGFyZGVuIHRoZSB0eXBpbmcgb24gdmlydF90b19wZm4oKQo+IGFuZCBwZm5fdG9fdmlydCgp
Lgo+Cj4gTWFraW5nIHZpcnRfdG9fcGZuKCkgYSBzdGF0aWMgaW5saW5lIHRha2luZyBhIHN0cm9u
Z2x5IHR5cGVkCj4gKGNvbnN0IHZvaWQgKikgbWFrZXMgdGhlIGNvbnRyYWN0IG9mIGEgcGFzc2lu
ZyBhIHBvaW50ZXIgb2YgdGhhdAo+IHR5cGUgdG8gdGhlIGZ1bmN0aW9uIGV4cGxpY2l0IGFuZCBl
eHBvc2VzIGFueSBtaXN1c2Ugb2YgdGhlCj4gbWFjcm8gdmlydF90b19wZm4oKSBhY3RpbmcgcG9s
eW1vcnBoaWMgYW5kIGFjY2VwdGluZyBtYW55IHR5cGVzCj4gc3VjaCBhcyAodm9pZCAqKSwgKHVu
aXRwdHJfdCkgb3IgKHVuc2lnbmVkIGxvbmcpIGFzIGFyZ3VtZW50cwo+IHdpdGhvdXQgd2Fybmlu
Z3MuCj4KPiBGb3Igc3ltbWV0cnksIHdlIGRvIHRoZSBzYW1lIHdpdGggcGZuX3RvX3ZpcnQoKS4K
Pgo+IFRoZSBwcm9ibGVtIHdpdGggdGhpcyBpbmNvbnNpc3RlbnQgdHlwaW5nIHdhcyBwb2ludGVk
IG91dCBieQo+IFJ1c3NlbGwgS2luZzoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsL1lvSkRLSlhjME1KMlFaVGJAc2hlbGwuYXJtbGludXgub3JnLnVrLwo+Cj4gQW5k
IGNvbmZpcm1lZCBieSBBbmRyZXcgTW9ydG9uOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1tLzIwMjIwNzAxMTYwMDA0LjJmZmZmNGU1YWI1OWE1NTQ5OWY0YzczNkBsaW51eC1mb3Vu
ZGF0aW9uLm9yZy8KPgo+IFNvIHRoZSByZWNvZ25pdGlvbiBvZiB0aGUgcHJvYmxlbSBpcyB3aWRl
c3ByZWFkLgo+Cj4gVGhlc2UgcGxhdGZvcm1zIGhhdmUgYmVlbiBjaG9zZW4gYXMgaW5pdGlhbCBj
b252ZXJzaW9uIHRhcmdldHM6Cj4KPiAtIEFSQwo+IC0gQVJNCj4gLSBBUk02NC9BYXJjaDY0Cj4g
LSBhc20tZ2VuZXJpYyAoaW5jbHVkaW5nIGZvciBleGFtcGxlIHg4NikKPiAtIG02OGsKClRoYW5r
cywgYnVpbGRzIGZpbmUgb24gbTY4ayB3aXRoIE1NVSwgYW5kIGJvb3RzIGZpbmUgb24gQVJBbnlN
LAp3aXRoIHRoZSBleHRyYSBjaGFuZ2VzIEkgcmVwbGllZCBvbiBwYXRjaCAyLzEyLgoKR3J7b2V0
amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
