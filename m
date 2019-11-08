Return-Path: <SRS0=7pOa=ZA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF04FC6197
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 21:08:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB5A20869
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 21:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QbbjxG0h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjflubiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB5A20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwuFpo0UiDnzPFiimc03yYQ0I92lDoFU8ZPsbJmfvdQ=; b=QbbjxG0heFqxkZ
	XHsH/AccYNT3ZYzwIWV5Y4Do9840af3v/UCZo4UggQfpoScwFiSg5n8xLCuJaCm0/JoGKuWfqgvO1
	rne9pxM2hPJyOU2Hbb7tCic1zipJQVIHJC4hnF4b1QHltR97UwRJJ48wIL7aftvtitfESfjccVZkf
	07zUfLmRS+Hyd9lM698b5xAgTD9IUrJs3AEzH+myRzrF73tX29f15NjrHmc0opBODxiU1X+TUG2h2
	xT9QiWLhGgRm2ZRKo0wZOD1siUqX1SnzDqfSn0/z67ZNpWQ/5Fc7dZgKT+lyUpazbWVGuqgZ+kqqr
	9PAoIr7pr5KPW1NCFcCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTBUr-0007aO-0U; Fri, 08 Nov 2019 21:08:45 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTBUo-0007ZX-0w; Fri, 08 Nov 2019 21:08:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id z19so7580915wmk.3;
 Fri, 08 Nov 2019 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=leuvFNJRBbgvPXZJlD4yDG614p9ePBBBJqh6/bi0nWM=;
 b=rjflubiq8T92r7IsfuflmmOLhAbyeUiuHnf/rQSYhhlSmttRaTaotAvL5xYp4yOydT
 GvzpvT1wRN/Se5w5Bamn3iuJIAGtHWJ3FQg7uwfFHiBZYXDG6coXsfRkKjBQWYAriMTe
 4kTrO4cphBn73YaGY9oVhRABcMWkQkwRmG/gGE9R1eQjZ3xrtTYtO4ekpHSWHoSNgXQt
 LOIHB3CeUqi5Hx5sAbRW5lNwEUAqSAnAREOPMl/n34UjrP0bXjp7N2IIvVwOE5dHTyoC
 y/6fNB8lMSjFK19DQSqAbg52NdT8Yh0NvqWS+ZavZPT5hVJ6jwjvtDCEDMZ1djztH8HA
 lzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=leuvFNJRBbgvPXZJlD4yDG614p9ePBBBJqh6/bi0nWM=;
 b=EkxvlN/PHgu+Du4+nXXUXlO6FYK+cIsSjhhvSKhkyLxfGCi842NrWIKRS3rPh7qIQB
 NOBQkj1/0i17s7rv88avu8xyUaK9EO3TNM9LRbNbetoKgl+v6NYBLkSJOwfx+rVOG70U
 vMSkcCm94cQSnYNtwIbcUCQ/yRC6NvKy9hwFRyBUIeLxrOyGCKFv4uNkWoCiTqpEcusA
 lTh7Z0G2AX9jaIPWxlnIgppH/60R+E0J5FDZooxuFZq7damQoZMkMD5aUoyNeLrOt19Q
 Zcx2bSPvW18pFXWYQ74FQg5qrlgtclqg2R5LTzdlsu+8FrQNOTPjMGy1PZ8V834FAbbg
 NfYg==
X-Gm-Message-State: APjAAAW9Q9T7wImqIPWljXQh8GPcPeg8iOXFIFDUazMbWOT19B6ZRWi6
 HqgYbsF91GaVJ04FJrgjfbs=
X-Google-Smtp-Source: APXvYqy4dAVQ+ZAcZ+Na7c6XiIr61o8y7Lfg2+bZQEg4XJKlBUyi7kCGw2dZZvY/2MRfFQOLGhdeXA==
X-Received: by 2002:a1c:810d:: with SMTP id c13mr6004971wmd.154.1573247319697; 
 Fri, 08 Nov 2019 13:08:39 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j63sm9370828wmj.46.2019.11.08.13.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 13:08:38 -0800 (PST)
Subject: Re: [PATCH 00/50] Add log level to show_stack()
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Dmitry Safonov <dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
 <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
 <20191108173045.GY25745@shell.armlinux.org.uk>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <5a411348-be84-f592-ef2d-ffaec99332bd@gmail.com>
Date: Fri, 8 Nov 2019 21:08:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191108173045.GY25745@shell.armlinux.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_130842_111666_BC36BA18 
X-CRM114-Status: GOOD (  18.89  )
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
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Douglas Anderson <dianders@chromium.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>,
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
 X86 ML <x86@kernel.org>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Mark Salter <msalter@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
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


On 11/8/19 5:30 PM, Russell King - ARM Linux admin wrote:
> On Fri, Nov 08, 2019 at 04:28:30PM +0000, Dmitry Safonov wrote:
[..]
>>
>> Well, the use-case for lower log-level is that everything goes into logs
>> (/var/log/dmesg or /var/log/messages whatever rsyslog has settting).
>>
>> That has it's value:
>> - after a failure (i.e. panic) messages, those were only signs that
>> something goes wrong can be seen in logs which can give ideas what has
>> happened.
> 
> No they don't.  When the kernel panics, userspace generally stops
> running, so rsyslog won't be able to write them to /var/log/messages.
> 
> How, by "kernel panics" I mean a real kernel panic, which probably
> isn't what you're talking about there.  You are probably talking
> about the whole shebang of non-fatal kernel oops, kernel warnings
> and the like.  If so, I'd ask you to stop confuzzilating terminology.
> 
> If you really want to capture such events, then you need to have the
> kernel write the panic to (e.g.) flash - see the mtdoops driver.

I was talking about things prior the panic: OOMs, MMC write/read
warnings, hung tasks, we also have local patches to produce a warning if
the mutex is being held for too long or a task is starving on CPU time
by hard/soft irqs (I hope I will design something like that for
upstream). I've found those warnings useful to:
(a) have an early message when the things are starting going bad.
(b) analyze contentions or too large scale for a box or faulty hardware
for non-reproducible issues just from logs.

We use kexec to save the dmesg ringbuffer content after the panic.

Thanks,
          Dmitry

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
