Return-Path: <SRS0=pfY0=ZE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A48C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 04:57:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66662084F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 04:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SfuTRvun";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI85TZux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66662084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/H3gou/LOUchhF1DCFDcmClJewgADwLHK1vducQwkc=; b=SfuTRvun+t5m9S
	pXBhGBEsBuSj6oN1nUbglue/rN2oL+0Mg8G4BA4HE0y8fgyM/ptW1Q/1WHV6Ay7PdNn0qvIt5dpQW
	nHAtSrdxIqEOsFryngYMsIqFqfn8zxSX1puizGpTp9qFu2dECGpW4k9A09amJ5dCxJp2PyzzCgog8
	znXSj2AJA47MXxsl0icsgjXSo5C9/YWrg4LrothXFjdYAlkokPTKcUgG0jz2MGYCOUn7/1fv4u7bn
	g4H+njHOMTp6+/TurghuJQ/m+BvyL4htuwl/+wspk1Wi02JKGht55DKY6EmTRjJz7Fdcvh3bLkh30
	5QCcHVLjCSk683PLgCEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUOEo-0000d4-PL; Tue, 12 Nov 2019 04:57:10 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUOEl-0000bm-EP; Tue, 12 Nov 2019 04:57:08 +0000
Received: by mail-pg1-x541.google.com with SMTP id r18so10979025pgu.13;
 Mon, 11 Nov 2019 20:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=;
 b=AI85TZuxJFzpojKZJlquzPJ/5YvDFz8JEdaGZ7N9Bmfov5X7GyMy3TfvkUyQANtqKe
 uWjtNNrB596OMU00c6+qct2nMEsGN4W/ajrsVlovtW2vJG2fjivE6vkHc9d5Fc8S37eB
 0VpD+e7K/Ht0coC/nAVEUQFQLhXtyB4aw6jKMKF9ff8HzhVOsLQ13K9MvUH4nh17A3b8
 X0IG+zvP4YjZB9qcfjrPIBuuKfgEibO6DzaNR3cG8TZwz73XhoRwn86VlJzYDpndT6LU
 MtpcwxBGTg4+qOqVF/y48uFNpA2bAo7xyKsOHk/v6yI7+ZG1IGpxyK0r3md+ToHLMdrK
 mWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=;
 b=G1gmbUZ4qwUhMYCsMXen/ygGuSZxuOg+k575AZSCJI7ar/Is64DWVLRIyUTPI1kC8t
 iu2fDZ8slybBPJVHQNgFV2khpX0sd9MJf4SBSe5f0vWWh652nvj4hq3yce+ChXTwgy4s
 4mHUEQm5bc/yzVA7XU1nkX5+b1MwUfZjJVCZedrWeHY/WQO2EBsoppLGrp7bQgbQB1Md
 oVryCTxBgaPpTIBcZltGPpVyo5ua0ny6a5m+XeXi54Z1h7BIaVG71ETy53oRTsqj40Du
 MKvgXbxTKlvgcnsdYhEsUEoFll4Hz73OE46d307r+qQgRLODGyOafvJKADmJS8A3YwMi
 1K8A==
X-Gm-Message-State: APjAAAU5z2/iqhIspq58f3/3w4kqaOqlLqnwVjMwg2vAfhqbTV/TJhvQ
 OnqzCLTnFp9wMjzTCOJc/NQ=
X-Google-Smtp-Source: APXvYqwONZTehdk35XitEb5MFGQ3YaKV519c02Q5wasJGEVSNUQOf6OoebSn7yVrmWLCDumcSeljhQ==
X-Received: by 2002:a17:90a:f48a:: with SMTP id
 bx10mr3683941pjb.103.1573534626683; 
 Mon, 11 Nov 2019 20:57:06 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id n23sm15226461pff.137.2019.11.11.20.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:57:05 -0800 (PST)
Date: Tue, 12 Nov 2019 13:57:04 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 00/50] Add log level to show_stack()
Message-ID: <20191112045704.GA138013@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112044447.GA121272@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_205707_487221_6DF431A0 
X-CRM114-Status: GOOD (  11.68  )
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

On (19/11/12 13:44), Sergey Senozhatsky wrote:
[..]
> > But yes, this per-code-section loglevel is problematic. The feedback
> > against the patchset shows that people want it also the other way.
> > I mean to keep pr_debug() as pr_debug().
> 
> Hmm. Right.
> 
> > A solution might be to use the per-code-section loglevel only instead
> > of some special loglevel.
> 
> So maybe we can "overwrite" only KERN_DEFAULT loglevels?

LOGLEVEL_DEFAULT, LOGLEVEL_NOTICE, LOGLEVEL_INFO?

So we can downgrade some messages (log_store() only) or promote
some messages.

DEBUG perhaps should stay debug.

> We certainly should not mess with SCHED or with anything in between
> EMERG and ERR.

  [EMERG, WARN]

	-ss

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
