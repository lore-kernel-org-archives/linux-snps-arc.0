Return-Path: <SRS0=19Kx=HZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C83C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 20:14:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E85D64E22
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 20:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E85D64E22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L623kGpdnNMHGcXlATd1Lf3wIEseg4+wdd57QgmxpcI=; b=sWT1u+JOfdO/HT9RHbBG6OnFC
	x1iq8unRvplqOWAd8MoGjWyHZgEOeE8K7qGCYT6rZtmG+qoiM9gM8aP/C6ixN9hiJg0eytID3iXpD
	jphBJI2ZtOhByjrpiiQOy1X3/xMt+LRy4YdZhTHKy2kpO+8Go4jWuR3hMqZFvLdBpEwqivbc8iVId
	eZwUWPEJZthTotzf6nnV+jmPopBJtqmSpzTuHjyJINtFtBppGOq0deYrBSQBZ8JIdVsLS3Z8eh4Wu
	A3VeNc4YP29HDAMCCEbfIi1aBc5eUk0ZAfxKq8AbLRjiEQ49h3wHe+i7DZONeIm57+r/mwe4JOqHI
	XX+YCeMXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEe4e-0001Rn-RV; Tue, 23 Feb 2021 20:14:24 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEe4c-0001RD-Ks
 for linux-snps-arc@lists.infradead.org; Tue, 23 Feb 2021 20:14:23 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 9045D72C8B1;
 Tue, 23 Feb 2021 23:14:18 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 6F49B7CC89C; Tue, 23 Feb 2021 23:14:18 +0300 (MSK)
Date: Tue, 23 Feb 2021 23:14:18 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ARC: Enable automatic support for newer ARC ISA variants
 (ARCv3)
Message-ID: <20210223201418.GA19996@altlinux.org>
References: <20210223023754.3123898-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223023754.3123898-1-vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_151422_828670_E200FD51 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: linux-snps-arc@lists.infradead.org, strace-devel@lists.strace.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 06:37:54PM -0800, Vineet Gupta wrote:
> The syscall TRAP instruction used to be 4 bytes on legacy ARCompact
> based ARC700 cores. Since then ARCv2 (circa 2014) and the upcoming ARCv3
> use the same 2-byte TRAP_S instruction.
> 
> To ease porting of software to new ISA, special case ARC700.
> 
> This is the only change needed to get strace working on 64-bit ARCv3
> cores (kudos to strace for making porting so easy)
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  src/linux/arc/raw_syscall.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/src/linux/arc/raw_syscall.h b/src/linux/arc/raw_syscall.h
> index 6e60a6112b31..f54fe06f33df 100644
> --- a/src/linux/arc/raw_syscall.h
> +++ b/src/linux/arc/raw_syscall.h
> @@ -21,10 +21,8 @@ raw_syscall_0(const kernel_ulong_t nr, kernel_ulong_t *err)
>  
>  # ifdef __A7__
>  #  define ARC_TRAP_INSN "trap0"
> -# elif defined __HS__
> -#  define ARC_TRAP_INSN "trap_s 0 "
>  # else
> -#  error unrecognized arc
> +#  define ARC_TRAP_INSN "trap_s 0 "
>  # endif
>  
>  	__asm__ __volatile__(ARC_TRAP_INSN

Applied, thanks.


-- 
ldv

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
