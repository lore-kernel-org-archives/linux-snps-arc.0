Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF15D2069D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUyJSbyd6UwCYLKODRIcMtSSuUzobxSDm6uCkF1V5Ss=; b=NDCCEFfomW/Juc
	7k6q78p33EdhLYXNIhIWl/zjYVfnMGuUhRXZ59E+5Dv6XdBGAOSPr4SR/oGTbudefZoiKecyb29O9
	E6Bf75dnS8JH4SJX4WI6fEgMhfse3bsSqGFHQbrARtctiCvem8EBrQnrgCcPvgAoXl61Gp8UFZyEH
	A7oiTMNxNXr7KWQy1KACCCCZiW9WUY2r6Q1ZJpQfFxgj8KPXpNUTZmHPbEGVjrRByx75r2vVrvmiP
	KykB2Z8eucz/JptfoqlHWXf0rgfIRFxSe5lVWxxl5hQwgwyEt1ClzVqmslZi9QVyK+CrxIAdp8vIr
	jHX51CjDhUW5Cin7dS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wes-0000000AaPi-1r9A;
	Wed, 16 Oct 2024 05:33:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0weq-0000000AaPB-1SEB
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 260655C0FAA
	for <linux-snps-arc@lists.infradead.org>; Wed, 16 Oct 2024 05:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1513CC4CEC5;
	Wed, 16 Oct 2024 05:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729056795;
	bh=hVPLU5owgqN9EfLSLj9fyqPKw/ZCOrmGrosiR7XtYsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C4GPtg3bIqr5iwxK1sgHEFhkSpDz1mryBKiygdzVoo8GrCkE8b8/LwasbjSdQ8DMB
	 iVJmbAAOsA/nW9bGc0xunAAzJ8VVnn3aNUdECZbpphuiRmsis54kgvUTg51Jf4iCsA
	 w1iQ5lhnZAm5JVglvtj56URvQCoQb5ry8qNKLGGZd57XZIev7P3sCYujp8kqcrtVxn
	 v/QoRyWA05Ld9ybvhxve4HKxTLZc/4cPvtx5yeCVBVJUBxtiQjBzYM8W9JECgF3nF9
	 56o1oW+URmW/Jqzylx1gWFFLAGqeIhY05STRDjV6rV8Ux4JbSY/sCDKFmETYXy7EkV
	 4bP2SyO1R31uQ==
Message-ID: <c1afa8ac-5c6a-4966-975d-915887c8106d@kernel.org>
Date: Tue, 15 Oct 2024 22:33:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARC: Use __force to suppress per-CPU cmpxchg complaints
To: paulmck@kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
Cc: vgupta@kernel.org
References: <c88fafb4-47d9-49b6-aeb6-5a83c9778791@paulmck-laptop>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <c88fafb4-47d9-49b6-aeb6-5a83c9778791@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_223316_464757_A3587A6B 
X-CRM114-Status: GOOD (  10.28  )
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

On 10/9/24 10:55, Paul E. McKenney wrote:
> Currently, the cast of the first argument to cmpxchg_emu_u8() drops the
> __percpu address-space designator, which results in sparse complaints
> when applying cmpxchg() to per-CPU variables in ARC.  Therefore, use
> __force to suppress these complaints, given that this does not pertain
> to cmpxchg() semantics, which are plently well-defined on variables in
> general, whether per-CPU or otherwise.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: <linux-snps-arc@lists.infradead.org>
>
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index 58045c8983404..76f43db0890fc 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -48,7 +48,7 @@
>  									\
>  	switch(sizeof((_p_))) {						\
>  	case 1:								\
> -		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
>  		break;							\
>  	case 4:								\
>  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\


Added to for-curr.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
