Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FA3C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 16:03:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83EDF2077D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 16:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rr0gos3F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aGRTcFwa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83EDF2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k7mgFkUQBeDYCxj5DSGvmRH8QBWyZp7Lhq8dVs9iDYk=; b=Rr0gos3FUnp9uXOWEuqRsI6Ui
	wH3cq8Uu6AvVWVK0uqb+cyYypQEUZVijn7EpJECviZL5eNU+VTMoBEbXUHJJU8+RFX2XZNCUwEv1e
	tvHxJm6gtRMEZOcqqjim2f6Q/TxzkDH4f0zf9+P2+gkWDmXabW/nEc8bEj7OuaNqIV4HRHgsWD8PP
	15Vq+vSo+oeVH5bjzNYzvku2UQX/V895c/FiIQkPNW/R8xbPwQ9EXjWoYY0Gp8oylUMNBaR5NUBZc
	Z8dnNBLxOaxla8bluq6gbqa6Yydykuc246efkX8ll/QXU7L3D76F9XwUsSFzdi/KfqCbiXFVDExPS
	sDpNlzeOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtZ1d-0002OG-Ny; Thu, 09 Jul 2020 16:03:53 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtZ1b-0002Nb-6O
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 16:03:52 +0000
Received: by mail-qt1-x842.google.com with SMTP id k18so2032003qtm.10
 for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2020 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fattEyfqWUvKmdcqvXi4+lF96LIozDTxNJ6DAtyaTG8=;
 b=aGRTcFwaDEDxbCg0Q9o4Yci8t80Va0l6iPXyainyACU0V6jfBMx7KUd3n52SpYWT48
 a1/8bhy6BTKp/zkjv2hee1XZl6jxT+J6DJeqeO1DjgwpGpcoa7gMWT9b0fQ3Y7VX1FAU
 UueYidqKyyd6amP2PLhiV/VI6NOE23MC5mJ1J2rSWeLMsXkDPxNatt427fx5oVgS+bes
 GKCj7ITVHkGkA4Uee3wyPxkJ8OlBfQ350jO9eb+QkhQbgtOj5Ty7FC9ndnr+AAXp7+Aw
 PXKwf4/sghNcW+fVQDows2retcsBCsXRIBSo3iwsoaAUmZ1UZYvH3E1KmcT7bkhIlctj
 taXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fattEyfqWUvKmdcqvXi4+lF96LIozDTxNJ6DAtyaTG8=;
 b=ZSk8DbIhsY7YWEgcZL4/xL/Bgx5qUed6tb2WNaPFLn3x9VGnEmyLmRV/HaFyrnL3Kg
 RNmcBcs6SP0tEZKSnhlP4VNYa3WxgL6pPOvZWsmq201YTF4+hnQ3j1kJEBw8CWJCqPq6
 cKbgWNllwzUmIFoKOZqhlvDcUTjybihozWrTJeUajyiG+RfGKGMJfgLmt+s4iV5UcAlY
 eT0Gg1DEHzLAyBt7LRPadz5TOAiUOr4KtXHo6afJWEOFo3HrVXJNQpyDEB4u9CODDJbS
 0SNHnSOnYkTWLzc0wkHdX+N87NwplKfMMnVr9wgsLkYPp8K6R4Lk9YterxR8wb4I4hFB
 U3lA==
X-Gm-Message-State: AOAM530N/UP36q8eceiehXjtzejMkpX/ep1afG3gTBwyFTTPLdkvBWJS
 IQM9ryGZ5rAc7OVMSNub0co6QomLH+Y=
X-Google-Smtp-Source: ABdhPJyvNRNUbqbdnnGdzXZutxbk7agy88Vp83N/MnMaVaN41SJMBPtoUwwvrlhkA8xTnhP5FUZ2KQ==
X-Received: by 2002:ac8:22d2:: with SMTP id g18mr68563420qta.38.1594310627820; 
 Thu, 09 Jul 2020 09:03:47 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id 16sm3970532qkv.48.2020.07.09.09.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 09:03:47 -0700 (PDT)
Subject: Re: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
Date: Thu, 9 Jul 2020 13:03:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_120351_336523_C582981A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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



On 08/07/2020 16:32, Vineet Gupta wrote:
> On 7/8/20 9:31 AM, Adhemerval Zanella via Libc-alpha wrote:
>>
>> On 07/07/2020 17:55, Vineet Gupta via Libc-alpha wrote:
>>> ---
>>>    Changes since v7.1:
>>>      - Added a few more 32-bit time_t syscalls to fixup-asm-unistd.h
>>>        and regen arch-syscall.h to remove them: __NR_timer{g,s}ettime,
>>>        __NR_clock_{gettime,nanosleep,settime}
>>>      - minimal/annotated list of 32-bit syscall aliases in ARC sysdeps.h
>>>        for 64-bit time_t support
>>>      - Open-coded SYS_ify() but retained the macro as used by common
>>>        code
>>>      - No functional changes in generated dsos.
>>>    Changes since v7:
>>>      - used long int (iso int) in sysdep.h/syscall_error for handling registers
>> LGTM, thanks.
>>
>> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> 
> Thx a lot. I now have Reviewed-by tags on all ARC patches so we just need the
> sysvipc/semctl y2038 patches to hit upstream before I can commit.

The patches are in, if you could just to a sanity check I will
be grateful. 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
