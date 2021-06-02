Return-Path: <SRS0=Frhj=K4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E666BC4708F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 21:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC2B613DE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 21:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC2B613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b63NpAse/4w/C9onOOMvh7n1vJJZp5wAEUscaTT8MRQ=; b=k7+tbGe43ib2d/
	llan7OsVHyVVFIhFPBDdmYaB7CcGSuaX1ngsodRqTKPmofIdmVceN6IA4B+Jg45XShhK8G7YvukIh
	v4vyuUqSpJSBhmP7GCssQpSdpsxhXm5mb44S4ES7e/6FovweZ0674864fRMYd9q9cB2NV4eAExb6k
	EESes1if80TDV+oDZ4t2SLf+CEha2BIu9VjqsapBRZcXg2+SI8LFKSz1zTTHlrKruARQGGZtWnsk2
	VGnJ9UW4tXyULAQCCRtKNTCwFsrTXiP4dpQ8Ett0KwPDkeMU86IwtppAI5kYk6ISBr9gIw2NTMzzE
	3nRmW8e2t4Bd0qlQPe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loXzw-006D79-5B; Wed, 02 Jun 2021 21:01:56 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loXzs-006D6a-PA
 for linux-snps-arc@lists.infradead.org; Wed, 02 Jun 2021 21:01:54 +0000
Received: by mail-qk1-x736.google.com with SMTP id 65so2460644qkg.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 02 Jun 2021 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z1KT2SC7zYxQmOT5Kh+dVtbV5THGRScxhKf6qZ6NuhM=;
 b=fjVzBHwziXF8lOlGiA+cSdLI5WysFYebfsZljZNKd0y07bFMazdOtpXO8LeAFnilQF
 bNgYzdiANZE1O/skNn1ESWetKqN7Y3AWq9kBmO/Rb9mEIWT53loNjrOju2zLpfYvehNn
 7mxbw+6b4AwoqpZ47FGrGIvIZXTjNcXpCHcusIqWkLShfqr9e0Ze+oISyL8E1DPd39C+
 il9lZaleTKA9Qv+zQMUEajB3+2PfM78c6yFRR+qjWCdUxvyAcWvAMVEZIkyf5BSma5i7
 orqNgezkQGcLOKBojT1L7As8o/eLvUh91kUa5WadSYrPLlImR2aBW/jUOUXpGRiNYmrl
 L/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z1KT2SC7zYxQmOT5Kh+dVtbV5THGRScxhKf6qZ6NuhM=;
 b=SN1w8rLQEY1HAFiIincPvMi0f5LJNavq5dQ7L2JNFdNw3NPmoSyW+kylcT3mG98SOj
 SXCHqpiBALpaw+68zglBUkqvGKjpsLUSp26Ssd72XtuwJ4mhfjjpFLmg82CQzkBVZs7z
 G+DmmkYgA2zCTV3IHoxSyI2Mjpin9Mr5+gHQOvKwCufCZapB3wXPZ8iuB/F0YauDyNTU
 F1s7I94nY8cNz1A0mGcRUnB3wMM77LkF5ar9pil0SJXaoH2a4ypXTuyRWXu0MGJDvPQf
 OS3fY12EYxTr+XTXWTQSzgYhJoCOYGcVeBVWTb0i2O7mErUAtiddvhutL/NOjhuYkm1Z
 CTaw==
X-Gm-Message-State: AOAM533nKUQEhDnI5jLxGf+Q1eyivxu5CUpAzIV4SNkVDZPlbEOXgsj5
 fb0WQF7nhQvsytdRgSTycSM=
X-Google-Smtp-Source: ABdhPJydjhJaoCAG7zNDFMerQvKEOpT3T7CAHJsFcWPZywrffd7t/jicwxojt/WinXZFX30lfERCGg==
X-Received: by 2002:a37:b6c4:: with SMTP id
 g187mr29621983qkf.491.1622667710719; 
 Wed, 02 Jun 2021 14:01:50 -0700 (PDT)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
 by smtp.gmail.com with ESMTPSA id s24sm542621qtx.94.2021.06.02.14.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:01:50 -0700 (PDT)
Date: Wed, 2 Jun 2021 17:01:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: abrodkin@synopsys.com
Cc: linux-yocto@lists.yoctoproject.org, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
Message-ID: <20210602210146.GA26712@gmail.com>
References: <20210531201641.2804-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531201641.2804-1-abrodkin@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_140152_853731_C1F309E0 
X-CRM114-Status: GOOD (  18.19  )
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

Looks good to me.

What branches were you targetting for the change ?

Bruce

In message: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
on 31/05/2021 Alexey Brodkin via lists.yoctoproject.org wrote:

> In v5.5 kernel we merged "nsim_hs" config into "haps_hs", see [1],
> and from then on we use the same one "haps_hs" for everything simulated:
> nSIM/QEMU/FPGA.
> 
> Of important notes:
>  * We switched from legacy ARC UART to a standard DW UART
> 
>  * QEMU port for ARC is under review upstream, see [2].
>    But even today with WIP version from our GitHub fork [3] its possible
>    to run this image for "hapshs" machine as simple as:
>    ----------------------------->8------------------------------
>    $ qemu-system-arc -cpu archs -M virt -nographic -no-reboot -monitor none \
>      -kernel build/tmp-glibc/deploy/images/hapshs/vmlinux-initramfs-hapshs.bin
>    ----------------------------->8------------------------------
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1681baa713aa138d3f0f77f05c3de1cd6416c7d6
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg00458.html
> [3] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  .../nsimhs-standard.scc => hapshs/hapshs-standard.scc}       |  4 ++--
>  bsp/hapshs/hapshs.cfg                                        | 12 ++++++++++++
>  bsp/{nsimhs/nsimhs.scc => hapshs/hapshs.scc}                 |  2 +-
>  bsp/nsimhs/nsimhs.cfg                                        | 10 ----------
>  4 files changed, 15 insertions(+), 13 deletions(-)
>  rename bsp/{nsimhs/nsimhs-standard.scc => hapshs/hapshs-standard.scc} (72%)
>  create mode 100644 bsp/hapshs/hapshs.cfg
>  rename bsp/{nsimhs/nsimhs.scc => hapshs/hapshs.scc} (54%)
>  delete mode 100644 bsp/nsimhs/nsimhs.cfg
> 
> diff --git a/bsp/nsimhs/nsimhs-standard.scc b/bsp/hapshs/hapshs-standard.scc
> similarity index 72%
> rename from bsp/nsimhs/nsimhs-standard.scc
> rename to bsp/hapshs/hapshs-standard.scc
> index 3201ca52..1842b00c 100644
> --- a/bsp/nsimhs/nsimhs-standard.scc
> +++ b/bsp/hapshs/hapshs-standard.scc
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: MIT
> -define KMACHINE nsimhs
> +define KMACHINE hapshs
>  define KTYPE standard
>  define KARCH arc
>  
>  include ktypes/standard/standard.scc
>  
> -include nsimhs.scc
> +include hapshs.scc
> diff --git a/bsp/hapshs/hapshs.cfg b/bsp/hapshs/hapshs.cfg
> new file mode 100644
> index 00000000..adcc0531
> --- /dev/null
> +++ b/bsp/hapshs/hapshs.cfg
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: MIT
> +# ARCv2 ISA
> +CONFIG_ISA_ARCV2=y
> +
> +# Serial port
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +
> +# Built-in .dtb
> +CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
> diff --git a/bsp/nsimhs/nsimhs.scc b/bsp/hapshs/hapshs.scc
> similarity index 54%
> rename from bsp/nsimhs/nsimhs.scc
> rename to bsp/hapshs/hapshs.scc
> index 3c1613a6..ea2b8b6c 100644
> --- a/bsp/nsimhs/nsimhs.scc
> +++ b/bsp/hapshs/hapshs.scc
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: MIT
> -kconf hardware nsimhs.cfg
> +kconf hardware hapshs.cfg
> diff --git a/bsp/nsimhs/nsimhs.cfg b/bsp/nsimhs/nsimhs.cfg
> deleted file mode 100644
> index 34580a39..00000000
> --- a/bsp/nsimhs/nsimhs.cfg
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: MIT
> -# ARCv2 ISA
> -CONFIG_ISA_ARCV2=y
> -
> -# Legacy ARC UART
> -CONFIG_SERIAL_ARC=y
> -CONFIG_SERIAL_ARC_CONSOLE=y
> -
> -# Built-in .dtb
> -CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs"
> -- 
> 2.16.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9926): https://lists.yoctoproject.org/g/linux-yocto/message/9926
> Mute This Topic: https://lists.yoctoproject.org/mt/83218216/1050810
> Group Owner: linux-yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/linux-yocto/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
