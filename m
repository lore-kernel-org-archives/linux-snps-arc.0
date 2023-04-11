Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84135C76196
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Apr 2023 08:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbPjk5UCLPBecq2fTwur1EP9DqoIKQHOt+6NL8aYwbc=; b=gU3YFRa17uucv5
	v5VVtFhXSPG5ddrF+RoIVjQ+mr/qA2O0A/YwLNSuLdz8Yn7y2JbQz6rzvAA4qdNa5rwvyR6CHMB5s
	D/GKARwBQMoqqaU2z/9Ce1Mj1T4qtBmhXbJI8gFGicRYPj0emG4v6EwUmeeP8rYwQxl+h//QRHlqu
	H6UHwUwIN3O7ofJokiHquRuF1MIGszVrV8Wof8ukzEUIvi7awH/2cHgMgbwsdTbQhFWejBtLYsihU
	2aU65EWuvtqVJgeiAIIahd/3XyJxQFadvqvjq/qUlGg5MLyqmY8p0I8oiPR6x+uGU/nobFUvewn9C
	e4zlVSB00s4WGnXk5a0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm953-00Gn4v-2S;
	Tue, 11 Apr 2023 08:10:21 +0000
Received: from mail-yb1-f178.google.com ([209.85.219.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm951-00Gn43-29;
	Tue, 11 Apr 2023 08:10:20 +0000
Received: by mail-yb1-f178.google.com with SMTP id v7so5678507ybi.0;
        Tue, 11 Apr 2023 01:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKyKsR4WjWkIQ4662w2UQ58EahuI+KkHYModkQblq2M=;
        b=uSmue4hHmEewAx24trKCmP7oWsQTF7I+rOgPKO3ESpprNvUZlTHCu6hru16iAzUNDX
         ooqnziAUvwM/GU4XU8bx4DVLPGmfX9juU8rR7oj4thOANUJ0gfuG3OPY4qE6urEluWYe
         82KZx4agJkPGFdxTlVshMpADEH863+OVwVlTG3TOV9C6RtuPvec8osY9d8m89etd9WKK
         UphyQs3RSN7DbZs8iB0c7ezQ3ZFZXkKNKKLQ8Hfus/QxXrwaE3dEfdPXyk7KaD4tiu7X
         KBp//NplIpUZ4t6EZPjUkfmbC2HmTgx9SoVDvfQxL2O606S76Ep5OSV20aLsnT60yxHo
         X95A==
X-Gm-Message-State: AAQBX9eFWkY9EGm81cD9CnenBtSfWEFyEoX3GtAEx6Pyf8V+6y3LW8pz
	DY4dJuGOv54P3Jtf6Ars5GQ9JzqPgypZng==
X-Google-Smtp-Source: AKy350ZhM/KE1WPP13x9AmxJXT8lQR/TXEX6fjPo9uQHUfkxFwxwXL1vS5JGERzZzKwgWP+e8Gtklw==
X-Received: by 2002:a25:b128:0:b0:b48:e823:bd0d with SMTP id g40-20020a25b128000000b00b48e823bd0dmr7746328ybj.23.1681200617441;
        Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 128-20020a251586000000b00b7d2204cd4bsm3479886ybv.21.2023.04.11.01.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-54ee9ad5eb3so139336877b3.1;
        Tue, 11 Apr 2023 01:10:16 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1216128ywi.4.1681200616792; Tue, 11 Apr
 2023 01:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-8-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-8-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:10:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] arch/m68k: Merge variants of fb_pgprotect() into
 single function
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, 
	gregkh@linuxfoundation.org, linux-arch@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_011019_702820_99E8097E 
X-CRM114-Status: GOOD (  14.71  )
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

T24gVGh1LCBBcHIgNiwgMjAyMyBhdCA0OjMw4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IE1lcmdlIGFsbCB2YXJpYW50cyBvZiBmYl9wZ3Byb3Rl
Y3QoKSBpbnRvIGEgc2luZ2xlIGZ1bmN0aW9uIGJvZHkuCj4gVGhlcmUgYXJlIHR3byBkaWZmZXJl
bnQgY2FzZXMgZm9yIE1NVSBzeXN0ZW1zLiBGb3Igbm9uLU1NVSBzeXN0ZW1zLAo+IHRoZSBmdW5j
dGlvbiBib2R5IHdpbGwgYmUgZW1wdHkuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcywgYnV0IHRoaXMK
PiB3aWxsIGhlbHAgd2l0aCB0aGUgc3dpdGNoIHRvIDxhc20tZ2VuZXJpYy9mYi5oPi4KPgo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2
aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CkFja2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
