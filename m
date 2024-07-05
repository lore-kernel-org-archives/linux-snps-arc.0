Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80908C30658
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jul 2024 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkzQDJflnGahmxP1Fijpdk2svc6dVbQ8xSQpIsms4Pc=; b=zhUBkimpn3vldj
	8UVlbI6ot0+5Bmkgf+bor4X5JRcHyT44cD0f1cC28k/l9XC8ozm+jFo8osxPd458dqMYUteMc3gns
	XAopZeIlMJ8nfzhkzp/fvVso4uWi8l8gjyA1N26XlhVV2SWGZap/RLSAj6T/ix8OYNMNmOYToUk/o
	kdGvLHfi3mRw19WKE8m+TVq3o+gq9mCJVURCF940nNqIkPGyKEZKWeZSyA7pBxZOUzrEbJ2qZt/do
	Sp7whiVPz3IczhOsJGUBYcSmKYGeHft2N5RNPZqLy2qRZCv/meym93HgKCe50MHGuNpXs2nT/STG/
	0/FbNt8jL2PW0UY0MKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe9h-0000000FG9F-0NQU;
	Fri, 05 Jul 2024 08:18:57 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe9e-0000000FG8L-47UG;
	Fri, 05 Jul 2024 08:18:56 +0000
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-446449e5df5so6932171cf.0;
        Fri, 05 Jul 2024 01:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720167533; x=1720772333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipFWrtbP2pnadKQDEjq7tVSKBPDnD8noGTMoh58siUs=;
        b=oQjOKDKVft4/527oH7JsFi5aK3xpNYRedSvTv/CdAV+WMw0O2WmlAyQyfX+t53xVCp
         WVY0fnVuVl5N+8nc45cuR1fpnRrjGdIMQMCX9ehLJEGk1CjBD6kghE+fes/wgd1ZY5rb
         0s4LEc4xxco7AUxxzDZgRzozEtgZROme0o9e8hN2nsfd5FSuhYRJckJJ7Frw5XciynUO
         2QJM6Oj7EzCocpDjsE2HozI+4nzSHHoJxgii1yo7deNK5EP7SiuslN/tQieyDAw6RyHS
         l4+LapIFOIWnPz9gq2dkTlRApvUqeMWEUZKT4suK4/swBvDhPpym6MbvsEowRrHirwd5
         VWiw==
X-Forwarded-Encrypted: i=1; AJvYcCUnCHw5I8ja1j27BhycrUIuT+hgTI/262xAUdaJPPCGVowFishiqK49sSq2EVGGhxABX5diW1V1rxtfjd9awXneiQ5N4prDhWIwMTSdeFWcJBvnxxd9xBahlt4iH0xLWueDqen/bvVVhCl/D9tW7c7d3oc06AMNnigx/b30HuYFF3eZijTk3l94g0eRlxZ+h6+03PWFv1y68D4=
X-Gm-Message-State: AOJu0Yw7EM6UukiGc9rWuZHIOIs8HIF21nM5EpjJgtb2G8nZi4B6nDCC
	CGApcTtTNuOjPNMiXlbZsl+SCrd1sUUpFM2QFJLn6JUuwIgSQJUTXa6fTasr
X-Google-Smtp-Source: AGHT+IF5AehrfMg6ofbCuZOi8LI0el8dxG9XzR6WIWu1thZNhz5EkCFM8gzX2t1kehn2sAOA2oJcuQ==
X-Received: by 2002:a05:6214:1d0b:b0:6b5:6097:396f with SMTP id 6a1803df08f44-6b5ed09514amr50088666d6.64.1720167533186;
        Fri, 05 Jul 2024 01:18:53 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5e4c79306sm20135016d6.35.2024.07.05.01.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 01:18:53 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b5dfa44f24so8238616d6.3;
        Fri, 05 Jul 2024 01:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+xkuw1Z8mQITRFKFmW9Lw2U369Yhv2tlMMQ5JoRDWj3vZhIedEv/BbOdtYoa3ap8+Tj4epkFzpwNL1mtsAMKEHYoklOrc1lnuD/qPNAN4ppm8Ar8QknC0kjj17ucAsnWz9S49cpRUtGOA6HSqGBCP18ETgQYVaKPgy4VrZpKalz8vVZXt6zxKbOvLm3YBw5B+jtpM2dtce0I=
X-Received: by 2002:a81:431f:0:b0:633:8b49:f97c with SMTP id
 00721157ae682-652d842fd27mr38728927b3.37.1720167188020; Fri, 05 Jul 2024
 01:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-8-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-8-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jul 2024 10:12:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-JtJWixt8J45rhZbpb7S90EDhp=x5iGGBhmUZyyQSnw@mail.gmail.com>
Message-ID: <CAMuHMdV-JtJWixt8J45rhZbpb7S90EDhp=x5iGGBhmUZyyQSnw@mail.gmail.com>
Subject: Re: [PATCH 07/17] clone3: drop __ARCH_WANT_SYS_CLONE3 macro
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_011855_043155_8B9BC91D 
X-CRM114-Status: GOOD (  20.68  )
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

T24gVGh1LCBKdWwgNCwgMjAyNCBhdCA0OjM44oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPiB3cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4g
V2hlbiBjbG9uZTMoKSB3YXMgaW50cm9kdWNlZCwgaXQgd2FzIG5vdCBvYnZpb3VzIGhvdyBlYWNo
IGFyY2hpdGVjdHVyZQo+IGRlYWxzIHdpdGggc2V0dGluZyB1cCB0aGUgc3RhY2sgYW5kIGtlZXBp
bmcgdGhlIHJlZ2lzdGVyIGNvbnRlbnRzIGluCj4gYSBmb3JrKCktbGlrZSBzeXN0ZW0gY2FsbCwg
c28gdGhpcyB3YXMgbGVmdCBmb3IgdGhlIGFyY2hpdGVjdHVyZQo+IG1haW50YWluZXJzIHRvIGlt
cGxlbWVudCwgd2l0aCBfX0FSQ0hfV0FOVF9TWVNfQ0xPTkUzIGRlZmluZWQgYnkgdGhvc2UKPiB0
aGF0IGFscmVhZHkgaW1wbGVtZW50IGl0Lgo+Cj4gRml2ZSB5ZWFycyBsYXRlciwgd2Ugc3RpbGwg
aGF2ZSBhIGZldyBhcmNoaXRlY3R1cmVzIGxlZnQgdGhhdCBhcmUgbWlzc2luZwo+IGNsb25lMygp
LCBhbmQgdGhlIG1hY3JvIGtlZXBzIGdldHRpbmcgaW4gdGhlIHdheSBhcyBpdCdzIGZ1bmRhbWVu
dGFsbHkKPiBkaWZmZXJlbnQgZnJvbSBhbGwgdGhlIG90aGVyIF9fQVJDSF9XQU5UX1NZU18qIG1h
Y3JvcyB0aGF0IGFyZSBtZWFudAo+IHRvIHByb3ZpZGUgYmFja3dhcmRzLWNvbXBhdGliaWxpdHkg
d2l0aCBhcHBsaWNhdGlvbnMgdXNpbmcgb2xkZXIKPiBzeXNjYWxscyB0aGF0IGFyZSBubyBsb25n
ZXIgcHJvdmlkZWQgYnkgZGVmYXVsdC4KPgo+IEFkZHJlc3MgdGhpcyBieSByZXZlcnNpbmcgdGhl
IHBvbGFyaXR5IG9mIHRoZSBtYWNybywgYWRkaW5nIGFuCj4gX19BUkNIX0JST0tFTl9TWVNfQ0xP
TkUzIG1hY3JvIHRvIGFsbCBhcmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3QKPiBhbHJlYWR5IHByb3Zp
ZGUgdGhlIHN5c2NhbGwsIGFuZCByZW1vdmUgX19BUkNIX1dBTlRfU1lTX0NMT05FMwo+IGZyb20g
YWxsIHRoZSBvdGhlciBvbmVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KCj4gIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS91bmlzdGQuaCAgICAgICAgICAg
ICAgICAgfCAxIC0KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
