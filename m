Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E571C3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Aug 2024 01:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaQMK0F81jdEHZjXI04U/8bT9BC0xGwCOjNIrG9+Rnk=; b=CLXx5e3hxsQAuY
	CMULReLty0Clanijr3GxxL615GKVz73mvMrcgWc5tk2zMGMwb0/+yiZIrJt/BryC5r1Ayi/DoNPra
	sWqhxbnUncG6HLxUEv7G90goqdk++RExmOpxxEn0cwWiiXNTeIGgkVpLLobCPkiUJlX1tER7umIZe
	Da1qCQJ0C5nlh8mUYT1tk8py4bK5VPFCOwjDkZQnP1eJsud/tJ/xOPgGOiy/XuifBtH7rYlGzJk0P
	1LfvSgKIs/RN3pvuLqc+sI8ekxO+ho8Iu6/a12aDD1Whqj6n3lDT7cptjzaGr00qK5UfwlyxjTiOp
	zOSeyKy0N0/XRyTxMI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb8zc-00000000AGs-0yNq;
	Tue, 06 Aug 2024 01:28:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb8zZ-00000000AFX-2sYM
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Aug 2024 01:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8343D60921;
	Tue,  6 Aug 2024 01:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AF2C32782;
	Tue,  6 Aug 2024 01:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722907680;
	bh=aIfOxL3rtOChdt3CLqv4K7JL0Tufmfdr6MR2r8LWXZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DEzjgHGNlgbqmK2mVmCz9C8IEZB2HDN2a8ja+5OLyah6qlvRrnd8pl0P7Ixfw3EEP
	 y7rDUY0KtiET+W6nUHVLdmj38iQHKpHvmOqat4kcVmocatbu8YmGfwf4zzEAFN8/DN
	 66d/dxGS7yLdybB6gOAxxqRdm9Fm8sBYuGqQpFlLzfvdtSd4PTvQB2KnvJ5UwnAaK/
	 0C8PMyQ+Jt/KHMj2U9RoCyMbRVwRFrGkTfefzdRMrNMvUiy/2VrF7b40r9C16PLYCu
	 5xMrsRfazUFhSFrZiyy+yeIJg1qgE9laFK+WIgWLL9J86XaFH93FpaMQpe5Wi5kDC6
	 dMi66ky02syCA==
Message-ID: <eacb9a3c-0d76-47d2-8b80-59d6a58fe4b4@kernel.org>
Date: Mon, 5 Aug 2024 18:27:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH cmpxchg 2/3] ARC: Emulate one-byte cmpxchg
To: "Paul E. McKenney" <paulmck@kernel.org>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
 peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de,
 geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
 <20240805192119.56816-2-paulmck@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20240805192119.56816-2-paulmck@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_182801_843402_88A5CDE8 
X-CRM114-Status: GOOD (  15.03  )
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

Hi Paul,

On 8/5/24 12:21, Paul E. McKenney wrote:
> Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.
>
> [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
> [ paulmck: Apply feedback from Naresh Kamboju. ]
> [ paulmck: Apply kernel test robot feedback. ]
>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: <linux-snps-arc@lists.infradead.org>
> ---
>  arch/arc/Kconfig               |  1 +
>  arch/arc/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++---------
>  2 files changed, 25 insertions(+), 9 deletions(-)
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
> index e138fde067dea..2102ce076f28b 100644
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
> @@ -65,16 +69,27 @@
>  	__typeof__(*(ptr)) _prev_;					\
>  	unsigned long __flags;						\
>  									\
> -	BUILD_BUG_ON(sizeof(_p_) != 4);					\

Is this alone not sufficient: i.e. for !LLSC let the atomic op happen
under a spin-lock for non 4 byte quantities as well.

> +	switch(sizeof((_p_))) {						\
> +	case 1:								\
> +		__flags = cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> +		_prev_ = (__typeof__(*(ptr)))__flags;			\
> +		break;							\
> +		break;							\

FWIW, the 2nd break seems extraneous.

> +	case 4:								\
> +		/*							\
> +		 * spin lock/unlock provide the needed smp_mb()		\
> +		 * before/after						\
> +		 */							\
> +		atomic_ops_lock(__flags);				\
> +		_prev_ = *_p_;						\
> +		if (_prev_ == _o_)					\
> +			*_p_ = _n_;					\
> +		atomic_ops_unlock(__flags);				\
> +		break;							\
> +	default:							\
> +		BUILD_BUG();						\
> +	}								\
>  									\
> -	/*								\
> -	 * spin lock/unlock provide the needed smp_mb() before/after	\
> -	 */								\
> -	atomic_ops_lock(__flags);					\
> -	_prev_ = *_p_;							\
> -	if (_prev_ == _o_)						\
> -		*_p_ = _n_;						\
> -	atomic_ops_unlock(__flags);					\
>  	_prev_;								\
>  })

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
