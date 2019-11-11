Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D93C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 19:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B6D421655
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 19:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vD5ibmp5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="cZIehrzG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B6D421655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=burf8SuQf/K0cviUiNaPgjO96BrO+miuKlA0Hz+3ZNQ=; b=vD5ibmp53LTidT
	8gj5d2AJh/qNBzepm2k7C+H29eKIIch3ctWN6QprV0TKnZ9x+Fm/l9P6tb6NRAUrXPp+90LODQ4Ak
	rBTGqYA6tj7AjcBfGliVnHo4FP5Avn1Kxh8T58ynazUVK/AQWwoiL+a1ldsUHwpc/Lqpfk1hDI0J/
	AJfRVhvi6AhM5IGjOfuvn1wWj1Ob0vM7wNUtDWuw3p4C4uJ9RCnhxvCozVFDLXN/y6p/JDUIFBdI3
	VGuhk8A1aeBkp3nCfZFOCQBkbDdQQlqfg84CD9i5G75DVvG6Vx2Nf1MpEuIGE6dh8Sm0LSPn0McKp
	KHxzbo+1DuHXWdS6ofTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFf5-0008KO-Bv; Mon, 11 Nov 2019 19:47:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFey-0008Ev-Ce
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 19:47:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id j18so638217wmk.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 11 Nov 2019 11:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=cZIehrzGpUFezD2aa4zmv8OufN5OtO0USzsaArEEUTu0egX1JDp7fXq/MKdHB+YxUr
 j/kC7hgtECdh5x1noQBDdzd4zMsGonK7DNa4R/e8/R7qxcehDcLnLo5qSFE4wjuyW42o
 PQpFktb3ed0G2yVCt/fgkRLVHHWNH3ragHLlsd4kHSnraDACO77RcGzlulVu3SB7tcFm
 Ka75d1q24hYXLZJbDgNbGl6ynhrMJhmWegwmwjFp7I5D0Fg2d54s1iF9aPGxd1hnX+B8
 gISwE6rYfN65iX3ZaYqQ/BYKUKfAwSvjgwPgiFEkk/eO1PVC0atmmvIxVoVwNPzimOsY
 R2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=bjJyNKC3BDGy4/ANqETA3/XQ3dn0OkVyVi1FM5CpKIT3n/yIYMlUSfHGI48KPT/zeR
 6QYog9TboSTYVP0FEgpN/LCXp2XiXEdRvF6Ifo2PC73M/Qj3OR+hfsdiZj/G1KzMFqgD
 MkJCL52lWUsdtP55F0WEJxM+J6WkJWbuXO5B0QYYRE7T2c7yf2JnSA7nxyMGBQyD8Sr6
 F8Uu5gDX5s2Q4GcykYNu2jHP/7fxp4LYJz2EdugomTAdMjRCpI76ya7BYRRA+TmBTZv9
 5DSjZ44cTeEODVPmVFxO5yJulux/wGHCMl+zk8wJ54tBth1sWY16Q+Ogg3lOSn/Lmr6B
 kNnA==
X-Gm-Message-State: APjAAAXMgHWItKM9ew1GN39TYHf4TLhzQmUIJl8IolK4GXdq2+FEgo8v
 6EiZ2yP8mwy7cgKJW4eDeykd2Q==
X-Google-Smtp-Source: APXvYqwUswzQhu0DkD+M5khz/mFK8gHdabdOoahgxknZZUvPWQw4U7A4JmJR+GV6KsoYg/TOZHa6cQ==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr585268wmj.56.1573501654084;
 Mon, 11 Nov 2019 11:47:34 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id f67sm723039wme.16.2019.11.11.11.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 11:47:33 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Petr Mladek <pmladek@suse.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
Date: Mon, 11 Nov 2019 19:47:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111012336.GA85185@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_114740_622749_932D847B 
X-CRM114-Status: GOOD (  17.67  )
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
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
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

Hi Sergey, Petr,

On 11/11/19 1:23 AM, Sergey Senozhatsky wrote:
> On (19/11/08 14:04), Petr Mladek wrote:
> [..]
>> I agree that it is complicated to pass the loglevel as
>> a parameter. It would be better define the default
>> log level for a given code section. It might be stored
>> in task_struct for the normal context and in per-CPU
>> variables for interrupt contexts.
> 
> I do recall that we talked about per-CPU printk state bit which would
> start/end "just print it" section. We probably can extend it to "just
> log_store" type of functionality. Doesn't look like a very bad idea.
> "This task/context is in trouble, whatever it printk()-s is important".

I don't see how bits on task_struct or in per-cpu are easier than
supplying a log level parameter down the stack.
How would it work if sysrq_handle_crash() called by key-press?
How would that interact with deferred printing?
How would it make visible prints from current context, but not from
something that preempted it?

Furthermore, what problems are you trying to solve with this design?
Only sysrq driver? Kdb?
In my perspective it sounds too complicated and over-engineered for
something that has two-three users.
Also I've tried to point that I need to print backtrace sometimes with
KERN_DEBUG loglevel to use it in production for early notices those
needs to go only to log files and currently each architecture decides
which log level it prefers.

And what's so complicated about this patches set? I see only side of the
testing, but the build-testing is covered with 0day bot and cost nothing
and any visible regression may be found during -next period.
While introducing those printk-sections may subtly break things.

I mean, I definitely know less about printk() and its internals than you
- so my points may be a no-sense.

What I'm going to do - is to fix all build and reported issues, I'll
send v2 this week and feel free to NAK it, I will forget about those
patches and won't be offended.
I don't see many people those are "hey, we'll benefit from this".
And doing this patches set was neither quite fun (dirty business), nor
something I can be later proud of (hey, I've introduced the log level
parameter to printing functions!).

Thanks,
          Dima

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
