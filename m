Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE29FC433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 18:36:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738D22080C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 18:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1nNMD16M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gK/Rrci2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 738D22080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fftQGjE79dcpfqNrkwKHSjh/AZaEMbj/xlZ7f4YUvG4=; b=1nNMD16M+M8CVtpi1HprBrbMp
	GXiE2tIj+lf7siaf4enGYU2K6d9aB5fl9EGA8jCgsX+vfWbAxTBp/IVoDHb0jSzvzPvIadL6bO2ne
	0Ir8/t4F7+aZDsa2RmBGL+MsXq89tSoVqF+q2H4OfgHZo8lD7yWLMqis4veVHoy47lmIXKAJ0M38n
	WS/hw2/J85VYx/w3hkBBSQaYoILRjk7ZCg/q+fx0eoPn5P2bA1Td+Q1JeegZjn3hxVx5pdlTKKA6A
	wyD+JPIMhZOK3+WMq6PPOoUl/+zsHDjZ3U0uMONngmUmq96ISNOlyIHCO/bhzxGG9O6WxQ/6SiYPl
	3pBHI/ABQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG4xb-0001Ds-S8; Wed, 09 Sep 2020 18:36:47 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG4xY-0001CE-Nv
 for linux-snps-arc@lists.infradead.org; Wed, 09 Sep 2020 18:36:46 +0000
Received: by mail-qv1-xf43.google.com with SMTP id p15so1514410qvk.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 09 Sep 2020 11:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JEe9MrNRGHX5HjQlerPQwEU6mRb0IR/0TY/anbYs8nU=;
 b=gK/Rrci2MRir5//dMezVbui5SsDTi6z0ErR5YDuOR8Z7Pd6kR0k1sE89t1kukhwACp
 cRQpoYhlaWNfc41Hx18ec1xF3Z+HPV1pe6y5LLf7YY8XQIHfQh1vvK6JkKSACQVjkgvv
 7NMctrJSnKWZhg3r25w8rahmxbT3noE14VbgYNzJpuE0LuXV9jO5plmOjl9t0MdWZFRm
 IGL8VWlU/0sZx6gVGBwYM0bXINBP7sCao/ktGm1gP6i8PU1+2D9nCMlHgZdP0SdP6qn9
 IWAWbolXAmpv9XvH/nJ0zjL9oL7TOjweZSyfczMhky2XBH24lnUC8LzUfdTLDX2XNn7G
 h+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JEe9MrNRGHX5HjQlerPQwEU6mRb0IR/0TY/anbYs8nU=;
 b=YfdAU8ZKgH+JSGfdcq7Nl///5Caik3aiCNGqVVqya8Hqm4mBTVspRjUq4mVuerh5HK
 Wpobl0R2YUlAQiLL8U+bou/TPaYKgtPcQSfnpf7lYOClF2guCR341LD6NJk2cj1/1Omu
 PJl7HOgR2RFXrKc91g+MbEIwWh5Z7aPTChNVa0PPzIrAMIlGUVKja9VdhU7kd32UeKHI
 apfMfHTErJkC51nHyovQXB8CHWxCM1MBWwwM7O0bbDYlTQLC05ZoLR4JXUFcaIAClrDZ
 8C6Hs/vzLDhDGjbDWoJ5JgL58NE3qpg6m9r2EwjB6wlj8yikfKXDDmmeHqYHWdnxk/ZW
 74aw==
X-Gm-Message-State: AOAM530xn4wTODFWUzdVDJYXJ/yuWvPVOgGYjJowiKtMWFyoFhn3VJi4
 a+vhHhuMA4N9WTFUw5z+zcTmhsiPXjlAPA==
X-Google-Smtp-Source: ABdhPJxUHzQamCDCRDppt1OEgWM5BAbUliMfnIpfyl4Xvm4v9gtAsdT0swZmvFekFQ97anPg+4YeIg==
X-Received: by 2002:a0c:b4c9:: with SMTP id h9mr5243922qvf.63.1599676600312;
 Wed, 09 Sep 2020 11:36:40 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id 8sm3417523qkc.100.2020.09.09.11.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 11:36:39 -0700 (PDT)
Subject: Re: [PATCH] Remove STATFS_IS_STATFS64 conditional as it is zero in
 all ports
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200909024826.3377653-1-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fee85a94-c54e-96c8-ca93-2d57d40ab4a1@linaro.org>
Date: Wed, 9 Sep 2020 15:36:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909024826.3377653-1-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_143645_044308_26173BFD 
X-CRM114-Status: GOOD (  19.12  )
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



On 08/09/2020 23:48, Vineet Gupta via Libc-alpha wrote:
> From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
> 
> This seems to be dead code, so remove it.

It could be useful for a possible statfs/statfs64 consolidation, but indeed
it is dead code now.

LGTM, thanks.

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>


> ---
>  sysdeps/unix/sysv/linux/alpha/kernel_stat.h       |  1 -
>  sysdeps/unix/sysv/linux/fstatfs64.c               | 14 --------------
>  sysdeps/unix/sysv/linux/generic/kernel_stat.h     |  2 --
>  .../unix/sysv/linux/generic/wordsize-32/fstatfs.c |  2 --
>  .../unix/sysv/linux/generic/wordsize-32/statfs.c  |  2 --
>  sysdeps/unix/sysv/linux/hppa/kernel_stat.h        |  1 -
>  sysdeps/unix/sysv/linux/ia64/kernel_stat.h        |  1 -
>  sysdeps/unix/sysv/linux/kernel_stat.h             |  1 -
>  sysdeps/unix/sysv/linux/microblaze/kernel_stat.h  |  1 -
>  sysdeps/unix/sysv/linux/mips/kernel_stat.h        |  1 -
>  .../sysv/linux/powerpc/powerpc32/kernel_stat.h    |  1 -
>  .../sysv/linux/powerpc/powerpc64/kernel_stat.h    |  1 -
>  .../unix/sysv/linux/s390/s390-64/kernel_stat.h    |  1 -
>  .../unix/sysv/linux/sparc/sparc32/kernel_stat.h   |  1 -
>  .../unix/sysv/linux/sparc/sparc64/kernel_stat.h   |  1 -
>  sysdeps/unix/sysv/linux/statfs64.c                | 15 ---------------
>  sysdeps/unix/sysv/linux/x86_64/kernel_stat.h      |  1 -
>  17 files changed, 47 deletions(-)
> 
> diff --git a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
> index d637e099cfe4..670841140765 100644
> --- a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
> @@ -86,4 +86,3 @@ struct glibc21_stat
>    };
>  
>  #define XSTAT_IS_XSTAT64 1
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/fstatfs64.c b/sysdeps/unix/sysv/linux/fstatfs64.c
> index 9d22fa228fa5..4a339b548aa7 100644
> --- a/sysdeps/unix/sysv/linux/fstatfs64.c
> +++ b/sysdeps/unix/sysv/linux/fstatfs64.c
> @@ -22,15 +22,6 @@
>  #include <sysdep.h>
>  #include <kernel_stat.h>
>  
> -/* Hide the prototypes for __fstatfs and fstatfs so that GCC will not
> -   complain about the different function signatures if they are aliased
> -   to  __fstat64.  If STATFS_IS_STATFS64 is not zero then the statfs and
> -   statfs64 structures have an identical layout but different type names.  */
> -
> -#if STATFS_IS_STATFS64
> -# define __fstatfs __fstatfs_disable
> -# define fstatfs fstatfs_disable
> -#endif
>  #include <sys/statfs.h>
>  
>  #include <kernel-features.h>
> @@ -85,8 +76,3 @@ weak_alias (__fstatfs64, fstatfs64)
>  
>  #undef __fstatfs
>  #undef fstatfs
> -
> -#if STATFS_IS_STATFS64
> -weak_alias (__fstatfs64, __fstatfs)
> -weak_alias (__fstatfs64, fstatfs)
> -#endif
> diff --git a/sysdeps/unix/sysv/linux/generic/kernel_stat.h b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
> index 2eed3596c0ed..5a600f188320 100644
> --- a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
> @@ -26,5 +26,3 @@
>  #else
>  # define XSTAT_IS_XSTAT64 0
>  #endif
> -
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
> index 93d9d94a0a61..bacc1543013a 100644
> --- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
> +++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
> @@ -21,7 +21,6 @@
>  #include <kernel_stat.h>
>  #include <stddef.h>
>  
> -#if !STATFS_IS_STATFS64
>  #include "overflow.h"
>  
>  /* Return information about the filesystem on which FD resides.  */
> @@ -32,4 +31,3 @@ __fstatfs (int fd, struct statfs *buf)
>    return rc ?: statfs_overflow (buf);
>  }
>  weak_alias (__fstatfs, fstatfs)
> -#endif
> diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
> index 7421501b4a40..a678e96058ce 100644
> --- a/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
> +++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
> @@ -21,7 +21,6 @@
>  #include <kernel_stat.h>
>  #include <stddef.h>
>  
> -#if !STATFS_IS_STATFS64
>  #include "overflow.h"
>  
>  /* Return information about the filesystem on which FILE resides.  */
> @@ -33,4 +32,3 @@ __statfs (const char *file, struct statfs *buf)
>  }
>  libc_hidden_def (__statfs)
>  weak_alias (__statfs, statfs)
> -#endif
> diff --git a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
> index a3ac53a1ef2f..9ffa3ba638ea 100644
> --- a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
> @@ -31,4 +31,3 @@ struct kernel_stat {
>  #define _HAVE_STAT64_NSEC
>  
>  #define XSTAT_IS_XSTAT64 0
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
> index b38bf741d37b..da8e2a91eff7 100644
> --- a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
> @@ -18,4 +18,3 @@
>  
>  #define STAT_IS_KERNEL_STAT 1
>  #define XSTAT_IS_XSTAT64 1
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/kernel_stat.h b/sysdeps/unix/sysv/linux/kernel_stat.h
> index eecc962de390..4354d14f76e9 100644
> --- a/sysdeps/unix/sysv/linux/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/kernel_stat.h
> @@ -35,4 +35,3 @@ struct kernel_stat
>  #define _HAVE_STAT64_NSEC
>  
>  #define XSTAT_IS_XSTAT64 0
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
> index 765e0dca6763..159870d9d5a7 100644
> --- a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
> @@ -49,4 +49,3 @@ struct kernel_stat
>  };
>  
>  #define XSTAT_IS_XSTAT64 0
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/mips/kernel_stat.h b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
> index 388df1bfffec..a41d15f95cfa 100644
> --- a/sysdeps/unix/sysv/linux/mips/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
> @@ -57,4 +57,3 @@ struct kernel_stat
>  #endif
>  
>  #define XSTAT_IS_XSTAT64 0
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
> index c5948a4d3c1c..c28ad2dbc165 100644
> --- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
> @@ -48,4 +48,3 @@ struct kernel_stat
>  #define _HAVE_STAT64_NSEC
>  
>  #define XSTAT_IS_XSTAT64 0
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
> index 5c10da3356f2..b764efe1a625 100644
> --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
> @@ -18,4 +18,3 @@
>  
>  #define STAT_IS_KERNEL_STAT 1
>  #define XSTAT_IS_XSTAT64 1
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
> index b38bf741d37b..da8e2a91eff7 100644
> --- a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
> @@ -18,4 +18,3 @@
>  
>  #define STAT_IS_KERNEL_STAT 1
>  #define XSTAT_IS_XSTAT64 1
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
> index a4416009f1bc..eb6023692955 100644
> --- a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
> @@ -32,4 +32,3 @@ struct kernel_stat
>  #define _HAVE_STAT64_NSEC
>  
>  #define XSTAT_IS_XSTAT64 0
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
> index 30afb553b9b8..2a26a78d9c19 100644
> --- a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
> @@ -45,4 +45,3 @@ struct kernel_stat64
>    };
>  
>  #define XSTAT_IS_XSTAT64 1
> -#define STATFS_IS_STATFS64 0
> diff --git a/sysdeps/unix/sysv/linux/statfs64.c b/sysdeps/unix/sysv/linux/statfs64.c
> index c9411286375b..153654ac318f 100644
> --- a/sysdeps/unix/sysv/linux/statfs64.c
> +++ b/sysdeps/unix/sysv/linux/statfs64.c
> @@ -22,15 +22,6 @@
>  #include <sysdep.h>
>  #include <kernel_stat.h>
>  
> -/* Hide the prototypes for __statfs and statfs so that GCC will not
> -   complain about the different function signatures if they are aliased
> -   to  __stat64.  If STATFS_IS_STATFS64 is not zero then the statfs and
> -   statfs64 structures have an identical layout but different type names.  */
> -
> -#if STATFS_IS_STATFS64
> -# define __statfs __statfs_disable
> -# define statfs statfs_disable
> -#endif
>  #include <sys/statfs.h>
>  
>  #include <kernel-features.h>
> @@ -87,9 +78,3 @@ weak_alias (__statfs64, statfs64)
>  
>  #undef __statfs
>  #undef statfs
> -
> -#if STATFS_IS_STATFS64
> -weak_alias (__statfs64, __statfs)
> -weak_alias (__statfs64, statfs)
> -libc_hidden_ver (__statfs64, __statfs)
> -#endif
> diff --git a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
> index b38bf741d37b..da8e2a91eff7 100644
> --- a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
> +++ b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
> @@ -18,4 +18,3 @@
>  
>  #define STAT_IS_KERNEL_STAT 1
>  #define XSTAT_IS_XSTAT64 1
> -#define STATFS_IS_STATFS64 0
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
