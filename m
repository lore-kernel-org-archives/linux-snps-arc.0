Return-Path: <SRS0=fjUF=LA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EA6C4743D
	for <linux-snps-arc@archiver.kernel.org>; Sun,  6 Jun 2021 21:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA67961380
	for <linux-snps-arc@archiver.kernel.org>; Sun,  6 Jun 2021 21:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA67961380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yI2EqX3jE3UNAXmQFI4HDd1CfhlGdQk/5Ba5ApIeqZE=; b=KEQ74hWSn6hkbZ
	89nqn8Ku43OPfrlRD3wDDxqG5VOSTZv472GjCRyReimqb43vqa448gdGyRpA2XZeBnmtq/WqKmdbM
	Zqu0HMi/BSZ/AXDBGPj2mtlC1mI6djEH2YoIJxDSVOMd+UNfEzoKMknGvtp/shBtGZ+A208Vg59Eh
	Or8nNyTG5FWTJG/eYKgaHI/TebbW7YIz30dgXQp4DWkOjnn4t6U50BLdB9NgtUzZAZerVMTcM6ddr
	XoRmd8bG1Gmzp2GdvjA4CPuzkZo7tuvkD74mFiByhAN5sLLkOrk7LyX63P0oK6KF+8cTVvW948r3E
	gJ4klL28UYg51CfOTj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq0Mo-000r4G-E7; Sun, 06 Jun 2021 21:31:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq0MY-000qzw-VE; Sun, 06 Jun 2021 21:31:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEFDA613B6;
 Sun,  6 Jun 2021 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623015078;
 bh=ZtDz+Tx3gDJURxeLGuynFGZ8uxab5SNEIC7k5srsrBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHcE9g6brTgSAV+4xVNhxekKQlGM0mhAwBWD7XpWpqvtSKGR2QVl9LLO9Fp8mdhc+
 pc81xS+K6zgxjC9BvkiLbrgqfQSTHMEsv0LbOBaFKiII1tEOu5/8nloj4MSsU82HIa
 zrNuIDNh84AL4LuphasPGIwe4LNbg9inob5KFPcyQWr6fCOpQ1hseHxL1zqLaM0xud
 rcUhT1KG4HC3/rPAMCNByPC09q5k03V88CjP/YnrWLRCt6Qt1kUehiQTJUTNwYN4hW
 To0R1RL/ILuw03NT52wJ9AiDWAT36NN77oYd2Bnz8ID2ZeewkpMb92YVMYNyVavhgv
 L/9jySVl4Hzcg==
Date: Mon, 7 Jun 2021 00:31:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 01/15] mm: add setup_initial_init_mm() helper
Message-ID: <YL0+nZPViz5xzxca@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <20210604070633.32363-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604070633.32363-2-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_143119_040561_68DCD4E8 
X-CRM114-Status: GOOD (  16.79  )
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

Hello Kefeng,

On Fri, Jun 04, 2021 at 03:06:19PM +0800, Kefeng Wang wrote:
> Add setup_initial_init_mm() helper to setup kernel text,
> data and brk.
> 
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: openrisc@lists.librecores.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: x86@kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  include/linux/mm_types.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5aacc1c10a45..e1d2429089a4 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -572,6 +572,14 @@ struct mm_struct {
>  };
>  
>  extern struct mm_struct init_mm;
> +static inline void setup_initial_init_mm(void *start_code, void *end_code,
> +					 void *end_data, void *brk)

I think it's not that performance sensitive to make it inline. It can be
placed in mm/init-mm.c with a forward declaration in mm.h

> +{
> +	init_mm.start_code = (unsigned long)start_code;
> +	init_mm.end_code = (unsigned long)end_code;
> +	init_mm.end_data = (unsigned long)end_data;
> +	init_mm.brk = (unsigned long)brk;
> +}
  
>  /* Pointer magic because the dynamic array size confuses some compilers. */
>  static inline void mm_init_cpumask(struct mm_struct *mm)
> -- 
> 2.26.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
