Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90147C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 19:25:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D3466109E
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 19:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D3466109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oWDe+GFAcMDnYA1hBe1s1BoT3hS6EvqA0QroaKLJ5Vw=; b=bkosxBje2FwStWirteg9oeloB
	5JvfoOwtUQMQyNibiX4vnQqDsGRI/lGhF1ESRLMFvleesKEnwmsms1TenhuyIA8Vlk+837qlXXn0n
	g0lftshWv+zgq1xjAeGJz3iIkPpPRACovmvlgJ5iUXMu+Y8AKmgBcLf1WjLjqdaJ09WIY828/92qr
	noDt+c+oAum1WbmC2yWvKL/AxZk29TQjJdiD56XqQV6A4OwUcVLJlgqFEPVM4w4FSXf74IMNEhDz2
	z2dPPg40ZqV1gfkaQaiBHIGZ+5Ti9Aavt1T06DRhVor8Kvm9UH7ChcETxbHsP4j96EJJYZjARI3Wh
	Ys+BVDk5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liiro-00FwSw-M3; Mon, 17 May 2021 19:25:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liirn-00FwSo-5k
 for linux-snps-arc@desiato.infradead.org; Mon, 17 May 2021 19:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tF8xzEJD9ygIIvQuzb7hQyk7B1yFEDIFbQylYokB8Pk=; b=PWdmFyuQr4XsX1DdgkdcokzroX
 6pihYD1Fux4sXpvGF5bo3vnUlDQCOqTF15WVST2zt0ng3BRoH3XCeX0iNuLO65DKDagr7NV8183Yy
 Lss14sbDe4lKuBD3yJff6HgwnejvcGcu61YNMi1PRbPQQVNq1wrwpuljTVu6scX85AD6v4zingbqO
 gVzaCaQ+m0S6cSZs2lEGZAIDpoFIils8/moWbT+Hye+6/0FUwVspPaRLE+begoZ4AFgHnHUrlWS6e
 vSQmpTZCt3c4kmLdDSW8vY3zCqZbKFHGvpegw6wqUZfUU8l1CvdYX1F84m+ra1ox1CSZxkwS/kfPA
 DKYMgT/g==;
Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liirj-00E5cM-TB
 for linux-snps-arc@lists.infradead.org; Mon, 17 May 2021 19:25:25 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1caa:dc3:ec0a:c9c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AC34113F8B6;
 Mon, 17 May 2021 21:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1621279489;
 bh=LiaWR42JZw0b4P2SMDqavPGc5ZzlP/w0mU39isi0RqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AJFP6C13NMWqKBseKOT4Ogu+YsiEk/pJFAEa7p65CE3G7AINxKUD3XoGVASyNrB8v
 QOEQrhoJtUw2tgwf2lNxshUP0kHJeoaD4WLy3jtzlOFmCUbLIxq543w8iI57w0zP59
 F2ilATYVK0MQpii9QE3sOrs2byw6Uf3YxOKQWYwLIwpO9QwHS29TGrshiON0AfVVlY
 lmS618IoOXI88tRYDoOBipnswPl8BaL441xZwrwuGgv++wtpbvkn/TEjDjZmhLToZK
 8+/S0tlBS3N4/kzyZ6hK/v/kJ+d9umRtMMePGinw/tDSQl9TulW89gAK+JxMzbvQJo
 zEedFpufSb7EA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 May 2021 21:24:36 +0200
Date: Mon, 17 May 2021 21:24:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [Buildroot] [PATCH v3 1/4] ARC: config: explicit'ify -mcpu for
 cpu selection
Message-ID: <20210517192436.GD2506@scaer>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-2-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510180049.61421-2-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_122524_113408_D453A796 
X-CRM114-Status: GOOD (  17.65  )
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

Vineet, All,

On 2021-05-10 11:00 -0700, Vineet Gupta via buildroot spake thusly:
> This helps with distinguishing the cpu at the time of config selection
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/Config.in.arc | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index f7a6d920b50d..c9a695000f2c 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -6,20 +6,20 @@ choice
>  	    Specific CPU to use
>  
>  config BR2_arc750d
> -	bool "ARC 750D"
> +	bool "ARC 750D (-mcpu=arc700)"

We are not doing this for any other architecture.

Besides, if this ever has to change, that would be two places where we'd
have to update the setting, and these prompts are just informative, so
they are prone to be missed.

It always possible to get that vaue, anyway, with:

    $ make printvars VARS=BR2_GCC_TARGET_%
    BR2_GCC_TARGET_CPU="arc700"

Regards,
Yann E. MORIN.

>  config BR2_arc770d
> -	bool "ARC 770D"
> +	bool "ARC 770D (-mcpu=arc700)"
>  
>  config BR2_archs38
> -	bool "ARC HS38"
> +	bool "ARC HS38 (-mcpu=archs)"
>  	help
>  	  Generic ARC HS capable of running Linux, i.e. with MMU,
>  	  caches and 32-bit multiplier. Also it corresponds to the
>  	  default configuration in older GNU toolchain versions.
>  
>  config BR2_archs38_64mpy
> -	bool "ARC HS38 with 64-bit mpy"
> +	bool "ARC HS38 with 64-bit mpy (-mcpu=hs38)"
>  	help
>  	  Fully featured ARC HS capable of running Linux, i.e. with
>  	  MMU, caches and 64-bit multiplier.
> @@ -28,7 +28,7 @@ config BR2_archs38_64mpy
>  	  for use this one.
>  
>  config BR2_archs38_full
> -	bool "ARC HS38 with Quad MAC & FPU"
> +	bool "ARC HS38 with Quad MAC & FPU (-mcpu=hs38_linux)"
>  	help
>  	  Fully featured ARC HS with additional support for
>  	   - Dual- and quad multiply and MC oprations
> @@ -38,12 +38,12 @@ config BR2_archs38_full
>  	  ARChitect.
>  
>  config BR2_archs4x_rel31
> -	bool "ARC HS48 rel 31"
> +	bool "ARC HS48 rel 31  (-mcpu=hs4x_rel31)"
>  	help
>  	   Build for HS48 release 3.1
>  
>  config BR2_archs4x
> -	bool "ARC HS48"
> +	bool "ARC HS48 (-mcpu=hs4x)"
>  	help
>  	   Latest release of HS48 processor
>  	   - Dual and Quad multiply and MAC operations
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
