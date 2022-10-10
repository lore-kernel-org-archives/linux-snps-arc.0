Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB96C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Oct 2022 05:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gg0+NpORfM+TI4TupGJx8HtNLAKGGEiRzHfdkZzsV8Y=; b=LEZAxFJkU7rP9K
	YXQ2fOC2qacYS4rgzWK/FPBEse7t3PsRJN7pL1gOLU1QWXHr+zs4SR7NoJW7HKy/44a8iNSPoZXwD
	u2VXya4FTPZlOEat6FK0IeitCnttCoG8jhvt6PwLToBF2Xb2X/BI36BDmBrtBaQO6bVXEfVxKd3zk
	hwkPEbQlqEjrqvkwxZKbtQZDpLknW9Sadzb535CS+gmGg1t8tQ2kMSoPeXAQWagm2Sr30CrgD9+Rm
	4+XCbetWNx53f7j3psjd3jAlYU/Nj8PvJX6eO2xbCF8duvK2C1k2XJZdnDuOLs+uToPE04DdZS1ix
	M3Q9yiRqfBAsinSkiAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohlBT-00H5Bd-2I; Mon, 10 Oct 2022 05:18:35 +0000
Received: from out2.migadu.com ([188.165.223.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohlBI-00H5A1-1f; Mon, 10 Oct 2022 05:18:26 +0000
Message-ID: <8da9812d-eb84-2a84-321e-ea2826ef8981@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1665379096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPNRy9onik+CC8H+dbLBGG/JFwC/8JgqUDFh6TQvjgI=;
	b=dVajeWBCcCO1PzScOej77248yySjwbUmP9SvX6xR/puhU5jnZMHgj6LOku/wZMaMMQ98Ki
	yfo+nMCN0uF3CE04ZlxkeKXtYTYNGRGuE1oxwx74rgy0CIYe1/njfj6gTTjQAl8S86mL5O
	rJsCdqqalBAjnegbuN5Fmk7Xe1Lqvpk=
Date: Sun, 9 Oct 2022 22:18:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/4] arc: Use generic dump_stack_print_cmdline()
 implementation
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, linux-s390@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20220808130917.30760-1-deller@gmx.de>
 <20220808130917.30760-5-deller@gmx.de>
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <20220808130917.30760-5-deller@gmx.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_221824_585541_5EE50777 
X-CRM114-Status: GOOD (  16.43  )
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

On 8/8/22 06:09, Helge Deller wrote:
> The process program name and command line is now shown in generic code
> in dump_stack_print_info(), so drop the arc-specific implementation.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

But that info printing was added back in 2018 by e36df28f532f882.
I don't think arc is using show_regs_print_info -> dump_stack_print_info 
yet.
Or is there a different code path now which calls here ?

> ---
>   arch/arc/kernel/troubleshoot.c | 24 ------------------------
>   1 file changed, 24 deletions(-)
>
> diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
> index 7654c2e42dc0..9807e590ee55 100644
> --- a/arch/arc/kernel/troubleshoot.c
> +++ b/arch/arc/kernel/troubleshoot.c
> @@ -51,29 +51,6 @@ static void print_regs_callee(struct callee_regs *regs)
>   		regs->r24, regs->r25);
>   }
>
> -static void print_task_path_n_nm(struct task_struct *tsk)
> -{
> -	char *path_nm = NULL;
> -	struct mm_struct *mm;
> -	struct file *exe_file;
> -	char buf[ARC_PATH_MAX];
> -
> -	mm = get_task_mm(tsk);
> -	if (!mm)
> -		goto done;
> -
> -	exe_file = get_mm_exe_file(mm);
> -	mmput(mm);
> -
> -	if (exe_file) {
> -		path_nm = file_path(exe_file, buf, ARC_PATH_MAX-1);
> -		fput(exe_file);
> -	}
> -
> -done:
> -	pr_info("Path: %s\n", !IS_ERR(path_nm) ? path_nm : "?");
> -}
> -
>   static void show_faulting_vma(unsigned long address)
>   {
>   	struct vm_area_struct *vma;
> @@ -176,7 +153,6 @@ void show_regs(struct pt_regs *regs)
>   	 */
>   	preempt_enable();

Maybe we remove preempt* as well now (perhaps as a follow up patch) 
since that was added by f731a8e89f8c78 "ARC: show_regs: lockdep: 
re-enable preemption" where show_regs -> print_task_path_n_nm -> mmput 
was triggering lockdep splat which is supposedly removed.

>
> -	print_task_path_n_nm(tsk);
>   	show_regs_print_info(KERN_INFO);
>
>   	show_ecr_verbose(regs);
> --
> 2.37.1
>
>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
