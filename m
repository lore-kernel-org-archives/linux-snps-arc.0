Return-Path: <SRS0=Wmq+=FZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A395C433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Dec 2020 08:32:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38E922B43
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Dec 2020 08:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D38E922B43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1aA/aNBDL1Rj0ZvAwz92bR8cfpo9GRGc8QWigwKGEo4=; b=M0aBEcmvxugL9KKHcg/CnaCYk
	Pmd5te02mDpf0glm1mOLuD48nAnf8kP2HDiJOYOcsQZgSo43MfLPgJxO6sP3iTTNbxw1ImdYmwUZ2
	4k9ohd3x2Xn/hVg91TouFE5fV0JIXAeg92Ga/wTi8mbGWQQEG2iPCXXmMCMG+buoNNY0s5l/2NMkq
	6cBSb3efi0J9pJGga5yyeKPjuqn03vl4YJv9gkCKrW4chVWPzSKFAQg8anb6ATXr6JFL68iGtA50h
	iAcgPETnPz9/QuLd6KcEwsQ4+L/yVRtMo7dvX0PRi8yV5l8H/P+5F4GSDT/5/vTQ+13ozfDsZ/nYe
	rcI5mSrDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krGc0-00086T-5R; Mon, 21 Dec 2020 08:32:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krGbw-000864-Tj
 for linux-snps-arc@lists.infradead.org; Mon, 21 Dec 2020 08:32:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id 91so10156903wrj.7
 for <linux-snps-arc@lists.infradead.org>; Mon, 21 Dec 2020 00:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VoiV0D68E7iBU6MgOJJtpGcG8ySo+Z5P8wrAxN/JZM4=;
 b=Ovso28SZMLRIhLgjh1Zx0mc+tPkxInEmCudiHe0gy+9uzNEIcvnwlwRo25C1Gqw1uo
 sGzHsf7EM2Xv3YyauEemOsVzh+bIi/8vI1/mTlpf5hGM5UAUq6VgizLdK9NrOfiFj5zZ
 uY7TQjrTzPm+7TkTkUE3uIZXHFIOCjUWTsHEcBMr6adhzVKBmjLXVzYwUStTcGYVshiY
 JONtiEZBEeU7SGN60OGvMkbKL9UM6z1hbpyW0zuPrj0P9WH0FH4DHF3SCZ+PevpGYecQ
 WfyqtgJxjxMH11JxRdjr/f9o6TEMDe2crgsrtoyPzSXl409gGzi/tJY/iv8biVKMdfZC
 /tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VoiV0D68E7iBU6MgOJJtpGcG8ySo+Z5P8wrAxN/JZM4=;
 b=Wr5/0oSiEOKkFgzuki6/kAzOrf+PQ4SPY7/eH0CFZ2Z4Y0Qw+UMmT2rzlgYU3/BoFx
 rfVLyQ9GFJfC7uIoR/zj0gAT1zSNXIWwMMJ6ky5uREdiOAu6+P0Vso69XHAYg4VF4WgB
 t2Le9vfQ/G7PSIRdM2RmVx0n0syA6x56F3pN8yDA3x84GGn5oExlZHCnJs83eipkieDp
 f0TlA037+s5G1WGz/d7+yqFrXTksblBe8Q1a6uqMxWyv7vGkyOStZ0Ju+yUYnZscpfvA
 aFrehg5gtVj0BCurhCw0gThPgT6tBSS5oj7Uw9a/aaDklF1RiWBDvrD9LFuwnxPz7vvw
 pgzA==
X-Gm-Message-State: AOAM531rLvD0Jqvq8/vtRNpimO9d4lOn22jHs4MSnO0xgbM1wvOSC7A+
 JNPcXjxRZ37lLOaPcMX5Usw=
X-Google-Smtp-Source: ABdhPJx4YGEmXDYJ2YKR4RrvSOsm7/mnOT/aDO8wr0wOUJEtAbHndIf8eLruBEyKHqfyDd46ST3H8Q==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr17651300wrt.246.1608539527540; 
 Mon, 21 Dec 2020 00:32:07 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id n12sm27406645wrg.76.2020.12.21.00.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 00:32:07 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Document Architecture-specific variants
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
 Dave Martin <Dave.Martin@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 linux-man@vger.kernel.org
References: <20201214143852.16565-1-alx.manpages@gmail.com>
 <53a3c827-3e83-441b-8192-afdf323ca296@gmail.com>
From: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <f4946e75-11eb-6938-3fe3-664af0f4d601@gmail.com>
Date: Mon, 21 Dec 2020 09:32:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <53a3c827-3e83-441b-8192-afdf323ca296@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_033209_620574_1AA274B6 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 12/20/20 9:54 PM, Michael Kerrisk (man-pages) wrote:
> Hi Alex
> 
> On 12/14/20 3:38 PM, Alejandro Colomar wrote:
>> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
>> ---
>>
>> Hi Michael,
>>
>> Please apply this patch after
>> '[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
>>  portable alternative'.
> 
> Thanks. Applied.
> 
>>  man2/cacheflush.2 | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
>> index fc35f1a0b..0761b429a 100644
>> --- a/man2/cacheflush.2
>> +++ b/man2/cacheflush.2
>> @@ -31,6 +31,10 @@ cacheflush \- flush contents of instruction and/or data cache
>>  .PP
>>  .BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
>>  .fi
>> +.PP
>> +.IR Note :
>> +On some architectures,
>> +there is no glibc wrapper for this system call; see NOTES.
>>  .SH DESCRIPTION
>>  .BR cacheflush ()
>>  flushes the contents of the indicated cache(s) for the
>> @@ -87,6 +91,44 @@ but nowadays, Linux provides a
>>  .BR cacheflush ()
>>  system call on some other architectures, but with different arguments.
>>  .SH NOTES
>> +.SS Architecture-specific variants
>> +Glibc provides a wrapper for this system call,
>> +with the prototype shown in SYNOPSIS,
>> +for the following architectures:
>> +ARC, CSKY, MIPS, and NIOS2.
>> +.PP
>> +On some other architectures,
>> +Linux provides this system call, with different arguments:
>> +.TP
>> +M68K:
>> +.PP
>> +.in +4n
>> +.EX
>> +.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
>> +.BI "               unsigned long " len );
>> +.EE
>> +.in
> 
> I made the formatting rather:
> 
> [[
> .TP
> M68K:
> .nf
> .BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
> .BI "               unsigned long " len );
> .fi
> ]]
> 
> That's for consistency wqith the SYNOPSIS sections, where .EX/.EE 
> isn't used.

Ahh. Right!

Thanks,

Alex

> 
>> +.TP
>> +SH:
>> +.PP
>> +.in +4n
>> +.EX
>> +.BI "int cacheflush(unsigned long " addr ", unsigned long " len ", int " op );
>> +.EE
>> +.in
>> +.TP
>> +NDS32:
>> +.PP
>> +.in +4n
>> +.EX
>> +.BI "int cacheflush(unsigned int " start ", unsigned int " end ", int " cache );
>> +.EE
>> +.in
>> +.PP
>> +On the above architectures,
>> +glibc does not provide a wrapper for this system call; call it using
>> +.BR syscall (2).
>> +.SS GCC alternative
>>  Unless you need the finer grained control that this system call provides,
>>  you probably want to use the GCC built-in function
>>  .BR __builtin___clear_cache (),
> 
> 
> Cheers,
> 
> Michael
> 
> 
> 

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
