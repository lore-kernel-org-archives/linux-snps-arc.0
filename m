Return-Path: <SRS0=fjUF=LA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0385EC4743E
	for <linux-snps-arc@archiver.kernel.org>; Sun,  6 Jun 2021 21:29:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE48613B6
	for <linux-snps-arc@archiver.kernel.org>; Sun,  6 Jun 2021 21:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE48613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfbvooloTSynd5JNzZ73FOJm3PXLbHkinKimH17Xorg=; b=PcKD41yZ0Hk7T3
	0wI/VNNFjO838tH7njAQCckaGSxIMAOaJQv5H3mXOzSDJAEr292UztmCmYTJ17H4Ak6eU2TPtG/Z4
	xW8EcV2vB8CmIcOmHepMdmAZO+dp8Yf3fgOiFgv1/5XnEwogNmoM0b/IiudOPqpiJhTvRN/DJaFHI
	PPnOzA2QyrAIsP/XTWBu7AR/By8uG0HVd5KeJ1gtYagobeYKIB5Yv36Y+IQcRhlkZDpEorticAY67
	YIV5CoocpQpPrU6w+BlDsew1+Vo9uVWp8bC4oK2KX042QYodkJLL5nkZ8MaG5f86aW1Rnh+Uah/Qt
	W2fDLK2qm4KkOpBPQ9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq0Ku-000qbb-7P; Sun, 06 Jun 2021 21:29:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq0Ke-000qa1-Aq; Sun, 06 Jun 2021 21:29:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 953E4613B6;
 Sun,  6 Jun 2021 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623014959;
 bh=4t5DawWhLmQPAFGRKhX1jFE4WEqbArxXgmERWe2C0xQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wu/fyJA4UR/3OsXx5PdnZuKJmqUDl6cQ0I5qOPmOobYB/YwD3loa7CHDMxmjDs7+O
 /+vTonUI3DKMDg+OJCEqqvIqeoGeqCBaFfCM6MGkwmW6KvTZO5CLkleOMNy5KmfR4d
 PteqC/M3+gPE1uiUsTSHvYSMYrpSkJ75a30BXywU3cSKzUfAv/A0+aJ76/IGuUYyhl
 S6LUi9EmnHUL5lEcDnAewWs8EsYomaOBUCef/cImLCqjaabNrEeHJoCWkyMWvCEGV1
 9+bVS1xXN0QGlOiLh2r3UXefQeesEuK/PQnscumw1S0RmHISk2eF6NrfUP8ytWcSpP
 sTzKK7DJdkKEw==
Date: Mon, 7 Jun 2021 00:29:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
Message-ID: <YL0+Jargm+y9aqx1@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_142920_428987_F29A5452 
X-CRM114-Status: GOOD (  13.08  )
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

On Fri, Jun 04, 2021 at 03:06:18PM +0800, Kefeng Wang wrote:
> Add setup_initial_init_mm() helper, then use it
> to cleanup the text, data and brk setup code.
> 
> v2:
> - change argument from "char *" to "void *" setup_initial_init_mm()
>   suggested by Geert Uytterhoeven
> - use NULL instead of (void *)0 on h8300 and m68k
> - collect ACKs
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
> Kefeng Wang (15):
>   mm: add setup_initial_init_mm() helper
>   arc: convert to setup_initial_init_mm()
>   arm: convert to setup_initial_init_mm()
>   arm64: convert to setup_initial_init_mm()
>   csky: convert to setup_initial_init_mm()
>   h8300: convert to setup_initial_init_mm()
>   m68k: convert to setup_initial_init_mm()
>   nds32: convert to setup_initial_init_mm()
>   nios2: convert to setup_initial_init_mm()
>   openrisc: convert to setup_initial_init_mm()
>   powerpc: convert to setup_initial_init_mm()
>   riscv: convert to setup_initial_init_mm()
>   s390: convert to setup_initial_init_mm()
>   sh: convert to setup_initial_init_mm()
>   x86: convert to setup_initial_init_mm()

I might be missing something, but AFAIU the init_mm.start_code and other
fields are not used really early so the new setup_initial_init_mm()
function can be called in the generic code outside setup_arch(), e.g in
mm_init().
 
>  arch/arc/mm/init.c                 | 5 +----
>  arch/arm/kernel/setup.c            | 5 +----
>  arch/arm64/kernel/setup.c          | 5 +----
>  arch/csky/kernel/setup.c           | 5 +----
>  arch/h8300/kernel/setup.c          | 5 +----
>  arch/m68k/kernel/setup_mm.c        | 5 +----
>  arch/m68k/kernel/setup_no.c        | 5 +----
>  arch/nds32/kernel/setup.c          | 5 +----
>  arch/nios2/kernel/setup.c          | 5 +----
>  arch/openrisc/kernel/setup.c       | 5 +----
>  arch/powerpc/kernel/setup-common.c | 5 +----
>  arch/riscv/kernel/setup.c          | 5 +----
>  arch/s390/kernel/setup.c           | 5 +----
>  arch/sh/kernel/setup.c             | 5 +----
>  arch/x86/kernel/setup.c            | 5 +----
>  include/linux/mm_types.h           | 8 ++++++++
>  16 files changed, 23 insertions(+), 60 deletions(-)
> 
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
