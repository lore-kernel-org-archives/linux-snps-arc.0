Return-Path: <SRS0=pfY0=ZE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79171C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 04:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E59A206BB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 04:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jalqb2lq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdGWTYNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E59A206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXieHhw51QG+DugL3cWvZpTZJA6cgsPSc6Kul53+8nk=; b=Jalqb2lqvq83ub
	Sspm+PzN7vsSNCo80WqSM6g851iIjmFnZhFoJzIF2GCFozNejPMS2wcLZYBSsFnC0RokD77VGOHKi
	0ELLkwyU58ugzBxxEf5d0WcSexriC1q2Fp35ZMGgbgKMkQUM33LfIs/8dUNdT74QlbsDjqSVr2ahv
	ZAXLFTmI0Nd9dEazkS/u/2fzeenbU+CSyy9EpNEK9aOtIommZRqH0gF1QdlUGsp8SN9ZRC61DACRI
	/5YOk5ChDiu5HEq1xVwnvIyRjVqnF4Bj/QJzs6jlNyOS3uMYVryRg8ycMVlOpUU1uFWJzUyc58w1E
	Pwe3d8UKpdz8lxJxRu8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUNkY-0004W4-1K; Tue, 12 Nov 2019 04:25:54 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUNkU-0004U7-EB; Tue, 12 Nov 2019 04:25:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id o9so8812179plk.6;
 Mon, 11 Nov 2019 20:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9VefD4i9ErvjrjSu5lBHBfa2VMuQnRlhyfcHWoSsFGA=;
 b=cdGWTYNC6NHRu+kvA4I6kS1Y2LfiO2jKF0r2reR+0mRqcG8yKudKBCw9I9DOXABIX4
 /3TUFbNC4J3e6CiNMFB22KOrjhFeNSMw6A4f5zE4eujUVPhwdAy4UE6JiknhjlsRGWe7
 RTgQRbIczKqjQpk9q9jHQE31BO+69ykoGYVcUuJlUop2q+ad5Zn3tErki59ff20RUtZo
 yWETgjDNltG315ymhYBMnymIi7dXr1HTD7KD2QIijuj5xF7vcEzw9cliyVtugI35e748
 tq7YxpziGywkq1lpdx1pl1YBrcMuX71SP1knncXeWdL4sRO4vx39eBLBEYWFTo///pwr
 NCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9VefD4i9ErvjrjSu5lBHBfa2VMuQnRlhyfcHWoSsFGA=;
 b=RT1vUZMz4D1IiY4qbCaMzVyS8+JCFF9FnRRpBf8RvXqtYllHvTcNI3MYQIx0gVKTHT
 Z1RYOdg43snZdWAzIoHibmulGYCyDdgO3/HY4KhCuKMLiVhaJhUKMrRFL1pjwKvyw7SM
 1aM7rTF0mS746ZSPcwbp8AtqQiwNFtcLo5DDm9Fozx0NUFsHaKBjaB95GP2l19svMfKd
 QpWhdH0fE3HxcIwGZr0sjNCoyQ0kPQOJzV4MhTyhrUyEepM2w1HJBbdEok1GwEDcoVO4
 PeJb59kNMqZUCTqjyeTacx6oUxgd5n7vllWK4ULLQYZEQCXqrbX5qBDewGGNi4Z5xqW1
 raqA==
X-Gm-Message-State: APjAAAVF2JPagSEHzKvKaNjhr+WIjZVxe5KkWFpvmBox/2m/HDrz8XHN
 Q2LBXHmpznDGUxxMfuPE99s=
X-Google-Smtp-Source: APXvYqyjkigrHz92j3yARMh7vwLk0eQQU3iBJc8XJ3FFSXhKkmIaB79Wx/YFJE8etx6MkatMc7zyFg==
X-Received: by 2002:a17:902:246:: with SMTP id
 64mr28628529plc.339.1573532749511; 
 Mon, 11 Nov 2019 20:25:49 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id 186sm23754823pfb.99.2019.11.11.20.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:25:48 -0800 (PST)
Date: Tue, 12 Nov 2019 13:25:46 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191112042546.GA119579@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_202550_505553_A18D0EF1 
X-CRM114-Status: GOOD (  11.94  )
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

On (19/11/12 02:40), Dmitry Safonov wrote:
[..]
> In my point of view the cost of one-time [mostly build] testing every
> architecture is cheaper than introducing some new smart code that will
> live forever.

Well, there may be the need to pass loglevel deeper due to "hey __show_stack()
on that arch invokes bar(), which invokes foo() and now foo() does printk(),
but we don't see it". The context which decided to backtaraces decided
to do so for a reason, probably, so I guess we can look at it as "a special
error reporting code block".

The proposed patch set passes loglevel via slightly unusual channel -
via sprintf(). We probably can do it, but I would prefer to minimize
the number of such printk-s in the kernel. The code snippet which I
posted also does pretty unusual thing w.r.t loglevel. Both approaches
are "non-standard" from that POV.

> I'll reply to your suggestion tomorrow, it's a bit late in my tz.

Sure.

To anyone who will comment on that code snippet - this is not a
"look, here is what you need to do" type of proposal. Just an
alternative approach with its pros and cons.

We had several requests over the years to have something like "forcibly
allow all underlying printk-s from here to here" or "forcibly suppress
or postpone underlying printk-s from here to here", etc.

	-ss

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
