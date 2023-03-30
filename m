Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC606C6FD1D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Mar 2023 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nibyahjAmxcEXaUFXtLky08HQ0qM0cX2e7YibI83Q0Y=; b=i/BMJ/i8oY5FtS
	saCd9ddRIlcGTr+2W0yko2YKwiHScYs2e8sf7rOz23iS2h05FYdpNbkTUJlsDMjdBeHYXsCozLwto
	N8GP6JDd6pJMX7XbsELRPVyF46JXtjEhSCn0G63zuF7kpcFGw2O6k71qCdE2jwePiScYNwlP0aqmU
	j7BFjUpD811keQ7W/tOWbITmZpKA/mAxgpD7ebCdAo4R8wlJE3UmxT5eR45+VjXikoFG83upvRIxL
	sPXiNHcZDRsKxz5dS8ZD1MNDeP6JN1h+3EHSKGaQhAtKuFwS0FcRjFFvG9QBbl/vXfPOpex3T2t/D
	O0gpJcX09UWJRxImNgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phnOL-0032IQ-0b;
	Thu, 30 Mar 2023 08:12:17 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phnOG-0032GK-39
	for linux-snps-arc@lists.infradead.org;
	Thu, 30 Mar 2023 08:12:15 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5445009c26bso340424607b3.8
        for <linux-snps-arc@lists.infradead.org>; Thu, 30 Mar 2023 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680163931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQCYgbZHrv29At0jbIiZAbPjoR2bcYIsz7/d6inu7f8=;
        b=ExPqwkg7v1NJaAb/s/k5m0AsXdPeqWANvICm34UN83+g91kLHVNxTL6wIK95elgwZ0
         BsoWOOEBJNZZMuzO0jd9e5ZnX+piu95PYHJc8aCAeb74EZLSXYYZcUnjlcrwcSx9uUSn
         +ZylXYodLpHskZhPbl4FteqkYPSevcOTC9viahsIQVrxIIJjVrJEKuNvoC6mbX+9pqR3
         89vqEOP7c1GfiVA/eOXrKlUJ2J9zGfYuC7KwccmlIyO2J0GIlDQpCElJBkH4Lwj1h0sT
         ooCHH5PYBMyLFmPU8W7WigILMi6/95wflgUZh1w0ygoWmHzMdYahkSPYjw44g9lyJXD6
         gNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680163931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQCYgbZHrv29At0jbIiZAbPjoR2bcYIsz7/d6inu7f8=;
        b=ovuV1IDSZkOBL7lZX5QOSRXlz061X8F9eErAsbEwJ5t1ovczW7c1TibwLzXtKlMJ6r
         xS+Zzd7qTPuBy6kg4KrsiQ2GcJ058/YO9nKdg0qr1pipkoeKgsdCaRlidQU7UiLFt1ZU
         ExJ4/QeQQ3+rGwdO3CXF3V9isFnPvgxz0GXwe8K3AOcrGJvETspZRnfSWz+9QjQGxx8l
         tQA7vF3BuWuXGakifU84SF8JwCHKAYK21KZF4rJG9uHUftVJtsd+pAK71W9uxUQW5jb/
         rtjhzw/YEYbvQV3jGQeH30uiOCeSyXRGL4KeD1rer4f4tzBLs6c7A5Rave9XmlV9wsKb
         gvbA==
X-Gm-Message-State: AAQBX9fwaCJO/jHX0MRfiOPxM/O/yOzCaeYUDf6GDZdAgwqhXd/Keggk
	KErmJ8dGKtKSa/nTuCVltahPEYOLnep2O6tmp9I/vw==
X-Google-Smtp-Source: AKy350a/1aBIXwj5sRzvro+POKQZrQ8u1qzHA9lYRVf8cH3+kLmmcEZ591QzYhrOYx7KtYdusctEvAjdnpZqGPXhdtA=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr10995359ywl.9.1680163931243; Thu, 30
 Mar 2023 01:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-19-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-19-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Mar 2023 10:12:00 +0200
Message-ID: <CACRpkdYuyzkvSQY0sQJei39d9ZoGM_DbJQ5LxUg3sXsBmzJyaQ@mail.gmail.com>
Subject: Re: [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_011213_021858_797999DD 
X-CRM114-Status: GOOD (  25.61  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMjoxNuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4K
PiBUaGUgY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRpb25zIGZvciBub25jb2hlcmVudCBETUEgb24g
QVJNdjYgd29yawo+IGluIHR3byBkaWZmZXJlbnQgd2F5czoKPgo+ICAqIFdoZW4gQ09ORklHX0RN
QV9DQUNIRV9SV0ZPIGlzIHNldCwgc3BlY3VsYXRpdmUgcHJlZmV0Y2hlcyBvbiBpbi1mbGlnaHQK
PiAgICBETUEgYnVmZmVycyBsZWFkIHRvIGRhdGEgY29ycnVwdGlvbiB3aGVuIHRoZSBwcmVmZXRj
aGVkIGRhdGEgaXMgd3JpdHRlbgo+ICAgIGJhY2sgb24gdG9wIG9mIGRhdGEgZnJvbSB0aGUgZGV2
aWNlLgo+Cj4gICogV2hlbiBDT05GSUdfRE1BX0NBQ0hFX1JXRk8gaXMgZGlzYWJsZWQsIGEgY2Fj
aGUgZmx1c2ggb24gb25lIENQVQo+ICAgIGlzIG5vdCBzZWVuIGJ5IHRoZSBvdGhlciBjb3JlKHMp
LCBsZWFkaW5nIHRvIGluY29uc2lzdGVudCBjb250ZW50cwo+ICAgIGFjY3Jvc3MgdGhlIHN5c3Rl
bS4KPgo+IEFzIGEgY29uc2VxdWVuY2UsIG5laXRoZXIgY29uZmlndXJhdGlvbiBpcyBhY3R1YWxs
eSBzYWZlIHRvIHVzZSBpbiBhCj4gZ2VuZXJhbC1wdXJwb3NlIGtlcm5lbCB0aGF0IGlzIHVzZWQg
b24gYm90aCBNUENvcmUgc3lzdGVtcyBhbmQgQVJNMTE3Ngo+IHdpdGggcHJlZmV0Y2hpbmcgZW5h
YmxlZC4KPgo+IFdlIGNvdWxkIGFkZCBmdXJ0aGVyIHdvcmthcm91bmRzIHRvIG1ha2UgdGhlIGJl
aGF2aW9yIG1vcmUgZHluYW1pYyBiYXNlZAo+IG9uIHRoZSBzeXN0ZW0sIGJ1dCByZWFsaXN0aWNh
bGx5LCB0aGVyZSBhcmUgY2xvc2UgdG8gemVybyByZW1haW5pbmcKPiB1c2VycyBvbiBhbnkgQVJN
MTFNUENvcmUgYW55d2F5LCBhbmQgbm9ib2R5IHNlZW1zIHRvbyBpbnRlcmVzdGVkIGluIGl0LAo+
IGNvbXBhcmVkIHRvIHRoZSBtb3JlIHBvcHVsYXIgQVJNMTE3NiB1c2VkIGluIEJNQzI4MzUgYW5k
IEFTVDI1MDAuCj4KPiBUaGUgT3huYXMgcGxhdGZvcm0gaGFzIHNvbWUgbWluaW1hbCBzdXBwb3J0
IGluIE9wZW5XUlQsIGJ1dCBtb3N0IG9mIHRoZQo+IGRyaXZlcnMgYW5kIGR0cyBmaWxlcyBuZXZl
ciBtYWRlIGl0IGludG8gdGhlIG1haW5saW5lIGtlcm5lbCwgd2hpbGUgdGhlCj4gQXJtIFZlcnNh
dGlsZS9SZWFsdmlldyBwbGF0Zm9ybSBtYWlubHkgc2VydmVzIGFzIGEgcmVmZXJlbmNlIHN5c3Rl
bSBidXQKPiBpcyBub3QgbmVjZXNzYXJ5IHRvIGJlIGtlcHQgd29ya2luZyBvbmNlIGFsbCBvdGhl
ciBBUk0xMU1QQ29yZSBhcmUgZ29uZS4KPgo+IFRha2UgdGhlIGVhc3kgd2F5IG91dCBoZXJlIGFu
ZCBkcm9wIHN1cHBvcnQgZm9yIG11bHRpcHJvY2Vzc2luZyBvbgo+IEFSTXY2LCBhbG9uZyB3aXRo
IHRoZSBDT05GSUdfRE1BX0NBQ0hFX1JXRk8gb3B0aW9uIGFuZCB0aGUgY2FjaGUKPiBtYW5hZ2Vt
ZW50IGltcGxlbWVudGF0aW9uIGZvciBpdC4gVGhpcyBhbHNvIGhlbHBzIHdpdGggb3RoZXIgQVJN
djYKPiBpc3N1ZXMsIGJ1dCBmb3IgdGhlIG1vbWVudCBsZWF2ZXMgdGhlIGFiaWxpdHkgdG8gYnVp
bGQgYSBrZXJuZWwgdGhhdAo+IGNhbiBydW4gb24gYm90aCBBUk12NyBTTVAgYW5kIHNpbmdsZS1w
cm9jZXNzb3IgQVJNdjYsIHdoaWNoIHdlIHByb2JhYmx5Cj4gd2FudCB0byBzdG9wIHN1cHBvcnRp
bmcgYXMgd2VsbCwgYnV0IG5vdCBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLgo+Cj4gQ2M6IE5laWwg
QXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IENjOiBEYW5pZWwgR29sbGUg
PGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgo+IENjOiBsaW51eC1veG5hc0Bncm91cHMuaW8KPiBTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKWWVhaCwgd2UgZGlzY3Vzc2VkIHRoaXMg
ZWFybGllciwgbGV0J3MganVzdCBkcm9wIGl0LiBOb3Qgd29ydGggdGhlIGVmZm9ydC4KQWNrZWQt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51
cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
