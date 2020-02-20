Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA84C11D04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 13:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E144F206ED
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 13:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfzwZbOm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pklu0RcQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E144F206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35vrBzh2S/x8ehAa4s4ntk089Ie+z3gQOGdPknI2xd4=; b=DfzwZbOmYEJkhL
	YnbYvivx+BqOC3OwjBUl6H47KBcnfDGWbgzIG9JidhfQm/Z6+/W11BGzk99IEV+aM/dRGDk0OS1yc
	9Ln8AXedgYEOVY9Cgk8n8lywbDDMeCR3UFR7y8MzP7cazRujjq+tAHXm7o9R5pSW/1hlA95dFYXCS
	T9YfBxzwDQiv9vtT10CiysVx+XPyVcDa1dWpd4NTBVVXEOHaMh2F6yQ2NFbg8DSsrKWvtgqZSplUU
	/OeinBiRHOw1BZvr0O2SWRG/aFWls0TZZOkWKNlwwe5J5PgHaXynKn53C4RdcapNCHOhIyf/Q36fP
	aNFD85ANEMW1gmGKwWoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4lfM-0007f9-0y; Thu, 20 Feb 2020 13:14:56 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4lfK-0007ej-1I
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 13:14:55 +0000
Received: by mail-qt1-x842.google.com with SMTP id n17so2808590qtv.2
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 Feb 2020 05:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ySlCMHI+gxHqC0V+xQd6MHOB9gUaaFB/WQadbzBIBo=;
 b=pklu0RcQjTenqn1qXhSD6tdwePOg+aYuyaTZu6P/nD64rO39MERNNh22sbCfoVJoIy
 TZYhJzAIk78q+gskEuyQ3wCuxKKEVBbhUHecUf2ejFL29jJbQlmXby0Tu+oklkAiFdqt
 NebGUJXYdWiJdL9hLw7/issxLnfo8CwhdtCMDgz2tluJzrEFG+kdWuf34qy7jfIadAC3
 j7EPtacCBdJDdcsNN3sg8w8T/Z6BHOLdzT/H4BVQN2UQuoUxEEE5ImBDzhREzDWh28Bh
 Sof5R9wt+55eLaJ+G32bIRhTOFHVHeUAUwArOgRmlh9ZikcsFrOrAuyy5Iu6TLuCTlTq
 wpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6ySlCMHI+gxHqC0V+xQd6MHOB9gUaaFB/WQadbzBIBo=;
 b=reVQw9UQq7SWqBgol+v8eFxxcUmnT6K71c+ckOdCirT5PPLZ4kjQupiHS64RBCjb4O
 lOC34jfHcHKtFGShB66MjEcOICQE9rblm1xj14iZ5J5j0OUz90MQYLoYqgcoO2sfq7vx
 hsqnQIcpVLIkEQzfSVtsHFwn9te4S/KTShg3S18kcjnpx4ZnBTLlTvn2AY8dErBpEsdb
 xDWRznf4ilfHaq9dEDGt0FzMIjYAZ9CB+198GZfWIU5z3RGz5fFVKmzSR87RQBd0r3hF
 CO9VDygRrkEw4FU9KoVh7JPyc0IcFYKIiBaqlx50fghWBOkV4meoF8MqwGHjA9meXKWo
 ApUw==
X-Gm-Message-State: APjAAAW2p9Vb/Osbf2tvz6tvk+jp5sZfkQ6e8rrSWTdcrFZHJUkke+xF
 nl4plYkjCMsPqx4zPUo/cExOLsdwQB0=
X-Google-Smtp-Source: APXvYqyMHe45DXRKEdCz5MLXBsPxGwbH9tglwqE7YWNocjcIJP80443/7zrCogf+VFQIKIxm+/0KGQ==
X-Received: by 2002:aed:2d01:: with SMTP id h1mr26670872qtd.239.1582204491690; 
 Thu, 20 Feb 2020 05:14:51 -0800 (PST)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id x126sm1592771qkc.42.2020.02.20.05.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 05:14:51 -0800 (PST)
Subject: Re: [PATCH 08/15] nios2: Use Linux kABI for syscall return
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200210192038.23588-1-adhemerval.zanella@linaro.org>
 <20200210192038.23588-8-adhemerval.zanella@linaro.org>
 <10265c86-aba3-12f9-9208-4a4c6ad31d28@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4d32b8a1-e294-d2b7-f150-2c55281614ed@linaro.org>
Date: Thu, 20 Feb 2020 10:14:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <10265c86-aba3-12f9-9208-4a4c6ad31d28@synopsys.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_051454_109781_556DE616 
X-CRM114-Status: GOOD (  13.20  )
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



On 19/02/2020 18:40, Vineet Gupta wrote:
> On 2/10/20 11:20 AM, Adhemerval Zanella wrote:
>> It changes the nios INTERNAL_SYSCALL_RAW macro to return a negative
>> value instead of 'r2' register value on 'err' macro argument.
>>
>> The macro INTERNAL_SYSCALL_DECL is no longer required, and the
>> INTERNAL_SYSCALL_ERROR_P follows the other Linux kABIS.
>>
>> Checked with a build against nios2-linux-gnu.
>> ---
>>  sysdeps/unix/sysv/linux/nios2/sysdep.h | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/sysdeps/unix/sysv/linux/nios2/sysdep.h b/sysdeps/unix/sysv/linux/nios2/sysdep.h
>> index b02730bd23..eab888df32 100644
>> --- a/sysdeps/unix/sysv/linux/nios2/sysdep.h
>> +++ b/sysdeps/unix/sysv/linux/nios2/sysdep.h
>> @@ -157,13 +157,14 @@
>>       (int) result_var; })
>>  
>>  #undef INTERNAL_SYSCALL_DECL
>> -#define INTERNAL_SYSCALL_DECL(err) unsigned int err __attribute__((unused))
>> +#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
>>  
>>  #undef INTERNAL_SYSCALL_ERROR_P
>> -#define INTERNAL_SYSCALL_ERROR_P(val, err) ((void) (val), (unsigned int) (err))
>> +#define INTERNAL_SYSCALL_ERROR_P(val, err) \
>> +  ((unsigned long) (val) >= (unsigned long) -4095)
>>  
>>  #undef INTERNAL_SYSCALL_ERRNO
>> -#define INTERNAL_SYSCALL_ERRNO(val, err)   ((void) (err), val)
>> +#define INTERNAL_SYSCALL_ERRNO(val, err)     (-(val))
>>  
>>  #undef INTERNAL_SYSCALL_RAW
>>  #define INTERNAL_SYSCALL_RAW(name, err, nr, args...)            \
>> @@ -180,8 +181,7 @@
>>                       : "+r" (_r2), "=r" (_err)                  \
>>                       : ASM_ARGS_##nr				\
>>                       : __SYSCALL_CLOBBERS);                     \
>> -       _sys_result = _r2;                                       \
>> -       err = _err;                                              \
>> +       _sys_result = _err != 0 ? -_r2 : -_r2;                   \
> 
> Is there a typo here ? both cases seem to be -ve

It is, thanks for catching it. I have pushed b790c8c2ed to fix and
double checked nios2 syscall handling (arch/nios2/kernel/entry.S:205)
to certify that the modification does follow nios2 kABI.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
