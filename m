Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C8EC64E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 15:07:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A942206C1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 15:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMBgsG9a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A942206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UwuHJnRNLidXELv6Qm/OjobssO9F0thMHjXz6PMQbUI=; b=iMBgsG9a1armjSXzbKU+p56ul
	qIrIBdrCJuZUDj990yPv3hZ2o5M54QDpF+urEDSZao+v09ArzSOzuVNHItgo2O3ZzN2cwmgXN3ugf
	Zx13QjL7hTL8swswLpA/cXoz4iMCNS8ZEVb8qlcIsDyp6E46rdQBDMuaLV5+IxWgZrNLX7OZROTOW
	Kq5ZjIkREkbpcTjiBo+OpwZ3/5KRfZ6yibp6ckhtprNHL1IyexyvWE2qL9i948TDznChMNS9kl0zG
	KwNlrDsC1OKepmEowzmNwZHzAfQQGDEVYPUcHPvMbUsh/6+sC0gZbgHguDTgesAMXUzIIKpiAw4Eo
	BKxRPJ38g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk7Fn-00005t-Eb; Tue, 01 Dec 2020 15:07:43 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk7Fk-0008WE-G8; Tue, 01 Dec 2020 15:07:41 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kk7Ff-0021Gh-6r; Tue, 01 Dec 2020 16:07:35 +0100
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1kk7Fe-0015L5-My; Tue, 01 Dec 2020 16:07:34 +0100
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <4c752ff0-27a6-b9d7-ab81-8aac1a3b7b65@physik.fu-berlin.de>
Date: Tue, 1 Dec 2020 16:07:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201135623.GA751215@kernel.org>
Content-Language: en-US
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_100740_701206_E4989DE8 
X-CRM114-Status: GOOD (  29.75  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-m68k@lists.linux-m68k.org,
 linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/1/20 2:56 PM, Mike Rapoport wrote:
> (added Jens)
> 
> On Tue, Dec 01, 2020 at 01:16:05PM +0100, John Paul Adrian Glaubitz wrote:
>> Hi Mike!
>>
>> On 12/1/20 1:10 PM, Mike Rapoport wrote:
>>> On Tue, Dec 01, 2020 at 12:35:09PM +0100, John Paul Adrian Glaubitz wrote:
>>>> Hi Mike!
>>>>
>>>> On 12/1/20 11:29 AM, Mike Rapoport wrote: 
>>>>> These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
>>>>> with a mirror at https://github.com/hnaz/linux-mm)
>>>>>
>>>>> I beleive they will be coming in 5.11.
>>>>
>>>> Just pulled from that tree and gave it a try, it actually fails to build:
>>>>
>>>>   LDS     arch/ia64/kernel/vmlinux.lds
>>>>   AS      arch/ia64/kernel/entry.o
>>>> arch/ia64/kernel/entry.S: Assembler messages:
>>>> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
>>>> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
>>>> arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
>>>> arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
>>>>   GEN     usr/initramfs_data.cpio
>>>> make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
>>>> make: *** [Makefile:1797: arch/ia64/kernel] Error 2
>>>> make: *** Waiting for unfinished jobs....
>>>>   CC      init/do_mounts_initrd.o
>>>>   SHIPPED usr/initramfs_inc_data
>>>>   AS      usr/initramfs_data.o
>>>
>>> Hmm, it was buidling fine with v5.10-rc2-mmotm-2020-11-07-21-40.
>>> I'll try to see what could cause this.
>>>
>>> Do you build with defconfig or do you use a custom config?
>>
>> That's with "localmodconfig", see attached configuration file.
> 
> Thanks.
> It seems that the recent addition of TIF_NOTIFY_SIGNAL to ia64 in
> linux-next caused the issue. Can you please try the below patch?
> 
> From c4d06cf1c2938e6b2302e7ed0be95c3401181ebb Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Tue, 1 Dec 2020 15:40:28 +0200
> Subject: [PATCH] ia64: fix TIF_NOTIFY_SIGNAL implementation
> 
> * Replace wrong spelling of TIF_SIGNAL_NOTIFY with the correct
>   TIF_NOTIFY_SIGNAL
> * Remove mistyped plural in test_thread_flag() call in
>   process::do_notify_resume_user()
> * Use number 5 for TIF_NOTIFY_SIGNAL as 7 is too big and assembler is not
>   happy:
> 
>   AS      arch/ia64/kernel/entry.o
> arch/ia64/kernel/entry.S: Assembler messages:
> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be an 8-bit integer (-128-127)
> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
> 
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Fixes: bbb026da151c ("ia64: add support for TIF_NOTIFY_SIGNAL")
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> 
> The Fixes tag is based on the commit in next-20201201, I'm not 100% sure
> it is stable
> 
>  arch/ia64/include/asm/thread_info.h | 4 ++--
>  arch/ia64/kernel/process.c          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/ia64/include/asm/thread_info.h b/arch/ia64/include/asm/thread_info.h
> index 759d7d68a5f2..51d20cb37706 100644
> --- a/arch/ia64/include/asm/thread_info.h
> +++ b/arch/ia64/include/asm/thread_info.h
> @@ -103,8 +103,8 @@ struct thread_info {
>  #define TIF_SYSCALL_TRACE	2	/* syscall trace active */
>  #define TIF_SYSCALL_AUDIT	3	/* syscall auditing active */
>  #define TIF_SINGLESTEP		4	/* restore singlestep on return to user mode */
> +#define TIF_NOTIFY_SIGNAL	5	/* signal notification exist */
>  #define TIF_NOTIFY_RESUME	6	/* resumption notification requested */
> -#define TIF_NOTIFY_SIGNAL	7	/* signal notification exist */
>  #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
>  #define TIF_MCA_INIT		18	/* this task is processing MCA or INIT */
>  #define TIF_DB_DISABLED		19	/* debug trap disabled for fsyscall */
> @@ -116,7 +116,7 @@ struct thread_info {
>  #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
>  #define _TIF_SYSCALL_TRACEAUDIT	(_TIF_SYSCALL_TRACE|_TIF_SYSCALL_AUDIT|_TIF_SINGLESTEP)
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
> -#define _TIF_SIGNAL_NOTIFY	(1 << TIF_SIGNAL_NOTIFY)
> +#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
>  #define _TIF_MCA_INIT		(1 << TIF_MCA_INIT)
> diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
> index 468525fc64e0..ee394abcc03e 100644
> --- a/arch/ia64/kernel/process.c
> +++ b/arch/ia64/kernel/process.c
> @@ -172,7 +172,7 @@ do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
>  
>  	/* deal with pending signal delivery */
>  	if (test_thread_flag(TIF_SIGPENDING) ||
> -	    test_thread_flags(TIF_NOTIFY_SIGNAL)) {
> +	    test_thread_flag(TIF_NOTIFY_SIGNAL)) {
>  		local_irq_enable();	/* force interrupt enable */
>  		ia64_do_signal(scr, in_syscall);
>  	}
> 

This fixes the issue for me.

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
