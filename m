Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE0BC433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 17:58:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00543223E8
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 17:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00543223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P2GERhn9Dbhd+KaXKyD2sIMJ7rPZJyFXPk6rWm+CDOs=; b=X/znfyFULo0UPhyrE8ejHjYAP
	eq7mfUdyvC8LXmpJNwHgWqbQKbkcF5xkJSwNe04zRjKzuM0hTb85Z7tN952Pg/l7BE/YdHBOfQaeW
	L9wNHH6CeTFpZNZ45kCRqnidB1yz6QxFCzSf/xyZ9KcHrfmfu5vhm+3DBvTisJact1JJ+BS46IYDz
	ap/JmGd44r0G3ui8V7BeyK42PqzJ3/t8fj2LBwRr7oaNx4y+1epdb6OTDQA+4894b+6kOGiJxHrav
	sgPj34yqh3vJFHacG6KypVF2VivCG9gRgbqvslz1n3SVP0hzoCMxX9owsC0AAvWzbeqY1FXiLfdbR
	ohiWIi8Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxZYF-0000aR-7B; Thu, 07 Jan 2021 17:58:23 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxZYB-0000a5-UX
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 17:58:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id p18so5442044pgm.11
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Jan 2021 09:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hTkzqrCNdP0r0M/fUFV1DV/mK3Fh5BcFABP+peFArds=;
 b=qCvkVAW7GzxhEniptCfQUtsKyYzGgk5rW8/4bIz9sHBwE2Isgyhd8KBe6UAyM8Om/T
 sfbjGnIEXiGsEvsYfifeQBcslPMSQgo6d1CzPtsRE7jQhLkUSGNCqpkyK0T7/33ToOyP
 ZdNl89k8ISaTpcBjDLOPgP4J10ovwyXlIGNSdTQXUz3eJvZQiRU8j1snMV0JeOaVl/GZ
 ZTuoKvnaoyjtKBz4tMOaJL95TCMnBGbeUGrU35UnBUAVP0VNdzWfh0n6fFrtPbIbw4UJ
 yrXT19r8VLm8dP4Y+Pzr+xrDiew06eQvAElhECUmGZVZTfCgyx/AdVANdd6y5c8kJc8D
 zAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hTkzqrCNdP0r0M/fUFV1DV/mK3Fh5BcFABP+peFArds=;
 b=KD+9wf4U8F8/8RkEENx6UN+WmDksyBBkLiL0MUPgLlx3xSjhG5YeppgXmhduanVqYm
 YJzVBDvdPcGcKXzOWQ4TfPL7GJA5/oKQ/MKA+jXSATiTep43ehxSSNoR20GIgFsBTby/
 AEt6oJcCfSwzLuhZBmANQLxR4d1xnEkt2qp7FP1ONKc6DVU/SkXjxOdUjQK6O207CIZI
 svGrTI3+0TVO6W1XHevZQn5/RYIU4x5phqoWLYLGas3mU+CqRV8GAUsNSoyPJAMnOh65
 Nm2e1ayQRUHoFsZqStJMroyTvyifEJCK5wW2KxcOz+ETkQs2Tfuwm71V1tOC3tImeR20
 Y3vQ==
X-Gm-Message-State: AOAM532OiBVTpBbw/U9AlQ3OL9/dFazxomXHxOSfum8YlRijuHq5SVfe
 /ndu5jzKo5va5zcTLV0aCPLkrD1OB0kI4icO
X-Google-Smtp-Source: ABdhPJzR/BNW8sCHTSftdbijHuVAAOcy+X7BgxMPUvq3C6Xv33E/J822bkKqzWyqjeNNDD3G1v/Ozw==
X-Received: by 2002:aa7:93cf:0:b029:19d:e287:b02b with SMTP id
 y15-20020aa793cf0000b029019de287b02bmr9856835pff.66.1610042296286; 
 Thu, 07 Jan 2021 09:58:16 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id o193sm6623174pfg.27.2021.01.07.09.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:58:09 -0800 (PST)
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
To: Petr Mladek <pmladek@suse.com>
Newsgroups: gmane.linux.kernel.cross-arch, gmane.linux.kernel,
 gmane.linux.kernel.arc
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com> <X/c/ONCYz2QQdvOP@alley>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
Date: Thu, 7 Jan 2021 09:58:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/c/ONCYz2QQdvOP@alley>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_125820_352669_15A6CC27 
X-CRM114-Status: GOOD (  22.18  )
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
Cc: linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/7/21 9:04 AM, Petr Mladek wrote:
> On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
>> Hi John,
>>
>> On 1/7/21 1:02 AM, John Ogness wrote:
>>> Hi Vineet,
>>>
>>> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
>>>> This breaks ARC booting (no output on console).
>>>
>>> Could you provide the kernel boot arguments that you use? This series is
>>> partly about addressing users that have used boot arguments that are
>>> technically incorrect (even if had worked). Seeing the boot arguments of
>>> users that are not experiencing problems may help to reveal some of the
>>> unusual console usages until now.
>>
>>
>> Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
>> console=ttyS0,115200n8 debug print-fatal-signals=1
> 
> This is strange, the problematic patch should use ttynull
> only as a fallback. It should not be used when a particular console
> is defined on the command line.

What happens in my case is console_on_rootfs() doesn't find /dev/console 
and switching to ttynull. /dev is not present because devtmpfs doesn't 
automount for initramfs.

> The only explanation would be that ttyS0 gets registered too late
> and ttynull is added as a fallback in the meantime.

I don't know if ttyS0 console should have registered already but even if 
it did - the /dev node missing would not have helped ?

> 
> Anyway, I propose the revert the problematic patch for 5.11-rc3,
> see
> https://lore.kernel.org/lkml/20210107164400.17904-2-pmladek@suse.com/
> This mystery is a good reason to avoid bigger changes at this stage.
> 
> Best Regards,
> Petr
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
