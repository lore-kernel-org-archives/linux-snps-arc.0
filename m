Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AF0C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Dec 2021 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IT8I0yP4UWmfBbQA8ivHEoT8kc15RrSx+484lUMO0KE=; b=w0+PVIU37ge/8Q
	kUvf2EdkTELBdo4efXfL7t/7H7UpklffqbA0hmLbd7e3NsWdpjUsYbu533F7Mt0SM9CDKGeEPxv88
	VMfP/L5oFobfIHyENfzf3gOwG1u6z8IKqXgYx3fgsurTiVc2ky4ER3Q9pLIJOhsqSSDTJyZIuCjVp
	hd/6Nn9vBe/JqqxEZJoiD61MuYUZINcOGTETduaRxr00nRSuns2DGyK0KvM/4xgNvPT4QE2XZJuBV
	oKrpIbuY99xs2VKU8J3XdwicFi9T2tCgjSDakSmEnsgoMQydfwBHh9mFKllY3gzyeQ02vpoH+G2Ae
	mQK1tQtqq2vpZhJozb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxDhw-00Fdx9-9G; Tue, 14 Dec 2021 19:43:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxDhr-00FduS-30; Tue, 14 Dec 2021 19:43:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id p13so18733119pfw.2;
 Tue, 14 Dec 2021 11:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LCilH12wWw0seUa3hiJyDy0VxFX2Q3bA7Y0HXIYHhF8=;
 b=mgUrMQhC4/CUdwucboxOLaDGWbb/3r/d8db3O9NgfZYUYEd6Zjz2nbba51SL7zLe8Y
 HoPx+IQ/X0fM2kJmgKk06iLEcvvTYlX2h8Als5lC5pEfulogO+sUqemRF4n6m2Eekf4w
 CtPoyJGaZ6slsRjff5y3xVucnMlyQBZjuB7TsLW/QfR5HbmU2eCSX+iDyn3uJA04puJa
 dF//PJEuj31ulpS82MggltzR4G2RUQnzjtNrp/7HOGpfHVW7cNQpoT3ypqVvpPJEUhsf
 QvGgSrM2kq5yWe5ythTOhC41utztrjpAcYlGjjw1vz9wzYdQhMtOLwSCYyXNwoJoZq7H
 sX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LCilH12wWw0seUa3hiJyDy0VxFX2Q3bA7Y0HXIYHhF8=;
 b=MbWW9kHkVZA5Oo3nBIUO5GJB7O6TkX4r7IaXSMyu2LiReWJ49b6E2k1wp0QNs8k2Ss
 Bf4YMnR7tKQKgBqAWl+rWzDImSP+r6J7qW/DVlsso/ZmuOJ3BlEUJ04nwCiMSo/IVK+o
 jCJd1dHV/CW0gGfBemyK+yE/h0rh4BaBniPzJ21g+bEJ6CIpcKLNQCe+PhKkNhfzgGmy
 v4cevCKsCnQjVTu2hghKYLCr/FHSI4JjC5NnNdstxEo8VBxYAx5rJmPWMsOueBm0R+l/
 NJSf4AcAFaNXtXeosoSqIm/HvXC6QQEQDCAm2yFgP2SIlBRmdw+vXl3G1hWXJ3fKnYVB
 Z0jQ==
X-Gm-Message-State: AOAM533leOCLMEgQX/Zvr+CS9VVpoCg5t8GOaTmRwlupRtFFE0IyYgdZ
 XbD8jQZg6axsQWsNOdIMUrnt9rZxvGPwEyis5I0=
X-Google-Smtp-Source: ABdhPJx1omsyXEH84uuE4kzYpPBu5v24anF9kQ0616INOFdPlqou2FDes2afxUGAuG2JNukP2+Sny94qEgWXdVVJ7J8=
X-Received: by 2002:a63:3f4e:: with SMTP id m75mr4955451pga.587.1639511000707; 
 Tue, 14 Dec 2021 11:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
In-Reply-To: <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
From: Yury Norov <yury.norov@gmail.com>
Date: Tue, 14 Dec 2021 11:43:09 -0800
Message-ID: <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,
 full} with bitmap_weight_eq()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, 
 Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, 
 Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, 
 Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@linux.ie>, 
 David Laight <David.Laight@aculab.com>, Dennis Zhou <dennis@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Geetha sowjanya <gakula@marvell.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Jens Axboe <axboe@fb.com>, 
 Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron <jic23@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, 
 Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, 
 Marc Zyngier <maz@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
 Mark Gross <markgross@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, 
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
 Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Roy Pledge <Roy.Pledge@nxp.com>, 
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>, 
 Sagi Grimberg <sagi@grimberg.me>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>, 
 Subbaraya Sundeep <sbhatta@marvell.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Tariq Toukan <tariqt@nvidia.com>,
 Tejun Heo <tj@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, 
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_114323_173059_2496CC0A 
X-CRM114-Status: GOOD (  22.76  )
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

T24gU3VuLCBOb3YgMjgsIDIwMjEgYXQgMTA6MTAgQU0gTWljaGHFgiBNaXJvc8WCYXcKPG1pcnEt
bGludXhAcmVyZS5xbXFtLnBsPiB3cm90ZToKPgo+IE9uIFNhdCwgTm92IDI3LCAyMDIxIGF0IDA3
OjU2OjU3UE0gLTA4MDAsIFl1cnkgTm9yb3Ygd3JvdGU6Cj4gPiBOb3cgYXMgd2UgaGF2ZSBiaXRt
YXBfd2VpZ2h0X2VxKCksIHN3aXRjaCBiaXRtYXBfZnVsbCgpIGFuZAo+ID4gYml0bWFwX2VtcHR5
KCkgdG8gdXNpbmcgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVyeSBOb3JvdiA8eXVyeS5u
b3JvdkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L2JpdG1hcC5oIHwgMjYg
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvYml0bWFwLmggYi9pbmNsdWRlL2xpbnV4L2JpdG1hcC5oCj4gPiBpbmRleCA5OTYwNDFmNzcx
YzguLjJkOTUxZTRkYzgxNCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvYml0bWFwLmgK
PiA+ICsrKyBiL2luY2x1ZGUvbGludXgvYml0bWFwLmgKPiA+IEBAIC0zODYsMjIgKzM4Niw2IEBA
IHN0YXRpYyBpbmxpbmUgaW50IGJpdG1hcF9zdWJzZXQoY29uc3QgdW5zaWduZWQgbG9uZyAqc3Jj
MSwKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIF9fYml0bWFwX3N1YnNldChzcmMxLCBzcmMyLCBu
Yml0cyk7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgaW5saW5lIGJvb2wgYml0bWFwX2VtcHR5KGNv
bnN0IHVuc2lnbmVkIGxvbmcgKnNyYywgdW5zaWduZWQgbmJpdHMpCj4gPiAtewo+ID4gLSAgICAg
aWYgKHNtYWxsX2NvbnN0X25iaXRzKG5iaXRzKSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuICEg
KCpzcmMgJiBCSVRNQVBfTEFTVF9XT1JEX01BU0sobmJpdHMpKTsKPiA+IC0KPiA+IC0gICAgIHJl
dHVybiBmaW5kX2ZpcnN0X2JpdChzcmMsIG5iaXRzKSA9PSBuYml0czsKPiA+IC19Cj4KPiBTaW5j
ZSB0aGlzIGlzIHN1cHBvc2VkIHRvIGJlIGFuIG9wdGltaXphdGlvbiwgSSB3b3VsZCBnbyBhbGwg
dGhlIHdheSBhbmQKPiByZXBsYWNlIHRoaXMgd2l0aCB0aGUgdHJpdmlhbCBpbXBsZW1lbnRhdGlv
biBpbnN0ZWFkOgo+Cj4gYm9vbCBiaXRtYXBfZW1wdHkobG9uZyAqYml0cywgc2l6ZV90IG5iaXRz
KQo+IHsKPiAgICAgICAgIGZvciAoOyBuYml0cyA+PSBCSVRTX1BFUl9MT05HOyArK2JpdHMsIG5i
aXRzIC09IEJJVFNfUEVSX0xPTkcpCj4gICAgICAgICAgICAgICAgIGlmICgqYml0cykKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4KPiAgICAgICAgIGlmIChuYml0cyAm
JiAqYml0cyAmIEJJVE1BUF9MQVNUX1dPUkRfTUFTSyhuYml0cykpCj4gICAgICAgICAgICAgICAg
IHJldHVybiBmYWxzZTsKPgo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gfQoKVGhpcyBpcyB3aGF0
IGN1cnJlbnQgaW1wbGVtZW50YXRpb25zIGJhc2ljYWxseSBkbywgYmFzZWQgb24gZmluZF9maXJz
dF9iaXQoKS4KCkkgdGhpbmsgdGhhdCBmb3IgbG9uZyBiaXRtYXBzIHRoZSBtb3N0IHRpbWUgY29u
c3VtaW5nIG9wZXJhdGlvbiBpcyBtb3ZpbmcKZGF0YSB0byBMMSwgYW5kIGZvciBzaG9ydCBiaXRt
YXBzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYXBwcm9hY2hlcyBpcwpiYXJlbHkgbWVhc3VyYWJs
ZS4KCkJ1dCBod2VnaHRfbG9uZyBvbiBlYWNoIGl0ZXJhdGlvbiBjYW4ndCBiZSBtb3JlIGVmZmVj
dGl2ZSB0aGFuIHRoZSBjdXJyZW50CnZlcnNpb24uIFNvLCBJJ2xsIGRyb3AgdGhpcyBwYXRjaCBm
b3IgdjIgYW5kIGtlZXAgdGhpbmdzIHVuY2hhbmdlZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
