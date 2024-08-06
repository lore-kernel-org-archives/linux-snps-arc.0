Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E259C3DA64
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Aug 2024 04:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mrJZj1DrOauE/w8SigYTWUU1J4+Bn3rbZqrTnOFPg0=; b=bkvbh+F35kwP8r
	ui5zmxbgkNwg0vJYPTCmTa+cNfYsvTPbRQ58L3XFKYAR8IYT84jsGK39aUc4WPIAZRCzrn8yVkWcE
	U54zSvZHhDdGL1ieBY6Vw4hgTD9lUamErSkOUsagDbWkiQYXvfdPZPwukfinoN7bfhZHDcnBA6kKW
	p+ZiT7N7JEMO0gHS1Fdokmw5uUaFekO1Lnx09xc49/BneMMR68VfgBPVpfycwbL9JVFrwpqaATibt
	4JQA4zO6+GLNdGMjoZ+XQxoG5f+GbR4VKwjTkVZfE3aJRp0C7j0ycjwu1uOVfPGY/I23HXtCQRW0b
	P/NH+1QmyW3Sc4Pq7ixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbC3z-00000000V07-3cS8;
	Tue, 06 Aug 2024 04:44:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbC3w-00000000UzK-1l5S
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Aug 2024 04:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26792CE0C6C;
	Tue,  6 Aug 2024 04:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819F8C32786;
	Tue,  6 Aug 2024 04:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722919481;
	bh=vnxcGwfLIU1KeSbJki1TxNVfFqhuJYfk0wotkvkiEgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QlNqqKrHRxxYLXdWUqusdxZxHlcjbXFbapkERYHUjVVQPu66ulZrF2xzCQeqLr4OF
	 oGQhqk2Sx4mwsLzzPMCDpUedq1D69xFHiUE2eoYm607Uu220e5yfoDpU/ObP1KN/oI
	 MByQDqW5yx+iKA2e5V/LmzsxvE5A+hBP6t11Wek2vPb5XzBvop10wDVCMY6aW5Ro47
	 AoeA1I9qB1k0mr2BjPkIS7keAi12shDJS7b+O/D2u7ow6NfWVZ3HLtcAHf4q2HtIBz
	 n3kvQqC/zfDRbsD9CjbEmfK0UQ3sq02RfLHHlRkw/ClaA68k8zurP8c008TCcBEWE3
	 EB2fHxx1NxRTg==
Message-ID: <c9952ed7-9e8a-4142-b70c-8ddb14bf90de@kernel.org>
Date: Mon, 5 Aug 2024 21:44:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH cmpxchg 2/3] ARC: Emulate one-byte cmpxchg
To: paulmck@kernel.org, Vineet Gupta <vgupta@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
 peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de,
 geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
 <20240805192119.56816-2-paulmck@kernel.org>
 <eacb9a3c-0d76-47d2-8b80-59d6a58fe4b4@kernel.org>
 <3353ac4f-97ed-471b-bd19-96e0dbc41612@paulmck-laptop>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <3353ac4f-97ed-471b-bd19-96e0dbc41612@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_214444_826760_F7C7CDD4 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 8/5/24 21:28, Paul E. McKenney wrote:
> On Mon, Aug 05, 2024 at 06:27:57PM -0700, Vineet Gupta wrote:
>> Hi Paul,
>>
>> On 8/5/24 12:21, Paul E. McKenney wrote:
>>> Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.
>>>
>>> [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
>>> [ paulmck: Apply feedback from Naresh Kamboju. ]
>>> [ paulmck: Apply kernel test robot feedback. ]
>>>
>>> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>>> Cc: Vineet Gupta <vgupta@kernel.org>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Palmer Dabbelt <palmer@rivosinc.com>
>>> Cc: <linux-snps-arc@lists.infradead.org>
>>> ---
>>>  arch/arc/Kconfig               |  1 +
>>>  arch/arc/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++---------
>>>  2 files changed, 25 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
>>> index fd0b0a0d4686a..163608fd49d18 100644
>>> --- a/arch/arc/Kconfig
>>> +++ b/arch/arc/Kconfig
>>> @@ -13,6 +13,7 @@ config ARC
>>>  	select ARCH_HAS_SETUP_DMA_OPS
>>>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>>>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>>> +	select ARCH_NEED_CMPXCHG_1_EMU
>>>  	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
>>>  	select ARCH_32BIT_OFF_T
>>>  	select BUILDTIME_TABLE_SORT
>>> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
>>> index e138fde067dea..2102ce076f28b 100644
>>> --- a/arch/arc/include/asm/cmpxchg.h
>>> +++ b/arch/arc/include/asm/cmpxchg.h
>>> @@ -8,6 +8,7 @@
>>>  
>>>  #include <linux/build_bug.h>
>>>  #include <linux/types.h>
>>> +#include <linux/cmpxchg-emu.h>
>>>  
>>>  #include <asm/barrier.h>
>>>  #include <asm/smp.h>
>>> @@ -46,6 +47,9 @@
>>>  	__typeof__(*(ptr)) _prev_;					\
>>>  									\
>>>  	switch(sizeof((_p_))) {						\
>>> +	case 1:								\
>>> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
>>> +		break;							\
>>>  	case 4:								\
>>>  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
>>>  		break;							\
>>> @@ -65,16 +69,27 @@
>>>  	__typeof__(*(ptr)) _prev_;					\
>>>  	unsigned long __flags;						\
>>>  									\
>>> -	BUILD_BUG_ON(sizeof(_p_) != 4);					\
>> Is this alone not sufficient: i.e. for !LLSC let the atomic op happen
>> under a spin-lock for non 4 byte quantities as well.
> Now that you mention it, that would be a lot simpler.
>
>>> +	switch(sizeof((_p_))) {						\
>>> +	case 1:								\
>>> +		__flags = cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
>>> +		_prev_ = (__typeof__(*(ptr)))__flags;			\
>>> +		break;							\
>>> +		break;							\
>> FWIW, the 2nd break seems extraneous.
> And to your earlier point, the first break as well.  ;-)
>
> How does the updated patch below look?  Or did I miss your point?
>
> 							Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 96c1107797ca329fe203818cdfda2fe5f5a9a82e
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Mon Mar 18 01:27:35 2024 -0700
>
>     ARC: Emulate one-byte cmpxchg
>     
>     Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.
>     
>     [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
>     [ paulmck: Apply feedback from Naresh Kamboju. ]
>     [ paulmck: Apply kernel test robot feedback. ]
>     [ paulmck: Apply feedback from Vineet Gupta. ]
>     
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>     Cc: Vineet Gupta <vgupta@kernel.org>
>     Cc: Andi Shyti <andi.shyti@linux.intel.com>
>     Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>     Cc: Arnd Bergmann <arnd@arndb.de>
>     Cc: Palmer Dabbelt <palmer@rivosinc.com>
>     Cc: <linux-snps-arc@lists.infradead.org>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index fd0b0a0d4686a..163608fd49d18 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -13,6 +13,7 @@ config ARC
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_NEED_CMPXCHG_1_EMU
>  	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
>  	select ARCH_32BIT_OFF_T
>  	select BUILDTIME_TABLE_SORT
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index e138fde067dea..58045c8983404 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/build_bug.h>
>  #include <linux/types.h>
> +#include <linux/cmpxchg-emu.h>
>  
>  #include <asm/barrier.h>
>  #include <asm/smp.h>
> @@ -46,6 +47,9 @@
>  	__typeof__(*(ptr)) _prev_;					\
>  									\
>  	switch(sizeof((_p_))) {						\
> +	case 1:								\
> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> +		break;							\
>  	case 4:								\
>  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
>  		break;							\
> @@ -65,8 +69,6 @@
>  	__typeof__(*(ptr)) _prev_;					\
>  	unsigned long __flags;						\
>  									\
> -	BUILD_BUG_ON(sizeof(_p_) != 4);					\
> -									\
>  	/*								\
>  	 * spin lock/unlock provide the needed smp_mb() before/after	\
>  	 */								\



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
