Return-Path: <SRS0=rFYR=NH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D78C432BE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Aug 2021 22:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5007E60F4B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Aug 2021 22:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5007E60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K07kCRm/hiVEqxRQXbOKEfzK2faV2RN05iHkhTTDGw4=; b=NutSzHLu5qpamPXOUekBrI1nYA
	9Ywnu4IrkxMsEfs/Jb5wfXQaKzyDDLtTNktCUpcM16osVlVwRryBoD5NFsSjhs7Ad9nYhLz2WEjHE
	lNBixb/6MDSImelAlB/Bpk8g5BUGSh8KeylM+4SLTM0b8CJoQHFKjtsvHjzrDatX4S0vcU+MPVona
	b0apzCLTqcjECnhRmaRCnfS78XUSnxejUzsCfBTidbEI1e/Symjhe1gNM0zkME584V+yYMot7CIXi
	2Q1jwUYxytnyE8V0BEJ77UznLLe5ARgC5eRq/exZ1WY2m+kviqteJOH0YGtoqIR+pw4H3HCVMM4XN
	8bMcBuPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFkf2-000R5A-N1; Mon, 16 Aug 2021 22:00:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFkex-000R42-Ej
 for linux-snps-arc@lists.infradead.org; Mon, 16 Aug 2021 22:00:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0709601FA;
 Mon, 16 Aug 2021 22:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629151243;
 bh=D6G11k2cgnrfXeO4tqRi+f+FFeddZGnV7Vxpe2Ldj60=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RFoeBLTLggFqBH9D60i1VYk/n1v6LifKuwoWxiuOmb7uFxRdjLRrtPmvpuPUbLGDe
 C5ZvdvC5T7+c9xZK2u5xHMGcm1mrh+Z1bP7FY5Sk+Uc+KFW5p9UZ+VgIPVqNQpSUx/
 g/auW0EoA7B7/Ujc0ZeKUlxWid0r1vg7tSjPfIhubgBeTFNzRiO6mUOJrQikVnyay0
 v36k73rJHK3gWA/UndADYQcvlMlS9PNrB9TF2eS/3gUHgoahG8MmuglW1Kq5eMt1Q2
 A6vcvgXK9WdNcEJ/aOLRC+Cr+lsCfPiuuneZAZoV8l6lOKpDbLrmPw3VZ4FC3pitJU
 1U3CNWlncgdEQ==
Subject: Re: [PATCH] ARC: export clear_user_page() for modules
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
References: <20210816210533.16929-1-rdunlap@infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <16255d77-e9a5-4bac-6c6e-596af6f5b0c1@kernel.org>
Date: Mon, 16 Aug 2021 15:00:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816210533.16929-1-rdunlap@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_150043_590019_D925FF04 
X-CRM114-Status: GOOD (  17.67  )
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

On 8/16/21 2:05 PM, Randy Dunlap wrote:
> 0day bot reports a build error:
>    ERROR: modpost: "clear_user_page" [drivers/media/v4l2-core/videobuf-dma-sg.ko] undefined!
> so export it in arch/arc/ to fix the build error.
>
> In most ARCHes, clear_user_page() is a macro. OTOH, in a few
> ARCHes it is a function and needs to be exported.
> PowerPC exported it in 2004. It looks like nds32 and nios2
> still need to have it exported.
>
> Fixes: 4102b53392d63 ("ARC: [mm] Aliasing VIPT dcache support 2/4")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org

Thx for the fix. Added for 5.16 !

-Vineet

> ---
>   arch/arc/mm/cache.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20210816.orig/arch/arc/mm/cache.c
> +++ linux-next-20210816/arch/arc/mm/cache.c
> @@ -1041,7 +1041,7 @@ void clear_user_page(void *to, unsigned
>   	clear_page(to);
>   	clear_bit(PG_dc_clean, &page->flags);
>   }
> -
> +EXPORT_SYMBOL(clear_user_page);
>   
>   /**********************************************************************
>    * Explicit Cache flush request from user space via syscall
>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
