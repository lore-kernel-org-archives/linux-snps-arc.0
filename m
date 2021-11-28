Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60530C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 06:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+Ar2Y/4XTjbSMIVmhkgrc48KQqVn0Ej5XFC4ePiibg=; b=lZVNH+s7wr3FKi
	TgkTY/m7/pDZqYVxadkJkEDWJrYk6YjdaWUFvgJe1icjqWeO8cX2wHnDSO6s6uveK+2YYUEljxVR7
	GSmD2aQEqWYS3UderhrzjqamhvcdwthFSSlIpkuv4B99cPXTCfUDT/PBpY0ppYplBECVisD45/nDr
	e/zHf8wwXdX6/mxOKQ7yfgd9QrL+zjmGMVomTEcn+V7K07hCEUqKzDP0puAKR5olkd2f4KHR+blxe
	N9Q1LKJiGzITdKAdVlbhZjs64sbr0p7MN6YXG4SGrMdo7ElazE4hvZaBbsH3aQXAIEXK1zYTbUE3z
	c1gqxiTNPYukVKek2KPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrDex-00FBYW-Ka; Sun, 28 Nov 2021 06:27:35 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrDer-00FBWs-VV; Sun, 28 Nov 2021 06:27:32 +0000
Received: by mail-qk1-x729.google.com with SMTP id t83so19290686qke.8;
 Sat, 27 Nov 2021 22:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UUaWw2/vndQwOuhRc6j6PRwXuBODm2Svdcs9xeM4FlQ=;
 b=RUU7MzRkdirUtowuDWCiM08P7YQBQBC0acoWzbBj+T+XJI6vVMBSu6aGIKh4+icUwh
 a8q9bMYJuHCqFTUz0wNigsRNRIbsDwqKoKMNa0qnfF66qijICeNv/dPkbz+/087xhZlV
 f64hTvJmbUAx1It3pzpI4UUvGtwyNbU+zmtX09eMQ0ByGsuhC27g5T60WwoNMBivtuLQ
 VUm/Sp71jqGs+1C8GEcrf12fOpYmPWgYxCrrC9gGrggZZRnsjHL5/c7LM3QqhQgnqCqj
 LxxzrdrvicV7rQvSx7+bgEc8nFcDr55sjaFrS6W7kwXrGHkLvw0E6R41fTx7A36r5Slm
 hdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UUaWw2/vndQwOuhRc6j6PRwXuBODm2Svdcs9xeM4FlQ=;
 b=gKCnjbXtvKiPAuBDwlPQsd8np9kMttBKYM+CSOQeJYSanpDO+mLQ7cSXfG7adQ92bb
 sG8toBrYaNy5KB2r9Oi4BqrRCeXWqVO0mMyyG86ZpjQsSmU4tu8CBzqaypQoUEq3eImO
 FRftcvC8Di+SAnS2PgjHPRMPc2KKNYLTONnhdnYp6uuYg65wnPhuFmKoUCZ9FFEfnJY8
 GbowvArDgvlRKER5uTrfi5eERn9pdRvtxeQtISuyLo8oZTTlHIqF3D1GiOQwl7Szd1Jg
 FHAP81aj0tI51P9jM5TG5fCY5INPckS5q4dY3xYw1w1NukNG/ZF0HhJn1ziWiYviJiw0
 NvsQ==
X-Gm-Message-State: AOAM531kwW8OoLAb20zP2wAxr2+2OqX8cdQYLTNL+ccruoQphiz8dvBd
 TurJlm7lp/CVm8hrUToIfRY=
X-Google-Smtp-Source: ABdhPJxAVXtuKFpo3xQALAgWXmZbnwidtxXikhe9UCcw/0T4+58Z974u1PPCzNdv2+qiERrm5clSCw==
X-Received: by 2002:a05:620a:2153:: with SMTP id
 m19mr32383206qkm.77.1638080848758; 
 Sat, 27 Nov 2021 22:27:28 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id z4sm6611865qtj.42.2021.11.27.22.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 22:27:28 -0800 (PST)
Date: Sat, 27 Nov 2021 22:27:27 -0800
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
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Message-ID: <20211128062727.GA276670@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_222730_040427_45774A48 
X-CRM114-Status: GOOD (  18.00  )
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

T24gU3VuLCBOb3YgMjgsIDIwMjEgYXQgMDU6Mzc6MTlBTSArMDEwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gT24gU2F0LCBOb3YgMjcsIDIwMjEgYXQgMDc6NTY6NTdQTSAtMDgwMCwgWXVy
eSBOb3JvdiB3cm90ZToKPiA+IE5vdyBhcyB3ZSBoYXZlIGJpdG1hcF93ZWlnaHRfZXEoKSwgc3dp
dGNoIGJpdG1hcF9mdWxsKCkgYW5kCj4gPiBiaXRtYXBfZW1wdHkoKSB0byB1c2luZyBpdC4KPiBb
Li4uXQo+ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCBiaXRtYXBfZW1wdHkoY29uc3QgdW5zaWduZWQg
bG9uZyAqc3JjLCB1bnNpZ25lZCBuYml0cykKPiA+IC17Cj4gPiAtCWlmIChzbWFsbF9jb25zdF9u
Yml0cyhuYml0cykpCj4gPiAtCQlyZXR1cm4gISAoKnNyYyAmIEJJVE1BUF9MQVNUX1dPUkRfTUFT
SyhuYml0cykpOwo+ID4gLQo+ID4gLQlyZXR1cm4gZmluZF9maXJzdF9iaXQoc3JjLCBuYml0cykg
PT0gbmJpdHM7Cj4gPiAtfQo+IFsuLi5dCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29s
IGJpdG1hcF9lbXB0eShjb25zdCB1bnNpZ25lZCBsb25nICpzcmMsIHVuc2lnbmVkIGludCBuYml0
cykKPiA+ICt7Cj4gPiArCXJldHVybiBiaXRtYXBfd2VpZ2h0X2VxKHNyYywgbmJpdHMsIDApOwo+
ID4gK30KPiBbLi5dCj4gCj4gV2hhdCdzIHRoZSBzcGVlZCBkaWZmZXJlbmNlPyBIYXZlIHlvdSBi
ZW5jaG1hcmtlZCB0aGlzPwoKYml0bWFwX3dlaWdodF9lcSgpIHNob3VsZCBiZSBmYXN0ZXIgdGhh
biBmaW5kX2ZpcnN0X2JpdCgpLCBidXQgdGhlCmRpZmZlcmVuY2UgaXMgZmV3IGN5Y2xlcywgc28g
SSBkaWRuJ3QgYm90aGVyIG1lYXN1cmluZyBpdC4KCk5ldyB2ZXJzaW9uIGxvb2tzIGp1c3QgYmV0
dGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
