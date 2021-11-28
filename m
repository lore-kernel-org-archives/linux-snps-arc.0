Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D859C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmOhricSZPr7gmY8CnTqPGpNSYKe72BnGdqadGM8OEk=; b=A7ONFcix5KulyH
	NVXPuavuUUogUTGmlX1FPTg8ZIuM1gxmydFwrzngyHYUNE8CF/SWXPr8ZGuVQaV77V+l1rk9DSHfz
	JIQm/ZfsqZ5EmG0noL8s2hM/3hN1jK+GH3XYKU1m7sK9vbj6nYBQqCJJ3vwev143v9wgJiPSKxDjm
	TGZYE2bTkN/UNxbTzPB7TQjBDqW3dNjf+T/Lr0r7YgaQp5LTwp8YLuXXSiDzy0hs7nzTRuabQ2rCu
	6ct8FviS3mJIQOWkBWryqfp8abXoemgkOD34nUjFH5G1yNTd0weXpgtSJFy+k2HkkdRjTZV0e4xsT
	k6qtUMuvxNJs2WJqsFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrORo-00GPMa-P8; Sun, 28 Nov 2021 17:58:44 +0000
Received: from smtprelay0252.hostedemail.com ([216.40.44.252]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrORi-00GPKJ-W6; Sun, 28 Nov 2021 17:58:40 +0000
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 991EA101DBDB6;
 Sun, 28 Nov 2021 17:58:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id A8CC6E0003E9; 
 Sun, 28 Nov 2021 17:57:35 +0000 (UTC)
Message-ID: <3e76ba158acaf414c982c95285ad5054fea7cd4f.camel@perches.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
From: Joe Perches <joe@perches.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley"
 <jejb@linux.ibm.com>,  "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,  Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>,  Andy Lutomirski <luto@kernel.org>, Andy
 Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard
 Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,  Catalin
 Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>,
 Christoph Lameter <cl@linux.com>,  Daniel Vetter <daniel@ffwll.ch>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@linux.ie>, 
 David Laight <David.Laight@ACULAB.COM>, Dennis Zhou <dennis@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,  Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, Ian Rogers
 <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Jens Axboe
 <axboe@fb.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron
 <jic23@kernel.org>,  Juri Lelli <juri.lelli@redhat.com>, Kalle Valo
 <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>,  Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones
 <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,  Marcin Wojtas
 <mw@semihalf.com>, Mark Gross <markgross@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,  Matti Vaittinen <mazziesaccount@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Mike Marciniszyn
 <mike.marciniszyn@cornelisnetworks.com>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra
 <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, Randy Dunlap
 <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Roy
 Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>, Saeed
 Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Solomon Peachy
 <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>, Subbaraya
 Sundeep <sbhatta@marvell.com>, Sudeep Holla <sudeep.holla@arm.com>, Sunil
 Goutham <sgoutham@marvell.com>, Tariq Toukan <tariqt@nvidia.com>, Tejun Heo
 <tj@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas
 Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,  Vineet Gupta
 <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon
 <will@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 kvm@vger.kernel.org,  linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-crypto@vger.kernel.org,
 linux-csky@vger.kernel.org,  linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org
Date: Sun, 28 Nov 2021 09:57:41 -0800
In-Reply-To: <20211128174320.GA304543@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-Stat-Signature: dxps35jgdkfac6qsmj9i1wzczrakfui8
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: A8CC6E0003E9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19MP3rv506VCPcDGFODNyKX4EmAMaIjwdw=
X-HE-Tag: 1638122255-377930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_095839_161067_6C8F2CEB 
X-CRM114-Status: GOOD (  21.89  )
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

On Sun, 2021-11-28 at 09:43 -0800, Yury Norov wrote:
> On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > to return earlier depending on the condition.
> > []
> > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > []
> > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >  	 * if platform didn't set the present map already, do it now
> > >  	 * boot cpu is set to present already by init/main.c
> > >  	 */
> > > -	if (num_present_cpus() <= 1)
> > > +	if (num_present_cpus_le(2))
> > >  		init_cpu_present(cpu_possible_mask);
> > 
> > ?  is this supposed to be 2 or 1
> 
> X <= 1 is the equivalent of X < 2.

True. The call though is _le not _lt



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
