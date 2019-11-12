Return-Path: <SRS0=pfY0=ZE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2310BC43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 02:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA48820818
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 02:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="METizC16";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="MX42aMTT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA48820818
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDw5MxKumxtaFFxitqhKC9t+iqd6rmXsRxEK9d2Bo3c=; b=METizC16LHzrLs
	sjyuWsQZxTI3cFbM0HJc80pcX9j/TQKtqY/F2zs7jQOTRDAAfM2KidBlgroNTrT5LAzEAZ20MArdx
	ar0H7mU2RsiMiXvLJR4nSLZAnHTCS30JpNuWskNMvklRWMhciaHl+4CHrW0Xn2jPmGKYzyzj6lJ3b
	BC74fNh+4NLo2yF0KHk9WtSNFfJ7PJWezGIpFAL7+x+L3sqJtPH9zucugYHPnhJ/1pA5NcIZFpNp0
	KrvMk0F6QiuaD723o26lX26JW7+iwi0dErC+L0u+zmSuRMCgzBz+1hARwdCP/9RCGT41gtfCYZBp1
	ff1yLeDenimSoVL3maMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUM6V-0004pB-Dy; Tue, 12 Nov 2019 02:40:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUM6P-0004m3-NA
 for linux-snps-arc@lists.infradead.org; Tue, 12 Nov 2019 02:40:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id b11so1392561wmb.5
 for <linux-snps-arc@lists.infradead.org>; Mon, 11 Nov 2019 18:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=MX42aMTTzAgzmolo19ziCaVvJW01j4llkcsSSsPBgIZf5M/QJqFnu0ykgQ+YU9I1XM
 lWWUfFOOmvWQUbOV/+iKy4yX6WRH0x7F+7sbAobnLPJdwSzb9YWyJ9/pnJvSWZVMB+xV
 UFEneok+5nQrKqWY1H/ryexuorVth0ci9XQccgC0yNGEatwsWoLWkeJcz3zYnXhenkJH
 nhLbJhqGH8CSvC3ekwmNTkFJs9KRa26JVi5KOJ0GN3lmDlPGH14xef5YqFU0Sk8qUi0p
 NtXZ7DYgZXwHf2rN/1LtOFtVEw8aJlkAZJ8tf3acCKNzLndcz00BKo1YrVsWG4zo53JF
 Pi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=MLs6rSHQCy7H5e7labUQuHn2gLp2aF9yguYTaNOr6TfkQCBz3pEalvGaQqQlW9R5hs
 7iEp7rtugt0PMQTC9yYzXdGJPaS/d9qK4F2Afl3okBztbwweEREGRisa+RKk6Kq56HPe
 uoBXaRyIpqQ1c+1WFiDm2WZsg5yg0z+B4WYUMNVPD9Y3/qTF7dnf4hbA2IagMk93w8BR
 kNAWXOFCeOn86gwrgnBSMtOJLQ3soo0LsOgUJIw00q5smvTsxYr27o94O3uB87HdynvH
 jpzmnPyJEPPc7oV/PBC7O7RVLxPYzOVi6cY2ZwVTPf/hynQ3JSZJGHhSFnaac4XQS6WD
 VaEA==
X-Gm-Message-State: APjAAAUNdYMycRr4MTzOuDqedCCoEaV3LbPQxZfFuKWgQ6Y6w81KqSEm
 +cymZC2szES9QMH7CfYFIUkaAg==
X-Google-Smtp-Source: APXvYqwGQmDILzErOejMnS6vcYmyu3aXwuweLJ3fDyVGcyV1rhcTRlJUkjSBJvf4yqYURAoU8N6Q/w==
X-Received: by 2002:a7b:c211:: with SMTP id x17mr1567811wmi.71.1573526420054; 
 Mon, 11 Nov 2019 18:40:20 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id u26sm1511046wmj.9.2019.11.11.18.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 18:40:19 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
Date: Tue, 12 Nov 2019 02:40:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112021747.GA68506@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_184021_773502_B99610DF 
X-CRM114-Status: GOOD (  14.86  )
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

On 11/12/19 2:17 AM, Sergey Senozhatsky wrote:
> On (19/11/11 19:47), Dmitry Safonov wrote:
[..]
>> What I'm going to do - is to fix all build and reported issues, I'll
>> send v2 this week and feel free to NAK it, I will forget about those
>> patches and won't be offended.
> 
> Lovely.
> And - no, I'm not going to NAK platform specific changes. Just so you know.
> 
> *All* I'm talking about is an alternative, less "go and touch a ton of
> platform code" approach. The argument "I patched so many files that I'm
> not even going to discuss anything now" is not productive, to say the
> least. Hope this clarifies.

It probably was a wrong impression from the both sides.
My impression was "You touch every architecture - we won't even consider
that". Sorry for the the wrong impression from my side - I'm open for
discussion.

In my point of view the cost of one-time [mostly build] testing every
architecture is cheaper than introducing some new smart code that will
live forever. Though, again you and Petr understand more than me in
printk() code, so I'm not any insisting.

I'll reply to your suggestion tomorrow, it's a bit late in my tz.

Thanks,
          Dmitry

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
