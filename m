Return-Path: <SRS0=iL9E=4P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB76C11D3D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2020 17:49:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7757624692
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2020 17:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a2rMYGZk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9/j0JvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7757624692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wE4sV7X9xqslz16WHxXr+olus80niwscxSm/ZsAPOqc=; b=a2rMYGZk5mt9Xk
	DUnTqU6AENfO9RUUsFIOg8s11SYtnbpEYZcCJ5NF5TKlRPSHzLKpUfP60oSd52VDm875QzyTp8bBK
	PecczSawhIWBkxOtS/IVEV03fYTX1H74ijlzdPvjpMqPHWC6WsEL2SILCp92sYEo2V+60Q135y43w
	314zJKYKoc8Pe/ZOcNevplkcXd2M/LDTJrlatctzcmTxrlZ+urSxNQ7fDHtvSnQwTXD0tyyIESfJR
	BTczIu2nDsrsjMz/l7HE5eLhZJRdpuRWi8UqyqFhKoL+A6kJUye4ZvzG5ZDE2Cy/yyinTUxTF2RXA
	NW/5Eza/xvugfYls3R2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7NI3-0006T6-G9; Thu, 27 Feb 2020 17:49:39 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7NI1-0006S8-Cb
 for linux-snps-arc@lists.infradead.org; Thu, 27 Feb 2020 17:49:38 +0000
Received: by mail-qk1-x744.google.com with SMTP id m2so176207qka.7
 for <linux-snps-arc@lists.infradead.org>; Thu, 27 Feb 2020 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SH3pRLz3uXkm8XTYvNUsU1QRJpAEy6SLBg/eBWJbn4E=;
 b=f9/j0JvAYwA8DH04ypLme127rAzjT6eyxr9SPNZx0wLFD+4xtBnEiDNxLF02Hy55vE
 5NxPqqsaIsIlKYlBW/KeEm3f7bC1Oc3J7CfAFx/oI6EbV4Z5orLpmwxEmDY0RoOYMleq
 NJ05fM9QhY8rX4q/030QZr35DyJmkjZT9SytwemyFlCIvKZjRQun1mKOxHDBIfZUYevs
 rWhTAAMSIPl6y8VLrDUCPsohuizxrAFaQ06+TmYv813GHXTs4bWlssKxfQVvGdG2b1Qc
 qYi/v51MeiNMAB1lVjmnJ8s6tyBw2d8sxQILtf6Q9oHBtOk+OPNOyxzQGNHEDZRC7WmF
 XlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SH3pRLz3uXkm8XTYvNUsU1QRJpAEy6SLBg/eBWJbn4E=;
 b=BrhZNClXupPqh9sLYdLixVE1OjRgA+TknsuliSIQXN2TTLqcc673hRQKUJOhnk0SoZ
 xFYNuIZ8WpQjE4OpEV9r8stT1YnpKPIQwWku5UDzgsJBGxzErOxXsxmbNTs9fdm0nMsJ
 WxSOgdYMwgD6TR9lc65WzMp4SV8kpIY35HU1QvX9WdBkbvlnGt9wWBzRos6+PqxhLIrl
 UbmGDE6J7trEKppfMrllIbZ9F+t4ysHO7gSQbotpucPHd3dtKx06nOaKIhmsCLID8Oob
 BgI0ZI9aOPZQN2GJGaY3GUAZV6GOTIjIWIShUoQjTrfG/fy0jtz54VAE6IJzNUusUT8W
 Qc5A==
X-Gm-Message-State: APjAAAU+MX/DnU952LlG5ru0/Ksu2M26fZpuSIN5v/ELB9EEnHeUwgTN
 z56wWnd4FuH60OzkUa+4tPsbbNHAf9Y=
X-Google-Smtp-Source: APXvYqz5cMHjvS1VnqI+qzFpYH5+DnOjSwcVPwiTp8e2YA/RklwMXENytzjo2VEhAWLefkdV7oqdYQ==
X-Received: by 2002:a37:b304:: with SMTP id c4mr463182qkf.348.1582825775387;
 Thu, 27 Feb 2020 09:49:35 -0800 (PST)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id
 z189sm3498536qkb.131.2020.02.27.09.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 09:49:34 -0800 (PST)
Subject: Re: [PATCH 08/15] nios2: Use Linux kABI for syscall return
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200210192038.23588-1-adhemerval.zanella@linaro.org>
 <20200210192038.23588-8-adhemerval.zanella@linaro.org>
 <10265c86-aba3-12f9-9208-4a4c6ad31d28@synopsys.com>
 <4d32b8a1-e294-d2b7-f150-2c55281614ed@linaro.org>
 <8f88415f-18cc-17ef-91ca-b0dc101558d9@synopsys.com>
 <f6bf5752-24c2-858f-7918-3e25c40d1e43@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <400b9721-cfbe-78f3-6cab-dd8d6a3115d1@linaro.org>
Date: Thu, 27 Feb 2020 14:49:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f6bf5752-24c2-858f-7918-3e25c40d1e43@synopsys.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_094937_456114_45BCE40E 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 20/02/2020 18:04, Vineet Gupta wrote:
> 
> Through a maze of defines this ends up calling INTERNAL_SYSCALL_RAW which seems be
> unconditionally converting !0 value (success) into -ve and returning it. So won't
>  it convert a legit brk address return into a -ve and save in __curbrk.


> On 2/20/20 12:39 PM, Vineet Gupta wrote:
>> Am I not following this correctly ?
> 
> Oh never mind, they use 2 seperate regs to convey syscall result and error, so
> your code is right.
> 

One of my goals is to disentangle the {INTERNAL,INLINE}_SYSCALL macros
to consolidate their definitions and move the arch-specific bits to 
inline functions instead of macros.  Another one is to remove the
requirement to define similar assembly macros to be used by the 
auto-generated one.

The idea is an architecture will just need to define a set of
inline_syscall{0-6} functions.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
