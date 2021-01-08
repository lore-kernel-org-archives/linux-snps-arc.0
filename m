Return-Path: <SRS0=cuW9=GL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9CAC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 05:18:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39B223383
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 05:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F39B223383
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h9ueHezZl33ThQ7wDbKfyAn22Iby1t+2l8GQyR3x9iA=; b=1YFlSAXGUDugVxQTd0JmgUWDp
	a1iCUVuaei6s+v6bIQ8OknoDEGp1Nxk5y7p3U6+z++rWsrIYYY0bMVyeP/6Ltkw78HdjDSH0Nn76f
	M+zXj2ZaN2KYx///0ZzdtejCg3kZobJiPSydfQnPsL9q32fW5OX1NVm8pkX199DndAtS5wOG6QuZA
	th6pmYyETcf7+eJetPZiHAmI4+qHNfua+tXOrNVkedFYPjxhpQGDGWKfi7XAcBoqKHYKdGLjtzlW8
	TrizTfLVDjOi5hrVxNA/DFZzUqyshIeq2bDx/bjzbW7NJKkkjO4M6pwbId7KIrbrsljmFdCa+W/x6
	T/y4RVskQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxkAS-0003zr-9s; Fri, 08 Jan 2021 05:18:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxkAQ-0003yq-A9
 for linux-snps-arc@lists.infradead.org; Fri, 08 Jan 2021 05:18:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id m5so5512341pjv.5
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Jan 2021 21:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aSxKMwdc2LOn2l0PdeifM0S0Y2l05A8yh5PMl2xYblo=;
 b=owhFsaRzICAUXtIRzOEsWNqrBsznL9RP5mZdv1HnNGFwini6cJS7XWXLP5SneT86JJ
 hYJrmSRbH3sbF4eLbZpZhVel0ev0N3uEk9qSYcsqKFnqaYjmV4y+a9+0J3Ljj7ISXW13
 mSCWjc170dWhkGxIsUdzwOPPIQ+dMz1lxSpzjZ2s7KPJZK+qNOhoV/CIUxsIxY6xzoVM
 PN4Q1SZUxw04kkkVFmPBdbcyf0FxEacZfgXrBsXgAr3o0g4Zum7l5puasXgFKAvL6HgG
 HN59tlSQCgS/YRUzyH5TxAuwDfo0klGPIVLpsgilEmF7PQAUvEoPg/zufmo329Agvvfd
 11wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aSxKMwdc2LOn2l0PdeifM0S0Y2l05A8yh5PMl2xYblo=;
 b=HESPNSvO+Rz4rfdM4ApChpKXATYOu4TSslG5Prrh7U5teWvcvWvfoM3s2Dl0iNQYh3
 3gEO07SP0eoXFuUqDiX7CaQeiPwPCaqLz+tuIumo2rWIdDhjmAmDIF+knjDHX+xuaLmF
 fIbVs++JWALRpEA66wRTEF59lmCed8Vupqh+Id9OyTvq4g9maONqjxWRPsNupo+XEcGI
 W7MGAO5JhiMM2cuQmQnrTA7s/jOrj7bMmmhVRt/+GrvdirL0OTd8m63tRLepywhe4XFx
 JOL4cRwNB7/Em5VcMSDdAaZ/kRkCP9NeV1iAcD6HOJuD7RdlJQEgE/UMQN8Og+48L7jv
 2Agg==
X-Gm-Message-State: AOAM5315RoGg8mcPXI0LKLA14d4kudiyRUqguJ8mx11z1uLKK34wPauN
 ECaVaX03caKeqE5dPF06sTt3OXrN7jbeXoDx
X-Google-Smtp-Source: ABdhPJxHs2I8fgn1/rnaSLlvFAMF8We5+bkxciPAber23woXbNgHmG0Awj6rCjaV0VLtd9ZBUKVh2Q==
X-Received: by 2002:a17:90a:5d03:: with SMTP id
 s3mr1893827pji.150.1610083105147; 
 Thu, 07 Jan 2021 21:18:25 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id w2sm7351029pfj.110.2021.01.07.21.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 21:18:24 -0800 (PST)
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Newsgroups: gmane.linux.kernel.cross-arch, gmane.linux.kernel,
 gmane.linux.kernel.arc
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com> <X/c/ONCYz2QQdvOP@alley>
 <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
 <X/fWGjYI5LapMdGW@jagdpanzerIV.localdomain>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <d7db7948-4831-8dac-0d16-7933bcd9d995@synopsys.com>
Date: Thu, 7 Jan 2021 21:18:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/fWGjYI5LapMdGW@jagdpanzerIV.localdomain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_001830_436499_869A0F74 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: linux-arch@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/7/21 7:48 PM, Sergey Senozhatsky wrote:
> On (21/01/07 09:58), Vineet Gupta wrote:
>> On 1/7/21 9:04 AM, Petr Mladek wrote:
>>> On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
>>>> Hi John,
>>>>
>>>> On 1/7/21 1:02 AM, John Ogness wrote:
>>>>> Hi Vineet,
>>>>>
>>>>> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
>>>>>> This breaks ARC booting (no output on console).
>>>>>
>>>>> Could you provide the kernel boot arguments that you use? This series is
>>>>> partly about addressing users that have used boot arguments that are
>>>>> technically incorrect (even if had worked). Seeing the boot arguments of
>>>>> users that are not experiencing problems may help to reveal some of the
>>>>> unusual console usages until now.
>>>>
>>>>
>>>> Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
>>>> console=ttyS0,115200n8 debug print-fatal-signals=1
>>>
>>> This is strange, the problematic patch should use ttynull
>>> only as a fallback. It should not be used when a particular console
>>> is defined on the command line.
>>
>> What happens in my case is console_on_rootfs() doesn't find /dev/console and
>> switching to ttynull. /dev is not present because devtmpfs doesn't automount
>> for initramfs.
> 
> I wonder if we'll move the nulltty fallback logic into printk code [1]
> will it fix the problem?
> 
> [1] https://lore.kernel.org/lkml/X6x%2FAxD1qanC6evJ@jagdpanzerIV.localdomain/

Your reasoning in the post above makes total sense.

I tired the patch: adding register_ttynull_console() call in 
console_device(), removing from console_on_rootfs() band that works too.


| Warning: unable to open an initial console. Fallback to ttynull.
| Warning: Failed to add ttynull console. No stdin, stdout, and stderr 
for the init process!
| Freeing unused kernel memory: 3096K
| This architecture does not have kernel memory protection.
| Run /init as init process
| with arguments:
|    /init
|  with environment:
|    HOME=/
|    TERM=linux
| Starting System logger (syslogd)
| Bringing up loopback device
| Starting inetd
| Mounting Posix Mqueue filesys
| 
CONFIG_INITRAMFS_SOURCE="~/arc/RAMFS/archs/ramfs_2011-GNU-2020-03-glibc-2.32-tiny"
| **********************************************************************
|			Welcome to ARCLinux
| **********************************************************************
| [ARCLinux]#

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
