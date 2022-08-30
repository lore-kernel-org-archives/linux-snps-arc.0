Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA38ECAAA1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Aug 2022 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/6vhmDtIeX/El9lKjRA797U4yT3KBgyZWRcjttuPxw=; b=fItu1MQazLXvTO
	nivn4e8OGxnUZPw/KKEioduEBBStm8FfvXlCZnTjK8gTuds8bTFqiO6vRoazukgOSI0F1As8EIbLI
	A9OOR6hXNQlUWoyS1ZMV+UAPUqNFcUTwRUP2fsTtZRVVk7Tn+T2ta51AQD/f4RXjjVcJBtEegFdZQ
	T2z7cudB3JJx3v1fdA8jZVZE/gh1ddQiqN0l9NHkfxuNiqecfEl/Fp4sJzUdIu7qnR6xHYPxyDjrF
	y6Dm8lz/6zR6X5PlPNMei3uhcljfFQK7zvQ7UpuTEdzaaqhkaXc2588Pu/Vu9cHTzdmXo7Fo1N+lC
	7wYAMhyFqtOJHBw5eGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvlJ-00EnDL-FV; Tue, 30 Aug 2022 07:34:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvky-00Emyb-IO; Tue, 30 Aug 2022 07:33:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id u18so309546wrq.10;
        Tue, 30 Aug 2022 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=AkyiwZAyTL+qEnClAJjmshzXLVaiiWcOqi2bEVx9lPg=;
        b=aRJmmvilCx9hvnJwsqFDPwUjBgxD5a6DXdivTL+SL6hBqXqSgsQY6k4ALeR8FvREBs
         29wLOX4jEh7pKEjjJOucUsyR6KsAsGxnleJB90+lIKMn0lwehPN+a28RBx4XSP0JcCpb
         tP05S/5Bl9i9PsRfB/mpmNAHJebhPrkZO8+cqakoCF0UxM+jgP8F9hdJ7m0dJy9698Hk
         +ix5Kdnbdj6A9npKn848lfV0UW/d3if+lSSi0fLHWNgF4jDqVxiaJ2yKNijxt2ctV/jF
         s4qgeh3LyJrpPG0ORO8pKTQBjeYKw1FdHIWS+bg0J/Hp8DM6+qamo3RDZENkCPnTqP40
         OTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=AkyiwZAyTL+qEnClAJjmshzXLVaiiWcOqi2bEVx9lPg=;
        b=T+D4YqEsw2H/zEijwsECWdrkYssFc5M+1G/et2dBTJQCNTpGCsO/+vykK/2cW0WFy8
         kZUF3BLTFn8CdzVvm6n/kCfme9tUeQdAqsSU3Qq8oBQaYELK74Wf/u7s3YXfDAy9/KPO
         tthX/gA6Hqx2FgFvbc8YnAAi9TCkXJinwq2JSRiITOWNPkutipR2G2cdYLlazp81IYkp
         q2A7bTsSxVjZaIWn15Wp1qief5mCJ8lQWUdWRvWiUpPCqW0LBFQh6JAjeviHwJvXpCCu
         T1AaKk9g7RBuU5tGvtWS8RYu4RaXYpqfFaX/qt4KScIjajSyaQcWm/UzaFrvEex92uIU
         llDg==
X-Gm-Message-State: ACgBeo1fwfWGIEkQuNOnLW+JPtInT0lmt9u33r7H5c3Wz2i2s7eermwE
	fcX5+ECrxGX6J78uiWmgudRPFfN9zFsIhg==
X-Google-Smtp-Source: AA6agR7M6K5NpAKHxyoBknJxWk60gWpGtre/xWrzuWyDehqu9BTVBu8aAalG/O21/110w8lPoNr+Bg==
X-Received: by 2002:a5d:59a2:0:b0:226:e6c3:a6c2 with SMTP id p2-20020a5d59a2000000b00226e6c3a6c2mr258841wrr.236.1661844832254;
        Tue, 30 Aug 2022 00:33:52 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
        by smtp.gmail.com with ESMTPSA id l17-20020a7bc351000000b003a5ee64cc98sm10920055wmj.33.2022.08.30.00.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:33:51 -0700 (PDT)
Date: Tue, 30 Aug 2022 07:33:51 +0000
From: Stafford Horne <shorne@gmail.com>
To: guoren@kernel.org
Cc: oleg@redhat.com, vgupta@kernel.org, linux@armlinux.org.uk,
	monstr@monstr.eu, dinguyen@kernel.org, palmer@dabbelt.com,
	davem@davemloft.net, arnd@arndb.de, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 2/3] openrisc: ptrace: Remove duplicate operation
Message-ID: <Yw29XwOoUY1Foze/@oscomms1>
References: <20220830065316.3924938-1-guoren@kernel.org>
 <20220830065316.3924938-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830065316.3924938-3-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_003356_693344_8976D2D0 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, Aug 30, 2022 at 02:53:15AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The TIF_SYSCALL_TRACE is controlled by a common code, see
> kernel/ptrace.c and include/linux/thread.h.
> 
> clear_task_syscall_work(child, SYSCALL_TRACE);
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/kernel/ptrace.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/openrisc/kernel/ptrace.c b/arch/openrisc/kernel/ptrace.c
> index b971740fc2aa..cc53fa676706 100644
> --- a/arch/openrisc/kernel/ptrace.c
> +++ b/arch/openrisc/kernel/ptrace.c
> @@ -132,7 +132,6 @@ void ptrace_disable(struct task_struct *child)
>  	pr_debug("ptrace_disable(): TODO\n");
>  
>  	user_disable_single_step(child);
> -	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
>  }
>  
>  long arch_ptrace(struct task_struct *child, long request, unsigned long addr,
> -- 
> 2.36.1
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
