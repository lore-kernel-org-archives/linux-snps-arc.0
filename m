Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618F3C6FA8F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Aug 2023 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NInW+s9ErroueKJUsdeMW/HjA5E3+lbYiSMCLvAEWDI=; b=rtFFLsvyZwHLf6
	g4mWu2+9fKm3GvrjVUG8QYdDnmcfV4uOppG6zsILxszxq9HVev5qKYsBhUdNUK1k9q8Jwr/r3NOPh
	uIIeO7eNn2z9JTpw/c2AeWilQsyO9BRJzquBdeikLNRJPmwes7M4P0i8+UzPq1JVamiZXvok4rK2x
	IsMo10kio9pksB00vaaLnRjnRMpUvzY4XDlbmlE7zwr9BvChWtUXjfzp0JNxN4fag5aTTdCm8Kb76
	Vw8dxgvAhlfKVsr6FoNgJTBYl9hSlCigvYjiGe25MXH1EChRmJrV6g6bmkw91E0yxo/Qbale1SPFE
	R49UeORtZdndGBMHflEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrDb-001A8n-0m;
	Wed, 23 Aug 2023 17:00:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrDY-001A8I-2t
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Aug 2023 17:00:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52B4C64A41;
	Wed, 23 Aug 2023 17:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE625C433C7;
	Wed, 23 Aug 2023 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692810027;
	bh=8VEsVfqtU9S9MgX99shwdJkXDGcWzkQCx635Hl8h+H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uF1ZA1gZ2i/TKYqocN8CHEInCnahoWHZcMnr7altexmz1FDwEk+yWK3yUgfd7eAYG
	 bVuhcvBdVQsy7u51Ur8zIP85JADUqrO61CbjAsdyZGpMmGzv13kcjkw1Il8mzWaHbO
	 n8FXFiF5v6NoRB3bQdcOQnBjizF/0Kj07NMYWhkmdvO2kUYHoJl/kQKT2ZDcqts64v
	 OfgbDPfj+ylvXEjmxdH/KYDhugkwVrQ475Cv/+B7Bm1m43glz5uH48+i8Tq5HD6GQx
	 KYmFh+6Bduj6IgUjNDDRGBAiT1FiSAYRL+AKPNmcvf3zJNAq2xLf9KJNQvnjIQG1dd
	 1Ol7aKTGt9MQg==
Received: (nullmailer pid 2470418 invoked by uid 1000);
	Wed, 23 Aug 2023 17:00:25 -0000
Date: Wed, 23 Aug 2023 12:00:25 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>
Cc: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arc: Explicitly include correct DT includes
Message-ID: <20230823170025.GA2470216-robh@kernel.org>
References: <20230714173949.4038981-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714173949.4038981-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_100028_977628_474BAED0 
X-CRM114-Status: GOOD (  16.13  )
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

On Fri, Jul 14, 2023 at 11:39:49AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arc/plat-axs10x/axs10x.c | 1 -
>  1 file changed, 1 deletion(-)

Ping!

> 
> diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
> index b821df7b0089..1feb990a56bc 100644
> --- a/arch/arc/plat-axs10x/axs10x.c
> +++ b/arch/arc/plat-axs10x/axs10x.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <linux/of_fdt.h>
> -#include <linux/of_platform.h>
>  #include <linux/libfdt.h>
>  
>  #include <asm/asm-offsets.h>
> -- 
> 2.40.1
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
