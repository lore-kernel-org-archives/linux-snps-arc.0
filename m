Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B0BC77B73
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0fVA580PLnnAsXCej5ipYg5sjMSxrfGc7PGuESs7kzE=; b=mpowbYL1nHELI22DkGhM77cvMl
	FmQRTYT3x8AHJnqkuzrmckAbBlyi2ZcVpVExeVaaYky9YAxubbig8Tqz+Giqcc88/DqBLnuqVWv4/
	YhB+mKB05dJwREA3cO5IDFMceUQ/BOU2eOaJqJ0AKO6On/XtWZdVu+xNrOwKfIcZvGCYme6SHtCiT
	Xfzp/+fR/NwAdxXffGzxGaMrWmlH8KfMRZGJRcOk9ndUhW1T/hvdmArMClBcjiXDwACzy2nSMklBX
	1xsd0WFIO3icw7JYJg5mYyjFtKaq9BEa9Hm9bdgcsK1+Zr5/QWwGay7pdyO5Nq0iJBkuo8ykwZwpd
	J0oES/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8i0-005e41-1c;
	Wed, 19 Apr 2023 14:22:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hw-005dyb-3A
	for linux-snps-arc@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b62d2f729so2471177b3a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 19 Apr 2023 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681914171; x=1684506171;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqMbvZWHdx/umNn2GDsuDcOtpXqKSdzh2puSjeFvGNg=;
        b=BQQfPjXj9RjzqoAPS+lEslGY5dDcNNPEbJrUbMfagQ00SpueZWLcpYAadUOn4K2r/7
         h4HdkG7hv1lk/JwJJQYCK1kCSiFRuTmkN44fcy7kPteadqn38MkQ3ndJHP2Mc9t7NrZL
         nmp1DYP7b7nPYrKCi/AHIrNyGwWhrPzKd1bjeAAqOo6tX3/AL+K+6SRGBPhAsfYsDgSs
         dPS/aO0HTzlFjGLxzQlmfHBIIf93KsDsbdHG4ySz5E0QxtwHAyLnkpkj20M9cIgvdPfV
         aEw0KFtyNn5lgDQSa9YMyBJglZh/UHtAgTzAA5ieEsZiecFBH/5j299y8tclByk2q0hU
         dWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914171; x=1684506171;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqMbvZWHdx/umNn2GDsuDcOtpXqKSdzh2puSjeFvGNg=;
        b=avQWUXL87kuXJub3R6sfUyAaUrVWsKdWSdka5CE5wawDf4iJpf3bNh441nz28Pg68q
         Gmq0kRcMqey8Ny3bTSKOHa/naGhhSRuLeDejyJ/2Tf+WfDwRllU9BQG7ec8J4HhW3msu
         XQ/yMINCanISu1oR/dyD+jjuIpoevAwo9MbVkP+hwi9+Loa6zK8hQ3sIgh9urqEQ5KM8
         xrdSOTowXVz+l7FRY9oGoMGaC7kUY0PdPLxXTKRMyBTlRTvVYPSWpEux88MaJl9xs6Q+
         1299EiFPkTK8BBT3y6STyP3QCk31NPjJJ09j7hXjleVjxv/kogmTyjBwOTQauE14TVBv
         sSDg==
X-Gm-Message-State: AAQBX9e8vFyZc/TVmzz/kwPSUyhe/1LkiDxr+ZSBH0bDK7n5gZFQW3WP
	t8vz9s24DTKrZr8IRZPbwLF4gg==
X-Google-Smtp-Source: AKy350bZHj+5SLgwTf96Z4FllovZ8h4/H1ZYpgVXzzdS4Hiiw7gNLDstVjX8e8aaqlbpRvsz3GY15A==
X-Received: by 2002:a05:6a00:2355:b0:63b:8778:99f7 with SMTP id j21-20020a056a00235500b0063b877899f7mr4656389pfj.9.1681914170729;
        Wed, 19 Apr 2023 07:22:50 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id j7-20020aa78dc7000000b0063b806b111csm7467077pfr.169.2023.04.19.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:50 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:22:50 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:22:40 PDT (-0700)
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
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
Message-ID: <mhng-158f3971-b108-426f-b3e2-4f3c02a2199d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072253_020137_2425800C 
X-CRM114-Status: GOOD (  18.82  )
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

On Mon, 27 Mar 2023 05:13:04 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
