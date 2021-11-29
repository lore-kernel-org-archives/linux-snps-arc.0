Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F490C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Nov 2021 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3L0ukgeYvVwQeaPPmIwwkvL+8DghD5KOzhbl43BmSvI=; b=43Zg8XDc1uJhBf
	AdnYil9ZKf7IrDG+0PAHAtl3VUDyWtAbCVE+Z1dIlSRTzKpDhjL34V2EgKTs3rwC0UdCGpsrcCJdw
	efTbpIxnDLgXLqQ9X+2RBDFnLLG4xKobgdm6ougHgnCGqSTk6eHqhDa2hWXa6e0mP1BcDJ++IFU1+
	US5OaPOMleAqNPBAnov8NIo6oRHtyp7O+UGzja0mPLg/YIoVc0VqLodET4R0HADRrJ+xsBuRpEdu7
	Z2s9AWx40wpJCdZ1iCukET0Bj8MUGfrPpV4RNtyj50JA0nyLF2xNtqrfcH8hGhI7TMqNxW/5yFYuU
	obIjdv5cR/y4FvmwYfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mraJP-00HT0v-SJ; Mon, 29 Nov 2021 06:38:51 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mraJM-00HSzT-QT; Mon, 29 Nov 2021 06:38:50 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id kl8so13652826qvb.3;
 Sun, 28 Nov 2021 22:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GW7wD7qKvROu8z9xZL5o2Gh9JvMEXrXNdc/d8bAaPNs=;
 b=Ximtyy9D6hF34jeHkx2abhxO2fEDksv5f5qJu4CbvoNWokti3yxmfDL3L7TYPRNI1N
 nLBExnAtE1kHxfW3UuSIcTZjpfdkrYaWw77PtYlgHprrRWmhg8onSirLlPaay6tbmdGV
 QOolCDulR6Tk/EKA2Gv8Xlb2VKcWxKtuMIpV9m8bP/Y2OIkRrwh1D8Uy/bj62ViSMN2l
 ZvGgVYwmHud/XyWXGXVdXp5Qsb6Tf/NpieRKvdWwCGOCaqCRU7xxjxP8pUys/Y0my6pK
 DI87mJm/+MqXPnLUnP7Gv+O+UoGKFiXftZWbYzOV5qGvrEcopuUsleS20idOc1qycgZd
 CJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GW7wD7qKvROu8z9xZL5o2Gh9JvMEXrXNdc/d8bAaPNs=;
 b=aoYUwJ5wefmz8YA8Syk9K+kdv/Df2DHsF3PjxPSPmulXX90AH7fccCqy7CiaF4jYht
 uu9RcNdYq0WB9pdeqydT2J3XqNa4r2Tss1AR/GCn58D1zx5sN7eD5UC8sptJYbsteZJr
 2kcf0oxQ1axA/72vN818lKrVxf5e5tYYvnOXR6JXwctzE49D0eHV2XremFZj0mB/by02
 ADASTikzRyL5Bs/rY2WX6LYJmZ7hKSWpqRBlzrN7tDkGwkQYrQMZ2+WI6v4gVa0ID9LW
 gtV8E5iILWS2ddmHrfALwueOMLG/dbmZDwyufg07kPBNIGRaFZT3TDTbVXO6iwNsCBT6
 ROYQ==
X-Gm-Message-State: AOAM530cWHq4CX03Co8GZwfU4Ye0UsPNo8aehjJqKT65g2e+fuBElp8d
 UM8jAiPVVhhBrMChs+WJVnk=
X-Google-Smtp-Source: ABdhPJwSywxmnS7RgaW8ur/GbWm8YSeTFfi4rMgLh/NdfnxtrZBeDnmatO6ciZp/cAThb6LO+btZbw==
X-Received: by 2002:a05:6214:984:: with SMTP id
 dt4mr30031399qvb.120.1638167922796; 
 Sun, 28 Nov 2021 22:38:42 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id h19sm8495514qth.63.2021.11.28.22.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:38:42 -0800 (PST)
Date: Sun, 28 Nov 2021 22:38:39 -0800
From: Yury Norov <yury.norov@gmail.com>
To: mirq-test@rere.qmqm.pl
Cc: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
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
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <20211129063839.GA338729@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_223848_926169_6BCEDFCB 
X-CRM114-Status: GOOD (  26.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, Nov 28, 2021 at 07:03:41PM +0100, mirq-test@rere.qmqm.pl wrote:
> On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
> > In many cases people use bitmap_weight()-based functions like this:
> > 
> > 	if (num_present_cpus() > 1)
> > 		do_something();
> > 
> > This may take considerable amount of time on many-cpus machines because
> > num_present_cpus() will traverse every word of underlying cpumask
> > unconditionally.
> > 
> > We can significantly improve on it for many real cases if stop traversing
> > the mask as soon as we count present cpus to any number greater than 1:
> > 
> > 	if (num_present_cpus_gt(1))
> > 		do_something();
> > 
> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> > functions together with corresponding wrappers in cpumask and nodemask.
> 
> Having slept on it I have more structured thoughts:
> 
> First, I like substituting bitmap_empty/full where possible - I think
> the change stands on its own, so could be split and sent as is.

Ok, I can do it.

> I don't like the proposed API very much. One problem is that it hides
> the comparison operator and makes call sites less readable:
> 
> 	bitmap_weight(...) > N
> 
> becomes:
> 
> 	bitmap_weight_gt(..., N)
> 
> and:
> 	bitmap_weight(...) <= N
> 
> becomes:
> 
> 	bitmap_weight_lt(..., N+1)
> or:
> 	!bitmap_weight_gt(..., N)
> 
> I'd rather see something resembling memcmp() API that's known enough
> to be easier to grasp. For above examples:
> 
> 	bitmap_weight_cmp(..., N) > 0
> 	bitmap_weight_cmp(..., N) <= 0
> 	...

bitmap_weight_cmp() cannot be efficient. Consider this example:

bitmap_weight_lt(1000 0000 0000 0000, 1) == false
                 ^
                 stop here

bitmap_weight_cmp(1000 0000 0000 0000, 1) == 0
                                 ^
                                 stop here

I agree that '_gt' is less verbose than '>', but the advantage of 
'_gt' over '>' is proportional to length of bitmap, and it means
that this API should exist.

> This would also make the implementation easier in not having to
> copy and paste the code three times. Could also use a simple
> optimization reducing code size:

In the next version I'll reduce code duplication like this:

bool bitmap_eq(..., N);
bool bitmap_ge(..., N);

#define bitmap_weight_gt(..., N)  bitmap_weight_ge(..., N + 1)
#define bitmap_weight_lt(..., N) !bitmap_weight_ge(..., N)
#define bitmap_weight_le(..., N) !bitmap_weight_gt(..., N)

Thanks,
Yury

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
