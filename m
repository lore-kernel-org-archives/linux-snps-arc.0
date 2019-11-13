Return-Path: <SRS0=eCxK=ZF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9845C17440
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 02:52:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CE482196E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2019 02:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3CliYMZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXCh/lzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CE482196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2r22119FvBqEM8ZJYtRtzdJlDf/T6kyF1He2C521JY=; b=B3CliYMZC9QWfr
	q4ksU7yjdfWf6gio48UM6G17aGyNOj9QEqRiYZGzb+Icm+G+Rhu/ktbv9x72deXPP1+KQA0638dR/
	Y9zDExJI9TE53lr7Jc2+mwrIvpyQnBBKTRC4yjR6TFvVOd45Li/DIG7RVzaLw6oIVKaGyxB9uki72
	u798afehSzozloKpCvBpbih+4JovtFfp5XiqhE7bokC/oEDjk3gxUsfZGbV47oH2nk+jc293fU41T
	FAvpH6j3qOsGcnCcDSlQgET68zxfWR6OcT/8FEaqqCX/1AdZaUrBuEE3YP+6QoQ/+0g0fJfE6E8oo
	6WDSoqSypYFLZUjkBVmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUilD-0001uG-Do; Wed, 13 Nov 2019 02:51:59 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUil9-0001st-Tf; Wed, 13 Nov 2019 02:51:57 +0000
Received: by mail-pl1-x643.google.com with SMTP id w8so411371plq.5;
 Tue, 12 Nov 2019 18:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mAEGoUcf015Kc1YtW4ruE+InFHxWlwYn7gbBVyirKYs=;
 b=XXCh/lzhc9PTzZMC0vGMEKaB6i1csVlUbqsH9rt47YYmIE3wdFLdN1RZ9XLo0Arau9
 DFSxYtIImotqP13tsBpRhqb8n2/Js3UmCNvM723O76JsU3YeDgNvB62RSmDR472f865P
 t1QAOVBhx+MjcLVo2R7QGZwppOQAhnDe5pnFM8bcC1mQYP4Xfr9JZq5mLce2CdFOCSHQ
 84njoBNSpMDUUGTsuJ77DSMbJh6PdBhKnrYmuC5XmJlJhZH9X7UWxpAWc2QurRhXPwj/
 RNRLsIyLkoYPXcQN5wrdc5lLemIanQ8txwfErNc3g/3wLnhyIhyW/Sj8BqL1ib+dXaLC
 deQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mAEGoUcf015Kc1YtW4ruE+InFHxWlwYn7gbBVyirKYs=;
 b=mP1/ajVK1eFW3W0im7rTC28EQjYsVTUQLVGJcC4oWjmNWbFIdvq6LxjAS5w7DWeEdd
 nxKzjGnt0gf/usIQdIGVb4uFMnr+KX8XWjOHr3UJ/0c5sspTNIW4mLDNelO0+LQzzNBc
 Q7ImNkHwwlXCh6L/Dm2HAgdcACtVC/l9Avpte9GfHmZVbhRSfUIGpI605i76VPR6vrmL
 gWFHe+lTxs3f8NA8IW6Nm6ftdZCvtpK2FYGtdlxd+oVWdL4qRw65ViFxqMFHsbEmz4sA
 u8Ms1972+zYvA+oFnaZlThH4EWgScpu912Dw/CLj1g0mMF0aRED4OrwQ55b/gwd6fj12
 LlKQ==
X-Gm-Message-State: APjAAAVybhkLultWVmlPWWy9LJsCU6FNhBz2+4nk2zQuz0nn9aagYWBg
 Y0abpcaKQnW0hAg7Moe2nzU=
X-Google-Smtp-Source: APXvYqyYgp5zwm8PfyC8ptc3y1M5FnRWqZNijSFiWVlVB0inT58a3/TsEELAtnKC4KW8B7tYLJSv2Q==
X-Received: by 2002:a17:902:fe06:: with SMTP id
 g6mr1170542plj.159.1573613513522; 
 Tue, 12 Nov 2019 18:51:53 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id b1sm463002pjw.19.2019.11.12.18.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 18:51:52 -0800 (PST)
Date: Wed, 13 Nov 2019 11:51:50 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191113025150.GA101113@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
 <20191112042546.GA119579@google.com>
 <d828cb62-aeea-4d67-33ba-b3a93ea10a3d@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d828cb62-aeea-4d67-33ba-b3a93ea10a3d@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_185155_980659_BBD72B2E 
X-CRM114-Status: GOOD (  10.90  )
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
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
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
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
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

On (19/11/13 02:41), Dmitry Safonov wrote:
[..]
> 
> I don't strongly disagree, but if you look at those results:
> git grep 'printk("%s.*", \(lvl\|level\)'
> 
> it seems to be used in quite a few places.

Yes, you are right, it is used in some places. That's why I said
that I'd prefer to keep that number low (minimize it). But it's
not 0 (that ship has sailed).

	-ss

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
