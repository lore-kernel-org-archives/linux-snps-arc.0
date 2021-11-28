Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08FFC433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CI389A4/lM/0d/bfSPXK+Nu7/kXD0q1RfyQkUKlKtk=; b=CwGstdtQaIAhef
	mvwvdm8I6OyVrxsGhfsyYXMUoSX7AKIOogNWEJB4Vjgg+bkS5l7mR++3iTw2kYmbuGsW1q50zjGcM
	sW0UB/zG9UyGSIORb24DR1IKOO3cf9ItAXxAMhNcLWYGDaaBnp72bIjsl2cGNk/g4ndCT0g1tKAHI
	KxNv8Go13JnW1C/a6n8TEny51phT9sasAGc4iWV4AqrRx33sxgNZq5R+Ru3MuWmK9Is99I1/1SHpc
	uh3m6H8iZ35KBXvH21gCiszQcjWBcK1bCH1Yx2EMy6i5r5VTgnRXC0vKouNJku/RX5zwx1K4AsFIB
	6/QtFBe5nQ3YpxkKkA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrPCy-00GU8j-7K; Sun, 28 Nov 2021 18:47:28 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrPCs-00GU62-K7; Sun, 28 Nov 2021 18:47:24 +0000
Received: by mail-qv1-xf35.google.com with SMTP id i13so12286526qvm.1;
 Sun, 28 Nov 2021 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+5JBAVd8frUmOsccut4e882tgrn1djQ8KjHhL4/ag+E=;
 b=oEs9cCLNoYNdz+AbfzXoumcqnU2rFCFJ5TyCH12jj8Ix0vmr0cjhof0ocW5eqSpQbo
 mrHrVXqzVgn1iu3yISJ4wwf50y2BGwES4qCIZWk6z19v3s6rfhM8ODKHsnHGdu0xSYmn
 zutWpoWgGKrfvlhNB+FDfgo3OCF/7V6L7yaewLYpZDm48/8KLn7Bhlr/nJjgfB4Oiw7i
 hyEVArk/04uNSdzcAMwME+LGzw661S1XN1lrF6iOjE5r2wDmrufbwXHGBlcjc0XG2JfP
 D0I2JqoyhsvbiLTErDYg5FY5mgjhIpdLZ1XuQkVWsomuMWeu+IFVGskruJ1MCFhjIPEq
 wYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+5JBAVd8frUmOsccut4e882tgrn1djQ8KjHhL4/ag+E=;
 b=W+ePG4AXaCNLIJAeSkZfkFU8hlJX22GA4kJUtRD4hfo5IZA/6Ik0ga0f0KXiPKlZEw
 PMVGWwjdP1ykXTpe7JZ36IVCUMWh/FbB5pKty+uM1fnaWdJk87GwlVj6Yd8JlvMSzH1n
 nVC60ueI8mN5dJ1j2gWNyYJsTQu4igsfkAgHyePhMBDDEeQtS5NmpvqmOh/WBxlw2avW
 YMg95/c6z/+/M3TrHuAthim20ONa79/S3qgtzi5exFC3TwzvK+nGLTk+r4mHm162Aaro
 gkkjjV0eP0gE5rKkJ5kE+ayQKjYocXbSjkovs7YGGBe9Xw+F8l+Mh9svo2YlKwRkJpQf
 rjBQ==
X-Gm-Message-State: AOAM530PVaOxEX5S8LaNaqxQsl5E0hHjJ3iys3cpkZwgimL9rmyrFV/F
 a9HAmMlpAq9RBHGSEHfqkSI=
X-Google-Smtp-Source: ABdhPJy+21VmTcm+AhhPYb7MVuOfGbfxLsGp1r9C41IKKFVcOTnAXjsR8SRxKxcOFPC3Y4DL0s01XQ==
X-Received: by 2002:a05:6214:2348:: with SMTP id
 hu8mr12230119qvb.9.1638125241136; 
 Sun, 28 Nov 2021 10:47:21 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id e13sm7457944qte.56.2021.11.28.10.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 10:47:20 -0800 (PST)
Date: Sun, 28 Nov 2021 10:47:12 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Dennis Zhou <dennis@kernel.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
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
 Dinh Nguyen <dinguyen@kernel.org>, Geetha sowjanya <gakula@marvell.com>,
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
Message-ID: <20211128184712.GA309073@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt> <YaPCOPqpI/oKrTXl@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaPCOPqpI/oKrTXl@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_104722_709775_80A3AF17 
X-CRM114-Status: GOOD (  29.77  )
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

On Sun, Nov 28, 2021 at 12:54:00PM -0500, Dennis Zhou wrote:
> Hello,
> 
> On Sun, Nov 28, 2021 at 09:43:20AM -0800, Yury Norov wrote:
> > On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > > to return earlier depending on the condition.
> > > []
> > > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > > []
> > > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > > >  	 * if platform didn't set the present map already, do it now
> > > >  	 * boot cpu is set to present already by init/main.c
> > > >  	 */
> > > > -	if (num_present_cpus() <= 1)
> > > > +	if (num_present_cpus_le(2))
> > > >  		init_cpu_present(cpu_possible_mask);
> > > 
> > > ?  is this supposed to be 2 or 1
> > 
> > X <= 1 is the equivalent of X < 2.
> > 
> > > > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> > > []
> > > > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > -	if (num_present_cpus() > 4) {
> > > > +	if (num_present_cpus_gt(4)) {
> > > >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> > > >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> > > >  		       __func__);
> > > 
> > > It looks as if the present variants should be using the same values
> > > so the _le test above with 1 changed to 2 looks odd.
> >  
> 
> I think the confusion comes from le meaning less than rather than lt.
> Given the general convention of: lt (<), le (<=), eg (=), ge (>=),
> gt (>), I'd consider renaming your le to lt.

Ok, makes sense. I'll rename in v2 and add <= and >= versions.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
