Return-Path: <SRS0=Q4Kc=GT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED2FC433DB
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:38:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6B42311F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6B42311F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z+nhoNCE3X1psPjGKHA052ztucYcP+JR3kNEqh/EUng=; b=HgVvxRcDGv2ea2cesFSqRoEyI
	k3pIqy3CCtZb1kUAKPdJ/Xgd35pxE2Ou28cbvGpHOYN0lZQHX0zdjnyDj0AMrAqvWaMxQpKCuwivx
	J8Ez33I+P8np1Qle1RUKSDLWkBnlK0YAa8HFO6T04kxV3QmIGW7H+qYi+o9FgfzCJjPsVy2qGLupI
	qzaayHjgXS317AzdLxHmEfcByaHleFt5MIF1/bwsgK04tl3+WOVQx4de9h6Rs+mV9YHVbGBcQ+aaD
	gkS5u1ecfJ7aVcjznN60eJjS2RaH5rVTOvtKMwgBZmlMNeW8/3yi2iv0gBAsT7yKAKAG6Jz+PTR7m
	81KVEOYrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0neT-000693-Gu; Sat, 16 Jan 2021 15:38:09 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0neQ-00068E-Uu
 for linux-snps-arc@lists.infradead.org; Sat, 16 Jan 2021 15:38:08 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1021:5979:3424:ca69])
 (Authenticated sender: yann.morin.1998)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BFA475FF95;
 Sat, 16 Jan 2021 16:37:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jan 2021 16:37:55 +0100
Date: Sat, 16 Jan 2021 16:37:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 3/4] configs/snps_archs38_hsdk_defconfig:
 switch to glibc hard-float
Message-ID: <20210116153755.GL2375@scaer>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
 <20210115200319.4139041-4-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115200319.4139041-4-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_103807_169362_711AD4DE 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Vineet, All,

On 2021-01-15 12:03 -0800, Vineet Gupta spake thusly:
> We are no longer actively working on uClibc and hard-float support is
> pretty stable, so make that default for HSDK boards
> 
> The hard-float setting is a bit convulated since current ARC gcc lacks
> --with-fpu - so this is done with BR2_TARGET_OPTIMIZATION
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

I split that patch in two:
  - one commit to switch to glibc,
  - one commit to enable hard-float

Since the hard-float, as you noticed, is using a non-conventional way to
passit, so if it truns out to be causing issues, it is easier to revert
if it is in a commit of its own.

Regards,
Yann E. MORIN.

> ---
>  configs/snps_archs38_hsdk_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
> index b8fd35636000..69d0b1936b3a 100644
> --- a/configs/snps_archs38_hsdk_defconfig
> +++ b/configs/snps_archs38_hsdk_defconfig
> @@ -1,6 +1,9 @@
>  BR2_arcle=y
>  BR2_archs38_full=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
> +BR2_PACKAGE_GLIBC_UTILS=y
> +BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
>  BR2_TARGET_GENERIC_HOSTNAME="hsdk"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
>  BR2_SYSTEM_DHCP="eth0"
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
