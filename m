Return-Path: <SRS0=eCxK=ZF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EEC17441
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 01:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A08222C5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 01:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gYhglaat";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPWPZKlq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A08222C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyXhuq9g8qcWeom5GbV9IbTm3nqOZu6ruCTSPyFvdGU=; b=gYhglaatz1vkm/
	G3Ru23dsTeh/wPNvB/vYU/3itoUfoIVJ0COYYI8ZUQBw2BhYWEOOMr5DnuiAs62gGtV3i1B/CaudS
	DOev1aVSvy8/PUT1QFzhzeaJaEeUwvwwaXZaAdnnGi0tGjKbfiYz36QgZ5hQAZUzZ/PRTMA1WtFID
	FmP+FZoSYHq5LlOILge5BkW4Gag3G3BJOQiD5OhpHbPx6C8YhS5eFS8CPE9HnhEdw/kNLjE9/ZRtY
	c7MtdeQnMdwc97PU3tfJzhh0YhJKF8nFEajOPsm+OflDPihxwOnecvao7jeJKC1JPVV5w2EJykVf8
	l9h6yGpuNos/QsWtN3MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUhNp-0000DY-PD; Wed, 13 Nov 2019 01:23:45 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUhNl-0000C7-Tc; Wed, 13 Nov 2019 01:23:43 +0000
Received: by mail-pl1-x644.google.com with SMTP id w8so317142plq.5;
 Tue, 12 Nov 2019 17:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1L7ASzKkM9H3jGXxNBrUB+7DORYDzuzDLILdAI3Iz7A=;
 b=hPWPZKlqyeQnXDnfKM+yto4tna7/NwAt3iB5d61vGkkJIZuUufxmpnoxkEgePVnej7
 L3hqEC23l+0zKgGK6W4wPhhfu5rKZowqxPh/46+GMjsQYom9+rxAtKscDZa4tq1EZ716
 v3E2zlUhIldCXA7DVyUqyyBaEbvglPUOrZExWlUjNqVUbKviWiZ0UqqlQQn5uS5GaAHc
 mq/bIirdXr39H9gdTuhjl1CNb4pz9u1NyVaytreQwY9zEl/crJdG04QmPFkkR8rnNcTE
 UvMTM+CfzewoFMwCfZcUTuuW9mgMTzeza8o6UpjTQJvYoUxBVhuX8rWLl3B8wj02ljU3
 maaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1L7ASzKkM9H3jGXxNBrUB+7DORYDzuzDLILdAI3Iz7A=;
 b=Dta5ADakPGhRi106kLbuHtE/4WRx1wMe6cU9ITESIl6UkiXuImVACZUyEa9zt76jVm
 2Gn1vpBrrfij0x7Volru+LBE3Ve3HRnMTV8b5hf57J6kkYYXYl1hpHCGl7Sbl5LkqlvN
 7RtKPuxEd3jZJ8tgn75xCn3uXerT+nJ3vqFxpg+xah15lajhbcPx15ToUX/bSohU0ALQ
 bsIE73b0NWmC1YU7B8EVm/b4CaOV6lSvzQkAvBLpdWNAyffzcwOet75fj2H7r65QXJSy
 U9xa2pr35R+wsuhP/OWGmIhNYPkkToNoqvny70qUlRikQnrWL3JZ/nAiKhxnTbA6y7tg
 quSQ==
X-Gm-Message-State: APjAAAWi5Hzzu9DzyeWoYx0RxsIUPLOGCaguhzfbpmcKvrhs9q6HkCJ7
 1Fz5hrXuJIvYwJRWgrWlHHU=
X-Google-Smtp-Source: APXvYqyiqUiMRcG57rYhVmi/PN592L9nB6krMmKeStEG0mbc1TStTpGh0xSJ8gvsM3GDADDNTGDfqQ==
X-Received: by 2002:a17:902:8a83:: with SMTP id p3mr856215plo.79.1573608220830; 
 Tue, 12 Nov 2019 17:23:40 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id s3sm304442pjr.13.2019.11.12.17.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 17:23:39 -0800 (PST)
Date: Wed, 13 Nov 2019 10:23:37 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191113012337.GA70781@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112101229.GA201294@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_172341_960195_1C61D2D0 
X-CRM114-Status: GOOD (  11.23  )
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

On (19/11/12 19:12), Sergey Senozhatsky wrote:
> On (19/11/12 09:35), Petr Mladek wrote:
> [..]
> > This is getting too complicated. It would introduce too many
> > hidden rules. While the explicitly passed loglevel parameter
> > is straightforward and clear.
>
> If loglevel is DEFAULT or NOTICE or INFO then we can overwrite it
> (either downgrade or upgrade). That's one rule, basically. Not too
> complicated, I guess.

Can be taken even a bit further than

	show_stack(NULL, NULL, LOGLEVEL_DEBUG);
or
	show_stack(NULL, NULL, LOGLEVEL_ERR);

For instance,

	spin_lock_irqsave(&rq->lock, flags);
	printk_emergency_enter(LOGLEVEL_SCHED);
		...
		show_stack(...);
		printk();
		printk();
		...
	spin_unlock_irqrestore(&rq->lock, flags);

or

	spin_lock_irqsave(&uart_port->lock, flags);
	printk_emergency_enter(LOGLEVEL_SCHED);
		...
		printk();
		printk();
		...

and so on.

	-ss

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
