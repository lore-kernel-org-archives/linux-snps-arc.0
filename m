Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916F3C4741F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 18:53:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B65B32151B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 18:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZS9qeYEm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="wBN3visN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B65B32151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRT7lZRenvbs3kgTgqVzEyPo8/5/Aj4C+D4oDIAABic=; b=ZS9qeYEm/R9jEru9mnMrLjwdM4
	2UiXVU+wjXv611IB74XuwqS0Q0dkAxXBvoNNg+6fJJmnl8FKZeqKT00SSs1Z/Tdnl9Il6rycFMifs
	ugki96d5IovJQQrce7rUmXaEZyK/2adGXM8oLw1i31gzY5nuNTLfhwYeC5U2ILHcHmTY/5jZUG+Qa
	m7jabpAXSKTphqA9g7wK7F/K0Yu7M+F37X0nmkTI6yyu6HeCHxUu/NrEjd1tqBCNtz0bhyBUtNHTL
	CiT29l8u7JVC/qnUbq6a1rsXFKxtMAJxycFdSbEeA4qaE5+gpCZ0bSc+AHnH6JJCLvROFSwQ9wPtX
	sSvj3hbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZXA-0007OM-SD; Fri, 30 Oct 2020 18:53:56 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZX7-0007Mt-Df
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 18:53:54 +0000
Received: by mail-il1-x144.google.com with SMTP id y17so7416288ilg.4
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yrG1MG2A4KxsXP6MXVK8fmTa4gkpV9wxJHGE0IIF07k=;
 b=wBN3visNjUgIBU6DVFvO3NiwRnZwmQ2UsxyCtWDMkiPFzZj64voGZhQypfHgDwvbZ0
 c9NdMRvcEt/gwILOPC/h/OIem/Ya7UYfx4up7v1Aq0CeJ8eCT8DFmNfC7oBkyUqLDX0G
 k3hs7ndQmVfJqI0dnpHJFg9EaMssUcynDR+K6UDCsq5Ouyo26WWht0MkuW+GLHtozK2Y
 w27UZQg7lkKRQk9YaANmxZkez6+14NNgVBn+U0u5l85Curroc43OGs0RNCKSS90mmWO0
 oSGaE/mO9HqG+BBRo14olIoudCrPyQ3QWq8vHwcw1cGYewGA3ImGPuP4kU3miuP4Oz7r
 Xjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yrG1MG2A4KxsXP6MXVK8fmTa4gkpV9wxJHGE0IIF07k=;
 b=DPtLRv1fSXqysCASCcb4zzIaxj14TFm5j97cMqrQbANKlWdhGkO745g/BY5vI6qKnB
 nD3awZKLIYuZyd6lUnQWIqbc7/PG6bJHpYyVptpQfbRhgiYp3B7UOeLUU/cCthA68Wld
 DkxrDCxDd/TpMkBk1WIBzJlZt6j6lu8dGT+LIFCQtpBQ9Jq10LS6vecbcuX7p9g8pQwC
 YUc17drPrR0K3eoHrVTEfrL4ZtGkCI8TLoPtJA6SKCnaAFLPEwxcMvCsQEkVJxgzv/ti
 /6uYJNjMnSr3a7sAw5VzhljCpPMrjnS6uKzpTzhOX+yOQN9oxwsSgdV4E68b6LPgfK1z
 BddA==
X-Gm-Message-State: AOAM530MJjVUYdDYOaSS2gim0vw77K4CVTyv6QyFKtYb2Rsnq27gdvPd
 FT5LZy6vJeaEIfy3bgL765KpEkDGqOVJYw==
X-Google-Smtp-Source: ABdhPJwp2wL8NrnZ0N0GrTwHxXQNF7UVNixxCQaRHtudIxnVOieOymCBdYwiI5Q8MoK/fnjkKuiuyg==
X-Received: by 2002:a05:6e02:1202:: with SMTP id
 a2mr2064753ilq.89.1604084029056; 
 Fri, 30 Oct 2020 11:53:49 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id u19sm4967654ioc.10.2020.10.30.11.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:53:48 -0700 (PDT)
Subject: Re: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <6b89e805-c645-e738-794f-05ba6be68d60@kernel.dk>
 <faa0272e-9719-8fd4-323c-b32fd4c9ccb6@synopsys.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <5d59c0f2-3a5e-478a-e0e4-4f487a4718a6@kernel.dk>
Date: Fri, 30 Oct 2020 12:53:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <faa0272e-9719-8fd4-323c-b32fd4c9ccb6@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_145353_521318_DE73E562 
X-CRM114-Status: GOOD (  25.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/30/20 12:47 PM, Vineet Gupta wrote:
> On 10/29/20 9:09 AM, Jens Axboe wrote:
>> Wire up TIF_NOTIFY_SIGNAL handling for arc.
>>
>> Cc:linux-arm-kernel@lists.infradead.org
> 
> 
> Just to be clear, ARC and ARM seem to differ in 1 letter, they are in no 
> way related :-)

Oops, fat fingered that one. Will update :-)

>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>> as that will enable a set of cleanups once all of them support it. I'm
>> happy carrying this patch if need be, or it can be funelled through the
>> arch tree. Let me know.
> 
> 
> I'm fine either ways too, best to do whatever you are doing for other 
> arches. Although this patch per se is broken, please see below.
> 
> 
>>   
>>   	GET_CURR_THR_INFO_FLAGS   r9
>> -	bbit0  r9, TIF_SIGPENDING, .Lchk_notify_resume
>> +	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL, .Lchk_notify_resume
> 
> This is not correct, AND is a simple ALU instruction with format: AND 
> dest, src2, src1
> With dest 0, it won't update any register. With .f suffix it would set 
> CC flag based on ALU operation which can subsequent used for a 
> predicated instruction such as BZ.
> 
> So you need something like
> 
> and.f 0, r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL
> bz .Lchk_notify_resume

Ah thanks, I'll make that change. Hard for me to test a lot of these, so
I really appreciate someone knowledgable taking a look at it.

>>   
>>   	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
>>   	; in pt_reg since the "C" ABI (kernel code) will automatically
>> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
>> index 2be55fb96d87..a78d8f745a67 100644
>> --- a/arch/arc/kernel/signal.c
>> +++ b/arch/arc/kernel/signal.c
>> @@ -362,7 +362,7 @@ void do_signal(struct pt_regs *regs)
>>   
>>   	restart_scall = in_syscall(regs) && syscall_restartable(regs);
>>   
>> -	if (get_signal(&ksig)) {
>> +	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
>>   		if (restart_scall) {
>>   			arc_restart_syscall(&ksig.ka, regs);
>>   			syscall_wont_restart(regs);	/* No more restarts */
> 
> 
> I've not seen your entire patchset, but it seems we are now hitting 
> do_signal() for either of TIF_{SIGPENDING|NOTIFY_SIGNAL} but then only 
> handling signal for TIF_SIGPENDING, so why even bother to come here. Do 
> you plan to add additional arch handling later ?

Nope, that's all that's needed for each arch. The behavior you describe
is how it works. It makes it so that TIF_SIGPENDING will do the signal
delivery and syscall restart as it always has done, but
TIF_NOTIFY_SIGNAL will only do the syscall restart. The latter is the
intent, hence TIF_NOTIFY_SIGNAL provides a way to interrupt a process
and have it process task_work without going through signal delivery like
task_work with TWA_SIGNAL does today.

Updated version below:


commit 3c6239647d95d03d1436bc826a004791c3f04617
Author: Jens Axboe <axboe@kernel.dk>
Date:   Mon Oct 12 07:15:37 2020 -0600

    arc: add support for TIF_NOTIFY_SIGNAL
    
    Wire up TIF_NOTIFY_SIGNAL handling for arc.
    
    Cc: linux-snps-arc@lists.infradead.org
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index f9eef0e8f0b7..c0942c24d401 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -79,6 +79,7 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall auditing active */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
 
 /* true if poll_idle() is polling TIF_NEED_RESCHED */
@@ -89,11 +90,12 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_MEMDIE		(1<<TIF_MEMDIE)
 
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
-				 _TIF_NOTIFY_RESUME)
+				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
 /*
  * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index ea00c8a17f07..1f5308abf36d 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -307,7 +307,8 @@ resume_user_mode_begin:
 	mov r0, sp	; pt_regs for arg to do_signal()/do_notify_resume()
 
 	GET_CURR_THR_INFO_FLAGS   r9
-	bbit0  r9, TIF_SIGPENDING, .Lchk_notify_resume
+	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL
+	bz .Lchk_notify_resume
 
 	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
 	; in pt_reg since the "C" ABI (kernel code) will automatically
diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 2be55fb96d87..a78d8f745a67 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -362,7 +362,7 @@ void do_signal(struct pt_regs *regs)
 
 	restart_scall = in_syscall(regs) && syscall_restartable(regs);
 
-	if (get_signal(&ksig)) {
+	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
 		if (restart_scall) {
 			arc_restart_syscall(&ksig.ka, regs);
 			syscall_wont_restart(regs);	/* No more restarts */

-- 
Jens Axboe


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
