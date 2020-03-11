Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE20C0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 20:13:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EDB020739
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 20:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iiovznbe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="qeszQ2FU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EDB020739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qr35y9ZkKfdqsox1vPuGoe4fgR7TEadiY6cb8qfHjbM=; b=iiovznbeXPncz7
	Y8ka7xnC6RbA/63kDICC2R/YGWEgKqZeTyxcc/ftchlDJOA858DJbF+Qo1CFes00TuRGUMHy2G5Mv
	O7GpUJU7ENYG2WUGtRWquK1WO+c4jfCQc/MQj6Dbz+vjU5CzGo6s9tIMuKcLGKIIxRq6TJ/gDZGk7
	k3QfiKffHTJpJAZJJVkx0v9F85sUtLKdNN9/0EifHsh/73kXJP3SHy/9LKjo0TdRW+XrmirTDCyCF
	ax4RX//sfI34eqFh/eeB7CGgqCWXBXvexikjiHU6ahny3JGdgrBPhkvnCRrg7cq3HWDt7qzS44pQg
	imyfM2mPwFI6zp9+sbsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC7jJ-0007gA-IV; Wed, 11 Mar 2020 20:13:25 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC7jG-0007e9-64
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 20:13:23 +0000
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 02BKD48S012934
 for <linux-snps-arc@lists.infradead.org>; Thu, 12 Mar 2020 05:13:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02BKD48S012934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1583957585;
 bh=UgsI4L/7hhHUm8L3XjDdMOn1HtPURuk7s+u4j4PE49E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qeszQ2FUXR7/uYcNONbBryhW4NCRyk80atebVbcpk3fC0Mm2nWiuuKyPTJer0ZPBW
 6yuswb+EeCl35RdRn2CxTHoMCOkzkGxBFf7q/lXo6LdrZfFp2UrI+6qgSzxZYC1TGG
 0WXj/KmlrN3YzTWLVo2NVK3F4TLWhbqjSitrvSbfvrE8oOKa9COOMpLcZkbqXICYKI
 hcaS3bIv8qRBAWBczjt/AxmVlPfTXhYd+bQ6NLssyW5OkweHrdZwaeTT009QGm5zVU
 91NVb0Jy8JLO/68jyTQ9DLQgj0730xGucS7ZfVY+MQPGTUQwFThU5CzAJdBGcu9cPo
 IqYZeF6QSiTUg==
X-Nifty-SrcIP: [209.85.221.179]
Received: by mail-vk1-f179.google.com with SMTP id w4so916737vkd.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 11 Mar 2020 13:13:05 -0700 (PDT)
X-Gm-Message-State: ANhLgQ18SMkmgke74EcBKGnWUp0NtcAN1o/netRqJYR351nPkeMUXsE9
 xp7HIhtKmPa6O3yN0wzs3K2E9XmxtLEo5Gibxao=
X-Google-Smtp-Source: ADFU+vt4K27MGCUWogRfX/2TSFVHCEsD8Ht8K80zJtpqN5IrUtsd9RyhaPlDJSqHFhMUShiI/tKrNEc6TB2DXVNwkdw=
X-Received: by 2002:a1f:2f4c:: with SMTP id v73mr3187092vkv.12.1583957584022; 
 Wed, 11 Mar 2020 13:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200311102217.25170-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200311102217.25170-1-Eugeniy.Paltsev@synopsys.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Mar 2020 05:12:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSNBOMK9+s9pmVsVtnzr2qqFxHNr+GhJd_BnbgNW4SSQ@mail.gmail.com>
Message-ID: <CAK7LNARSNBOMK9+s9pmVsVtnzr2qqFxHNr+GhJd_BnbgNW4SSQ@mail.gmail.com>
Subject: Re: [PATCH] initramfs: restore default compression behaviour
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_131322_559401_F581EF65 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Eugeniy.

On Wed, Mar 11, 2020 at 7:22 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> Even though INITRAMFS_SOURCE kconfig option isn't set in most of
> defconfigs it is used (set) extensively by various build systems.
> Commit f26661e12765 ("initramfs: make initramfs compression choice
> non-optional") has changed default compression mode. Previously we
> compress initramfs using available compression algorithm. Now
> we don't use any compression at all by default.
> It significantly increases the image size in case of build system
> chooses embedded initramfs. Initially I faced with this issue while
> using buildroot.
>
> As of today it's not possible to set preferred compression mode
> in target defconfig as this option depends on INITRAMFS_SOURCE
> being set.
> Modification of build systems doesn't look like good option in this
> case as it requires to check against kernel version when setting
> compression mode. The reason for this is that kconfig options
> describing compression mode was renamed (in same patch series)

Which commit?

I do not remember the renaming of kconfig options
with this regard.



> so
> we are not able to simply enable one option for old and new kernels.
>
> Given that I propose to use GZIP as default here instead of NO
> compression. It should be used only when available but given that
> gzip is enabled by default it looks like good enough choice.



Another solution would be to move
INITRAMFS_COMPRESSION_NONE to the end of the choice menu.

The default of the choice menu is the first visible entry.

GZIP if RD_GZIP is defined, BZIP2 if RD_BZIP2 is defined ...



> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  usr/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/usr/Kconfig b/usr/Kconfig
> index bdf5bbd40727..690ef9020819 100644
> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -102,6 +102,7 @@ config RD_LZ4
>
>  choice
>         prompt "Built-in initramfs compression mode"
> +       default INITRAMFS_COMPRESSION_GZIP if RD_GZIP
>         depends on INITRAMFS_SOURCE != ""
>         help
>           This option allows you to decide by which algorithm the builtin
> --
> 2.21.1
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
