Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB3FC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 19:24:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCB22065D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 19:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLaiNBfA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UDnrKalh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCB22065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FgASKQ8KdGJyek9e0bz4DDMR3/sTX6knf97i2VaHa8k=; b=hLaiNBfA80XDY8o9vHPEfOCQR
	VaxKoqb+Ir5U3zE2/G16S/97eB/1PslmiJFAynOIH8+IfBZNYq0a+4f/jzlqm1YFy0zN8WN3Hkl8h
	8B92gYPZNXortYRrVkLN/iicqIO8MBuGibl7wYHoGEW2vMJuSke/8ceKyFDFvhHNM3/Y0fVkzhEyx
	riIIVr2KcUcX/CHQZ7T9P3GZe0O1/VBjmid3oaQaKH1lOF2kFcXTWqvY98v+c03Kr3tumBh8R4iOv
	bhzsRr14u2q+rZIrTblRkRZXV24bS8ggSAxdfz8evv+w2sGonAErWztkQP6ZIISR2+L7ZfTnT0GQT
	O7/xs1T0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jstCV-0004n9-0w; Tue, 07 Jul 2020 19:24:19 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jstCS-0004m0-CJ
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 19:24:17 +0000
Received: by mail-qt1-x841.google.com with SMTP id w27so9623128qtb.7
 for <linux-snps-arc@lists.infradead.org>; Tue, 07 Jul 2020 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RpmkVZgnV41KF2VEUQHHaXOf3JuETTCdlnqRthwmR9A=;
 b=UDnrKalhPwcUvF5CE3DNdPEn8jLDcWxrAaYkZDE5Ufx1ro7PwzyoCnXjO9Iz8ebaWv
 JFvBeQMdaDazjRA9NL0TO3kpedXFpDAAJpEODfWRtO7593hk9zN83W5Aqy7OSQqox8aa
 yf8eqscw9sb5XjY+7nXOaMSFU3agrkYtPQqymQ8HACbezhrwuDda/wCCyN0JNZhWrJ7H
 ES0KEZkDmeYwV11lEYVTuTMxJ1RcKT+owkaDfwgemPe+jgGLqQ/1PYWbCTREKc6WIMRH
 zBrqp3Re+05es/cq6On6+Nv9qxPG50awiUbaVLEENRwR6DUzzbKR/N0Aav4/vrNBLq3i
 B3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RpmkVZgnV41KF2VEUQHHaXOf3JuETTCdlnqRthwmR9A=;
 b=uMohk4Ljnfijv74V2cWNkEJ5CQ6TW3XVibx4rHlvd1fm599SzFypn0aN3SSTv8zo3q
 PgOpNYKhKHW51b1XnoJMp+X1qCn865LLaHpisUVRARwe3fD/tbPAFaYn2vGIXPOLFvBx
 16VX+7r5mHhKbd2QtYMzN8Xst1JK4GmUQuJtXWuf3DOHS1CslgmlNFOpMATa+0oKGR61
 Q2Vdja6igP0lvvYNQxNt9JqqUguq4GBzA8SiS0fDHAuZI7axNMZ4Nw5VF+7eRKn7qxS/
 tJoj1wbEZmmsEct4oq2n0LbK/jhi3jzcZIH2EizRgyrStdwy2NqzNlP53zoolFJ5ZpYj
 2xMg==
X-Gm-Message-State: AOAM530Npg5n755FazR87rPxs1PspmkCqq/ARX1EnpQoveBREFmKRnSH
 K7rHcWkRq7qc2XjBw4Sd40/7xZygcC4=
X-Google-Smtp-Source: ABdhPJxEJphxWiyOPjq+jSq3NTruEAQqM3Lz5DHCcBzCiXgM1uFsIi/xVaLrRoJTKivur+b6fc94RA==
X-Received: by 2002:ac8:134a:: with SMTP id f10mr57839638qtj.131.1594149852820; 
 Tue, 07 Jul 2020 12:24:12 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id f4sm26480033qtv.59.2020.07.07.12.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 12:24:12 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200615201441.31820-8-vgupta@synopsys.com>
 <20200701000848.20492-1-vgupta@synopsys.com>
 <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
 <64e18e52-9dc6-6d14-3e15-8c5ff1c0cdc2@synopsys.com>
 <a56d0e2a-cbc1-9a2b-b145-0d59318426d4@linaro.org>
 <5feda452-d571-2ffb-5cb4-a71dc7033503@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
Message-ID: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
Date: Tue, 7 Jul 2020 16:24:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5feda452-d571-2ffb-5cb4-a71dc7033503@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_152416_532359_4E60D707 
X-CRM114-Status: GOOD (  33.72  )
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



On 06/07/2020 22:25, Vineet Gupta wrote:
> On 7/6/20 6:20 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
>>>
>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h b/sysdeps/unix/sysv/linux/arc/fixup-asm-unistd.h
>>>
>>>>> +
>>>>> +/* Adjustments to ARC asm-generic syscall ABI (3.9 kernel) for 64-bit time_t
>>>>> +   support.  */
>>>>> +
>>>>> +/* fstat64 and fstatat64 need to be replaced with statx.  */
>>>>> +
>>>>> +#undef __NR_fstat64
>>>>> +#undef __NR_fstatat64
>>>
>>> This is certainly needed as they are present in ARC arch-syscall.h but we need to
>>> use statx.
>>>
>>>>> +/* Replace all other 32-bit time syscalls with 64-bit variants.  */
>>>>> +
>>>>> +# undef __NR_clock_adjtime
>>>>> +# undef __NR_clock_getres
>>>>> +# undef __NR_futex
>>>>> +# undef __NR_mq_timedreceive
>>>>> +# undef __NR_mq_timedsend
>>>>> +# undef __NR_ppoll
>>>>> +# undef __NR_pselect6
>>>>> +# undef __NR_recvmmsg
>>>>> +# undef __NR_rt_sigtimedwait
>>>>> +# undef __NR_sched_rr_get_interval
>>>>> +# undef __NR_semtimedop
>>>>> +# undef __NR_timerfd_settime
>>>>> +# undef __NR_timerfd_gettime
>>>>> +# undef __NR_utimensat
>>>>
>>>> I am trying to understand why these are required since arc does not define 
>>>> them in arch-syscall.h.
>>>
>>> arch-syscall.h doesn't define them precisely due to these being here. When
>>> update-syscalls is run, the 32-bit syscalls are generated for ARC (since kernel
>>> ABI provides these because that was v3.9 circa 2013). Adding them
>>> fixup-asm-unistd.h removes them (perhaps I need to add this in changelog to
>>> clarify - atleast for myself).
>>>
>>>> And the generic implementation should handle the time64 variant.  If they
>>>> are not this is something we need to handle it.
>>>
>>> At the time we we doing this, arch-syscall.h generation was not yet in place,
>>> however I tried to undef in generic/sysdep.h for TIMESIZE==64. However I was asked
>>> me to add this to ARC specific fixup-asm-unistd.h
>>> https://sourceware.org/pipermail/libc-alpha/2020-March/112395.html
>>> https://sourceware.org/pipermail/libc-alpha/2020-April/112909.html
>>
>> My confusion here, I forgot that this header is only used glibcsyscalls.py
>> to actually generate arch-syscall.h.
>>
>> You changes does look correct.
> 
> Actually we can add a few more entries here which have 64-bit variants.
> 
> +# undef __NR_clock_gettime
> +# undef __NR_clock_nanosleep
> +# undef __NR_clock_settime
> +# undef __NR_timer_gettime
> +# undef __NR_timer_settime

It should not intefere since ARC also defines __ASSUME_TIME64_SYSCALLS
and the 32-bit fallback syscalls won't be used in this case.

As a side note, now that arch-syscall.h is based on latest kernel version
and all the 32-bit ABIs with old 32-bit time_t have upstream support for 
64-bit time_t we can simplify a bit some implementation by assuming 
the 64-bit time_t is always defined and adding a fallback only for
!define __ASSUME_TIME64_SYSCALLS.


> 
> 
>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/kernel_stat.h b/sysdeps/unix/sysv/linux/arc/kernel_stat.h
> 
>>> This specific one is actually dead code. I did post a patch to this effect and
>>> followed up with supporting data that enabling it on 64-bit arches doesn't lead to
>>> any changes in generated code.
>>>
>>> https://sourceware.org/pipermail/libc-alpha/2020-February/111259.html
>>> https://sourceware.org/pipermail/libc-alpha/2020-June/115217.html
>>>
>>
>> Ack.
> 
> Thx. I'll repost this after things settle at bit.
> 
>>>>> diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
>>>
>>> ...
>>>
>>>>> +/* 32-bit time syscalls are not available, but the redefines allow generic
>>>>> +   wrappers to work.  */
>>>>> +#define __NR_clock_adjtime	__NR_clock_adjtime64
>>>>> +#define __NR_clock_getres	__NR_clock_getres_time64
>>>>> +#define __NR_futex		__NR_futex_time64
>>>>> +#define __NR_mq_timedreceive	__NR_mq_timedreceive_time64
>>>>> +#define __NR_mq_timedsend	__NR_mq_timedsend_time64
>>>>> +#define __NR_ppoll		__NR_ppoll_time64
>>>>> +#define __NR_pselect6		__NR_pselect6_time64
>>>>> +#define __NR_recvmmsg		__NR_recvmmsg_time64
>>>>> +#define __NR_rt_sigtimedwait	__NR_rt_sigtimedwait_time64
>>>>> +#define __NR_sched_rr_get_interval	__NR_sched_rr_get_interval_time64
>>>>> +#define __NR_semtimedop		__NR_semtimedop_time64
>>>>> +#define __NR_timerfd_gettime	__NR_timerfd_gettime64
>>>>> +#define __NR_timerfd_settime	__NR_timerfd_settime64
>>>>> +#define __NR_utimensat		__NR_utimensat_time64
>>>>
>>>> As for the fixup-asm-unistd.h, the generic implementation should handle it
>>>> without the requirement of the ABI to add such tricks.
>>>
>>> fixup-asm-unistd.h is different, but this could be avoided. I know for sure that
>>> ll code literally expects __NR_futex (atleast used to). But I can remove this and
>>> see what comes out.
>>>
>>>>
>>>> However it seems that we are still missing support for pselect 
>>>> (__NR_pselect6_time64), recvmmsg (__NR_recvmmsg_time64), sigtimedwait 
>>>> (__NR_rt_sigtimedwait_time64), and semtimeop (__NR_semtimedop_time64).
>>>>
>>>> I think we can add the redefine hack only the aforementioned symbols for
>>>> now and removed them once we implement the y2038 support on such symbols
>>>> (since the expected ABI won't change for ARC, only for old ABIs with
>>>> 32 time_t support).
>>>
>>> Sorry /me horribly confused here.
>>
>> Sorry for the confusion, I meant that some of these re-defines are superfluous 
>> and I would like to have the minimum required re-define to enable the ARC 
>> support, 
> 
> Right. The generic code needs a bit more work to eliminate the redefines altogether.
> 
> 1. Following is not needed
> 
> -#define __NR_clock_adjtime     __NR_clock_adjtime64
> -#define __NR_sched_rr_get_interval     __NR_sched_rr_get_interval_time64
> -#define __NR_mq_timedreceive   __NR_mq_timedreceive_time64
> -#define __NR_mq_timedsend      __NR_mq_timedsend_time64
> -#define __NR_timerfd_gettime   __NR_timerfd_gettime64
> -#define __NR_timerfd_settime   __NR_timerfd_settime64

Ok.

> 
> 2. The minimum list needed for ARC (with annotations as to which generic file
> needs fixing).
> 
> /* Fix sysdeps/unix/sysv/linux/clock_getcpuclockid.c.  */
> #define __NR_clock_getres      __NR_clock_getres_time64

It should be simple since there is no need to provide an extra symbol
for old ABIs, it would be to just use __NR_clock_getres_time64 if it
is defined.

> /* Fix sysdeps/nptl/lowlevellock-futex.h.  */
> #define __NR_futex             __NR_futex_time64

It seems Lukasz Majewski has sent a patchset to address it (I haven't
checked the detail yet).

> /* Fix sysdeps/unix/sysv/linux/pause.c.  */
> #define __NR_ppoll             __NR_ppoll_time64

This is another one similar to clock_getcpuclockid.

> /* Fix sysdeps/unix/sysv/linux/select.c.  */
> #define __NR_pselect6          __NR_pselect6_time64

I have a patch for select [1], it a bit more complex because we need to 
handle both the timeout and the microblaze lacking support of
pselect6.

> /* Fix sysdeps/unix/sysv/linux/recvmmsg.c.  */
> #define __NR_recvmmsg          __NR_recvmmsg_time64

I also have a patch for this [1], although it still does not have the
ancillary data from struct msghdr which might return SCM_TIMESTAMP
information (which returns struct timespec).  The recvmsg also has
the same issue regarding ancillary data.

> /* Fix sysdeps/unix/sysv/linux/sigtimedwait.c.  */
> #define __NR_rt_sigtimedwait   __NR_rt_sigtimedwait_time64

The patch for is more straighfoward [1].

> /* Fix sysdeps/unix/sysv/linux/semtimedop.c.  */
> #define __NR_semtimedop                __NR_semtimedop_time64

The patch for is also straighfoward [1].


> /* Hack sysdeps/unix/sysv/linux/generic/utimes.c (need linux/utimes.c).  */
> #define __NR_utimensat         __NR_utimensat_time64

Lukasz Majewski also has a patchset for this, I will check this out.

> 
> 
>> so we can cleanup these later once we enable time64_t support on 
>> old ABIs as well.
> 
> IMO the cleanup applies to new ABIs too as generic code should handle those cases
> w/o these workarounds. But that would delay things further for new ports so I
> suggest we keep the workarounds and clean things up going fwd.

I agree, this can be worked in parallel.

> 
> BTW, if one were to actually go about fixing those, whats the best approach.
> Consider the simplest case pause(). For !__NR_pause do we replicate the code for
> ppoll/ppoll64 handling or simply just call ppoll(). Later has a function call
> overhead) ? Or there is a paradigm to use __syscallxxx_helper() although that
> still has a function call overhead.
> 
> Actually the pause case is really simple as there are no args, so just redefine
> __NR_xxx trick should suffice w/o going into all the explicit
> interworking/conversion etc.
> 
> __libc_pause (void)
> {
> #ifdef __NR_pause
>   return SYSCALL_CANCEL (pause);
> #else
> 
>   return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
> #endif
> 

Each implementation has it ows requirements so I can't really say if
a helper function does make sense for all of them.  For pause
specifically we can even simplify to since all architectures have
either ppoll or ppoll_time64:

  int
  __libc_pause (void)
  {
  #ifdef __NR_ppoll_time64
    return SYSCALL_CANCEL (ppoll_time64, NULL, 0, NULL, NULL);
  #else
    return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
  #endif
  }
> 
>>>>> +#undef SYS_ify
>>>>> +#define SYS_ify(syscall_name)   __NR_##syscall_name
>>>>
>>>> The code mixes __NR_* and SYS_ify macro. This macro is really superflous
>>>> and I am preparing some patches to cleanup this up along with C asm
>>>> macros to generate syscall.  So I would suggest to just use the __NR_*
>>>> way and drop this definition.
>>>
>>> I don't mind, but it seems that the wrapper was a simply way to avoid open-coding
>>> the macro concatenation. e.g.
>>>
>>> # define DO_CALL(syscall_name, args)                    \
>>> -    mov    r8, SYS_ify (syscall_name)  ASM_LINE_SEP    \
>>> +    mov    r8, __NR__##syscall_name  ASM_LINE_SEP    \
>>>      ARC_TRAP_INSN
>>>
>>
>> My understand was in fact parametrized way to define syscall numbers when
>> glibc added support to future multiple Unix implementation (which never
>> actually happened).  I don't have a strong opinion here in fact, any is
>> fine in the end.
> 
> I open-coded the 2 calls to SYS_ify() in ARC code and deleted SYS_ify()...
> 
> ... and 2 hrs later, after mysterious build failures, find that SYS_ify() needs to
> be retained (even if not used in ARC port) it is expected/used by generic
> make-syscalls.h :-(

Sigh, alright let keep it then.

[1] https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/azanella/y2038-fixes

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
