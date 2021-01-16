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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1B1C433DB
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:40:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D6A20449
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D6A20449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RGD9blSpXh0EKsUsMb8IvJLuimu8PWHpzb2ANoic3No=; b=3OnFeqLVTukJ6ikPmiXX+suF3
	UiJsQfANL9drSx5mgblBugpAIHBaLyikO7B5BbpYhUAiXuBbsRXYiczPsnmpT2PZSm/cOfaJt5ShC
	DR4yemHqQ7Gancj/uRh8hZrL+c6pybfkgzLUmxhIsjiZ/KKKNpxgbDPhydE+wJd55/h+PP1ozTL9I
	kHg90Egri9OH0Mp9VnmsVyZrjpXdeAwOsimLJ0Q5Oaik0Rgcern4yRloEe/zKFR8+KUwtzlzRAde/
	EJycGDjiXlcsmDYDykFVYkqV8I1g1SMl4SxMP0NfGLCLbrremMMXwLSsuD3PmqByWT6WhIHTk8Bje
	m/P1nklLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0nh2-0006EL-IH; Sat, 16 Jan 2021 15:40:48 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0nh0-0006E0-Dv
 for linux-snps-arc@lists.infradead.org; Sat, 16 Jan 2021 15:40:47 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1021:5979:3424:ca69])
 (Authenticated sender: yann.morin.1998)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0D9985FFAF;
 Sat, 16 Jan 2021 16:40:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jan 2021 16:40:34 +0100
Date: Sat, 16 Jan 2021 16:40:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 4/4] configs/snps_archs38_hsdk_defconfig:
 update for better out-of-box experience
Message-ID: <20210116154034.GM2375@scaer>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
 <20210115200319.4139041-5-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115200319.4139041-5-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_104046_660705_D37E2EEB 
X-CRM114-Status: GOOD (  14.00  )
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
>  - Enable C++ support
>  - Don't strip executables
>  - Add minimal debug symbols
>  - Enable strace and openssh
>  - Enable perf (and elfutils)

Of all those, I only kept adding C++.

None of the other defconfigs enable debug, or disable stripping.

Also, we like our defconfigs to truly be minimal. We could however
accept an additional defconfig with more packages, as a "demo" of sorts,
though. But the selection of packages you added is not kind of "demoing"
that specific board...

So, I just kept C++.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  configs/snps_archs38_hsdk_defconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
> index 69d0b1936b3a..7d406a90ed3c 100644
> --- a/configs/snps_archs38_hsdk_defconfig
> +++ b/configs/snps_archs38_hsdk_defconfig
> @@ -1,8 +1,12 @@
>  BR2_arcle=y
>  BR2_archs38_full=y
> +BR2_ENABLE_DEBUG=y
> +BR2_DEBUG_1=y
> +# BR2_STRIP_strip is not set
>  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
>  BR2_PACKAGE_GLIBC_UTILS=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
>  BR2_TARGET_GENERIC_HOSTNAME="hsdk"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
> @@ -14,8 +18,15 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
>  BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
>  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
> +BR2_PACKAGE_LINUX_TOOLS_PERF=y
> +BR2_PACKAGE_STRACE=y
> +BR2_PACKAGE_MAKE=y
> +BR2_PACKAGE_ELFUTILS=y
> +BR2_PACKAGE_ELFUTILS_PROGS=y
> +BR2_PACKAGE_OPENSSH=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
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
