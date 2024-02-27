Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AD2C5478C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiv9RgFqU1Pm+xAUJFPNnet5USM7tpHqY4omo+umYAU=; b=hRXLqKR6uHVcgU
	uiofbbWkcu1yFPZgPrj1o02r6NktWR27mKT/IYn3i5a6n9kTyYl6WKi4FNpsCZo3asFfJ2zg0n+q+
	Jz8cdFMkJAs3SVgpi2jtTd7lbz9EENtmQFLvCFYC9HFMnE+6RDhLP9NduZ9Ue0QwpTMJhgKfwMBbU
	d1F/aI4/WnXiWj7n4miOBFMQDdkjoQFevGu1oixEaBIdTh/FKH5OZanz+GjOGE280Q059oqDAEOr5
	ECtCjdGAcDNQMjwub83Y9ojNlN3MT0Y0AE5P9ZsitqBrgiMAWpTkmcjumxJQW5YkE6V7tXxHWDzA6
	qO+Xi7UNnHXPZnJC01dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revOU-00000004toB-04Dn;
	Tue, 27 Feb 2024 11:13:06 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revOQ-00000004tmz-2Sb5;
	Tue, 27 Feb 2024 11:13:03 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bb5fda069bso239957639f.0;
        Tue, 27 Feb 2024 03:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032379; x=1709637179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4Tv6sdcFEpWvZL/hYJEF+Ju7qt4AFqMkWFUs5NrLKU=;
        b=Fx/UWjTBB0vV69yjYR/HYeGmigEYxo2ktBhygY/pRRgiKCyzIjatzT/qR47y/DEHJb
         4GqZGNoMJ6EMYYrlvLCU5hb0k5L1S/LHeTz+hwERkPGPSV6Fla1MXRL6ijN4fuBLGbrA
         nZXkBLEeyQfPtBHXoStniY5bxeKdFPUlmaqNHtGSqAkw6YUcmjw5VqpoTY7OX7kqGBhj
         OxvuBY9hbOFGy9lDSk5RTIozwMWTCUwmT9gdOnKoBSIYlhSfcvVmMX6jVRWFCnC+Omnp
         N01asSEyzGkNC0jqtm/cR7Ads7xIEq2bev5SP8ByWhhKT9wQs6ARWGA7BhaOZceCX6Ki
         zKfg==
X-Forwarded-Encrypted: i=1; AJvYcCUZg+7vOj93i0126wNMhUtg4Y60YYzSa7WTMOHnu45HhEgKg/7LH9tzjbLpbIuJSlKQ/lf+3oE7NiZLrx42tB4J0nGv5iSs8q3+BT+Ji4Ly1z52L7GvJEKUdvyMFfsR+PWX/tKLZRf0M3/nZggTzs9gkXSgbQKB5oi1pOpcYkMK6JcKjvlzbk/M0KBLUiZWyZauTZ1/jrd/vkJfBlcz7md6V5gx1Rl8KwQcye/Wt1UWSMDtAPsy8zk=
X-Gm-Message-State: AOJu0YyEq1fvyCPYQJOtDeRKQa0cKel8NSmicpe0CNzXDcRcwyblC/Ae
	EEg/iv+e6xcTsgCiCK7ferqVlrdCxxiQQWsmxwgPOfpQSQnWem8Dq4RBr+xueW2Qvw==
X-Google-Smtp-Source: AGHT+IGzhwvYBWxQVYC8fUrv+Wj9OZAam2OMs89EA17nhi4LxFLRrIwjApYg51vCmebPSi5o29yGZg==
X-Received: by 2002:a05:6602:3f88:b0:7c7:b815:ff93 with SMTP id fb8-20020a0566023f8800b007c7b815ff93mr10704981iob.17.1709032379015;
        Tue, 27 Feb 2024 03:12:59 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id eo4-20020a0566024b0400b007c7a55ea0b6sm1729890iob.48.2024.02.27.03.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7bb5fda069bso239956639f.0;
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYiFtN8XQcQclMGSJpkIj4Z7EiAqN1UO1yVlBZImKZxT3LzidKlaE0Kw5aUZUmLTFnomHsDLD7Azes7phP84nEUUoGvK6+GpHyhYmCP/6uHuGJpp+sEE6AgO2iPlr1saseFUx9umjd5RZkzwiOIEbAXr0cUhgGaSKKAFmJ8EZPQh4pP/gRIXrOCUkgh+LzlA3piG+qUepUiVO7Wv99/ljzVhp2p9Gjwp74drEnrZWLokWiBQC9hbU=
X-Received: by 2002:a5b:ecc:0:b0:dc6:c32f:6126 with SMTP id
 a12-20020a5b0ecc000000b00dc6c32f6126mr1607871ybs.22.1709032357452; Tue, 27
 Feb 2024 03:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com> <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
In-Reply-To: <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 12:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, guoren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	Greg Ungerer <gerg@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_031302_636178_56F588DE 
X-CRM114-Status: GOOD (  30.19  )
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

SGkgQXJuZCwKCkNDIEdyZWcKCk9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDExOjU54oCvQU0gQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gT24gVHVlLCBGZWIgMjcsIDIwMjQs
IGF0IDA5OjU0LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvbTY4ay9LY29uZmlnLmNwdSBiL2FyY2gvbTY4ay9LY29uZmlnLmNwdQo+ID4+IGluZGV4IDlk
Y2YyNDVjOWNiZi4uYzc3N2ExMjk3NjhhIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvbTY4ay9LY29u
ZmlnLmNwdQo+ID4+ICsrKyBiL2FyY2gvbTY4ay9LY29uZmlnLmNwdQo+ID4+IEBAIC0zMCw2ICsz
MCw3IEBAIGNvbmZpZyBDT0xERklSRQo+ID4+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfQ1NVTQo+
ID4+ICAgICAgICAgc2VsZWN0IEdQSU9MSUIKPiA+PiAgICAgICAgIHNlbGVjdCBIQVZFX0xFR0FD
WV9DTEsKPiA+PiArICAgICAgIHNlbGVjdCBIQVZFX1BBR0VfU0laRV84S0IgaWYgIU1NVQo+ID4K
PiA+IC4uLi4gaWYgeW91IHdvdWxkIGRyb3AgdGhlICFNTVUtZGVwZW5kZW5jeSBoZXJlLgo+ID4K
PiA+Pgo+ID4+ICBlbmRjaG9pY2UKPiA+Pgo+ID4+IEBAIC00NSw2ICs0Niw3IEBAIGNvbmZpZyBN
NjgwMDAKPiA+PiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0NTVU0KPiA+PiAgICAgICAgIHNlbGVj
dCBDUFVfTk9fRUZGSUNJRU5UX0ZGUwo+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfQVJDSF9IQVNI
Cj4gPj4gKyAgICAgICBzZWxlY3QgSEFWRV9QQUdFX1NJWkVfNEtCCj4gPgo+ID4gUGVyaGFwcyBy
ZXBsYWNlIHRoaXMgYnkKPiA+Cj4gPiAgICAgY29uZmlnIE02OEtDTEFTU0lDCj4gPiAgICAgICAg
ICAgICBib29sICJDbGFzc2ljIE02OEsgQ1BVIGZhbWlseSBzdXBwb3J0Igo+ID4gICAgICAgICAg
ICAgc2VsZWN0IEhBVkVfQVJDSF9QRk5fVkFMSUQKPiA+ICAgKyAgICAgICAgIHNlbGVjdCBIQVZF
X1BBR0VfU0laRV80S0IgaWYgIU1NVQo+ID4KPiA+IHNvIGl0IGNvdmVycyBhbGwgNjgweDAgQ1BV
cyB3aXRob3V0IE1NVT8KPgo+IEkgd2FzIGEgYml0IHVuc3VyZSBhYm91dCBob3cgdG8gYmVzdCBk
byB0aGlzIHNpbmNlIHRoZXJlCj4gaXMgbm90IHJlYWxseSBhIG5lZWQgZm9yIGEgZml4ZWQgcGFn
ZSBzaXplIG9uIG5vbW11IGtlcm5lbHMsCj4gd2hlcmVhcyB0aGUgdGhyZWUgTU1VIGNvbmZpZ3Mg
Y2xlYXJseSB0aWUgdGhlIHBhZ2Ugc2l6ZSB0bwo+IHRoZSBNTVUgcmF0aGVyIHRoYW4gdGhlIHBs
YXRmb3JtLgo+Cj4gVGhlcmUgc2hvdWxkIGJlIG5vIHJlYXNvbiBmb3IgY29sZGZpcmUgdG8gaGF2
ZSBhIGRpZmZlcmVudAo+IHBhZ2Ugc2l6ZSBmcm9tIGRyYWdvbmJhbGwgaWYgbmVpdGhlciBvZiB0
aGVtIGFjdHVhbGx5IHVzZXMKPiBoYXJkd2FyZSBwYWdlcywgc28gb25lIG9mIHRoZW0gY291bGQg
YmUgY2hhbmdlZCBsYXRlci4KCkluZGVlZCwgaW4gdGhlb3J5LCBQQUdFX1NJWkUgZG9lc24ndCBt
YXR0ZXIgZm9yIG5vbW11LCBidXQgdGhlIGNvbmNlcHQKb2YgcGFnZXMgaXMgdXNlZCBhbGwgb3Zl
ciB0aGUgcGxhY2UgaW4gTGludXguCgpJJ20gbW9zdGx5IHdvcnJpZWQgYWJvdXQgc29tZSBDb2xk
ZmlyZSBjb2RlIHJlbHlpbmcgb24gdGhlIGFjdHVhbCB2YWx1ZQpvZiBQQUdFX1NJWkUgaW4gc29t
ZSBvdGhlciBjb250ZXh0LiBlLmcuIGZvciBjb25maWd1cmluZyBub24tY2FjaGVhYmxlCnJlZ2lv
bnMuCgpBbmQgZG9lcyB0aGlzIGltcGFjdCBydW5uaW5nIG5vbW11IGJpbmFyaWVzIG9uIGEgc3lz
dGVtIHdpdGggTU1VPwpJLmUuIGlmIG5vbW11IGJpbmFyaWVzIHdlcmUgYnVpbHQgd2l0aCBhIDQg
S2lCIFBBR0VfU0laRSwgZG8gdGhleQpzdGlsbCBydW4gb24gTU1VIHN5c3RlbXMgd2l0aCBhbiA4
IEtpQiBQQUdFX1NJWkUgKGNvbGRmaXJlIGFuZCBzdW4zKSwKb3IgYXJlIHRoZXJlIHNvbWUgc3Vi
dGxldGllcyB0byB0YWtlIGludG8gYWNjb3VudD8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
