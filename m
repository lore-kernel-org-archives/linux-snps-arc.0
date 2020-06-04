Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E24C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 17:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7997D206DC
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 17:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2TQXyoU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4UOpxgC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7997D206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4emiuwCIRZtqidFjvZEGRqGk3FBWm3q38YJ6GO5CYAQ=; b=q2TQXyoUZxOr5s
	Kz6OGlFOSkSmsM1xTewEPF/k3qUJRT6q6wU7mU6DwrMSf3UOdEmnSO4Y/J1zaxb4O+NclIcqYB5CV
	8fe1Rs3qsguYMeveQsO/FLPivz8o2lO7MQe5MsSpJKIA7H7rp0jRCYUc7dXlbIMKWCdH22B+MZX0c
	4CuC6UHou6alkkH2oIV68+Rz7JnHWRJR53HtFfZTBbN20S08Ena5Te59fpo7ijuggxrH1TbO6x1P5
	CwZc/m0LIoJR2uRA+yLM3zvX0BJ0rss8cH460rwt4J18zTTHVKGecJc3dGV2kd1JYlES1UFgwmkF3
	8XGcMguLT/qj/2pT1edw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgtJa-0007Nd-1Q; Thu, 04 Jun 2020 17:06:02 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgtJX-0007NG-PW
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 17:06:01 +0000
Received: by mail-qk1-x744.google.com with SMTP id c185so6783215qke.7
 for <linux-snps-arc@lists.infradead.org>; Thu, 04 Jun 2020 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tnt/+uRjDbC98l9Z5UJ39+50TVFrVgEOJXCekboEBrk=;
 b=Z4UOpxgCIxiUoF83ngOrxfBPoA8MgI9eRJJllr5eo1q5yThr/Gj4uEsB3Brvbf5+RZ
 roMMcgjppRZbBDMaamrSfxEf9Z89reSugSYZlL8OayjMD2VnT7t8vC6sc2PexHH95gmQ
 uEIxpQxWuzwG02AhU9p30DA9e9dW4qtJpdhr9/bkOcvWJPI6oSS5wGzHc9O4WowvZwYH
 5SshcNCOCPk3Rbh7FTzm3x0mxD6lrGo/gkvzDAgPDja/ID6e/BUYeBZy7zF4oXQrl9JX
 LZ2QCi/YYjjlbwzRBLZFae+ffT/GAxet127IJbUxipOhIjyULFbB2N95n3+QZ/XOS+WJ
 vWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tnt/+uRjDbC98l9Z5UJ39+50TVFrVgEOJXCekboEBrk=;
 b=Y0FwV0mE3EHa0fwuuvQOzJviyq+cph4Jj36j2iy0ZJXhxW5PRPP7geUZSIRPZShpMJ
 985SL++8sTJ7kd/9fydR3L+CX0mPfXw7eJUmIq5icwUq+UWOdYe9DQbD3Vd4S8eudPGt
 7O/GIh8eYhohPvzSvTF4ckpo7VnIjCfX3FcxoXQ8MeAk28jT9rtuizGBxW50MoZtCvLc
 UcuNoDBoQ9VQMK1zvnm50BkHLK0+XCHaExPmTGSzhwfPhZdLOXCzMydDB8oVe0uyaVut
 3Pv/UbxRKWDYwb77Xd7jN6ZUzKpcQ+VxMPwmttIv3KLCXLNZLqD9MY+Fw+ggAY/996Aj
 HIiw==
X-Gm-Message-State: AOAM5324sYPFU6+zQiRcq3GSxiqrh3+RogQCQesmtT2KUjWC632IotXh
 T1o55iALGeE8G7t6wZhe4Gon6me86mo=
X-Google-Smtp-Source: ABdhPJwxMfHgmgXURQ30faU4PiCLZKTPHBNPdVhj8kFOjWdlZLHJs0DYrH7HjpCzm+jyv4O6oKe+9w==
X-Received: by 2002:a37:a147:: with SMTP id k68mr5667716qke.62.1591290356702; 
 Thu, 04 Jun 2020 10:05:56 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id i13sm4748368qkk.2.2020.06.04.10.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 10:05:55 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-12-vgupta@synopsys.com>
 <fe061156-0870-086d-72b7-a006ec8421c7@linaro.org>
 <d64e6491-c5de-4c43-4e8e-d56ca77e662c@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v6 11/13] ARC: Build Infrastructure
Message-ID: <98aad6dd-dd47-a5af-eb36-8203a080ee01@linaro.org>
Date: Thu, 4 Jun 2020 14:05:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d64e6491-c5de-4c43-4e8e-d56ca77e662c@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_100559_843602_3E1AA2A4 
X-CRM114-Status: GOOD (  21.94  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 04/06/2020 12:25, Vineet Gupta wrote:
> On 6/3/20 12:58 PM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>>
>>> diff --git a/config.h.in b/config.h.in
>>> index dea43df438f6..08962dfed075 100644
>>> --- a/config.h.in
>>> +++ b/config.h.in
>>> @@ -109,6 +109,9 @@
>>>  /* AArch64 big endian ABI */
>>>  #undef HAVE_AARCH64_BE
>>>  
>>> +/* ARC big endian ABI */
>>> +#undef HAVE_ARC_BE
>>> +
>>
>> Why do you need this define exactly? It is not used anywhere in the code
>> and for C code if is more straightforwar to use endian.h.
> 
> It is used in build system as part of "formal" BE ABI support as pointed to in v4
> series review. This specific thing helps choose the right dynamic linker name for
> BE case.

Ack.

> 
> $ git grep HAVE_ARC_BE
> config.h.in:113:#undef HAVE_ARC_BE
> sysdeps/arc/configure:175:  $as_echo "#define HAVE_ARC_BE 1" >>confdefs.h
> sysdeps/arc/configure.ac:22:  AC_DEFINE(HAVE_ARC_BE)
> sysdeps/unix/sysv/linux/arc/shlib-versions:3:%ifdef HAVE_ARC_BE
> 
> I looked at other ports and they seem to follow similar patters: csky for CSKYABI,
> riscv for RISCV_ABI_XLEN etc.

Right, it is the usual way indeed. This is fine.

> 
> But I can rework if there's a simpler/better way.
> 
>>> +++ b/sysdeps/arc/Versions
>>> @@ -0,0 +1,8 @@
>>> +libc {
>>> +  GLIBC_2.32 {
>>> +    __mcount;
>>> +  }
>>
>> Hum, does ARC require a different symbol name than the one provided
>> by gmon/Versions?
> 
> ARC gcc generates __mcount and _mcount with different ABIs and we use the newer
> __mcount.

Ack.

> 
>>> +AC_DEFINE(PI_STATIC_AND_HIDDEN)
>>> +libc_cv_have_sdata_section=no
>>
>> The libc_cv_have_sdata_section is done by configure.ac, why do you need
>> to explicit set it here?
> 
> We inhibit small data explicitly which by default kicks in.

Ok, is it some limitation for loader bootstrap or something else?

> 
>>> +if test $libc_cv_arc_be = yes; then
>>> +  # For shlib-versions.
>>> +  AC_DEFINE(HAVE_ARC_BE)
>>> +  LIBC_CONFIG_VAR([default-abi], [ilp32_be])
>>> +else
>>> +  LIBC_CONFIG_VAR([default-abi], [ilp32])
>>> +fi
>>
>> The ilp32 naming is usually set for ILP32 architectures that uses 
>> 64-bit registers type on 32 bit VMA (for instance mips64n32, x32,
>> or aarch64_ilp32).  I don't think this is the case for ARC, so I think
>> this naming might be confusing.
>>> +abi-variants := ilp32 ilp32_be
> 
> arcle arcbe ?

LGTM.

> 
>>> +
>>> +ifeq (,$(filter $(default-abi),$(abi-variants)))
>>> +$(error Unknown ABI $(default-abi), must be one of $(abi-variants))
>>> +endif
>>> +
>>> +abi-ilp32-condition	:= !defined __BIG_ENDIAN__
>>> +abi-ilp32_be-condition	:= defined __BIG_ENDIAN__
>>
>> Ok with the 'ilp32' naming module described above.
> 
> 
>>> diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
>>> new file mode 100644
>>> index 000000000000..292f1974b02a
>>> --- /dev/null
>>> +++ b/sysdeps/unix/sysv/linux/arc/Versions
>>> @@ -0,0 +1,16 @@
>>> +ld {
>>> +  GLIBC_PRIVATE {
>>> +    # used for loading by static libraries
>>> +    _dl_var_init;
>>> +  }
>>> +}
>>> +libc {
>>> +  GLIBC_2.32 {
>>> +    _flush_cache;
>>> +    cacheflush;
>>> +  }
>>> +  GLIBC_PRIVATE {
>>> +    # A copy of sigaction lives in libpthread, and needs these.
>>> +    __default_rt_sa_restorer;
>>> +  }
>>> +}
>>
>> Afaik all other ABIs that requires the sa_restores uses a local symbol in
>> libpthread. I don't have a strong preference here.
> 
> Do you mean add following to sysdeps/unix/sysv/linux/arc/Makefile
> 
> ifeq ($(subdir),nptl)
> libpthread-routines += sigrestorer
> libpthread-shared-only-routines += sigrestorer
> endif

Yeap.

> 
> And that is to optimize the reference to restorer as a direct PC relative access
> vs a got reference ?

My understanding is this specific optimization does not really matter: 
sigaction is hardly a hotspot and the symbol will be issue by the 
kernel itself. AFAIU is more a way to optimize the exported symbols
and simplify the GLIBC_PRIVATE namespace (since the sa_restore usually
has small text size).

> 
> It seems even in libc, this is currently not optimal. It seems we need
> libc_hidden_* on restorer.
> 
> 0002b020 <__GI___libc_sigaction>:
>  2b020: std.aw	r14r15,[sp,-8]
>  2b024: push_s	r13
>  2b026: sub_s	sp,sp,0x28
> ...
>  2b02e: mov_s	r3,r1
>  2b030: ld r13,[pcl,0xd4e9c] <__default_rt_sa_restorer@@GLIBC_PRIVATE+0xd4558>
> 

If you define it as attribute_hidden and add on both libc and libpthread it
should not require the libc_hidden_{proto,def}.

> 
> 
>>> diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
>>> new file mode 100644
>>> index 000000000000..343c0a04500e
>>> --- /dev/null
>>> +++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
>>> @@ -0,0 +1,7 @@
>>> +DEFAULT                 GLIBC_2.32
>>> +
>>> +%ifdef HAVE_ARC_BE
> 
> This is where the BE define is used.
> 
>>> +ld=ld-linux-arceb.so.2
>>> +%else
>>> +ld=ld-linux-arc.so.2
>>> +%endif
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
