Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BD7C0015E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTqJEKMyK9JEEXLPUa9slW3j53yDQOu6VY8XIXmt/YA=; b=2BMbK4r60RA+RH
	EcEJw9bl6kq+iSPjca596hWB1VuUNGcuWJp+Vj0s09mLWn0Pi52Olf9x3asWF+NCqdPDLOzYIfwgk
	jTVvor5ctgQoZiMJSFrIQGDOHxbI0490jzdaQFNmBOKaAMW8toDI0B/rJVySsE6oXyrUsULkdFNn9
	uM0j1+8vP9afYR0YsFzoX9XR17C9ky5cI4tWkHtZyKhfvtlLLCqk+0Uq0Fs6fSy7pZac0NyygvOE0
	ohxRYLQnD69ou4G4Mjg0YBuq07qcBG5ZnTjEJUv9LQ3jKXODUXGxZrHH0Cx58k7MdJkkJepba+tn9
	a4pz+0ENbtgUx4DQH91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwf8-001xOQ-2j;
	Tue, 15 Aug 2023 16:12:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVwf5-001xNU-2B
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 16:12:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E09B5627D2;
	Tue, 15 Aug 2023 16:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16064C433C8;
	Tue, 15 Aug 2023 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692115970;
	bh=N3OM+clUa6koI6lGjQiHjHyRvH37l0zus4518nO+E10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kBD6aRCww6QnLx/rsU4KOMW6CAq1bwVClHVVTzB1NWX4qtMrx2YzWryIPIjwL5Ks6
	 MJLQU6DxP8I9bOo6AqFofCHp26tQxPEA/HPWiI2hORuvG30zP8j8jR+CKH1kdfqASK
	 piwANskal1t91lFVp/NgrC7vrL8YqlxIAWCoI5IsUiE9fQwgtHWebNZGDmi0jevokt
	 cK2P7BCEZI3LIY7fJLbQ3nmlDaQC86ArrFw2yKHL6WZZzD4SIvPGfKOkYMDIG6wlMT
	 NDaLFYYYmP1Zrg3D8O7DmKlwmtSN6SBXu6xYwKbdEqgD5CkoQQXyaEgFHaYd9UC4Z9
	 7FKgXPmZAm9vg==
Message-ID: <ed79681e-ecd1-3129-5ad1-2965e2cd42b5@kernel.org>
Date: Tue, 15 Aug 2023 09:12:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ARC: avoid unwanted gcc optimizations in atomic
 operations
To: Pavel.Kozlov@synopsys.com, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, vgupta@kernel.org, stable@vger.kernel.org
References: <20230815151136.2220588-1-kozlov@synopsys.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20230815151136.2220588-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_091251_754879_847C67CD 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 8/15/23 08:11, Pavel.Kozlov@synopsys.com wrote:
> From: Pavel Kozlov<pavel.kozlov@synopsys.com>
>
> Notify a compiler about write operations and prevent unwanted
> optimizations. Add the "memory" clobber to the clobber list.
>
> An obvious problem with unwanted compiler optimizations appeared after
> the cpumask optimization commit 596ff4a09b89 ("cpumask: re-introduce
> constant-sized cpumask optimizations").
>
> After this commit the SMP kernels for ARC no longer loads because of
> failed assert in the percpu allocator initialization routine:
>
> percpu: BUG: failure at mm/percpu.c:2981/pcpu_build_alloc_info()!
>
> The write operation performed by the scond instruction in the atomic
> inline asm code is not properly passed to the compiler. The compiler
> cannot correctly optimize a nested loop that runs through the cpumask
> in the pcpu_build_alloc_info() function.
>
> Add the "memory" clobber to fix this.
>
> Link:https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/135
> Cc:<stable@vger.kernel.org>  # v6.3+
> Signed-off-by: Pavel Kozlov<pavel.kozlov@synopsys.com>


Acked-by: Vineet Gupta <vgupta@kernel.org>

Fixes: b64be6836993c431e ("ARC: atomics: implement relaxed variants")

Before that commit, atomic ops could elide memory clobber because the 
trailing smp_mb() did that anyways.
However after that commit, the smp_mb() was optional for relaxed 
variants and thus needs clobber.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
