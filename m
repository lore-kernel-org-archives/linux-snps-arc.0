Return-Path: <SRS0=Y0WM=AO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54CFC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 17:38:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F9C2084C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 17:38:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MgJAGHYo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tmk7tTdQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F9C2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vHcXRXA4+tUh5yALUoqJkh6dCnoPNzM5oVXocVMeR5E=; b=MgJAGHYoXMlCSIOtqV53e2Zfs
	d4Cz/gChATQNj47SGGNLhkpHpJ4YyWpU2iKXhaux/SmZDzfWjvKgaWeiVcXUlXn6bllHKEF26I3xg
	Yyva8NH6MRinR0+dTAoAyV2IuWlOSzZkzvYYVO8e9ndFITteZ3VBKbuSumEunBMPjNvAxgmVUu77l
	sZCCBSbD/oY/SjzaKogFbnjLu81Y+TU912XKgaKNBw2SC8cj5hMIcq6g+TMY6dxJn9pAqDyDS0AEz
	EcFtpchrxCoWDkIT4IIISn+0yQ+oaOJjXTnQak7iVff4FhbmWPDh/aRFxzxtBiKr2ws2d+8ne8TzH
	S52+WmNKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrPe7-0001Vz-15; Fri, 03 Jul 2020 17:38:43 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrPe4-0001VF-K9
 for linux-snps-arc@lists.infradead.org; Fri, 03 Jul 2020 17:38:41 +0000
Received: by mail-qt1-x842.google.com with SMTP id j10so24377645qtq.11
 for <linux-snps-arc@lists.infradead.org>; Fri, 03 Jul 2020 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v++m5JBC+M9T3f9r2HI29LQqG6HL0NjkaA4gmFeh4vE=;
 b=Tmk7tTdQ8n5UPOzDlYEa4B8oSZmeao4GAN+tNIodi02CK0ajaH/t6mQxhg/sTXe/gq
 dwzdWqP8PKPAIXpcqWRxZ1yzIUawGm/8sVb/oz9RXxN2TMPW45f7CA896uP18n8vz4Mm
 8ZTsziAjzDeyjoCQYx9SgVDQ5QDkHaYwhhyDJo06fOBmq6sHC2jBKqlc6Ripwj8/AIRn
 Pq73eUj+7682DmUxLNiSEL3DlvqDiZomaJPi6wKpjBTD/du8J14/YTbHjKhyVoXlQotp
 fa+fq1R7F+l51nAr8R+p/TmOP6aJ8lnltDMG1ATDaMng3sCAs5PfeKh9adfoLjd9g1T0
 wqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v++m5JBC+M9T3f9r2HI29LQqG6HL0NjkaA4gmFeh4vE=;
 b=EEnDHSVyUNSWlXX7lmpY32Sh4Hz+p1u86qD4TCRqOicShpKaM2/c5CBIG8WyDBUkpP
 aLu7to+TWT/9++yNJKZtrsTnYLHQ8E3CG6w4SRO2XWzHTneBzTXnr6F7SKLettv8m9++
 44pEFgeJjan4p/gqQyU7foe+n8qXdmXycGv4IbEd31wsS3dvka/EURdkP7VBf9JiIx+D
 fW9rqHPkEM+p0CD/ma+i5VMGs/YUOlylFoQT/E7vFctCgFETtrSCQmxmKpmH3+9VTZWp
 G3P/FHyHUyQHsIUpl9Pz6PBSndX/E5JP8KOFLmadbeWL1nzDnHD6mDsUcdjoa32Jj8Aw
 tcXg==
X-Gm-Message-State: AOAM531gW+dw3ZXexkxGbDT3rs5g2kuSxUu0Tu5eDPjP6tPECWZVX3lQ
 71fkGHIzV6DYDzJxBuR73VS2mEB0i5M=
X-Google-Smtp-Source: ABdhPJxr/2ZFELV8duPzlEd5YuLdgvKjeDNWOMaMQdYbRtWqUZy8erPxB3rTrzfpRc0dHAPo9p1vVQ==
X-Received: by 2002:ac8:7343:: with SMTP id q3mr39641129qtp.165.1593797918800; 
 Fri, 03 Jul 2020 10:38:38 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id m7sm11696022qti.6.2020.07.03.10.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 10:38:38 -0700 (PDT)
Subject: Re: [PATCH v7 13/13] Documentation for ARC port
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <20200615201441.31820-14-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7013feb9-4d86-97d2-6e19-8e5b83400f54@linaro.org>
Date: Fri, 3 Jul 2020 14:38:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615201441.31820-14-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_133840_694452_266E3277 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 15/06/2020 17:14, Vineet Gupta via Libc-alpha wrote:
> ---
>  NEWS                | 11 +++++++++++
>  README              |  1 +
>  manual/install.texi |  4 ++++

LGTM, thanks.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

>  3 files changed, 16 insertions(+)
> 
> diff --git a/NEWS b/NEWS
> index a660fc59a89e..db65fea8b6ec 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -15,6 +15,17 @@ Major new features:
>  
>  * New locale added: ckb_IQ (Kurdish/Sorani spoken in Iraq)
>  
> +* Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been
> +  added. This port requires at least binutils-2.32, gcc-8.3 and Linux-5.1.
> +  Three ABIs are supported:
> +
> +     - arc-linux-gnu
> +     - arc-linux-gnuhf
> +     - arceb-linux-gnu
> +
> +  The arc* ABI is little-endian while arceb is big-endian. All ABIs use
> +  64-bit time (y2038 safe) and 64-bit file offsets (LFS default).
> +
>  * The GNU C Library now loads audit modules listed in the DT_AUDIT and
>    DT_DEPAUDIT dynamic section entries of the main executable.
>  

Ok.

> diff --git a/README b/README
> index 31c5da0405bd..903f07e4840a 100644
> --- a/README
> +++ b/README
> @@ -24,6 +24,7 @@ The GNU C Library supports these configurations for using Linux kernels:
>  
>  	aarch64*-*-linux-gnu
>  	alpha*-*-linux-gnu
> +	arc*-*-linux-gnu
>  	arm-*-linux-gnueabi
>  	csky-*-linux-gnuabiv2
>  	hppa-*-linux-gnu

Ok.

> diff --git a/manual/install.texi b/manual/install.texi
> index c1e49a94fed3..74cb90a91331 100644
> --- a/manual/install.texi
> +++ b/manual/install.texi
> @@ -522,6 +522,8 @@ Library with support for IEEE long double.
>  @c powerpc64le performs an autoconf test to verify the compiler compiles with
>  @c commands like "$CC -c foo.c -mabi=ibmlongdouble -mlong-double-128".
>  
> +For ARC architecture builds, GCC 8.3 or higher is needed.
> +
>  For multi-arch support it is recommended to use a GCC which has been built with
>  support for GNU indirect functions.  This ensures that correct debugging
>  information is generated for functions selected by IFUNC resolvers.  This
> @@ -547,6 +549,8 @@ For PowerPC 64-bits little-endian (powerpc64le), @command{objcopy} is required
>  to support @option{--update-section}.  This option requires binutils 2.26 or
>  newer.
>  
> +ARC architecture needs @code{binutils} 2.32 or higher for TLS related fixes.
> +
>  @item
>  GNU @code{texinfo} 4.7 or later
>  
> 

Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
