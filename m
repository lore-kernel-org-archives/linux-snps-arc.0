Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EBEC54798
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ov2Oixd0XtTulJ5RVkWlkpVXjBK1V3E0m+d0GLXsIE=; b=memjDtWDCPmE/G
	NwfQhYXjV/x4DMELMyKwDSpzH8cDnMSSSvfROu5qSulI8bWxXs3MuFuojJc8nS5jyYfBMNPTbtSFJ
	ribvXdlz3fJB8jU0kNZlR1cCX9eKlpdu/t/ERSbMMYUobXqA2meaUtB5mXEzs2zSAxcsszZIFQWbq
	GaKWKTpj5OXJsahqguwLoc+8eGkY/RVevd3gRLjK+8dEy8Qg5M951TdCMvNBUc7DshpE1KK5c+6ZH
	r3yd6JFWk0KaDL54708poRSXeDhaZl3o9mT/WhNV7egb+oNyPakIXxkOmXN/ICr5CkYtWs1DOxuwn
	vYrR1NyuRNVGWzNvk7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retFF-00000004PY1-0rQa;
	Tue, 27 Feb 2024 08:55:25 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1retFC-00000004PVg-2xUV;
	Tue, 27 Feb 2024 08:55:24 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6da202aa138so2635462b3a.2;
        Tue, 27 Feb 2024 00:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024119; x=1709628919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF4kXg8LPe/h8pV/74EqYHGgPgOEfsUWLG6ibzoE1S0=;
        b=CKyJQOTh5EEr0PmLlVxtnmopwqr2ZYDk+CNr5//kMZIrge53zz0JH0fQVGlG//S44n
         n7p1Ah715/+2d2Unv53mut85txmudbPevS3u00Irgm+zrYaO5WEBbuBhlaLe72DcTlYQ
         BMKjo207iMDD5c0NRg74l+V+R5quOjoCMHbixIYEdvyB/+ckOzyz8ledCwU/3oj0F+xc
         t3jibcYrzP4WwBYMcqg2y6gXbRE2SK3zV8aj76d9rFdyGmys1rDK/NZqZXG+v2d3fvSx
         9nuRU3UV3OBOECZV75AbLBYwU6HxfWsPBjRpb7qXsj2oGe/5PuQYL5V+NmHLYljK6bEk
         iWHA==
X-Forwarded-Encrypted: i=1; AJvYcCVLNgVkNkL5bZCRzc7r/Aqb4Fp5+906n+TtPhe1bWSMsKl9M1o+ov25jpMy4yO6umIKbgEqUNQppWZtPi8sX81etV0NOiYxmS14x2e4K00UU65VRtGn9O6lEtkiZKNP0guo5uuDS9fwk3MIGhjlaQbjummfvvIMlhFXo5OkiyrUTvZAaBKKng1U4sai53dNopV39OsXmmQaIs83lJqjZEGnfijcFVU4aPvAYt07g64FpDelSyyM9wc=
X-Gm-Message-State: AOJu0YzAPVW0u4/ao7ycabzKfdG6QVc0za+2wv0PhchHZH5Yx+aXrSJ3
	qXmJKeINjp3JTerBIbBaaqd4rep65T4q9L885gSdCGl1uVDI7WlgTEJQig8hUX19hA==
X-Google-Smtp-Source: AGHT+IGhW/2kP/IsRHJQ27M/f0ypZS+oxnC8tPIR8VMRPHsGk5BXe+0dPgXX1Ujjxoa200e0pYTuhQ==
X-Received: by 2002:a62:cf04:0:b0:6e4:625a:f03 with SMTP id b4-20020a62cf04000000b006e4625a0f03mr9372321pfg.15.1709024118771;
        Tue, 27 Feb 2024 00:55:18 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id gu17-20020a056a004e5100b006e4e584ed59sm5361650pfb.116.2024.02.27.00.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:55:18 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso3429187a12.2;
        Tue, 27 Feb 2024 00:55:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOBXVJfLco/o9zyxUZSdFC48o4Cd12UkGy0rVFCiBu2Y4lowBdmqqhliGFSiwyjg3VvKJ2oGG6GzWS9ivw5GJDbAWe7RbyRVA3bJMun8rFZoh+K22B+LraS7K+Bps94rEPhkI+fEqipIvb8s4dTF0oQE0y8YAoHqf1AFMIXzn5NFGDJEKKJmpfu+gyTqdmFyGNQaAQvEu40hMyRNiojWHOgJu4z0uGzAju1vRO7JEjC9J3MUIKSMc=
X-Received: by 2002:a25:71c3:0:b0:dcf:2b44:f38d with SMTP id
 m186-20020a2571c3000000b00dcf2b44f38dmr1589302ybc.49.1709024097788; Tue, 27
 Feb 2024 00:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:54:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_005522_753415_6A273E54 
X-CRM114-Status: GOOD (  23.89  )
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

SGkgQXJuZCwKCk9uIE1vbiwgRmViIDI2LCAyMDI0IGF0IDU6MTXigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4KPiBNb3N0IGFyY2hpdGVjdHVyZXMgb25seSBzdXBwb3J0IGEgc2luZ2xlIGhhcmRj
b2RlZCBwYWdlIHNpemUuIEluIG9yZGVyCj4gdG8gZW5zdXJlIHRoYXQgZWFjaCBvbmUgb2YgdGhl
c2Ugc2V0cyB0aGUgY29ycmVzcG9uZGluZyBLY29uZmlnIHN5bWJvbHMsCj4gY2hhbmdlIG92ZXIg
dGhlIFBBR0VfU0hJRlQgZGVmaW5pdGlvbiB0byB0aGUgY29tbW9uIG9uZSBhbmQgYWxsb3cKPiBv
bmx5IHRoZSBoYXJkd2FyZSBwYWdlIHNpemUgdG8gYmUgc2VsZWN0ZWQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQoKPiAtLS0gYS9hcmNoL202OGsvS2NvbmZpZwo+ICsrKyBiL2FyY2gvbTY4ay9LY29uZmlnCj4g
QEAgLTg0LDEyICs4NCwxNSBAQCBjb25maWcgTU1VCj4KPiAgY29uZmlnIE1NVV9NT1RPUk9MQQo+
ICAgICAgICAgYm9vbAo+ICsgICAgICAgc2VsZWN0IEhBVkVfUEFHRV9TSVpFXzRLQgo+Cj4gIGNv
bmZpZyBNTVVfQ09MREZJUkUKPiArICAgICAgIHNlbGVjdCBIQVZFX1BBR0VfU0laRV84S0IKCkkg
dGhpbmsgeW91IGNhbiBkbyB3aXRob3V0IHRoaXMuLi4KCj4gICAgICAgICBib29sCj4KPiAgY29u
ZmlnIE1NVV9TVU4zCj4gICAgICAgICBib29sCj4gKyAgICAgICBzZWxlY3QgSEFWRV9QQUdFX1NJ
WkVfOEtCCj4gICAgICAgICBkZXBlbmRzIG9uIE1NVSAmJiAhTU1VX01PVE9ST0xBICYmICFNTVVf
Q09MREZJUkUKPgo+ICBjb25maWcgQVJDSF9TVVBQT1JUU19LRVhFQwo+IGRpZmYgLS1naXQgYS9h
cmNoL202OGsvS2NvbmZpZy5jcHUgYi9hcmNoL202OGsvS2NvbmZpZy5jcHUKPiBpbmRleCA5ZGNm
MjQ1YzljYmYuLmM3NzdhMTI5NzY4YSAxMDA2NDQKPiAtLS0gYS9hcmNoL202OGsvS2NvbmZpZy5j
cHUKPiArKysgYi9hcmNoL202OGsvS2NvbmZpZy5jcHUKPiBAQCAtMzAsNiArMzAsNyBAQCBjb25m
aWcgQ09MREZJUkUKPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0NTVU0KPiAgICAgICAgIHNlbGVj
dCBHUElPTElCCj4gICAgICAgICBzZWxlY3QgSEFWRV9MRUdBQ1lfQ0xLCj4gKyAgICAgICBzZWxl
Y3QgSEFWRV9QQUdFX1NJWkVfOEtCIGlmICFNTVUKCi4uLi4gaWYgeW91IHdvdWxkIGRyb3AgdGhl
ICFNTVUtZGVwZW5kZW5jeSBoZXJlLgoKPgo+ICBlbmRjaG9pY2UKPgo+IEBAIC00NSw2ICs0Niw3
IEBAIGNvbmZpZyBNNjgwMDAKPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0NTVU0KPiAgICAgICAg
IHNlbGVjdCBDUFVfTk9fRUZGSUNJRU5UX0ZGUwo+ICAgICAgICAgc2VsZWN0IEhBVkVfQVJDSF9I
QVNICj4gKyAgICAgICBzZWxlY3QgSEFWRV9QQUdFX1NJWkVfNEtCCgpQZXJoYXBzIHJlcGxhY2Ug
dGhpcyBieQoKICAgIGNvbmZpZyBNNjhLQ0xBU1NJQwogICAgICAgICAgICBib29sICJDbGFzc2lj
IE02OEsgQ1BVIGZhbWlseSBzdXBwb3J0IgogICAgICAgICAgICBzZWxlY3QgSEFWRV9BUkNIX1BG
Tl9WQUxJRAogICsgICAgICAgICBzZWxlY3QgSEFWRV9QQUdFX1NJWkVfNEtCIGlmICFNTVUKCnNv
IGl0IGNvdmVycyBhbGwgNjgweDAgQ1BVcyB3aXRob3V0IE1NVT8KCj4gICAgICAgICBzZWxlY3Qg
TEVHQUNZX1RJTUVSX1RJQ0sKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgVGhlIEZyZWVzY2Fs
ZSAod2FzIE1vdG9yb2xhKSA2ODAwMCBDUFUgaXMgdGhlIGZpcnN0IGdlbmVyYXRpb24gb2YKCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
