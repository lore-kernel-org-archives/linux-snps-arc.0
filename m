Return-Path: <SRS0=uFJY=5Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B088C2D0EC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Apr 2020 01:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D138206A1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Apr 2020 01:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+gqk9pD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eShkpyC2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D138206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96/FMKuj/rJbJya1LY+Y7mWzH396AV/SpQ5EN4gxo1c=; b=e+gqk9pDN2ymzr
	Hf5iFvOL9Vr28y2W+WL+qzRPzUhhVclRjfjDuV2apvPXFj6hU4FpxvKoo9kJ7bpql1kf73rsqpKCc
	jsoKZ1uWB7eg2vEQYpXrFNDVzImV9ks4Cwbo5bNfh+I80jE72afP5uhKTHEZFDT0FbiCkmaNJfXJc
	zTp9yKeXIDClvU2UAMGqtgxR5rc9vsus4iLPJFefzFQ6DOo9TxPzIBO0PfX1k0OOTJZWAqRhqlZQ4
	eMGrB/A0FMWgHEOEhtuYFAaoQmr5NzNBmGkJlXiyug8gBOQR7Z1Gos8MsNlk0ODyPHLLUxdtNPwki
	Q4xsqUoeiAINWO/Tx7eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLzOS-0004Fj-36; Wed, 08 Apr 2020 01:20:40 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLzOP-0004F5-Gd
 for linux-snps-arc@lists.infradead.org; Wed, 08 Apr 2020 01:20:38 +0000
Received: by mail-ot1-x342.google.com with SMTP id 111so3841790oth.13
 for <linux-snps-arc@lists.infradead.org>; Tue, 07 Apr 2020 18:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w74IQpWH+YeWMBE49oRHFdAV4Qtub4fERsktwyE3yMU=;
 b=eShkpyC2j7BgC9dKflFtWT3BanRLRI4FR5r+l2HfDAnmrCnH5wdmKlUqR5xw0nn1vt
 zJeiNrFQtsSsD4YbvTaBJ9FHsXfdLuJ3Vgy5twrY+84lgek6k1UOSIwKi16yf2Fu5qon
 P4dELGkn4E2CENN87UdXHtkLnxTl5sEdAzKgaexWGfeXcggMGF1qeH1cF6en+AaK0XuK
 6nI5sPWSOE9Luyu+0SoK4HXVjxOfon5XfmdN/UFHUZsXS3m4T3B404Ocsp7gRykWeook
 DqOxk1d9SRrrhDf1BlitGdiPVVDqOtSQ3nkl0eU+6JU9JVjm83mE6nDhHI1khrXPRyyY
 vhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w74IQpWH+YeWMBE49oRHFdAV4Qtub4fERsktwyE3yMU=;
 b=Cc3nCjqYnk2XtziIAu+89CQa3tIa6GJDlEKMNExIgEZVszcUkI5DhpwEQQENDXId5v
 Dc/D8NBcjMKy+ayM9dWW6ZiSlcuHE7oF11OV11CgzEJ5VtuZkwhymCtC57xcAS3gXhZC
 +a9eFgo39YEiH4Sos1hml0/OCBmG+3QBeSR9B5tDp633i69B7dDcC1GidAWJw8vaAyOO
 LlAvnUUwYkfQE2qajJWtDWEAFdRPqB1Sai31k6dpoOgthcCKCrQwm07R1K1nQZcH1hw+
 QcgruXWC9sLp9jCwTaXX1RSHVhkmUgq759oxhAn90oDCvlX38cSqLzkYkcyiXJhveZFN
 kkVQ==
X-Gm-Message-State: AGi0PuZkYySURz2fDex/W9e+2zBFupaTkHRn1Z2KV2g5+OmhY27qwGOJ
 UX1ZSdh7mdi+GNU3+sLPtHY=
X-Google-Smtp-Source: APiQypLG2wKpFDLR8uMgZ5n9JRt0QDVqxhTip1KKep9inHP7v17jRMPb6Wb+tLc+sKxMOXkklAAGpw==
X-Received: by 2002:a4a:a226:: with SMTP id m38mr4189121ool.94.1586308830034; 
 Tue, 07 Apr 2020 18:20:30 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id g72sm5927092otg.79.2020.04.07.18.20.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Apr 2020 18:20:29 -0700 (PDT)
Date: Tue, 7 Apr 2020 18:20:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH] ARC: [plat-hsdk]: fix USB regression
Message-ID: <20200408012028.GA40613@ubuntu-s3-xlarge-x86>
References: <20200407161933.10874-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407161933.10874-1-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_182037_555370_058A5E5C 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Apr 07, 2020 at 07:19:33PM +0300, Eugeniy Paltsev wrote:
> As of today the CONFIG_USB isn't explicitly present in HSDK defconfig
> as it is implicitly forcibly enabled by UDL driver which selects CONFIG_USB
> in its kconfig.
> The commit 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
> reverse the dependencies between UDL and USB so UDL now depends on
> CONFIG_USB and not selects it. This introduces regression for ARC HSDK
> board as HSDK defconfig wasn't adjusted and now it misses USB support
> due to lack of CONFIG_USB enabled.
> 
> Fix that.
> 
> Fixes: 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  arch/arc/configs/hsdk_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
> index 0974226fab55..f79c15892704 100644
> --- a/arch/arc/configs/hsdk_defconfig
> +++ b/arch/arc/configs/hsdk_defconfig
> @@ -65,6 +65,7 @@ CONFIG_DRM_UDL=y
>  CONFIG_DRM_ETNAVIV=y
>  CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_USB

Shouldn't this be CONFIG_USB=y?

As it stands, this patch does nothing.

Cheers,
Nathan

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
