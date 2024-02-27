Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154A3C54E49
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igw0x3Ti5vAgAQdsPD7PcfTObXUWGF++uBKSiRCFb9M=; b=Iq/moikni83G2U
	n8CMuydQwxioe0NB/WB7DRcfQEfzGHyLIfbjDnnyTE945qa0RAXef9X583WT2HUCSugP6APqYqMq3
	YpwcUAi8QzZ/iHaME2ZX035m33++bi9KU0kn3+SuIQvf4t3xJE8WDmWrqLu/g0IG5n5SWk28A9q0y
	Apx8ZAL+ml2uoPafjIHmrZw+/46ok+q31KnfRAbgLhordD/mYtHK7xhbkXsMUZaX0R1Tpe49piJRk
	jcrK71uWehpYNjyIznE3DvjSdKZFdl2lczxL3SS4tUYQonNTRfhbSrnbKPYo9/VQVpXG1DajUsPWb
	o+3wKUE1ZwxHqLQlUCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ret5o-00000004N1y-272o;
	Tue, 27 Feb 2024 08:45:40 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ret5l-00000004Myk-25HE;
	Tue, 27 Feb 2024 08:45:39 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bb9b28acb4so2787732b6e.2;
        Tue, 27 Feb 2024 00:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709023534; x=1709628334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzwNvfzqcMx0O3hVp46LgRJMNTPfRBstut9NEe744kY=;
        b=n4W3W5SgACNjI13cKv0BoQZGsL347W8oX+mxL7Yju0NwU2PyTBMrXjDmozIKRThQEy
         uRsRMdcTwEzkTCpLK50yhHItDNIvZKO3KPLyA4sIuOcGLP7PV5f0W2J0yBw36Okuql2k
         k9SGgMsOKJxwVllk+ebnuGyoaLgHzLe6nY9HRCDmGLpZ1P7sBnR5MGdSxc6qJlDPWyRt
         LW3OMgMnWpDxsbww+edAW1MQ0sNVwn211baRwP158ovJvcpsOMCFCstJ5rTGKoPshFE4
         NmNw23p0EkI2d4+NcOMMsRobDUcImPF5JQiAhMJ5Tx7Pi7oEuiB+MYWQ9uzu6srkxkEk
         SbUg==
X-Forwarded-Encrypted: i=1; AJvYcCURQg+UNHwA6sizK/M8OiqPexdV8w+ZxhAJ7abjHc6aOUCCe9sFs9jEgdtJKy9ijecTGVJRiskb08B3L8OlC/xb3/JFiHwG956lWIb0j6X8fLRXyzYpYeYRQaot/wP01F5wV5KDKOerw1GLhc14qmZ3K5zvqAWRCdxJiLV9uIqLRTSPY26u72J4Cxnt0/qWbZJg6MGR9Sd/hs46uWB69sMIeLVsw/kf+yzeBVPuil4duuZVBtBOsIU=
X-Gm-Message-State: AOJu0YzrvLcAJ4rd2P1YVF2ltiixbt1AGU2Auw2tqSeYgaePgj/UPqcz
	cwfd4yI+1Fg5m2jmNTDX64X+ergfasypncGaW0LZ+jJTQnv1SlGovQwV4+Ov/h22zQ==
X-Google-Smtp-Source: AGHT+IH5xqThb3ZlvGh2FopJouv01FecqxQOUdkn/wizntoYYvZ4pCciwQFLdO+9HGP5lnOSs3nTpw==
X-Received: by 2002:a05:6870:b027:b0:21f:aad7:6882 with SMTP id y39-20020a056870b02700b0021faad76882mr9141384oae.35.1709023534029;
        Tue, 27 Feb 2024 00:45:34 -0800 (PST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id nw15-20020a056870bb0f00b0021ebd810c92sm1966473oab.41.2024.02.27.00.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:45:33 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a035a1124dso1491134eaf.1;
        Tue, 27 Feb 2024 00:45:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXoH+kWjworULD3x4UELUtoAtxH9NFSN6E1BrJfIlcgXOwRCSUMwpxV5PxqxkIP+ammptwj5NCXEc6e45VuO9Y8gb5fShGTAwIql4z3z+EsAtHORaEpPBll5lQjq5qnJffPzLmMP3E2s/CmSMKKEZTLLbwnPogKRerlgTn+1abuBMg35BT8S3qsFn+wAH+35aZ/HtRpWOX3haztH8mdOnISBUjNrgqWuZ8X/986l2XbU34xwrVH0Zc=
X-Received: by 2002:a25:84c7:0:b0:dc7:496e:42e1 with SMTP id
 x7-20020a2584c7000000b00dc7496e42e1mr1414712ybm.51.1709023513209; Tue, 27 Feb
 2024 00:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-2-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:45:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
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
X-CRM114-CacheID: sfid-20240227_004537_567260_BCEF3A20 
X-CRM114-Status: GOOD (  18.32  )
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

SGkgQXJuZCwKCk9uIE1vbiwgRmViIDI2LCAyMDI0IGF0IDU6MTTigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4KPiBUaGVzZSBmb3VyIGFyY2hpdGVjdHVyZXMgZGVmaW5lIHRoZSBzYW1lIEtjb25m
aWcgc3ltYm9scyBmb3IgY29uZmlndXJpbmcKPiB0aGUgcGFnZSBzaXplLiBNb3ZlIHRoZSBsb2dp
YyBpbnRvIGEgY29tbW9uIHBsYWNlIHdoZXJlIGl0IGNhbiBiZSBzaGFyZWQKPiB3aXRoIGFsbCBv
dGhlciBhcmNoaXRlY3R1cmVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEvYXJjaC9LY29uZmln
Cj4gKysrIGIvYXJjaC9LY29uZmlnCgo+ICtjb25maWcgUEFHRV9TSVpFXzRLQgo+ICsgICAgICAg
Ym9vbCAiNEtCIHBhZ2VzIgoKTm93IHlvdSBnb3QgcmlkIG9mIHRoZSA0MDAwLWJ5dGUgKCI0a0Ii
KSBwYWdlcyBhbmQgZnJpZW5kcywgcGxlYXNlCmRvIG5vdCByZXBsYWNlIHRoZXNlIGJ5IEtlbHZp
bi1ieXRlcywgYW5kIHVzZSB0aGUgb2ZmaWNpYWwgYmluYXJ5CnByZWZpeGVzID0+ICI0IEtpQiIu
Cgo+ICsgICAgICAgZGVwZW5kcyBvbiBIQVZFX1BBR0VfU0laRV80S0IKCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
