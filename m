Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26439C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 23:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLDDDwVcc4kAQv2JUp5Ao3iAt7zeKVoqrHpN7t3unak=; b=IUEI2LILUlfkeC
	WVGxsjHFjPxAd8BhcEg9OYlqcUQSI+FDZq5kitqsGU9DppMS2+GvEV4oaTw6L4By+szR1IZLX9pX1
	DAFelrxPf3q/w/HFRf0A8I3vD9EXbq4u9I39fv8YREH3ePfexQsLdUlm5To5frJJqxDETw9R4ntfq
	AUul73H7pW7PYV6dZ8YYIre+2OigBeBFegDxqDZie4r7wXjYIKXgvLwj9IER7hkgQstjvYrwygkiX
	2ugTWKxCgLYV5UqZAAdPsKho46m2vCiOgCXZF7WxAZkV8sr4oLJQgx4iMBIoXpJXDZRRJJ1pXFyYp
	/Ky8L63/mORc+0nX/fYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myj89-00EzjJ-2v; Sat, 18 Dec 2021 23:28:45 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myj84-00Ezh3-0c; Sat, 18 Dec 2021 23:28:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r5so5746122pgi.6;
 Sat, 18 Dec 2021 15:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pIYxkiGisug+VVJYFtmCG20TylNRXB8zO8kw91s3wyc=;
 b=TIuyQXz6oo8PN+yMbImlC2c2rmmoCdLu5CdlQlReccXapNNMDZyLSkZvnzlgZ9AIdV
 6+qzntuQo5gBX86FaZFlCIaH4FCNC7RUVw367F08QPEjoiFWXa2CV6SAzISHS5RZPpY/
 QbkHqa0fdrihFEuRX0X/GeMy6P75DvnBsKWfABXcb5D5/2zTgkKaV4VEiJSuyy+zBwcd
 zNIVzererH+Fx7ZEOWvTBpmd3THvXh1KHtzsLHvjMiIPuGFGIqMdZbyjf9H7vLYP6+7J
 cQ/P2vAafsI3DEFtzgX9UWRj1ZmCeXy01hG6ih9PN1N9Tz70SEQsg8aJQpCrrbXl1cqP
 QppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pIYxkiGisug+VVJYFtmCG20TylNRXB8zO8kw91s3wyc=;
 b=G90Zh987SyYIE5BftiajCGziDEZ/ACXG94U0rmPmAv8YevgXkmmlmK/cJi9Uf2z0ja
 6wzL+TgTdPnH5VS2DvzKqjL8WmAT5wk3w1B/FXiP1CLh6CbPydimycnOO/TqsfikzXLU
 RF3a2L/nKW+mt8MQjLqu/26hMKOMnHRbD9LEm82KMCKPEuz+UsxospZ+4nek9/KWpfN3
 MkpiBT+A1MRSEHZtR+wnYjvPJD9RAx9MPjge9x6I5JUYvxayBLilICzcMvw+R8n7RG2s
 xwZl0e272LI04jdt71VpwxSiHigWo0c51uPfI9a+XFsoUwxOHZFY935oULxrRJmkMf8v
 DHjg==
X-Gm-Message-State: AOAM530d3cn5l+JiSgvEtd5kKF2LEiGQFf0y47I15OcZCm+9Pi3goHKK
 4lGekeS7ZcZ9/z92QocMSwgrr04OriUgHiKGizQ=
X-Google-Smtp-Source: ABdhPJxWDXMTWC77oOKCjFiIpES/JejUzoFwUACXrmSW9T47MOn3N7k2dUXoB6NpZZlsfwgvBd+k97C3LkDR7q0l13Y=
X-Received: by 2002:a63:2a0d:: with SMTP id q13mr8815341pgq.513.1639870119035; 
 Sat, 18 Dec 2021 15:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-2-yury.norov@gmail.com>
 <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
In-Reply-To: <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
From: Yury Norov <yury.norov@gmail.com>
Date: Sat, 18 Dec 2021 15:28:29 -0800
Message-ID: <CAAH8bW9uWW+t5TvkMt_e-sKp71hiLpXhXeuGuSZPK-3kds-GgQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] all: don't use bitmap_weight() where possible
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
 Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 Jens Axboe <axboe@fb.com>, 
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, 
 Juri Lelli <juri.lelli@redhat.com>, Kees Cook <keescook@chromium.org>, 
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>, 
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, 
 Stephen Boyd <sboyd@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Steven Rostedt <rostedt@goodmis.org>, Subbaraya Sundeep <sbhatta@marvell.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>, 
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>, 
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
X-CRM114-CacheID: sfid-20211218_152840_073419_A023EA41 
X-CRM114-Status: GOOD (  19.75  )
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

T24gU2F0LCBEZWMgMTgsIDIwMjEgYXQgMjoxNiBQTSBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1s
aW51eEByZXJlLnFtcW0ucGw+IHdyb3RlOgo+Cj4gT24gU2F0LCBEZWMgMTgsIDIwMjEgYXQgMDE6
MTk6NTdQTSAtMDgwMCwgWXVyeSBOb3JvdiB3cm90ZToKPiA+IERvbid0IGNhbGwgYml0bWFwX3dl
aWdodCgpIGlmIHRoZSBmb2xsb3dpbmcgY29kZSBjYW4gZ2V0IGJ5Cj4gPiB3aXRob3V0IGl0Lgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1cnkgTm9yb3YgPHl1cnkubm9yb3ZAZ21haWwuY29tPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9uZXQvZHNhL2I1My9iNTNfY29tbW9uLmMgICAgICAgICAgIHwg
NiArLS0tLS0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9icm9hZGNvbS9iY21zeXNwb3J0LmMg
fCA2ICstLS0tLQo+ID4gIGRyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnRlbF9wb3dlcmNsYW1wLmMg
ICB8IDkgKysrLS0tLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE2
IGRlbGV0aW9ucygtKQo+IFsuLi5dCj4KPiBMb29rcyBnb29kLAoKRG9lcyBpdCBtZWFuIEFja2Vk
LWJ5LCBSZXZpZXdlZC1ieSwgb3Igc29tZXRoaW5nIGVsc2U/Cgo+IGJ1dCBJIHRoaW5rIHRoaXMg
bmVlZHMgdG8gYmUgc3BsaXQgcGVyIHN1YnN5c3RlbS4KCldoYXQgeW91IGFzayBicmVha3MgcnVs
ZXM6CgpEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdDoKClNlcGFy
YXRlIGVhY2ggKipsb2dpY2FsIGNoYW5nZSoqIGludG8gYSBzZXBhcmF0ZSBwYXRjaC4KCkZvciBl
eGFtcGxlLCBpZiB5b3VyIGNoYW5nZXMgaW5jbHVkZSBib3RoIGJ1ZyBmaXhlcyBhbmQgcGVyZm9y
bWFuY2UKZW5oYW5jZW1lbnRzIGZvciBhIHNpbmdsZSBkcml2ZXIsIHNlcGFyYXRlIHRob3NlIGNo
YW5nZXMgaW50byB0d28Kb3IgbW9yZSBwYXRjaGVzLiAgSWYgeW91ciBjaGFuZ2VzIGluY2x1ZGUg
YW4gQVBJIHVwZGF0ZSwgYW5kIGEgbmV3CmRyaXZlciB3aGljaCB1c2VzIHRoYXQgbmV3IEFQSSwg
c2VwYXJhdGUgdGhvc2UgaW50byB0d28gcGF0Y2hlcy4KCk9uIHRoZSBvdGhlciBoYW5kLCBpZiB5
b3UgbWFrZSBhIHNpbmdsZSBjaGFuZ2UgdG8gbnVtZXJvdXMgZmlsZXMsCmdyb3VwIHRob3NlIGNo
YW5nZXMgaW50byBhIHNpbmdsZSBwYXRjaC4gIFRodXMgYSBzaW5nbGUgbG9naWNhbCBjaGFuZ2UK
aXMgY29udGFpbmVkIHdpdGhpbiBhIHNpbmdsZSBwYXRjaC4KClRoaXMgaXMgbm90IGEgZGVhZCBy
dWxlLCByZWZlciBmb3IgZXhhbXBsZSB0aGUgOTZkNGYyNjdlNDBmOSAoIlJlbW92ZQondHlwZScg
YXJndW1lbnQgZnJvbSBhY2Nlc3Nfb2soKSBmdW5jdGlvaW4uIikKCk9yIHRoaXM6IGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDIxLzYvMTQvMTczNgoKVGhhbmtzLApZdXJ5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
