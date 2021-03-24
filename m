Return-Path: <SRS0=H19V=IW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C025FC433DB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Mar 2021 17:56:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A34F61A05
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Mar 2021 17:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A34F61A05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=et2LnfvVwdpWx6mwCAAqVbAldmP/5YzR6HQ7R8g3raM=; b=FqLza+f2Pe+KfNyVy+LCnK0FR
	wVuDxeq7FFc9VbqSW6y9Ke0DbIBQyNFpD+vTjQGUE6PsMPBSaC81Y8I1DqknqbFcPi7U+05y/gUk9
	asD98Dt8TxRghUZOndMvNnB0sa8lxpE6rvL9K4UImpv0WGv/1ExaPauQmCUrYjKhEoN+JERUj8FxP
	cQjlpU04gQjLLUeT8tDsBUG+b8TmCaYynanlcWx7VAXC/0P6x2BWLSz6oRe3xwqmIv5e+xqRa631G
	ROmZKIXLGvkiqJgQwtiyBmzKi6F9rHUF8OblPdw3WUS7hM5Yvuv2hETHch74wRpWxRFDwJ6ir3BaE
	dnndvkOjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP7jl-00Hb7A-9u; Wed, 24 Mar 2021 17:56:09 +0000
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lP7jh-00Hb6m-Kj; Wed, 24 Mar 2021 17:56:06 +0000
Subject: Re: [PATCH] arc/kernel/signal.c: Fix couple of typos
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, vgupta@synopsys.com,
 axboe@kernel.dk, gustavoars@kernel.org, tglx@linutronix.de,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210324055213.26775-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6bdf8409-48cf-a68d-b4f1-172206753871@infradead.org>
Date: Wed, 24 Mar 2021 10:56:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324055213.26775-1-unixbhaskar@gmail.com>
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

On 3/23/21 10:52 PM, Bhaskar Chowdhury wrote:
> 
> s/unconditonally/unconditionally/
> s/gaurantees/guarantees/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  arch/arc/kernel/signal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
> index a78d8f745a67..cf1788fd3812 100644
> --- a/arch/arc/kernel/signal.c
> +++ b/arch/arc/kernel/signal.c
> @@ -259,7 +259,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
>  		regs->r2 = (unsigned long)&sf->uc;
> 
>  		/*
> -		 * small optim to avoid unconditonally calling do_sigaltstack
> +		 * small optim to avoid unconditionally calling do_sigaltstack
>  		 * in sigreturn path, now that we only have rt_sigreturn
>  		 */
>  		magic = MAGIC_SIGALTSTK;
> @@ -391,7 +391,7 @@ void do_signal(struct pt_regs *regs)
>  void do_notify_resume(struct pt_regs *regs)
>  {
>  	/*
> -	 * ASM glue gaurantees that this is only called when returning to
> +	 * ASM glue guarantees that this is only called when returning to
>  	 * user mode
>  	 */
>  	if (test_thread_flag(TIF_NOTIFY_RESUME))
> --


-- 
~Randy


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
