Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQpLqw6YQ7dP4CHFkP92HUxq6nDiSmDvh2uPP4u7DKg=; b=LI7LSf729Ir0qz
	tYsbQxrBTWGoCqUZWIiI38GPlg216YOeKTNy2OAPIzNZ+ANQG59o0m0r4gXWuBDI/t/U0gCLyu8/R
	Pjef8l7SaMCvy6IPbUQYlpSdmKiZ1L26+R69DD9dIuaHyjPVuGaioF+b2QnFKI0qzbFejgaJcmA8V
	jofZ7my0CAXxhKPz1ozmrWrd+QSPbyw3iTqexwNwxnCMXRcr7Xg3pe0rrYGAuqf5RU+lTwqAexi7A
	hIHL/PqxiT1UC0VsVNevdLfEGHSK4yXLAvoG1mbfxjeJ5DJKZV+qrpuHSZLyuG073r4d65b1txATj
	bGUN/4YXkLM0KaEBnSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWul-000QyU-8r; Mon, 18 Apr 2022 19:19:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWui-000Qxg-E0
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:19:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A65BE60C40;
 Mon, 18 Apr 2022 19:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEACC385A1;
 Mon, 18 Apr 2022 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309595;
 bh=fMRmxDGA7HvyX1AhV9WMrS3yAztOUhwSHU/GlvALZsI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FB6VgUXfEJKQe7iHhx49f3TuSShudqNowUV6WJ+2P+1xyUROYQoGoUBoRfD44DDs8
 Yu+nuLEjO+Qw6VH4heC2C3rllQJm2wx1Pk9LlXrnI5Sv6b0Y+BIlwMwZPoSGArqR+Z
 KtysTSebtNy9cSNPImqFkdVbZcV3nchLTEImB3n5xPjcDcrq5YGZjCVLcSO7bUuSmb
 MhuxyA3xcJi59x79i2NwYeKUI29JrTTToYT8tvHkqzev9fcSSm7ARQu6OnB3jhm4N/
 1Iw1tku/0LkVDOxLSZX1rI+G2swdahnyToN8xgSjgQBP6p2KV9JV5sLbW4SPZQEyJH
 MDp43MM1pKA/Q==
Message-ID: <e86916c4-1a5c-f89d-bcec-c4ed275aa4be@kernel.org>
Date: Mon, 18 Apr 2022 12:19:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARC: remove redundant READ_ONCE() in cmpxchg loop
Content-Language: en-US
To: Bang Li <libang.linuxer@gmail.com>, vgupta@kernel.org
Cc: peterz@infradead.org, mingo@kernel.org, valentin.schneider@arm.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220319020316.142479-1-libang.linuxer@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220319020316.142479-1-libang.linuxer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_121956_554456_3903B241 
X-CRM114-Status: GOOD (  19.01  )
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



On 3/18/22 19:03, Bang Li wrote:
> This patch reverts commit 7082a29c22ac ("ARC: use ACCESS_ONCE in cmpxchg
> loop").
>
> It is not necessary to use READ_ONCE() because cmpxchg contains barrier. We
> can get it from commit d57f727264f1 ("ARC: add compiler barrier to LLSC
> based cmpxchg").
>
> Signed-off-by: Bang Li <libang.linuxer@gmail.com>

Indeed this is not needed. However have you checked the code with and/wo 
this change to see if it builds the same.

-Vineet

> ---
>   arch/arc/kernel/smp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index 78e6d069b1c1..56c23f3e1309 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -274,7 +274,7 @@ static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
>   	 * and read back old value
>   	 */
>   	do {
> -		new = old = READ_ONCE(*ipi_data_ptr);
> +		new = old = *ipi_data_ptr;
>   		new |= 1U << msg;
>   	} while (cmpxchg(ipi_data_ptr, old, new) != old);
>   


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
