Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B264C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6BMiL+seQQDQRZ3gGeRs6emCT6AZdv3jPS20Pqq9ZU=; b=ul9mrEu1R2wlBl
	X2H/dU3Ww7wdd/QpIWkjb3OSfDjSmnG364yLy7UcjpvtpqYQxvAq9772SFcg3ZF9szcLC5LorZDcB
	mugbn/Z9VsxV9vkklu6pvgBHG5Xh67iXwR8fd18N8UqdK9hAEDkr1zGpbB9uL30BKMbgmvE0/ufdh
	WqxHGA0m2+vNc1T0it1U7KY8fsb+/9+2nLPh0lyhnSiVG2C0fmVu9TRe5RDO00EXhcSUdnZSpxQQM
	ETb7GfBzBT6LynHa5ayrPzcLde0SPpNTc7bBI3IRrGlvNCVgyiU7YqqsgX+UXJchsbDErKysvp5lS
	w14cSvEkVAZDqFKIEO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrOD2-00GMjX-Es; Sun, 28 Nov 2021 17:43:28 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrOCx-00GMhP-9C; Sun, 28 Nov 2021 17:43:24 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id i13so12196808qvm.1;
 Sun, 28 Nov 2021 09:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EGDOAtYN2fK/PZFUkmOA85+Y42I5mUiptIM8w58G0rQ=;
 b=OJQe08uA10eX2TeWvqt06FdB++sdcPrwIbnMHmMMGLEPh2+R8hbd/40wYpjwkaqeE/
 6XfapPGwIUZ4LDWqz39Nwr5uu4E6umAX+6Z0+jE4weTI7q/jI3+ccI8GT5haFqvlnbNr
 sS4x0m3enUvOT+nRdFdnlBmA/MI7DQ4E1ZmrvA03uMZsjm9/iv2EP37/X2J9G1KwyXb6
 Hfv1Hav0WBaO6x7osIh95buMPO77Agb/hfuz57/z7KzCuL+cYyh+7wuFgcWNiN6IEUYt
 1HZymoWzXAdksfeaUOA73f5K948RKJ1FSFdx5FI5zvS1fbr8o5m0p5Rrx2G97GqX7v/H
 u+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EGDOAtYN2fK/PZFUkmOA85+Y42I5mUiptIM8w58G0rQ=;
 b=rSBQ7hc6uOxzUj3Rz0wxvtPcb0PB988FRUMG/gx+wx3l8YbE+XpzZAdHgMFtS32FrH
 UZES4Mp1MJJAACI1tS+pjdH+1tsCyj14KP9cXSI3IwM1e7iEIey/aSNJYWlGGwor+MPg
 gWqFOPNXlYRpx45r7y59kslutebWWL5qOgCncdkPVH5Luzbr5D6pb5DnRT0Y/Eqpz4ix
 XgSAqkC4EJ+P33d0tA/i/ibvbXsLPSWONpjseJejt5YuoO14bFkEk5zQ867oswI9pOji
 Rm1IEOmNpwBhg6OLCW3dOG267xXrSSABJPjLsWy8SokKPw3fJPI1GMp8k9t3nZbZ4ew6
 vRTg==
X-Gm-Message-State: AOAM530vdTZXAua3q2esiKtMAJ89skHz2g4Vz/iOVs/HBHc+V9/oIJAR
 kMTDXYT0ryoNuJmwAURRkXM=
X-Google-Smtp-Source: ABdhPJz1EHRO0NhP22/uPVki3bkMYlc7JC+OLMNGN1jvJUoway5a+xcKpp5gLpPJ+uu/Tahl0/hKjQ==
X-Received: by 2002:a05:6214:f2d:: with SMTP id
 iw13mr37805973qvb.13.1638121402048; 
 Sun, 28 Nov 2021 09:43:22 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id l22sm6905101qtj.68.2021.11.28.09.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 09:43:21 -0800 (PST)
Date: Sun, 28 Nov 2021 09:43:20 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Joe Perches <joe@perches.com>
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
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
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
Message-ID: <20211128174320.GA304543@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_094323_370121_11B31ABC 
X-CRM114-Status: GOOD (  24.95  )
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

On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> []
> > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> []
> > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  	 * if platform didn't set the present map already, do it now
> >  	 * boot cpu is set to present already by init/main.c
> >  	 */
> > -	if (num_present_cpus() <= 1)
> > +	if (num_present_cpus_le(2))
> >  		init_cpu_present(cpu_possible_mask);
> 
> ?  is this supposed to be 2 or 1

X <= 1 is the equivalent of X < 2.

> > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> []
> > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> >  		return ret;
> >  	}
> >  
> > -	if (num_present_cpus() > 4) {
> > +	if (num_present_cpus_gt(4)) {
> >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> >  		       __func__);
> 
> It looks as if the present variants should be using the same values
> so the _le test above with 1 changed to 2 looks odd.
 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
