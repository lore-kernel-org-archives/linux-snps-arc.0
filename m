Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA57BC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Dec 2021 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+kW6y49CnGFyRj0K6BSvLxGZx8x9SYP7TNq9ysVanw=; b=s3mIYLs0J4vDBt
	p7Ve1fIZqKkReNzJ7tPSyl90q9wD4wzMDhGI82458VTgls8E+kHnc81IqMpSi4vujr02fjonwD39+
	c44OolOkdW/myzu/mw0ybycy6Nwk2H0/nOi2S32UEPpc5T21MjZpW2w6BG+8xQu1UPTE4qKhCi9BZ
	ZsC/LJ8c89SFMfg/I6PxkFem7U7vWCpWgh1m4axXzrrTJHS3HcnjL2SE42GLeTNUOWep4JGDuWOIp
	TdwykJwWE0oJsRpTrLRZeHvhtrwmoI7TdqJn/2qwMcPYMYmS4sFV9bCa1HfdngBQfPfMxLY6XROVU
	oAPjsKefEGD1cwxChW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxYLc-0028nC-JS; Wed, 15 Dec 2021 17:45:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxYLX-0028k2-1P; Wed, 15 Dec 2021 17:45:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id w24so4403777ply.12;
 Wed, 15 Dec 2021 09:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RLdWdHoT6O3wLXgWsRx2m2m62hSjV0BcJXlTjn5JUFY=;
 b=fVGVY8wqrxR8Y9FDXFtr4SE6iyR8BVVbZ5vgJ4y8dkqTnryOyAM1f7oIOnezuj4A6J
 xZUPr4yWMlNLYsHQ1fallxSJg8aU00+SwAnq0ijeJb6rpCasKd3VYye0HMu7Rz4Fmzli
 VTY7ooY+g0kHA+TAUoyyLgzX0mSn9ha1KmFllLdg51BzQBC+Mgmo9+XdPBjphX6Y4e34
 aHA3UHFWRC7Btex9u1tZiEFoYFee/G/WGm4rYd3nNUPqV0MpixQGc6Vx0PruHv6wejmQ
 Ow0n2j4fyu9ba9vCZKTh9cTJvx1bERx0Yn7rh5DuRA2QxMZuAeUzJXU06wIQ9Mevfcss
 WI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RLdWdHoT6O3wLXgWsRx2m2m62hSjV0BcJXlTjn5JUFY=;
 b=rBbiOtPwPqqrjixFvqkwxhsHAVSG64S3q7hKwAn8B1DButi/DFX2DhlAGrr5m2SbEg
 w/jeGcj2QHBAKr2Gb6bwQzB/9kYDh/helJvBN9goUQyyUjvwXJtMliA+XM8KCd27PkYj
 JqpJi+vvt+Elu+ytw3LZhg2hJu1JZamXAllu8JOnXLjy7XIvRwd1A3qnEtlR8m3no3Rq
 9CKPXUBHzVGkUgCd2mTLX+jONivD53jB5YQnVKoRqjLOTZATphKvqTWDnJNP1w0wSZPc
 GL5Y+4VqJIepQ269NyU56tA7bWvbzZJ2VTjZfm69Lo1LBh04VMnJ4Zd5CoiIXUwi8gKp
 fLSw==
X-Gm-Message-State: AOAM533TgPUkd4bxEQAnBc5QUMeE9m+tg1ToZ1xpt2vR0fJruCWdOQjf
 64e9CnzZUvzkThLKBtldm86NOJn2mJ4MHnZp+OE=
X-Google-Smtp-Source: ABdhPJxIcVzS1V95pBlMUcYP2k7Lrcyzl/rBNhnf3pbvrkTovj6aQvXpyQPCUffP2FcbLTl6T7AIgJQIhLFRrE2qAuQ=
X-Received: by 2002:a17:90a:4a06:: with SMTP id
 e6mr968675pjh.228.1639590342342; 
 Wed, 15 Dec 2021 09:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
 <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
 <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
In-Reply-To: <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 15 Dec 2021 09:45:30 -0800
Message-ID: <CAAH8bW-u5AsFTXUOJPRkF-6dk1LcL7PE0Tm+dUc9Ctb6JMy=tg@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,
 full} with bitmap_weight_eq()
To: David Laight <David.Laight@aculab.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Geetha sowjanya <gakula@marvell.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Ian Rogers <irogers@google.com>, 
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, 
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
 Will Deacon <will@kernel.org>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, 
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_094543_122823_194E1BF1 
X-CRM114-Status: GOOD (  19.36  )
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

On Wed, Dec 15, 2021 at 12:41 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Yury Norov
> > Sent: 14 December 2021 19:43
> ...
> >
> > I think that for long bitmaps the most time consuming operation is moving
> > data to L1, and for short bitmaps the difference between approaches is
> > barely measurable.
> >
> > But hweght_long on each iteration can't be more effective than the current
> > version. So, I'll drop this patch for v2 and keep things unchanged.
>
> Actually do bitmap_full/empty() calls make any sense at all?
> The result is stale since bitmaps are designed to do locked operations.
> If you have a lock covering the bitmap then you should be using
> something that uses non-locked accesses.
> Rightly or wrongly that isn't the bitmap api.

Are you talking about __{set,clear}_bit()?
include/asm-generic/bitops/non-atomic.h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
