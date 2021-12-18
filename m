Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F080C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Dec 2021 21:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXfpR0mYG43Wu5dkweC74rw2rPsK6FlcefLUZ2YcXcw=; b=fVDbCmQjSBI6fz
	s+SGc3UlU4yGveqhjcuCG687b5BPd5tbHVp+rGLwM0RXhsKwCCLgxPqXUjgVJF48FxClzPU3EXC3G
	k89UNF7ah2gjII8CUPNzcsER7ei2oI5cKT0KqSVpbDUfqALyFqQEZrnx6QHZoYJw9JwN7aPG6EO6P
	pNhz+Di1KW+dBsjga2ZI4i3tsSdmtM7LmbkeVY1D9+XwgSpiSzpO/7iFxCTyh7LO27DLQkl0QICT7
	swGzmwZCyrucXr5Fqs8ixauIANKNKfaB41F+XKKM+bTB2JuXQLStd4Nxnmw7uoU8d6cSorCufNs23
	EoXxadEJTkQIgew0R72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myh8t-00EkK8-L6; Sat, 18 Dec 2021 21:21:23 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myh8C-00Ejj1-Nd; Sat, 18 Dec 2021 21:20:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id
 r18-20020a4a7252000000b002c5f52d1834so1864651ooe.0; 
 Sat, 18 Dec 2021 13:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y8ExfgOcgrA4CHmSecZvjPn/xavwnyrvtMRh3tqxxrw=;
 b=ky3nIm4VKfqY0Iq4zNauj3NXFN9QLbU64c4NLKd8+eXyY5UHvMFlx9aiNTA/qwjF5p
 5WEcS0LUjqwMpD0Ly9X7LVxbhmiOR2GbQ+abrUk6bHvx7+Cvj1ungkoH5D46b1QyLWQz
 km2XM/SS0wgiVd0HWTiaIFErZ5cDFzoDijXs35dCpitpd1tSBTdIYvXxDqkzZELiy25H
 54tm+5ByXHXPQCWtpde4rVewBv2R910Nw8U1BZzohGqANJ92nhEfKoJ9hVS5V3Wa/96H
 D15GnwPbjMyWcfB02PLIxfn7tGI1glt4iKIi7P1KZiLFMB3n2s8o4pHZOlsQnok+/jIH
 ei5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8ExfgOcgrA4CHmSecZvjPn/xavwnyrvtMRh3tqxxrw=;
 b=kAf5IA5b3amwX5cWNU2HxeR6RbI7Zh8mOEV3/9fp6mgLJdMQztiIeGaecehsdWgQzS
 GOygWaEKt5N7EBbwOdaqateoqTv74/G9k9wWgfH9qmLKCVuTl/rRZmj9Q647vOWhLJTE
 ckNWwn3IBs3KhMU1jFo3ekDYHVP1olovi/RokQNXFcvJimEOo4qd5FZk/Pq4F+sTQIMX
 UaR07yUiJ6hkU5LRJ9LDAUGOyjGtHsBnjPstglhT4elAYFh+hrBrjfPLPqZrper4wLJK
 VFrltmbaMmybemtKrtlHJr8lf1U1CdqoxD0Wj+MiZrGsXzP1kwApXZcJ+0FDc5D/Vfus
 S0fg==
X-Gm-Message-State: AOAM5319geHoPiDhIk84A0HAzsP5m3l4M1LCWy1KtDqKgXAclriJGiAI
 ifGOQIW2dQoMfouE2nkeep4=
X-Google-Smtp-Source: ABdhPJxRJAChWm8hZEgKNS5uqGfM1GLlIQqNCNXw8p1t/B+Bt/JWEVwLsC+a2lNQnmWVQu7sh+mn1Q==
X-Received: by 2002:a05:6820:820:: with SMTP id
 bg32mr5869341oob.10.1639862439949; 
 Sat, 18 Dec 2021 13:20:39 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id r26sm2292099otn.15.2021.12.18.13.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:39 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
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
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/17] lib/bitmap: add bitmap_weight_{cmp, eq, gt, ge, lt,
 le} functions
Date: Sat, 18 Dec 2021 13:20:03 -0800
Message-Id: <20211218212014.1315894-8-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_132040_878811_DAC4618A 
X-CRM114-Status: GOOD (  23.51  )
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

TWFueSBrZXJuZWwgdXNlcnMgdXNlIGJpdG1hcF93ZWlnaHQoKSB0byBjb21wYXJlIHRoZSByZXN1
bHQgYWdhaW5zdApzb21lIG51bWJlciBvciBleHByZXNzaW9uOgoKCWlmIChiaXRtYXBfd2VpZ2h0
KC4uLikgPiAxKQoJCWRvX3NvbWV0aGluZygpOwoKSXQgd29ya3MgT0ssIGJ1dCBtYXkgYmUgc2ln
bmlmaWNhbnRseSBpbXByb3ZlZCBmb3IgbGFyZ2UgYml0bWFwczogaWYKZmlyc3QgZmV3IHdvcmRz
IGNvdW50IHNldCBiaXRzIHRvIGEgbnVtYmVyIGdyZWF0ZXIgdGhhbiBnaXZlbiwgd2UgY2FuCnN0
b3AgY291bnRpbmcgYW5kIGltbWVkaWF0ZWx5IHJldHVybi4KClRoZSBzYW1lIGlkZWEgd291bGQg
d29yayBpbiBvdGhlciBkaXJlY3Rpb246IGlmIHdlIGtub3cgdGhhdCB0aGUgbnVtYmVyCm9mIHNl
dCBiaXRzIHRoYXQgd2UgY291bnRlZCBzbyBmYXIgaXMgc21hbGwgZW5vdWdoLCBzbyB0aGF0IGl0
IHdvdWxkIGJlCnNtYWxsZXIgdGhhbiByZXF1aXJlZCBudW1iZXIgZXZlbiBpZiBhbGwgYml0cyBv
ZiB0aGUgcmVzdCBvZiB0aGUgYml0bWFwCmFyZSBzZXQsIHdlIGNhbiBzdG9wIGNvdW50aW5nIGVh
cmxpZXIuCgpUaGlzIHBhdGNoIGFkZHMgbmV3IGJpdG1hcF93ZWlnaHRfY21wKCkgYXMgc3VnZ2Vz
dGVkIGJ5IE1pY2hhxYIgTWlyb3PFgmF3CmFuZCBhIGZhbWlseSBvZiBlcSwgZ3QsIGdlLCBsdCBh
bmQgbGUgd3JhcHBlcnMgdG8gYWxsb3cgdGhpcyBvcHRpbWl6YXRpb24uClRoZSBmb2xsb3dpbmcg
cGF0Y2hlcyBhcHBseSBuZXcgZnVuY3Rpb25zIHdoZXJlIGFwcHJvcHJpYXRlLgoKU3VnZ2VzdGVk
LWJ5OiAiTWljaGHFgiBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4gKGZvciBi
aXRtYXBfd2VpZ2h0X2NtcCkKU2lnbmVkLW9mZi1ieTogWXVyeSBOb3JvdiA8eXVyeS5ub3JvdkBn
bWFpbC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9iaXRtYXAuaCB8IDgwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogbGliL2JpdG1hcC5jICAgICAgICAgICB8IDIx
ICsrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9iaXRtYXAuaCBiL2luY2x1ZGUvbGludXgvYml0bWFwLmgKaW5k
ZXggN2RiYTA4NDc1MTBjLi43MDhlNTdiMzIzNjIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
Yml0bWFwLmgKKysrIGIvaW5jbHVkZS9saW51eC9iaXRtYXAuaApAQCAtNTEsNiArNTEsMTIgQEAg
c3RydWN0IGRldmljZTsKICAqICBiaXRtYXBfZW1wdHkoc3JjLCBuYml0cykgICAgICAgICAgICAg
ICAgICAgIEFyZSBhbGwgYml0cyB6ZXJvIGluICpzcmM/CiAgKiAgYml0bWFwX2Z1bGwoc3JjLCBu
Yml0cykgICAgICAgICAgICAgICAgICAgICBBcmUgYWxsIGJpdHMgc2V0IGluICpzcmM/CiAgKiAg
Yml0bWFwX3dlaWdodChzcmMsIG5iaXRzKSAgICAgICAgICAgICAgICAgICBIYW1taW5nIFdlaWdo
dDogbnVtYmVyIHNldCBiaXRzCisgKiAgYml0bWFwX3dlaWdodF9jbXAoc3JjLCBuYml0cykgICAg
ICAgICAgICAgICBjb21wYXJlIEhhbW1pbmcgV2VpZ2h0IHdpdGggYSBudW1iZXIKKyAqICBiaXRt
YXBfd2VpZ2h0X2VxKHNyYywgbmJpdHMsIG51bSkgICAgICAgICAgIEhhbW1pbmcgV2VpZ2h0ID09
IG51bQorICogIGJpdG1hcF93ZWlnaHRfZ3Qoc3JjLCBuYml0cywgbnVtKSAgICAgICAgICAgSGFt
bWluZyBXZWlnaHQgPiAgbnVtCisgKiAgYml0bWFwX3dlaWdodF9nZShzcmMsIG5iaXRzLCBudW0p
ICAgICAgICAgICBIYW1taW5nIFdlaWdodCA+PSBudW0KKyAqICBiaXRtYXBfd2VpZ2h0X2x0KHNy
YywgbmJpdHMsIG51bSkgICAgICAgICAgIEhhbW1pbmcgV2VpZ2h0IDwgIG51bQorICogIGJpdG1h
cF93ZWlnaHRfbGUoc3JjLCBuYml0cywgbnVtKSAgICAgICAgICAgSGFtbWluZyBXZWlnaHQgPD0g
bnVtCiAgKiAgYml0bWFwX3NldChkc3QsIHBvcywgbmJpdHMpICAgICAgICAgICAgICAgICBTZXQg
c3BlY2lmaWVkIGJpdCBhcmVhCiAgKiAgYml0bWFwX2NsZWFyKGRzdCwgcG9zLCBuYml0cykgICAg
ICAgICAgICAgICBDbGVhciBzcGVjaWZpZWQgYml0IGFyZWEKICAqICBiaXRtYXBfZmluZF9uZXh0
X3plcm9fYXJlYShidWYsIGxlbiwgcG9zLCBuLCBtYXNrKSAgRmluZCBiaXQgZnJlZSBhcmVhCkBA
IC0xNjIsNiArMTY4LDcgQEAgaW50IF9fYml0bWFwX2ludGVyc2VjdHMoY29uc3QgdW5zaWduZWQg
bG9uZyAqYml0bWFwMSwKIGludCBfX2JpdG1hcF9zdWJzZXQoY29uc3QgdW5zaWduZWQgbG9uZyAq
Yml0bWFwMSwKIAkJICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcDIsIHVuc2lnbmVkIGlu
dCBuYml0cyk7CiBpbnQgX19iaXRtYXBfd2VpZ2h0KGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1h
cCwgdW5zaWduZWQgaW50IG5iaXRzKTsKK2ludCBfX2JpdG1hcF93ZWlnaHRfY21wKGNvbnN0IHVu
c2lnbmVkIGxvbmcgKmJpdG1hcCwgdW5zaWduZWQgaW50IGJpdHMsIGludCBudW0pOwogdm9pZCBf
X2JpdG1hcF9zZXQodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBpbnQgc3RhcnQsIGludCBs
ZW4pOwogdm9pZCBfX2JpdG1hcF9jbGVhcih1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGlu
dCBzdGFydCwgaW50IGxlbik7CiAKQEAgLTQwMyw2ICs0MTAsNzkgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSBpbnQgYml0bWFwX3dlaWdodChjb25zdCB1bnNpZ25lZCBsb25nICpzcmMsIHVuc2ln
bmVkIGludAogCXJldHVybiBfX2JpdG1hcF93ZWlnaHQoc3JjLCBuYml0cyk7CiB9CiAKKy8qKgor
ICogYml0bWFwX3dlaWdodF9jbXAgLSBjb21wYXJlcyBudW1iZXIgb2Ygc2V0IGJpdHMgaW4gQHNy
YyB3aXRoIEBudW0uCisgKiBAc3JjOiAgIHNvdXJjZSBiaXRtYXAKKyAqIEBuYml0czogbGVuZ3Ro
IG9mIGJpdG1hcCBpbiBiaXRzCisgKiBAbnVtOiAgIG51bWJlciB0byBjb21wYXJlIHdpdGgKKyAq
CisgKiBBcyBvcHBvc2l0ZSB0byBiaXRtYXBfd2VpZ2h0KCkgdGhpcyBmdW5jdGlvbiBkb2Vzbid0
IG5lY2Vzc2FyaWx5CisgKiB0cmF2ZXJzZSBmdWxsIGJpdG1hcCBhbmQgbWF5IHJldHVybiBlYXJs
aWVyLgorICoKKyAqIFJldHVybnMgemVybyBpZiB3ZWlnaHQgb2YgQHNyYyBpcyBlcXVhbCB0byBA
bnVtOworICoJICAgbmVnYXRpdmUgbnVtYmVyIGlmIHdlaWdodCBvZiBAc3JjIGlzIGxlc3MgdGhh
biBAbnVtOworICoJICAgcG9zaXRpdmUgbnVtYmVyIGlmIHdlaWdodCBvZiBAc3JjIGlzIGdyZWF0
ZXIgdGhhbiBAbnVtOworICoKKyAqIE5PVEVTCisgKgorICogQmVjYXVzZSBudW1iZXIgb2Ygc2V0
IGJpdHMgY2Fubm90IGRlY3JlYXNlIHdoaWxlIGNvdW50aW5nLCB3aGVuIHVzZXIKKyAqIHdhbnRz
IHRvIGtub3cgaWYgdGhlIG51bWJlciBvZiBzZXQgYml0cyBpbiB0aGUgYml0bWFwIGlzIGxlc3Mg
dGhhbgorICogQG51bSwgY2FsbGluZworICoJYml0bWFwX3dlaWdodF9jbXAoLi4uLCBAbnVtKSA8
IDAKKyAqIGlzIHBvdGVudGlhbGx5IGxlc3MgZWZmZWN0aXZlIHRoYW4KKyAqCWJpdG1hcF93ZWln
aHRfY21wKC4uLiwgQG51bSAtIDEpIDw9IDAKKyAqCisgKiBDb25zaWRlciBhbiBleGFtcGxlOgor
ICogYml0bWFwX3dlaWdodF9jbXAoMTAwMCAwMDAwIDAwMDAgMDAwMCwgMSkgPCAwCisgKgkJCQkg
ICAgXgorICoJCQkJICAgIHN0b3AgaGVyZQorICoKKyAqIGJpdG1hcF93ZWlnaHRfY21wKDEwMDAg
MDAwMCAwMDAwIDAwMDAsIDApIDw9IDAKKyAqCQkgICAgIF4KKyAqCQkgICAgIHN0b3AgaGVyZQor
ICovCitzdGF0aWMgX19hbHdheXNfaW5saW5lCitpbnQgYml0bWFwX3dlaWdodF9jbXAoY29uc3Qg
dW5zaWduZWQgbG9uZyAqc3JjLCB1bnNpZ25lZCBpbnQgbmJpdHMsIGludCBudW0pCit7CisJaWYg
KG51bSA+IChpbnQpbmJpdHMgfHwgbnVtIDwgMCkKKwkJcmV0dXJuIC1udW07CisKKwlpZiAoc21h
bGxfY29uc3RfbmJpdHMobmJpdHMpKQorCQlyZXR1cm4gaHdlaWdodF9sb25nKCpzcmMgJiBCSVRN
QVBfTEFTVF9XT1JEX01BU0sobmJpdHMpKSAtIG51bTsKKworCXJldHVybiBfX2JpdG1hcF93ZWln
aHRfY21wKHNyYywgbmJpdHMsIG51bSk7Cit9CisKK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUKK2Jv
b2wgYml0bWFwX3dlaWdodF9lcShjb25zdCB1bnNpZ25lZCBsb25nICpzcmMsIHVuc2lnbmVkIGlu
dCBuYml0cywgaW50IG51bSkKK3sKKwlyZXR1cm4gYml0bWFwX3dlaWdodF9jbXAoc3JjLCBuYml0
cywgbnVtKSA9PSAwOworfQorCitzdGF0aWMgX19hbHdheXNfaW5saW5lCitib29sIGJpdG1hcF93
ZWlnaHRfZ3QoY29uc3QgdW5zaWduZWQgbG9uZyAqc3JjLCB1bnNpZ25lZCBpbnQgbmJpdHMsIGlu
dCBudW0pCit7CisJcmV0dXJuIGJpdG1hcF93ZWlnaHRfY21wKHNyYywgbmJpdHMsIG51bSkgPiAw
OworfQorCitzdGF0aWMgX19hbHdheXNfaW5saW5lCitib29sIGJpdG1hcF93ZWlnaHRfZ2UoY29u
c3QgdW5zaWduZWQgbG9uZyAqc3JjLCB1bnNpZ25lZCBpbnQgbmJpdHMsIGludCBudW0pCit7CisJ
cmV0dXJuIGJpdG1hcF93ZWlnaHRfY21wKHNyYywgbmJpdHMsIG51bSAtIDEpID4gMDsKK30KKwor
c3RhdGljIF9fYWx3YXlzX2lubGluZQorYm9vbCBiaXRtYXBfd2VpZ2h0X2x0KGNvbnN0IHVuc2ln
bmVkIGxvbmcgKnNyYywgdW5zaWduZWQgaW50IG5iaXRzLCBpbnQgbnVtKQoreworCXJldHVybiBi
aXRtYXBfd2VpZ2h0X2NtcChzcmMsIG5iaXRzLCBudW0gLSAxKSA8PSAwOworfQorCitzdGF0aWMg
X19hbHdheXNfaW5saW5lCitib29sIGJpdG1hcF93ZWlnaHRfbGUoY29uc3QgdW5zaWduZWQgbG9u
ZyAqc3JjLCB1bnNpZ25lZCBpbnQgbmJpdHMsIGludCBudW0pCit7CisJcmV0dXJuIGJpdG1hcF93
ZWlnaHRfY21wKHNyYywgbmJpdHMsIG51bSkgPD0gMDsKK30KKwogc3RhdGljIF9fYWx3YXlzX2lu
bGluZSB2b2lkIGJpdG1hcF9zZXQodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBpbnQgc3Rh
cnQsCiAJCXVuc2lnbmVkIGludCBuYml0cykKIHsKZGlmZiAtLWdpdCBhL2xpYi9iaXRtYXAuYyBi
L2xpYi9iaXRtYXAuYwppbmRleCA5MjY0MDg4ODM0NTYuLmZiODRjYTcwYzVkOSAxMDA2NDQKLS0t
IGEvbGliL2JpdG1hcC5jCisrKyBiL2xpYi9iaXRtYXAuYwpAQCAtMzQ4LDYgKzM0OCwyNyBAQCBp
bnQgX19iaXRtYXBfd2VpZ2h0KGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwgdW5zaWduZWQg
aW50IGJpdHMpCiB9CiBFWFBPUlRfU1lNQk9MKF9fYml0bWFwX3dlaWdodCk7CiAKK2ludCBfX2Jp
dG1hcF93ZWlnaHRfY21wKGNvbnN0IHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwgdW5zaWduZWQgaW50
IGJpdHMsIGludCBudW0pCit7CisJdW5zaWduZWQgaW50IGssIHcsIGxpbSA9IGJpdHMgLyBCSVRT
X1BFUl9MT05HOworCisJZm9yIChrID0gMCwgdyA9IDA7IGsgPCBsaW07IGsrKykgeworCQlpZiAo
dyArIGJpdHMgLSBrICogQklUU19QRVJfTE9ORyA8IG51bSkKKwkJCWdvdG8gb3V0OworCisJCXcg
Kz0gaHdlaWdodF9sb25nKGJpdG1hcFtrXSk7CisKKwkJaWYgKHcgPiBudW0pCisJCQlnb3RvIG91
dDsKKwl9CisKKwlpZiAoYml0cyAlIEJJVFNfUEVSX0xPTkcpCisJCXcgKz0gaHdlaWdodF9sb25n
KGJpdG1hcFtrXSAmIEJJVE1BUF9MQVNUX1dPUkRfTUFTSyhiaXRzKSk7CitvdXQ6CisJcmV0dXJu
IHcgLSBudW07Cit9CitFWFBPUlRfU1lNQk9MKF9fYml0bWFwX3dlaWdodF9jbXApOworCiB2b2lk
IF9fYml0bWFwX3NldCh1bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwgaW50
IGxlbikKIHsKIAl1bnNpZ25lZCBsb25nICpwID0gbWFwICsgQklUX1dPUkQoc3RhcnQpOwotLSAK
Mi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
