Return-Path: <SRS0=ZTsv=CD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05543C433E4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Aug 2020 07:22:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB70120706
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Aug 2020 07:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3A1+WzSA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lpohMO4A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CFSF1lVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB70120706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VH+37zWOJCUHEBpqpaAoorC1N8iUoQFr6VYAwQpKpxo=; b=3A1+WzSA8sBESb6AWUyUd2JBL
	bBK0J/oVsuPscmzRWKG3P9CaGP/z62ZbFAtD7wkY6I51mHlbqMkyKbqMWpHcAdEby0dyDZFwyZIID
	JwNTAVUZ6M12q3vet3jfQxbVmRG1cSnOMECaOAwa4cdow876Asz4Xq2m5deHTzrq7RagFzyAGX8gi
	GwgqQ868zQLHaLP83iiv5+5ZNFTHGStGmy7721ciYYOMo6SwMOu3pLvbBYMxMITwj85vChZjZ92SO
	F250fu1y9Z1RIUi25J53Iw+B3o53QTnB9I9cU2IPibQXB6hH7RauD1W9EY+mwbWwwLZxKuRwvcbiN
	rLU7bVLvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kATHM-0005Kb-2H; Tue, 25 Aug 2020 07:22:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kATHI-0005Hq-7b
 for linux-snps-arc@lists.infradead.org; Tue, 25 Aug 2020 07:21:57 +0000
Date: Tue, 25 Aug 2020 09:21:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598340113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dMiNCEJ8BasINNDn7lM/cZvFiMvMZcNk+zxoVqGBx0c=;
 b=lpohMO4AuqciTq7XljGE/G6Tn+Q3G1RblpL1soN2WKA+jafIfUYM+lazj3F5s2Vnfx4D5s
 2VIGsTbgLnTPkSK6dqtp0j6oZHScwD4k8kvyjd4oAhLqaoTFi41AB35mLbEnqB1i+Fck+/
 e3RNHtBM4ewSNktev6GgoReG6rxHulCKkjcCeFHAlnQ4qpYSVUIHSBl5UggT/yJaD5Z9zL
 2gkqfxsKbQWqfhSe7bgmptTbQKTfyFhQytXSjvsuqyBvWC119GwzQ3ewVssLpK9acgqqEF
 WDIYNBFweYzw/6Mi6+fz2EhEqLNC30L8bBOUhklEEyaStbJjqnFlX1waKWwGzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598340113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dMiNCEJ8BasINNDn7lM/cZvFiMvMZcNk+zxoVqGBx0c=;
 b=CFSF1lVUmnhX4zs4jWvsEjHzIO4f477Y3lFEcnW9PCL0KkPZ3ufd/79F0cnlDvuO0f0Jr+
 hrR7F4GAPgW9XmDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] irqchip/eznps: Fix build error for !ARC700 builds
Message-ID: <20200825072152.725jmtlcqah5oos4@linutronix.de>
References: <20200824230149.199656-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824230149.199656-1-vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_032156_487921_6D6C0D72 
X-CRM114-Status: GOOD (  13.42  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, oferle@mellanox.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2020-08-24 16:01:49 [-0700], Vineet Gupta wrote:

A little of patch description wouldn't hurt. Especially since it is not
a simple move but IENABLE comes out of nowhere.

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: http://lists.infradead.org/pipermail/linux-snps-arc/2020-August/004032.html

That link gets lost if someone decides to recreate the pipermail archive
and you have no hint what it was. Using

  Link: https://lkml.kernel.org/r/20200824095831.5lpkmkafelnvlpi2@linutronix.de

instead will instead give you the message-id in case lore dies or the
lkml.kernel.org redirect service goes into retirement.

> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/arc/plat-eznps/include/plat/ctop.h | 1 -
>  include/soc/nps/common.h                | 6 ++++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
> index a4a61531c7fb..77712c5ffe84 100644
> --- a/arch/arc/plat-eznps/include/plat/ctop.h
> +++ b/arch/arc/plat-eznps/include/plat/ctop.h
> @@ -33,7 +33,6 @@
>  #define CTOP_AUX_DPC				(CTOP_AUX_BASE + 0x02C)
>  #define CTOP_AUX_LPC				(CTOP_AUX_BASE + 0x030)
>  #define CTOP_AUX_EFLAGS				(CTOP_AUX_BASE + 0x080)
> -#define CTOP_AUX_IACK				(CTOP_AUX_BASE + 0x088)
>  #define CTOP_AUX_GPA1				(CTOP_AUX_BASE + 0x08C)
>  #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
>  
> diff --git a/include/soc/nps/common.h b/include/soc/nps/common.h
> index 9b1d43d671a3..8c18dc6d3fde 100644
> --- a/include/soc/nps/common.h
> +++ b/include/soc/nps/common.h
> @@ -45,6 +45,12 @@
>  #define CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST	0x5B60
>  #define CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM	0x00010422
>  
> +#ifndef AUX_IENABLE
> +#define AUX_IENABLE				0x40c
> +#endif
> +
> +#define CTOP_AUX_IACK				(0xFFFFF800 + 0x088)
> +
>  #ifndef __ASSEMBLY__
>  
>  /* In order to increase compilation test coverage */

Sebastian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
