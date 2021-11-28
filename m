Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713C8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6+yBvdrf8SuZYtQbqqvKjJIZ1irXbHPY2MhDUnYqVk=; b=DUfPvlEubvxk0G
	c18V8R9QZJEKzyoFi4CcAQrEvwWEL9P5XYHTdAadQeQ1PVgpdD9n+/BF1UtRrPTfpTY7kuM0grsC0
	kX1KbH9jX88onR8gUMyXC8o/tIvFD6rEZ61pG3M3k9UYl49Rqsc+066YX+2OUzuR7n43w2ZaRMK/A
	RIIdEi7GrrOoy5VJv+h2pB5BrlBm/yoPoijEzEzQ/B4wsNmSQTMkX8ngIumxVFkOSgYNStDLA5opo
	7/6BJF9rZLpbHFR0e0UdXEE9Fh6nex7x6OLwitbHWvUp7eTUcTr/dzKxQ8j/GJq/35ThD/Q1zbde9
	3SRmQLFQe5Hn53We5mCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrTin-00Gqhl-O6; Sun, 28 Nov 2021 23:36:37 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrTih-00GqfR-2j; Sun, 28 Nov 2021 23:36:32 +0000
Received: by mail-qk1-x72f.google.com with SMTP id q64so20961388qkd.5;
 Sun, 28 Nov 2021 15:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+pvPLMMOaG75eXeO+MYWVtFy7p98nfe1U4iD6DUFgqs=;
 b=FqHxiwrQ7QYivLGpovhQrNQCHUCj7LxMV2WH4G2Ujzkjgck5ZuLpYg6YmyS5/pcjd8
 PioI6TsqEy6uPfhoz8wEavEgHnpCryLeBpBEb8dr5G6s12WteiFVLQFxrBR47EVsTB3X
 ndIWwpq8YabRGonzz7m7f+N7UJXzBMp2vfRHxXo9M1u6ZB6qiEh6DrJAZ2z7gRkAQ5sC
 IqRPeZsbgWqH6z7gZV/iyVzYOISv9QQ48jjOTsL+5HMXkolOWVbHK0gj+h+Ra3+OPnrQ
 HZwGnjmshXRb1nFHqTfVME98Ezv2622Zg9Ol7LGc837jR3cjnZ1W8PCl/MaA7m1eTWjV
 ggTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+pvPLMMOaG75eXeO+MYWVtFy7p98nfe1U4iD6DUFgqs=;
 b=Js4R5RhmLG0oOcaKrpqpNazYICXmZ0NRCDyJy/VsdQR5JlPmfB0E5W0w+H/pheomVq
 GITS0GahRJrGWqTcclHXhgus+YKq72ZuLy7Hvxt07Qgt0qjIPFiusUONu39LEhqKVc6O
 ITLMqi3LXm/N9e0YM5JmSKmYDx8zQ8AgL0Dsc2FtDlBkKaFLHuPsm4NmLC4wH9mGYbpC
 ySRkLf3BLqClxeS1sfCfJ+bslc6KQIUUXY1H9ctRCTfqXMtrY88RvcWlgnFWg+Oh/qPN
 p2u/sIuE64ck64GjldR+/BaHO06wY2w0BB5JKUEvaq3zSGv0h8Jc9gYUkcAPy5+PzDWm
 PJww==
X-Gm-Message-State: AOAM531qbkncW/161iQlgQf3524EiFYhhr+o4MgKh5VR31+2plNydldC
 rw4peH0UXRopKOKxuPk4RWg=
X-Google-Smtp-Source: ABdhPJwjz8dPYMt9os+urjypBO3KPO0n0aAUmhuhKTUddMw0/hFm/BxjybZbsejId+j0oxfauAhjwQ==
X-Received: by 2002:a05:620a:4491:: with SMTP id
 x17mr26762094qkp.528.1638142589577; 
 Sun, 28 Nov 2021 15:36:29 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id h19sm8013261qth.63.2021.11.28.15.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 15:36:28 -0800 (PST)
Date: Sun, 28 Nov 2021 15:36:27 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Andy Gross <agross@kernel.org>, David Airlie <airlied@linux.ie>,
 Alexey Klimov <aklimov@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@infradead.org>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@fb.com>,
 bcm-kernel-feedback-list@broadcom.com, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Hans de Goede <hdegoede@redhat.com>,
 Ian Rogers <irogers@google.com>, Jason Wessel <jason.wessel@windriver.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Jonathan Cameron <jic23@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 kvm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Russell King <linux@armlinux.org.uk>, linux-crypto@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Andy Lutomirski <luto@kernel.org>,
 Mark Gross <markgross@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Marc Zyngier <maz@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Marcin Wojtas <mw@semihalf.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Solomon Peachy <pizza@shaftnet.org>, Petr Mladek <pmladek@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Roy Pledge <Roy.Pledge@nxp.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Sunil Goutham <sgoutham@marvell.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vlastimil Babka <vbabka@suse.cz>, Vineet Gupta <vgupta@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Message-ID: <20211128233627.GA323159@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <1638096766.3elxdzb8ly.astroid@bobo.none>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638096766.3elxdzb8ly.astroid@bobo.none>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_153631_148408_8B33FE0E 
X-CRM114-Status: GOOD (  19.58  )
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

On Sun, Nov 28, 2021 at 09:08:41PM +1000, Nicholas Piggin wrote:
> Excerpts from Yury Norov's message of November 28, 2021 1:56 pm:
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
> There would be no change to callers if you maintain counters like what
> is done for num_online_cpus() today. Maybe some fixes to arch code that
> does not use set_cpu_possible() etc APIs required, but AFAIKS it would
> be better to fix such cases anyway.

Thanks, Nick. I'll try to do this.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
