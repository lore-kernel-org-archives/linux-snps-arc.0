Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F3EB64DC
	for <linux-snps-arc@archiver.kernel.org>; Sat, 24 Jun 2023 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDIglu85gi2j7H99j9ZI1ljTV1+AaaLN07LkZCMh/SA=; b=z4Z7eMulOU1eGe
	PVZTELRehg10yEpNLy4QYeOWUnYixtZYuDjD1/ADI/3Jkq72igOfLCF3G7Ct5xrWITXDHVklSsDB/
	dMfQSgP5A+BGOGSK8ZiDzzE+VsF0zr0sGWauB5C53TIQ7jxKjB7gt0aghihw1+3T6OZARr6silQjG
	UpgyqjdPmTWphs3a+IJnciZ3qgRiui++MVExfwsDxiMJXP9AH90w6oN8jARx549vs3ODC1l/8IW29
	acH16bz6fBLSngu8aZMsQNDhUn8rakiFROT6qWWIijEkWACDvr0aLxikOQQEBlda+7IxKSTAFFUpj
	X8yznQuM9EZM0sdy9p5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD3Ht-0062Ja-2i;
	Sat, 24 Jun 2023 13:26:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD3Hq-0062J2-2V;
	Sat, 24 Jun 2023 13:26:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262cc036fa4so32480a91.3;
        Sat, 24 Jun 2023 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687613205; x=1690205205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
        b=j4S9zj7lUuy3sqeeDhUPOz9rwvMJbGSEdKnwRk/XZ+y08PrJVIgqGnCRVMjv5QysTG
         qw+xSrtWimmK0w+c8oUxGgA/hWWS3mddb5TfZRZZkZXCB9iy4qhZcLzmK/w1rFGHNOlD
         u6YXzvdMzyxYCBki+QXeLCsaSepsuUuVeoUWLvfvN2Dfxqqx0oSY8FZK/DD2zqhKZHfv
         RYvqwhQB7QGRxNAtgIU6NHSikcQzK9FTked9KfdwhJI/KFzaz6eCW0C1QabmKjtdXE0H
         kEFZFV+Sc13EU6p5oRwnRdHPaXUEyY8PcvUlBsvAgUzJqMVPy3L5lDhMq3dGib+XWXWt
         gQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687613205; x=1690205205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
        b=WccCTNqPHNNe0bv2l0CmBzZmsUh1gLswbaCsJF2lbxyOUCNhRHoDLb+ElSAqYDQsF4
         ZSHY+WtyhgHFn2koqtTbYD0i9jz33R6IO+8Ur4W032c0xYd8H0vb4n/P8eAzdsdOAe10
         dbBEFgjSuab4aank/tn4qUsDYg7coma6ojs+ihnl3VyLHJLlc6RuKYBbw6Wxzlw5zKGE
         tzsfGpscCfMBkWU2/1ex0apg2u+//eDkocbGOHW+8k2dBfNMrWRALd2FJ4ENpM0LChFN
         DzVJer5Z6xVP9TjDnYInhhO33WSBN7vSwZ+AJLYhCdWzbc/svuYkn5Ld7z3a8I1kWHS+
         XKSQ==
X-Gm-Message-State: AC+VfDxjFtiGHeYgx3HrwLBIOrH5Xp+SQP4/yojD04zCDjKMFxAUArKB
	jMnlEpFNU5abO/UTkPPV0mc=
X-Google-Smtp-Source: ACHHUZ7BC5DQswxC/X8knfo6PJ0Ce0pzV2b4lrahqjLtajzjQRmz1UcB8/ZZrwmJOMsABWyiGJPEWQ==
X-Received: by 2002:a17:90b:251:b0:25b:d304:6eaf with SMTP id fz17-20020a17090b025100b0025bd3046eafmr14080091pjb.24.1687613204832;
        Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n189-20020a6327c6000000b0055387ffef10sm1282333pgn.24.2023.06.24.06.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Message-ID: <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
Date: Sat, 24 Jun 2023 06:26:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in source
 file
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_062647_058890_C90B7A9B 
X-CRM114-Status: GOOD (  16.19  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/24/23 02:27, Arnd Bergmann wrote:
> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>
>> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>>> Other architectures implment fb_is_primary_device() in a source
>>> file. Do the same on sparc. No functional changes, but allows to
>>> remove several include statement from <asm/fb.h>.
>>>
>>> v2:
>>> 	* don't include <asm/prom.h> in header file
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>
>> This patch results (or appears to result) in the following build error
>> when trying to build sparc64:allmodconfig.
>>
>> Error log:
>> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch
>> in reference: cpufreq_us2e_driver+0x20 (section: .data) ->
>> us2e_freq_cpu_init (section: .init.text)
>> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch
>> in reference: cpufreq_us3_driver+0x20 (section: .data) ->
>> us3_freq_cpu_init (section: .init.text)
>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>> undefined!
> 
> These all look like old bugs that would be trivially fixed if
> anyone cared about sparc.
> 

Odd argument, given that this _is_ a sparc patch. Those may be old
bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.

Sure, I can stop build testing it if that is where things are going.

Guenter

>> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
> 
> I checked that there are no callers of fb_is_primary_device()
> in built-in code when CONFIG_FB is =m, so adding the MODULE_LICENSE()
> and MODULE_DESCRIPTION() tags to the file is the correct fix.
> 
>      Arnd


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
