Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C591C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 06:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=J1ThttNH0Yzxpye7ltyX8l/am+TCo5Z5rGVggLkI7gc=; b=FcjGiVqdBVqU1a
	Iw3QBc3Eu54NyVcWN5HcjqVOqE++9yH8XdoCeN2m4593FRT/8hp6kNpX7Fafr6S5GbZRmXYuYCKb4
	lK9OVxXnRZX16pomOpNWX1QEmPetR83hIciARjLj4RtquD19vB1L0yfki6PrdGSxYl7qdce0tCYU6
	7Qp0UTx5sl6HptbpUm5soPngNZJD8oCdtzDVbVDQB7UEVNzIjGsOkjUwyPbuZUkJTu2EpYJG2ajmq
	3mAN2vc7AjHOF/Vk+yDJ+pHS/EfVq5HYEXxd+9JZoUerhkckMhwoMzsrc6Bsq1SYpFggvQiEoljLI
	UnfIyUn+WzL++Su3iyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrDm3-00FCBw-AE; Sun, 28 Nov 2021 06:34:55 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrDly-00FCAS-7w; Sun, 28 Nov 2021 06:34:51 +0000
Received: by mail-qt1-x82f.google.com with SMTP id o17so13149680qtk.1;
 Sat, 27 Nov 2021 22:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=rKuklq8jxCETHcjcAENlFbP3nl/uNBZqDfuGt3bzd1Q=;
 b=N/urFmV2NmOFP42e1LVLW8fwa/hr9KDv3ZUpw+lC8WGtW8rc7tWztvbdFPuGBjub1O
 wspFhVe7cCjM3GiHaTs/o61wPhHvRulBbX8eWk+oUvPHasNmnTk9fguzetRPFqMAMSbw
 NSq70yUrota4HuwP2mw6e4EdU69PrQnC7+N7r+KW5WUjDm+ME76HZpk50UYeWuhhvrtv
 jzlo36RajlwI73FqiorEZUjBdSjpmlO3li6nkrgdjIjD0UyBvsHE9SsWB4qkZCd+owE5
 cwmTSVDOhxhxddNAGQkE0CL6sKvMvIJPhAZNBZoNO0tLt8RIHXr/GUyMzCFG050MR/6f
 IXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rKuklq8jxCETHcjcAENlFbP3nl/uNBZqDfuGt3bzd1Q=;
 b=DQoh0aHqlAxx44mZQQmdF+FcKJQHyseMUDcxzYXcwU+3zxDEATvkFOPWk4QDZGRazj
 4muDBHdybEVyN+Jm85c1M+lPXzOMkf/u4xAWLoxg1aLxCd/lKHALyyvwCr248tV3UyXi
 VT2E1lkdIj5gIdyDE1TN2gLyuFcUCSicvI9Rs+zK63m+G0tMrGdVQ/tcR3PamT67EAQj
 K5nPPJpOqH/oR9XcIIfd5HMNSXcO74Fr834E2D9xLa8O2DnCdAfXTwloaNy1oGrGV5Gx
 0xjFNjKGUnFGr6nCMAZax7D6/GNBH7t11UeM7+nKuIY8+46lINv1mC0VnR53xeD2xY7Z
 0oKQ==
X-Gm-Message-State: AOAM5318/Ac4OmPpvVBaDKGmdWDOOFrJVOkOGDG3UKvijYlH4GQ/UHm7
 M1Gx9T4iT55SmZrdY6lCVeg=
X-Google-Smtp-Source: ABdhPJyJzVPAC11UsMz+HJsW0TzZJUpS9rijQwW94Vpknlgpg+/mG8cwCXUq1qsThYXJdJN6S8tP7Q==
X-Received: by 2002:ac8:5fcc:: with SMTP id k12mr35432768qta.346.1638081289128; 
 Sat, 27 Nov 2021 22:34:49 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id f18sm6419326qko.34.2021.11.27.22.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 22:34:48 -0800 (PST)
Date: Sat, 27 Nov 2021 22:34:47 -0800
From: Yury Norov <yury.norov@gmail.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@aculab.com>,
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Jens Axboe <axboe@fb.com>, Jiri Olsa <jolsa@redhat.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <20211128063447.GA270945@lapt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_223450_299611_AA47B6CB 
X-CRM114-Status: GOOD (  21.90  )
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

KHJlc3RvcmUgQ0MgbGlzdCkKCk9uIFN1biwgTm92IDI4LCAyMDIxIGF0IDA1OjU2OjUxQU0gKzAx
MDAsIE1pY2hhxYIgTWlyb3PFgmF3IHdyb3RlOgo+IE9uIFNhdCwgTm92IDI3LCAyMDIxIGF0IDA3
OjU3OjAyUE0gLTA4MDAsIFl1cnkgTm9yb3Ygd3JvdGU6Cj4gPiBBZGQgbnVtX3twb3NzaWJsZSxw
cmVzZW50LGFjdGl2ZX1fY3B1c197ZXEsZ3QsbGV9IGFuZCByZXBsYWNlIG51bV8qX2NwdXMoKQo+
ID4gd2l0aCBvbmUgb2YgbmV3IGZ1bmN0aW9ucyB3aGVyZSBhcHByb3ByaWF0ZS4gVGhpcyBhbGxv
d3MgbnVtXypfY3B1c18qKCkKPiA+IHRvIHJldHVybiBlYXJsaWVyIGRlcGVuZGluZyBvbiB0aGUg
Y29uZGl0aW9uLgo+IFsuLi5dCj4gPiBAQCAtMzE5Myw3ICszMTkzLDcgQEAgaW50IF9faW5pdCBw
Y3B1X3BhZ2VfZmlyc3RfY2h1bmsoc2l6ZV90IHJlc2VydmVkX3NpemUsCj4gPiAgCj4gPiAgCS8q
IGFsbG9jYXRlIHBhZ2VzICovCj4gPiAgCWogPSAwOwo+ID4gLQlmb3IgKHVuaXQgPSAwOyB1bml0
IDwgbnVtX3Bvc3NpYmxlX2NwdXMoKTsgdW5pdCsrKSB7Cj4gPiArCWZvciAodW5pdCA9IDA7IG51
bV9wb3NzaWJsZV9jcHVzX2d0KHVuaXQpOyB1bml0KyspIHsKPiAKPiBUaGlzIGxvb2tzIGR1Ymlv
dXMuCgpPbmx5IHRoaXM/Cgo+IFRoZSBvbGQgdmVyc2lvbiBJIGNvdWxkIGhvcGUgdGhlIGNvbXBp
bGVyIHdvdWxkIGNhbGwKPiBudW1fcG9zc2libGVfY3B1cygpIG9ubHkgb25jZSBpZiBpdCdzIG1h
cmtlZCBjb25zdCBvciBwdXJlLCBidXQgdGhlCj4gYWx0ZXJuYXRpdmUgaXMgZ29pbmcgdG8gY291
bnQgdGhlIGJpdHMgZXZlcnkgdGltZSBtYWtpbmcgdGhpcyBhIGd1YXJhbnRlZWQKPiBPKG5eMikg
ZXZlbiB0aG91Z2ggdGhlIGJpdG1hcCBkb2Vzbid0IGNoYW5nZS4KCm51bV9wb3NzaWJsZV9jcHVz
KCkgaXMgbm90IGNvbnN0IG5laXRoZXIgcHVyZS4gVGhpcyBpcyBPKG5eMikgYmVmb3JlIGFuZCBh
ZnRlci4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
