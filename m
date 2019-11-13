Return-Path: <SRS0=eCxK=ZF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B86C43141
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 16:58:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7633206D5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 16:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bGGSu2Uy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="kRXw4Avo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7633206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHT1I6opo0i/U993tzxvoHLLAcJ+P73UJpxH0BEsc/U=; b=bGGSu2Uy6RO8na
	St0hn6Vy4E+wCgn6SW3J/AjqTUQ2mdf6uYZsU8LYkivuydz4qYUN/ZK5vG+5ZjmjAjINb7SeExDTL
	Lb/kbSs90yWSQ3C9BY0bBuRw9yISTM3naNd5Q1+a/cpm4Wwr08k5NhNHGj8tsybRlE69xgl7df/si
	yS2HLKmnowvnAM/e45C/GrW7kClbkAhdunStCbeTxOMQSjfnIE7l6K5oynAA2XAEhGs9r5HZ5rWRC
	pT6Uts96pRjnXFyTfdmsdN6uY+47Ws3huUZHR/GyND9FDxHZumg31ppGyIleGb2QpxZxPu+ta33Tt
	4tKU2DJndtgU+lR3MUuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUvhz-0001vf-Vy; Wed, 13 Nov 2019 16:41:31 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUvhu-0001sc-Da
 for linux-snps-arc@lists.infradead.org; Wed, 13 Nov 2019 16:41:30 +0000
Received: by mail-pf1-x442.google.com with SMTP id c184so2035404pfb.0
 for <linux-snps-arc@lists.infradead.org>; Wed, 13 Nov 2019 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpYMERXodNN3/IUKFqoV3bu09Kfnjp4MDDbBxGqTaak=;
 b=kRXw4AvoWBw7ukkZ2SwH4DcHmhkOyvtHzm9A9tembEe4SHnL/Wkxs4OG+Y78DFYLKj
 WUQkQ3xkRC7KpV6HsQsVQ8Y83U6DSV4bjqqA4yz8eiAzM5MouyPOfpTV04Q+Swaq6dzO
 iwJ3irSL+AWM6APV8kLc/aiqJnine4lrlZLBQET4Kth1bx1KYWl6QngPsxySaS0LA2u8
 4l3EYQWDxhDPyJMBUmdjQ4AlBq5rQRf2tmZq6s9bjkx4QpbhYyBqV94RH9xa8/CrCe8j
 rdAqy2276oEWDDekf+JPcbvdolRg+K/VuqSY8KHpC1K4x4t7plUDL/CedXLaIDpvWCOd
 tkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpYMERXodNN3/IUKFqoV3bu09Kfnjp4MDDbBxGqTaak=;
 b=MrJN7rLV949tCdgcSpyYotYMwklcvTIbxv3celITH0Xx6taynNRiSVFsmSau47WBOJ
 4aqnu7uVAErf4h1e71K+z7DTW2yg9MOUiyca+W+qPyXtjNdIpLaBIb+0bFASilRVgcLi
 07e2QlK9dYs4p0Jp4h3iT62vczZY+DOsfkGx53NW2mniaLIUV5RNcF0T0B77DgXg8IPo
 K81fk/6LREx5aiGGoNQko/FGdVGWFLJtf4r9VQJimFtJ1/xKFdjMtxWYpzCn1kFO9ohO
 3RNEq4sGj/k9CcRLCM/xrSZQcP8KtdovYxo6cCnCzT0xWaVn7QSyxFiOkTGposz5ZDj3
 FCUw==
X-Gm-Message-State: APjAAAWD20EWvB2Vt2fBgto+HcWREl0vNTt5Bm4QKkqzuO5iCu06sA5J
 aL7uLNbRuLJuJQcuMicpEkmkXQ==
X-Google-Smtp-Source: APXvYqxGmsqG/IrGmwAGiFxwnMwQ7BOsmJMkITh9aVjyUYUrJF/k6QpL2RmzoyB1mQQoM3FoiW7TOw==
X-Received: by 2002:a63:c55:: with SMTP id 21mr4829337pgm.282.1573663285447;
 Wed, 13 Nov 2019 08:41:25 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id h4sm2954304pjs.24.2019.11.13.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2019 08:41:24 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com> <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com> <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
 <20191113063334.GA147997@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
Date: Wed, 13 Nov 2019 16:40:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191113063334.GA147997@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_084126_476255_A7C5444A 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Douglas Anderson <dianders@chromium.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Sergey,

On 11/13/19 6:33 AM, Sergey Senozhatsky wrote:
[..]
> Well, here we go. There is a number of generally useful functions that
> print nice data and where people might want to have better loglevel control
> (for debugging purposes). show_stack() is just one of them. Patching all
> those functions, which you have mentioned above, is hardly a fun task to do.
> Hence the printk() per-CPU per-context loglevel proposition. The code there
> is not clever or complicated and is meant for debugging purposes only, but
> with just 3 lines of code one can do some stuff:
> 
> 	/* @BTW you can't do this with "%s" KERN_FOO ;P */
> +	printk_emergency_enter(LOGLEVEL_SCHED);
> +	debug_show_all_locks();
> +	printk_emergency_exit();

Not that I want to critic your proposal more, but just to clarify what
I've meant by "cleaver and complicated":

I don't think semantically there is any difference between:

printk_emergency_enter(LOGLEVEL_SCHED);
printk();
printk_emergency_exit();
vs
printk("%s ...", KERN_SHED, ...);

I was speaking about complexity not about usage, but about realization
inside printk_emergency_enter(): there will be some business logic that
will do "it's NMI? Use loglevel given. it's KERN_ALERT? Don't downgrade
the loglevel..." and other smart details those are really logic which
one have to think about and later maintain.

There will be also minor issues like people inserting print with one log
level and seeing it in dmesg with another, but I presume those
printk_enter() and printk_exit() will cover little amount of code
without much nesting [as long as it's not getting overused]. And also it
can be documented and people will learn about another feature of printk().

And this year I've seen the presentation "Why printk() is so
complicated?" and I presumed that the approach is to keep things as
simple as possible.

In conclusion:
I see that your proposal also solves the problem [except preemption and
some pr_debug() that shouldn't be printed]. And I think your approach is
better in the sense of short-term (we won't have any missed %s KERN_ in
linux-next), but in a long-term it adds some amount of business logic to
printk and another feature.

Just in case: again, I don't mind, it's up to you, maintainers of
printk. It's also not very fun for me to create those patches.
But they fix console_loglevel issues (I hope we could un-export it in
the end) and also I need it for my other patches those will produce
warnings with debug loglevel when configured through sysctl.

Thanks,
          Dmitry

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
