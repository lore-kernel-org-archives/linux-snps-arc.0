Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528FCC3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jan 2024 00:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yxPcs4jraaVWvoRHBPR00UVcv86uajAV/ej6IZHQ0o=; b=4qboMTHc+YAEgh
	d4vlpyI1TxVoQQkVyoI57P3Xueo6l4T8w3YGD0BvXlIC+ABR4nhcwsX20cNjAVDtFMa0Cquxiv1//
	6ltyPKhVBy7bN7spg7pE7NmaHIWq4WJFxlz4aUNwpXAxY7Mv+xw/WdXUr3eznQRlYsIm2xGWtUyik
	NR7cLFIEL4v5x0EIr4cWrNq95jByWeJDivnmGyDNHiuyxxUjIIQxOj5FtQEyH5895zs5Pu+Rz5R/R
	iJneYjniVQtlW/lH9hbEZl4M4ooXqZN613rcgU/472uQ1sKEerLJOZh2RJB+m457mBkHpc7l6xN8W
	taQwcJDe2v18xtPLWd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLBe2-00CUlx-09;
	Thu, 04 Jan 2024 00:31:34 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rLBe0-00CUli-1A;
	Thu, 04 Jan 2024 00:31:32 +0000
Message-ID: <62c7008e-d460-4314-b2af-2122b93d41dc@infradead.org>
Date: Wed, 3 Jan 2024 16:31:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] ARC: Fix typos
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-snps-arc@lists.infradead.org
References: <20240103231605.1801364-1-helgaas@kernel.org>
 <20240103231605.1801364-3-helgaas@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240103231605.1801364-3-helgaas@kernel.org>
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



On 1/3/24 15:15, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix typos, most reported by "codespell arch/arc".  Only touches comments,
> no code changes.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-snps-arc@lists.infradead.org
> ---
>  arch/arc/boot/Makefile                    |  4 ++--
>  arch/arc/boot/dts/axc003.dtsi             |  4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi      |  2 +-
>  arch/arc/include/asm/dsp.h                |  2 +-
>  arch/arc/include/asm/entry-compact.h      | 10 +++++-----
>  arch/arc/include/asm/entry.h              |  4 ++--
>  arch/arc/include/asm/irq.h                |  2 +-
>  arch/arc/include/asm/irqflags-compact.h   |  2 +-
>  arch/arc/include/asm/mmu_context.h        |  2 +-
>  arch/arc/include/asm/pgtable-bits-arcv2.h |  2 +-
>  arch/arc/include/asm/shmparam.h           |  2 +-
>  arch/arc/include/asm/smp.h                |  4 ++--
>  arch/arc/include/asm/thread_info.h        |  2 +-
>  arch/arc/include/uapi/asm/swab.h          |  2 +-
>  arch/arc/kernel/entry-arcv2.S             |  8 ++++----
>  arch/arc/kernel/entry.S                   |  4 ++--
>  arch/arc/kernel/head.S                    |  2 +-
>  arch/arc/kernel/intc-arcv2.c              |  2 +-
>  arch/arc/kernel/perf_event.c              |  2 +-
>  arch/arc/kernel/setup.c                   |  2 +-
>  arch/arc/kernel/signal.c                  |  2 +-
>  arch/arc/kernel/traps.c                   |  2 +-
>  arch/arc/kernel/vmlinux.lds.S             |  4 ++--
>  arch/arc/mm/tlbex.S                       |  8 ++++----
>  24 files changed, 40 insertions(+), 40 deletions(-)
> 


> diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
> index f3eea3f30b2e..f8f85c04d7a8 100644
> --- a/arch/arc/include/asm/pgtable-bits-arcv2.h
> +++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
> @@ -66,7 +66,7 @@
>   * Other rules which cause the divergence from 1:1 mapping
>   *
>   *  1. Although ARC700 can do exclusive execute/write protection (meaning R
> - *     can be tracked independet of X/W unlike some other CPUs), still to
> + *     can be tracked independent of X/W unlike some other CPUs), still to

                         independently

>   *     keep things consistent with other archs:
>   *      -Write implies Read:   W => R
>   *      -Execute implies Read: X => R

> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
> index 0b3bb529d246..5414d9f5c40c 100644
> --- a/arch/arc/kernel/signal.c
> +++ b/arch/arc/kernel/signal.c
> @@ -9,7 +9,7 @@
>   * vineetg: Nov 2009 (Everything needed for TIF_RESTORE_SIGMASK)
>   *  -do_signal() supports TIF_RESTORE_SIGMASK
>   *  -do_signal() no loner needs oldset, required by OLD sys_sigsuspend
> - *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implemen
> + *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implement

                                                                         implementation

>   *  -sys_sigsuspend() no longer needs to fudge ptregs, hence that arg removed
>   *  -sys_sigsuspend() no longer loops for do_signal(), sets TIF_xxx and leaves
>   *   the job to do_signal()


But in any case:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
#Randy

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
