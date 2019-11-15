Return-Path: <SRS0=qRPJ=ZH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC4AC43215
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Nov 2019 03:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54B5206D3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Nov 2019 03:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMdec361";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rosvxXmb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54B5206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1PWgPm6N70HQZfRNYAj3eFw0w/nejeDYjk0Sqts9Zs=; b=qMdec361pqE4g1
	RVVQkU0qGxVzKA0nrv/UUOnQ9r6qqzbEbHEKkPoP0OKjmej/nkQNFcAIndNGYmWwaC0bhi0UxQV6P
	Q6g0S92IsmMQkd2v5eb43ILwN0WFqXNotyaZM9B+GK3fT7RLDMfQLVpGbhmB5dvsaKo26ioNwb54f
	0QbiQoOyrKSziZE+UMYrFXUy95iz7ObCvv2r5HVRoMqeVB1gVwgu5Z1ELPwb4jEWZsNBEKWWomNZ/
	03DJvsNMIx7Kb/TA4tI3kSg2CE95oke+T+zwfgDR9f0TSLzNtpQ+Xf0jpfuTdu15LXZ9ReHYUg2bg
	vUpDV9JsJdsj2fjgmhCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVSPx-00071F-S9; Fri, 15 Nov 2019 03:37:05 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVSPu-0006zv-DI; Fri, 15 Nov 2019 03:37:03 +0000
Received: by mail-pg1-x542.google.com with SMTP id 29so5104381pgm.6;
 Thu, 14 Nov 2019 19:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R4XvROx888fXHPMG3Yq7w0aZuXsuTxn0lpM2IVqDtzs=;
 b=rosvxXmbxVwR1vACXmA9SkZCr7uwAAKB6UJ8GlY8l4n3tXBdK85d2C9bdYAAEJpyjW
 fFT+vr+mLl81JuDMdjUW+anF/Xfc5QEH7c2oMcSh2P3aCNGkUk5+dRVglouCIodq7WHR
 JntZpByfaG3f7z0ITWNWyjrHYUvHFedDz7NuSv9ofmpS9hbezDyvMp+CoX7pBe/a9BYH
 /5ccIl6Ob9b8/5VHy4+InTzOLbgcfU08QWMmpxugSNVufjRM7H87w0j0Xx9TVnx7E9kd
 kxH5U2h1R9bMcCLWkDU/RL/xXI7ZSl6Xqv3IfS/GbHtrXQnrqR+tQq1vNAk34F04bDED
 gXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R4XvROx888fXHPMG3Yq7w0aZuXsuTxn0lpM2IVqDtzs=;
 b=ZVjBhQ9YWdlji8NtmNcP0bYiySgKgF4NUXshjlCQFZ18qqFkN/B7+TKBLZjXsvtmOl
 c1iHFgJEX5wT/QuHJFLyvCi1B00iGF3BUIaY2DOnHH5SMKNrQjH8Ll91tigYejp+ReD8
 zB8PuYG+xoJkofkaEs2UCrdO0PJo/0ZG5hL7FPoI7peXNtxniQGyMhru9WB9VxovlKQA
 oHOweHdlPS6LXggIYnhATX1shQded9dVVn4HDCF9dNSz7jhgBRqGiSi2Fhwq/NjaRlSR
 8vlCtra0KTUyk8xvPbs/Y0mreVXtgO+hFUFKDLsx2FKGFVHdZTNhVT87slODd+B5PvUs
 nf5A==
X-Gm-Message-State: APjAAAVyHf8uNiuRmJVh7F4O8oF5I2XQS4ceiwjd8UfWUTfhQr26VOrN
 U1/AoeNCODX/lbKsQ0/fPfU=
X-Google-Smtp-Source: APXvYqwa2DybaatOPAzowDw1CIcEQNF5GJFztVtnxnB/hIwTXcIG59PN65RlFcbDJvpIicCUEmC1oA==
X-Received: by 2002:a63:7cf:: with SMTP id 198mr13931473pgh.372.1573789020559; 
 Thu, 14 Nov 2019 19:37:00 -0800 (PST)
Received: from localhost ([2a00:79e1:abc:f604:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id y22sm8178148pfn.6.2019.11.14.19.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 19:36:59 -0800 (PST)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 15 Nov 2019 12:36:57 +0900
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191115033657.GA407@tigerII.localdomain>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <20191113103922.3dc3e8e9@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113103922.3dc3e8e9@gandalf.local.home>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_193702_477423_88BD856B 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Dmitry Safonov <dima@arista.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Jeff Dike <jdike@addtoit.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, "David S. Miller" <davem@davemloft.net>,
 Rich Felker <dalias@libc.org>, Len Brown <len.brown@intel.com>,
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

On (19/11/13 10:39), Steven Rostedt wrote:
[..]
> > void show_stack(struct task_struct *task, unsigned long *sp, int log_level)
> > {
> > 	printk_emergency_enter(log_level);
> > 	__show_stack(task, sp);
> > 	printk_emergency_exit();
> > }
> > // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
> >
> > show_stack() never schedules, disabling preemption around it should
> > not change anything. Should it be interrupted, we will handle it via
> > preempt count.
>
> Please no! The whole point of the printk rewrite was to allow for
> printk to be preemptible and used in more contexts. The show_stack() can
> be all over the place and is not a fast function. Let's not disable
> preemption for it.

I never said that this code should be used all over the place. What
I did say several times was that this code is for quick debugging,
when one sits behind a slow serial console and wants to tweak loglevel
of all printk-s of a particular context/function only.

	-ss

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
