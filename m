Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC886C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 16:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EECF23370
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 16:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EECF23370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L2KKvfER2jyF4ITBRs8FMJV1U1iTq77OPC3tSR0BVj4=; b=ySv4AKNgcaSHic+cV6/05eV7O
	3tY5el3aSvraeh+iK6Vc0poV1CnTGvgvFt0t0too0xtY296gH4ZQnPV4OzO6vpkwXhgkaEaEV713Q
	3pZEAYQ6s5S4QDY6kOapRRzoW/GRKSg8/qFGWcBxwGAcf2lvKVP/nSZkIaAAUrqDw4C/tSBrGs3SI
	N/0cApFrH+jWHP9rkfokQYNVz1CbXeXhvWgt1Cim4h58IS2v6AD1AuS/rKBnz1fGcy0HQgG3vWwpt
	yEPPBbCyXa8qXmN3GuqPNIDtXaTzFOmCcNbfA2wLlWEb3bHM9CAaZTxQ6hGUQag2T7xLwrGRhjxg+
	HnAaTRqoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxYNi-0007lS-QZ; Thu, 07 Jan 2021 16:43:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxYNf-0007ky-OF
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 16:43:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id j1so3834485pld.3
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Jan 2021 08:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NnHGgaTL7UJZGdN03aVyVWo38iGyqoEYM1bR0ga7ij8=;
 b=DrAmz6OBWqnVg7ucMJbCtL4YazKAfGIm509SyM01kSqP0G8aafO2z3H+4244zPYKVj
 cn/KNKIWDSxtoR8eeNDCL5WuZWVZacvA6eokmHjrK5Q8lFurU8BjNHgbt7rnSgfjsj+Q
 I7bjSOYqCdwlaJU9SC3byuce66eC3Ug043c0XYxCD3OHAR6wbX4EDY254+IAioPpTGC5
 to4Ev2xT6QAYyaStqeSreEChxg/fEbsqMNjusCYeIovdaSQdyAcujIqOlhTM/4B6/VTd
 JML2vhCh0moW1vD/dbfTI9ZDeUnUJ9THl5/VhAu5nSNQImg5WTXZ3GANu3qMtHthDour
 vI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NnHGgaTL7UJZGdN03aVyVWo38iGyqoEYM1bR0ga7ij8=;
 b=El6grCCGbERrl07pmUZr5oEgkkOp+K9UPBJbjEt9/gxEeBryoGBuirVSz8AkCtrIyD
 6DfZaNO1M2nLPp796FggB+uzI5TMHxDp3axzQMy2LE6E8YEoaXGVx9UlrHP7ppjXlkO/
 HeUasbTRFqGgEXmyP+tGCzqPaddC8X+5KdLkJ5JpVnvgXw8IdjkiLyuiR60caI7q3d1h
 4ApqHxyRsmJGQDUpU76SyR5U1f5lKsbYhTlYfbgUTA+W1HD7IReHpu9aPKUSp4TEqO4l
 guleGSOMkPEJ3I3LpOJV5qzvhpsDJb/v8bisIPIYxrmplRS4fLpPo0Ic0hkdqz+IXxrV
 NO2g==
X-Gm-Message-State: AOAM532ogiKTVsLsBMsm8yjJzbcjgUrkvz97BMrkvMBmGFmm1sW++qVx
 BDadWCmt/eYoCguNbEU2jMkg0IZEMxMdeM3w
X-Google-Smtp-Source: ABdhPJxeFpK8dX2MRlk52dm8MVC7U1Wjp9mS+gZUH1TWKFk0rS3lrwNPwAwOB8oy4gd/b5q8vye6qQ==
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr9753673plo.29.1610037800309; 
 Thu, 07 Jan 2021 08:43:20 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id y3sm6135773pjb.18.2021.01.07.08.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 08:43:19 -0800 (PST)
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Newsgroups: gmane.linux.kernel.cross-arch, gmane.linux.kernel,
 gmane.linux.kernel.arc
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
Date: Thu, 7 Jan 2021 08:43:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8735zdm86m.fsf@jogness.linutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_114323_822916_81522013 
X-CRM114-Status: GOOD (  14.67  )
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
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi John,

On 1/7/21 1:02 AM, John Ogness wrote:
> Hi Vineet,
> 
> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
>> This breaks ARC booting (no output on console).
> 
> Could you provide the kernel boot arguments that you use? This series is
> partly about addressing users that have used boot arguments that are
> technically incorrect (even if had worked). Seeing the boot arguments of
> users that are not experiencing problems may help to reveal some of the
> unusual console usages until now.


Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8 
console=ttyS0,115200n8 debug print-fatal-signals=1

And we do have serial driver built-in.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
