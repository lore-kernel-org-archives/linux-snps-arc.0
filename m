Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33014C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 14:22:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE8B164F02
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 14:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE8B164F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S8dH/PRCTcPIv5h32Tpd+23Xd8AdwnW3c/VZQfHdT+M=; b=VZ4pyz50Kx0cW3U3gjFJ7AcHt
	IYHnFWslKspEqnyxK/FT+2N+1eAqHaS/UURoVWrcCZEOQloJ0/g5bs4mc1D8PFQpu4GVFk937Pxz3
	OphqgQU2Tj+EXk94D6ZMHN9LbNxsSjlbDdNuPSahHRANzrZ1VSrx3b5JPHk8Uxgnf3aYkSc/NhgrM
	VqX1fMA1ejxKdY8gX7ZzRMXovYFfIGJzfEicm6vRStJNLx4BA26ff5+snbR/tW7qrdnjOOSt5YQp4
	cgFM6yPBI7YVd7GbJXoOe7wskB0nAyPV6giqRYNMIxdcDNa22xHQu1Zavsavn2rL6/uD8e/SaYdjr
	IA8WpOMtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHos6-008sss-7k; Thu, 04 Mar 2021 14:22:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHos0-008srU-SA
 for linux-snps-arc@lists.infradead.org; Thu, 04 Mar 2021 14:22:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u14so27860108wri.3
 for <linux-snps-arc@lists.infradead.org>; Thu, 04 Mar 2021 06:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VnG4tu4VgSlUkh5WwEH2QyWi6B9WiJssSBKAtiBStGM=;
 b=iuycZa+F+vtISNTPXCWqu6NyoSjc78qNC7lctybLJBDC8RepTQibIElKvgblS1lt1R
 fShdhag9+n7w3EoTkk0cDWiJss3Y+TVo2uzl3ddLcVYAXw0b/366cKhKRMC7HgaX+K8X
 CeHQ3/A3l2Ke+SvG70chT4E8BAJTqa4L8MkbCEEbDnvKyDrJSwb6e0uNXkK7IZ7vZ8z7
 ZwxoM3btIU5GIP1JQtqI7ALH+/u+WAOPlmElTGO5EcYa8bYJd55pC+z+XsvuvneQdFrG
 dSZND5WVL4lVOrtxMr7zGzGg9o+4VK9xBNoesn/bgCTpOn9w8uPc8FPCsR67wzregTfS
 V7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VnG4tu4VgSlUkh5WwEH2QyWi6B9WiJssSBKAtiBStGM=;
 b=A5iISivPLfXLZvgO7RbLl7Stq1ovgw/xEiWWpKkyOBQ58IEnjlBXx0Pn5X1isd5hl6
 ge3wyVeB4Lwqf/KZ4fqhj3IdZ5L/CZrzHmh9zvI03TgPjwhplSxUPoS7jUvcpo9UDZiZ
 iPcFRzD9JRqdYcK7cE/hycYJP+M6VHVAoDNL357eivSNkB19snPKLvsflkOT2DXXO1Wm
 0rHjdRulD9WGCMw3nVrVqwYrncBUDmsw7ckTvDANWuZ7ElXTNQBa6mtAtYxjGQk6tPGG
 MMXGebU9bhOyM4QUz1flh9tt69TcnUfAwz2Yl4Za8YqK1PtgEJP6rwgaKcp0DweVFZyn
 wEiA==
X-Gm-Message-State: AOAM53290TMUfM/v2lInU//Dih2W1T7bStlR6GSpFvsz7h+TxYkagetb
 7p9f7E405F2m4C7zhp/y0H8=
X-Google-Smtp-Source: ABdhPJzTdLStXYk0J9Ktu6ilg4ACfPbm1fzFL0y0p4yBuqDQhZH7uMsAbQ+g0rVak6P7DJ5H15cnKA==
X-Received: by 2002:a5d:4743:: with SMTP id o3mr4512397wrs.108.1614867746226; 
 Thu, 04 Mar 2021 06:22:26 -0800 (PST)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id h20sm10121146wmb.1.2021.03.04.06.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 06:22:25 -0800 (PST)
Subject: Re: [PATCH 10/11] pragma once: delete few backslashes
To: Alexey Dobriyan <adobriyan@gmail.com>, torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 vgupta@synopsys.com, linux-snps-arc@lists.infradead.org, jiri@nvidia.com,
 idosch@nvidia.com, netdev@vger.kernel.org, Jason@zx2c4.com,
 mchehab@kernel.org
References: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
 <YDvNSg9OPv7JqfRS@localhost.localdomain>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <91f4ba8b-38a0-dfcf-1fec-31410a802f5f@gmail.com>
Date: Thu, 4 Mar 2021 14:22:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YDvNSg9OPv7JqfRS@localhost.localdomain>
Content-Language: en-GB
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

On 28/02/2021 17:05, Alexey Dobriyan wrote:
> From 251ca5673886b5bb0a42004944290b9d2b267a4a Mon Sep 17 00:00:00 2001
> From: Alexey Dobriyan <adobriyan@gmail.com>
> Date: Fri, 19 Feb 2021 13:37:24 +0300
> Subject: [PATCH 10/11] pragma once: delete few backslashes
> 
> Some macros contain one backslash too many and end up being the last
> macro in a header file. When #pragma once conversion script truncates
> the last #endif and whitespace before it, such backslash triggers
> a warning about "OMG file ends up in a backslash-newline".
> 
> Needless to say I don't want to handle another case in my script,
> so delete useless backslashes instead.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  arch/arc/include/asm/cacheflush.h          | 2 +-
>  drivers/net/ethernet/mellanox/mlxsw/item.h | 2 +-
>  include/linux/once.h                       | 2 +-
>  include/media/drv-intf/exynos-fimc.h       | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
> index e201b4b1655a..46704c341b17 100644
> --- a/arch/arc/include/asm/cacheflush.h
> +++ b/arch/arc/include/asm/cacheflush.h
> @@ -112,6 +112,6 @@ do {									\
>  } while (0)
>  
>  #define copy_from_user_page(vma, page, vaddr, dst, src, len)		\
> -	memcpy(dst, src, len);						\
> +	memcpy(dst, src, len)
>  This changebar also removes a semicolon.
It looks plausibly correct, but the commit message ought to mention it.

-ed

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
