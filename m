Return-Path: <SRS0=nWz8=IB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C21AC433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Mar 2021 19:26:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A239364EBB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Mar 2021 19:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A239364EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+kVS4IolbOHYsY6aOlKm4L92B/ZPSztgCSBAN5CBHRY=; b=RrqLCh06HR0U9YpWCAQxJIdCJ
	MLT3AZloiWb++HkS8DzgNp5sSpiQLjpDu667YpWWftyQyFmOFKMxKeMOYMkAHDwc6SgyG/Ui+fm2N
	LLTUC7OosmVkxkaHWQIcdfuAblLsLgMtL2b3sT724mdVzxyNfRYzF0LushoA6+RudBBmWbF+TvHmv
	TD9jVgHbu18wpwmMMna//n/KReGQOX9IG15d1yQufx7lG34qrUBAAFoDh4stlsIRJyBph89UdSHOi
	einH9XyM11J5xSJxTkpk/mSEzidiGkXR9TSiYlTKcuBlvcv2RunhzX1V47q8EROstqq0zeF9psAZg
	CfpVPlp1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHX8k-006D4Y-Ez; Wed, 03 Mar 2021 19:26:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT3Q-005I3M-J5
 for linux-snps-arc@desiato.infradead.org; Wed, 03 Mar 2021 15:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Pm2aM6FEgY+3tAqdPcwvE3RwWA9gxzo2YpOjuF17cv8=; b=S7e1rHMPdp/7zT2JWZoLyO52IH
 2GwroCIoBpMW3wsDvNobRjZtSklOpvipAyXYP01FOTILGBe+3OQ00SJrTvJBC8N+wi7RrG5SrjYT8
 W1Duqv88+FoeuGZGm63Ze8rBeHlg/QJKwKdJVv/gzbndfwWooGCrI4bmwe895zmJh8tDy7vwufrpe
 iIRdK5/TC52X21q9t3Jd9X9OQN2dYwQrbUUfs3s1U2endqXviLdUGfbj8Y5GDis10fczorTjIloj+
 /f1tIG2uo1t409Kx9iWiYRP9OTEXs6CbWOWXnPp7IGN4Phc3HWcwQeRFbWsMcpIZgszL/b2d60wdY
 iwDXnxIw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHAGl-0007Fn-O3
 for linux-snps-arc@lists.infradead.org; Tue, 02 Mar 2021 19:01:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id a24so12548322plm.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Mar 2021 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pm2aM6FEgY+3tAqdPcwvE3RwWA9gxzo2YpOjuF17cv8=;
 b=AWkypi6kEjBrXnQanyv1xj1pAvw7NlbLFHxY6hoohSjAaPeKGWIFd3M81Sag8pdaoP
 +JPVudjBLkVHVlG+41WBpr1mAUV6lkiBp7iT3t6w4tww08wHWhNyK64lATI/D7n9+vJw
 bnF2U78ssFQ9aCHREawwYrs9s8u4debDn/V6z+uFBNNkupCO1Hyionu886RnqIlACM49
 DN41Zkwo7XpblLXpV4IBdJ9J7wKMHFhD8VZgYvnd1y9hpQnUjLypc/VnLVavowuLW0J0
 BnpjwTeHpv3CSASet/dblY2H7nEeeoEH9T2z8v6SohRwU1CueqpUGJmvoOSpmhwjXBW7
 9qOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Pm2aM6FEgY+3tAqdPcwvE3RwWA9gxzo2YpOjuF17cv8=;
 b=qAnjjHFUWH3rZcK8m45AxGedpa27co4HlxK2MV1E3wCmWWF1He0qTQTqlJCIhxAMzl
 UGfd0oCHeJb3R3ZKZxEPMSIsFdnlruteFg8lvReWUPbLpcWszGHFrxGDB6TFnGxekaac
 wBTuUpPU+Ib3HfS+Pprkx9HwXdsSYGe6rIO46zdRUOgbFZtAnFpi8PAt1NVTnSUWt3aP
 bSo3sr2MHhkVpsLLBFOmfp0E7IFkAryZb1UyG2y/NoIu66pi6ZExhtTEM8UQ1CmzF1uj
 uEMK7RsoMFKUTbhXaxX8ezVOeIiis+53z2P2umEx8LT5AMx0ek2zxSquYAMpTL6ULrCq
 MFVA==
X-Gm-Message-State: AOAM530b1PqbSXalpt3PfGzNaUjZzQYSpBaW8JuuEZZEkTAyyFmDiDvF
 dXpU2LdIxuGEQBTFo5HqT48=
X-Google-Smtp-Source: ABdhPJw6tjn8/TxNf1rBIHrhfEfbfG5tHMVi2iYMOvI69cprxwH+TD8cO83WIZRUx4dqD3JFR7WXMg==
X-Received: by 2002:a17:90a:a106:: with SMTP id
 s6mr4897313pjp.146.1614711613646; 
 Tue, 02 Mar 2021 11:00:13 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id o5sm4146300pjq.57.2021.03.02.11.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 11:00:13 -0800 (PST)
Subject: Re: [PATCH 10/11] pragma once: delete few backslashes
To: Alexey Dobriyan <adobriyan@gmail.com>, torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-snps-arc@lists.infradead.org, jiri@nvidia.com, idosch@nvidia.com,
 netdev@vger.kernel.org, Jason@zx2c4.com, mchehab@kernel.org
Newsgroups: gmane.linux.network,gmane.linux.kernel,gmane.linux.kernel.arc
References: <YDvLYzsGu+l1pQ2y@localhost.localdomain>
 <YDvNSg9OPv7JqfRS@localhost.localdomain>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <5783abae-c7af-0e82-8f28-09f30ff67904@synopsys.com>
Date: Tue, 2 Mar 2021 11:00:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDvNSg9OPv7JqfRS@localhost.localdomain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_190122_506016_EBCBB40D 
X-CRM114-Status: GOOD (  16.77  )
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

On 2/28/21 9:05 AM, Alexey Dobriyan wrote:
>  From 251ca5673886b5bb0a42004944290b9d2b267a4a Mon Sep 17 00:00:00 2001
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

Acked-by: Vineet Gupta <vgupta@synopsys.com>   #arch/arc bits

Thx,
-Vineet

> ---
>   arch/arc/include/asm/cacheflush.h          | 2 +-
>   drivers/net/ethernet/mellanox/mlxsw/item.h | 2 +-
>   include/linux/once.h                       | 2 +-
>   include/media/drv-intf/exynos-fimc.h       | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/cacheflush.h b/arch/arc/include/asm/cacheflush.h
> index e201b4b1655a..46704c341b17 100644
> --- a/arch/arc/include/asm/cacheflush.h
> +++ b/arch/arc/include/asm/cacheflush.h
> @@ -112,6 +112,6 @@ do {									\
>   } while (0)
>   
>   #define copy_from_user_page(vma, page, vaddr, dst, src, len)		\
> -	memcpy(dst, src, len);						\
> +	memcpy(dst, src, len)
>   
>   #endif
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/item.h b/drivers/net/ethernet/mellanox/mlxsw/item.h
> index e92cadc98128..cc0133401dd1 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/item.h
> +++ b/drivers/net/ethernet/mellanox/mlxsw/item.h
> @@ -504,6 +504,6 @@ mlxsw_##_type##_##_cname##_##_iname##_set(char *buf, u16 index, u8 val)		\
>   	return __mlxsw_item_bit_array_set(buf,					\
>   					  &__ITEM_NAME(_type, _cname, _iname),	\
>   					  index, val);				\
> -}										\
> +}
>   
>   #endif
> diff --git a/include/linux/once.h b/include/linux/once.h
> index 9225ee6d96c7..0af450ff94a5 100644
> --- a/include/linux/once.h
> +++ b/include/linux/once.h
> @@ -55,6 +55,6 @@ void __do_once_done(bool *done, struct static_key_true *once_key,
>   #define get_random_once(buf, nbytes)					     \
>   	DO_ONCE(get_random_bytes, (buf), (nbytes))
>   #define get_random_once_wait(buf, nbytes)                                    \
> -	DO_ONCE(get_random_bytes_wait, (buf), (nbytes))                      \
> +	DO_ONCE(get_random_bytes_wait, (buf), (nbytes))
>   
>   #endif /* _LINUX_ONCE_H */
> diff --git a/include/media/drv-intf/exynos-fimc.h b/include/media/drv-intf/exynos-fimc.h
> index 6b9ef631d6bb..6c5fbdacf4b5 100644
> --- a/include/media/drv-intf/exynos-fimc.h
> +++ b/include/media/drv-intf/exynos-fimc.h
> @@ -152,6 +152,6 @@ static inline struct exynos_video_entity *vdev_to_exynos_video_entity(
>   #define fimc_pipeline_call(ent, op, args...)				  \
>   	((!(ent) || !(ent)->pipe) ? -ENOENT : \
>   	(((ent)->pipe->ops && (ent)->pipe->ops->op) ? \
> -	(ent)->pipe->ops->op(((ent)->pipe), ##args) : -ENOIOCTLCMD))	  \
> +	(ent)->pipe->ops->op(((ent)->pipe), ##args) : -ENOIOCTLCMD))
>   
>   #endif /* S5P_FIMC_H_ */
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
