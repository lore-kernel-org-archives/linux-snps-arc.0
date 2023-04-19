Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8483DC77B75
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Apr 2023 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MjFC0BTU66MeqTC1XkNYpQ/jmCpcyOswYh1HDWcPYu0=; b=BJZGVqUQBJBTkGitWFHwLQzEtp
	Zlu6FJz5fv2wmwvnyS003I7f4iecghqwbYvXrZJg/NTNjF13sKfxRaAcJru+3gT1qwDnZXYFrDoN4
	5fMITh0hzRVUFj1QpucVbJL9K7/A+ootB9WOkPULNH4ZOhvPlm29yBdIQselIWIS/zK12zPnUHoEp
	BMUiNVk6Dki61lR+aRaXDlBdP8SzoC04Qfe6bcFx7fR4sGhNx7gl46SZq0wJsG2XVmY4x8nrnqSL7
	zTLsgz5Aq/CfW2xHBMeimiYkYcaN78LrSfjk5W/OsgCyiVcou/2R9NMnMRJBPoqAJaGf1NfdieWNJ
	mrGH0MTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8i6-005e90-2c;
	Wed, 19 Apr 2023 14:23:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hz-005dzZ-14
	for linux-snps-arc@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:57 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b62d2f729so2471202b3a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 19 Apr 2023 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681914172; x=1684506172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvT99d3vu2s9u2HdXHuOsCskK0/5VChFq+aBcaoQwKM=;
        b=eJ51Lyhme8n3XB+0k6fcBFov9PY8/EUmTR8+nuSaGr7xBsijqIoLjwhsLzVxYH/nx0
         wauVowtfzqnaLMg0Md06tjLXI3lWkSGzsXedNOsMpQwkDCNvEtBTyQ19M/Yyo6D06BSV
         XNjXn0CGdLZl3nFWqDjNax+yB6CXLq01SwKNwyDS36uGnLYxQFXzNQuK/+7hScqPlZwX
         z+agJw/VCIGMUixwVDzm2XMnLSn8GR3DsnMXY+jrQCfbr9O1Le1uXDKTi2rYkt7oJ2Ce
         tyNNGrxSj0L54sdbIeiSTDtndMc3YiWnjyxMJLeRw/TsNRHsyFeDM9KNzzDNKUVPs4Et
         pKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914172; x=1684506172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvT99d3vu2s9u2HdXHuOsCskK0/5VChFq+aBcaoQwKM=;
        b=jqIjN7qIt11DuQaSHf2RTWDkGUBP4Je1eUaKCLYBCu9H3BrSnQZ+QumiHLKluepxIZ
         pCTlJcrLpQHR+6ZIDelQWFFUO9W2v7xeV5KO2xs3E9ULa2ZxfIonu9fQnoYTNckfAsKu
         62cKkuX3mVLHudMPesiZQVn+Ev6/ANKc9Q/VgCZdN5flpTXvyd98CALx9zQRmxwujc0W
         qSn1BL2LYp0M01wpY2VhE2fLs2lU8dpgZzLPFttyiHFilCbe57tsIPzInOJAbgk5XMzM
         JxVyd6iTrOb64uWx9fqafyM7jdLHWt6K8LYkrVSc3XLfAryaUNNeCG8lMn9oeI/emHRM
         xbCQ==
X-Gm-Message-State: AAQBX9fu5urpXMDlcW+7ESLosivQtJKIdTho/C8V4zaAzAQOQ535TeDu
	nxMzXU+TqyADN57lrGU88ORYPw==
X-Google-Smtp-Source: AKy350YgrN7zbaEKFT5DU1qrct74Wsi9a0WokbCy4dVCW0VXg9H7v3lPwT87yJxbljWHRWpRpF5B0Q==
X-Received: by 2002:a05:6a00:130a:b0:63b:859f:f094 with SMTP id j10-20020a056a00130a00b0063b859ff094mr4002975pfu.20.1681914171995;
        Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d2-20020a63d642000000b005140ce70582sm10431557pgj.44.2023.04.19.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:22:44 PDT (-0700)
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional DMA
In-Reply-To: <20230327121317.4081816-10-arnd@kernel.org>
CC: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, vgupta@kernel.org,
  linux@armlinux.org.uk, neil.armstrong@linaro.org, linus.walleij@linaro.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, guoren@kernel.org, bcain@quicinc.com,
  geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
  shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
  Paul Walmsley <paul.walmsley@sifive.com>, dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
  jcmvbkbc@gmail.com, Christoph Hellwig <hch@lst.de>, robin.murphy@arm.com,
  prabhakar.mahadev-lad.rj@bp.renesas.com, Conor Dooley <conor.dooley@microchip.com>, linux-snps-arc@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, linux-csky@vger.kernel.org,
  linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
  linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
  linux-xtensa@linux-xtensa.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-7529cf5a-4397-456f-b610-faa619d4faca@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072255_373582_F6D2567A 
X-CRM114-Status: GOOD (  19.66  )
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

On Mon, 27 Mar 2023 05:13:05 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
>
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index 640f4c496d26..69c80b2155a1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
