Return-Path: <SRS0=RmAe=IU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630F0C433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 18:43:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE95861984
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 18:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE95861984
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CT/Dflu4CLC35pnouqTUpCStb2EQKv+T4NU9ekwfC+Q=; b=rCOouNiriGgUfXReRxxPWAdIQ
	f4+2/nwq22qGk6tn1BQKj2NKRws+b06rRP/st8J4BOgqEswO8AbBzuHJ/cVWSbxyK3v6OxebufH51
	Zr5SPZMkJh3SsoD9SVKDfwCY/+CiwQbYdyRRxKky/2n8mQOAxeopMMp8m0iiQsiDSeGJ1YqxVS5/v
	1YoJXQz1c9GAi9CiDHa7bTKWi2r2+Mt+4s61oJ0QeWB10w/ffpweBTPG9eiSJwU+7UOrMjbFN2Doa
	qG+GQerKS3FJZ6z98Q8PCTBWZ5qEWwbkctM5ADgJFYeC933uNWVxfyHpQv2aQNXdTyB4MzBIlxyFZ
	m4fWrn6qg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPWr-00CHzY-C6; Mon, 22 Mar 2021 18:43:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPWp-00CHzI-JN
 for linux-snps-arc@desiato.infradead.org; Mon, 22 Mar 2021 18:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=aU/UwboqgudsLTP0O1Tomg8b4db04KMc5kunvG1cL98=; b=OAU+NuZmisB4PeaGW3wSPyIhyV
 TFe88Xrvc/eDflESCde7TwrX4xBN9LvrNUusCNP5LDzhaDrzRih0s5wSoAdsVDxhSVCHjj+NITnSn
 ljLS01LF4BvNeyCJnn6B0ZeJMfXPi3OgEB/loR4RkyAaiO7UnL4GUYCytMBFWdZBix4XFRIuZqcfc
 84CQ4byq6z7JPHVFILo22mB9JiBxgLwyT3iWoZJyuds36K/wNdqztpLQSvGE4ZmzYpSEbX2zizlPW
 jGU7K/i8/TRguTmwji3KLDCMbinOmgxWi7FsG12sJNc2nZX6NHVa/wuKpPSgKL51ZJccVCr+qSrzB
 Hfv5sjMg==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPWD-008vnK-Bs; Mon, 22 Mar 2021 18:43:27 +0000
Subject: Re: [PATCH] arc: include/asm: Couple of spelling fixes
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, vgupta@synopsys.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210322123259.2894194-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c2e269cc-779a-0213-982b-84278efac595@infradead.org>
Date: Mon, 22 Mar 2021 11:43:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322123259.2894194-1-unixbhaskar@gmail.com>
Content-Language: en-US
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

On 3/22/21 5:32 AM, Bhaskar Chowdhury wrote:
> 
> s/interrpted/interrupted/
> s/defintion/definition/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  arch/arc/include/asm/cmpxchg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index 9b87e162e539..dfeffa25499b 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -116,7 +116,7 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
>   *
>   * Technically the lock is also needed for UP (boils down to irq save/restore)
>   * but we can cheat a bit since cmpxchg() atomic_ops_lock() would cause irqs to
> - * be disabled thus can't possibly be interrpted/preempted/clobbered by xchg()
> + * be disabled thus can't possibly be interrupted/preempted/clobbered by xchg()
>   * Other way around, xchg is one instruction anyways, so can't be interrupted
>   * as such
>   */
> @@ -143,7 +143,7 @@ static inline unsigned long __xchg(unsigned long val, volatile void *ptr,
>  /*
>   * "atomic" variant of xchg()
>   * REQ: It needs to follow the same serialization rules as other atomic_xxx()
> - * Since xchg() doesn't always do that, it would seem that following defintion
> + * Since xchg() doesn't always do that, it would seem that following definition
>   * is incorrect. But here's the rationale:
>   *   SMP : Even xchg() takes the atomic_ops_lock, so OK.
>   *   LLSC: atomic_ops_lock are not relevant at all (even if SMP, since LLSC
> --


-- 
~Randy


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
