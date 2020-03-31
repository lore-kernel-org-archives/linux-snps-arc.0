Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE9DC43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 01:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A0A2072D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 01:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1/ho4cB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkcd0sPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A0A2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+h23wdFuZX4xEg4XolfSqWvQaOasuFH99wsvuQUECg=; b=t1/ho4cBa6eK9D
	cmpI2rncW5cYGD9UGos+9CpwR6j2SZ632IGTPeY4GupGv2Qm3NgBJd9UvEE9C6IRn09kqMHiu+W6s
	BlRC3y2U9PmAF68+67mG2XzmjMcOKVzjnPWxc0ohou4nHMwn2Ji4KUvMybiKgrVlgLNa8cJejoKBB
	A6WN7IACXzRRzawkqKjdftqM0FNjfjZRBHb9baoD/E+0ARLiJ9fYhrpNz8dB/9J6sxOI8EQ3WjlxW
	nd+QfRecOVtWEnF9XnjeBC8sA/yt9CpgRKbXAWK0TPFcUR+d3st9Zinzk+Qzx+x36so4MUh9YzS7Y
	/cV40F6sk71ZIpTeSLMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ5eg-0001Cy-2k; Tue, 31 Mar 2020 01:25:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ5ec-0001CV-HW
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 01:25:24 +0000
Received: by mail-pf1-x444.google.com with SMTP id 23so9548487pfj.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 30 Mar 2020 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9iE9dtchfVUQDWedQkDoxY1/km2Qx13EVW65J4IDlNM=;
 b=nkcd0sPr/Nsk7KIhhereuti/tf1kZjdTwnjY0kRJV/OlG7tb4xuAWcA8T5pQA7YU6b
 LbYnH6p1b0HYEoiUNxn5MoZnT/jWE2yO53l3M3HDAyNyBbcQ+vao+zpWOvWl1fkLfY82
 vWL80d/T/njh7/4YGojfbJLgkIM6wepaKk8PeChC4+aYFm7d2G6l35gsUEE6Otl5SnUu
 IYn3zgUuzGMeYVB8+0gC41XQPFaTwhrFlflL2LdspPlSXOK+hnCgaOIZoiw4dZBFD9rO
 fLjqd7lbmwUQ4g+UmUKk//uKHJ37ApZjL9xzBviwc+lgf0HLQuwFPga6uzjX+wB+DoFP
 Zrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9iE9dtchfVUQDWedQkDoxY1/km2Qx13EVW65J4IDlNM=;
 b=dWCvrpdVS2MQBcg6/CSt5bYNH6gpVktNJDC5nE8d+byHP+7OfEnaDX1uOqNTwu5R6+
 pyYC/iuUoSBUo1SIvx8rCCv6j1UbCspn9TvjfipWcIQwGZHB1H052Al9tY3lISoCcBk2
 HLGrarf9VdaxzvaNiOFluNUZAUuS35YU16oLX3bc+pKJtTKTqHwAsrCY8uTCqelgHnYH
 xov44vW/LQc4WmMgaDTcctMZktUn62GVFiigXGO1bQZO40RitqXYeGH/CQjI8swJp+22
 i4sGMkSRGy4+RMk8x6wBss/vNz4gqT+OODNIiikq/zaXkWRTbRqMzmu03QqxGyclKCz1
 7STA==
X-Gm-Message-State: ANhLgQ2X1/znrHxkRpdX/fbG2CEb5wt2nOI9VZKucV8580Z/iO6ssF6z
 77lTr26BrCV0jpZgo3+FpJc=
X-Google-Smtp-Source: ADFU+vv/A47jC6nFTV+C4t9DHVpU2sucf6YzpkVslPFR0jLWYaAtKH8sxNq7OHTNgsKxeqH35pzw3g==
X-Received: by 2002:a65:6801:: with SMTP id l1mr15726046pgt.105.1585617921088; 
 Mon, 30 Mar 2020 18:25:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h26sm11069220pfr.134.2020.03.30.18.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 18:25:20 -0700 (PDT)
Subject: Re: Build regressions/improvements in v5.6
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200330085854.19774-1-geert@linux-m68k.org>
 <CAHp75Vc1gW2FnRpTNm6uu4gY3bSmccSkCFkAKqYraLincK29yA@mail.gmail.com>
 <CAMuHMdXDBtOo_deXsmX=zA9_va0O5j8XydxoigmS35+Tj7xDDA@mail.gmail.com>
 <CAHp75VfsfBD7djyB=S8QtQPdKTkpU5gFzyRYr8FshavoWgT0CA@mail.gmail.com>
 <CY4PR1201MB01204FB968A6661FB8B295ACA1CB0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <c8447243-98c6-d545-9766-e6b3f33f4d13@synopsys.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a5e8ec79-2eff-7517-4b90-38d5cb366f45@roeck-us.net>
Date: Mon, 30 Mar 2020 18:25:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c8447243-98c6-d545-9766-e6b3f33f4d13@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_182522_612533_748D719F 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/30/20 2:17 PM, Vineet Gupta wrote:
> On 3/30/20 1:40 PM, Alexey Brodkin wrote:
>> Hi Andy, Geert,
>>
>>> -----Original Message-----
>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Sent: Monday, March 30, 2020 4:28 PM
>>> To: Geert Uytterhoeven <geert@linux-m68k.org>; Alexey Brodkin <abrodkin@synopsys.com>
>>> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
>>> Subject: Re: Build regressions/improvements in v5.6
>>>
>>> On Mon, Mar 30, 2020 at 4:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>
>>>> Hi Andy,
>>>>
>>>> On Mon, Mar 30, 2020 at 3:08 PM Andy Shevchenko
>>>> <andy.shevchenko@gmail.com> wrote:
>>>>> On Mon, Mar 30, 2020 at 12:00 PM Geert Uytterhoeven
>>>>> <geert@linux-m68k.org> wrote:
>>>>>> Below is the list of build error/warning regressions/improvements in
>>>>>> v5.6[1] compared to v5.5[2].
>>>>>
>>>>>>   + /kisskb/src/include/linux/dev_printk.h: warning: format '%zu' expects argument of type
>>> 'size_t', but argument 8 has type 'unsigned int' [-Wformat=]:  => 232:23
>>>>>
>>>>> This is interesting... I checked all dev_WARN_ONCE() and didn't find an issue.
>>>>
>>>> arcv2/axs103_smp_defconfig
>>>>
>>>> It's probably due to a broken configuration for the arc toolchain.
>>>
>>> Alexey, do have any insight?
>>
>> I think I do have some but first I'd like to get it reproduced myself.
>> I just built v5.6 with help of both GCC 8.3.1- & 9.3.1-based toolchains
>> and didn't see a single warning. So I guess I was doing something wrong.
>>
>> FWIW
>>
>> 1. My GCC 8.3.1 toolchain was exactly this:
>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2019.09-release/arc_gnu_2019.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
>>
>> 2. Linux kernel is vanilla v5.6.0
>>
>> 3. Configured and built as simple as:
>>    make axs103_smp_defconfig && make
> 
> It seems the build service is using a arc toolchain built in 2016 :-)
> 
> # < /opt/cross/kisskb/br-arcle-hs38-full-2016.08-613-ge98b4dd/bin/arc-linux-gcc
> 
> Call it Murphy's law, same year a little later I'd fixed the same issue in gcc [1]
> 
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2016-October/001661.html
> 
> @Guenter could you please consider updating the ARC tools. FWIW you can build
> stuff off upstream gcc/binutils using build system of your choice.
> 

I am currently using vanilla gcc 9.2.0 to build arc and arcv2 images. Are you saying
that I need to update to gcc 9.3.0 ? gcc 9.3.0 was released only a couple of weeks
ago. I don't usually jump onto new compiler releases that quickly because each
release tends to have regressions.

[ Never mind, I just noticed Geert's reply. Still.... ]

Guenter

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
