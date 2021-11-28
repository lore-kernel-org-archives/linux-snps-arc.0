Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B047EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/K3t8weLaRuqL1m5fJF87dmOykT/O+NyAdnZU4EC2Q=; b=dnxVe31tBW+lL2
	Q0sw4CUCM/1UAw1AuvZW1MxAel1LVmLSkHZf2fpvXV+l5oY7UwLRBqNmOXmEz24gDkYb2Qftt6kZR
	sjKJMLmmqjIJJ0DjG2oK252tD3qNgw/DX/fDpDuoJFp/s8b1w5SmpUbRfDO4IhvGt5vaO8+wGPPvS
	mNAVeBOu0tqXebCuUOht+9ngXGZim9253pdXdBtJLtn8wuhbthmUN+9A3mtlAWgx/U7VOrzyiJI15
	1KgUIi8PnM2C6lQd/38TaxEO6nOZBdhlW7jCCTxN0ZRGkoSM5526RukKLQ6PSOPMuZCpjRoSkjULO
	YXUjroeIyBC7DAbk6eRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrOQF-00GP2A-4u; Sun, 28 Nov 2021 17:57:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrOQB-00GOzd-Bn; Sun, 28 Nov 2021 17:57:04 +0000
Received: by mail-pl1-x635.google.com with SMTP id v19so10213257plo.7;
 Sun, 28 Nov 2021 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIVU/9w51Ef2hg0ubArEuNU4cyYrytLI0Mp9d442l5g=;
 b=MOV5U2nrdRxFhWxyR7bOZpWlabqXOjxSoT999ssZl4Mq0S6JAhQfWyHw7OPilcdHmF
 6BGRpZnEpe8f9bpa77XQqQiPPBLd4gqEwap2s83tCamJXoetkbl6hCD0wkZTc5ZtL81/
 0oBwvtx8A8nEwcdqAvCz07X70fdDjUOrb88hgxJCEmCDBMTsfM8MgzFpsGuihBTo3i4/
 BO5H2USw15PhIR9jKFnq7EoAkCha2k8c7ry0hA6yyRozC0i3UkUk9dhKZX7Fdkb9vjGS
 8k1hfy+ikEeJEGfeYwNOOXgwgIH5nCo9f2fvYp5m9MjcvWjKnN995P4PSF7zBTJOShEa
 Axzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIVU/9w51Ef2hg0ubArEuNU4cyYrytLI0Mp9d442l5g=;
 b=hHhyV1dSSW43iyWJWxVLq0LEekaEFV80UB8PnXroIIVfTwIUZc2+JfhnoSKeNTK0bR
 rNAhOWNWi+jvrUuOUsvFBP/LPvbYVpgimMKoXFQoHocBw2w4KFYsc6CMzsSZH0TNYsfu
 hSTZoNgqtzwspev67EqugzDUJT89dEQYvs28qq/bXb++FsvA1rs9Iwt7lTaKfBJLInmY
 LmLN0J9Re4Jrlgl8sa5XwaUlqrz0ILpV5eh+wuiWCcSnatKq/Vfo6Ua+rU34MCh7lKw6
 b5LqEJYSf+lmpaVdFCCeUqHopZs55YEsmJ6e0vkuuPYQRHrdV8fB03Uv/DGP8JlEPJuF
 y1ZQ==
X-Gm-Message-State: AOAM530g6LLqQM0TzdYcjfLrrGjqMOmtkxOQYIN3EHpMlH/lAfygFMVy
 G77yv32gg+P9gl/LtI4ncV1LF7/78pv+sEoCBZM=
X-Google-Smtp-Source: ABdhPJwg/YAIedkhsO4JO/I1SvpK80O+jGy4LgSO12zXzv7Z2PPdL5Fb+4vML+arhaNI5Rnxj3zFEocQ77wPSF7XA5Q=
X-Received: by 2002:a17:902:b581:b0:144:e601:de7 with SMTP id
 a1-20020a170902b58100b00144e6010de7mr54292000pls.71.1638122222149; Sun, 28
 Nov 2021 09:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt>
In-Reply-To: <20211128174320.GA304543@lapt>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 28 Nov 2021 18:56:51 +0100
Message-ID: <CANBLGczYBaxES12eCurm6fELat0U-9+VbuKUG_Fea3iK6d9RVA@mail.gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add num_{possible, present,
 active}_cpus_{eq, gt, le}
To: Yury Norov <yury.norov@gmail.com>
Cc: Joe Perches <joe@perches.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
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
 linux-alpha@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-crypto@vger.kernel.org, 
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-perf-users@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_095703_429654_8DAF2879 
X-CRM114-Status: GOOD (  23.66  )
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

On Sun, 28 Nov 2021 at 18:43, Yury Norov <yury.norov@gmail.com> wrote:
> On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > to return earlier depending on the condition.
> > []
> > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > []
> > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >      * if platform didn't set the present map already, do it now
> > >      * boot cpu is set to present already by init/main.c
> > >      */
> > > -   if (num_present_cpus() <= 1)
> > > +   if (num_present_cpus_le(2))
> > >             init_cpu_present(cpu_possible_mask);
> >
> > ?  is this supposed to be 2 or 1
>
> X <= 1 is the equivalent of X < 2.

Ah, then the function is confusing. Usually it's lt = less than and lt
= less than or equal. Same idea for gt vs ge.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
