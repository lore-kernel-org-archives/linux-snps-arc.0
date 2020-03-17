Return-Path: <SRS0=S7jJ=5C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087D5C0044D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Mar 2020 00:52:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2D3206C0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Mar 2020 00:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWwk83Uu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="PiDufGef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA2D3206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKawiw2NnCmh6ifhcBco5A5d0UepFtlmO58Ymimid8w=; b=hWwk83Uu+2o5lJ
	S0dAxRysir3sOL+rlNtgLRgpMkIWQa3IomMO0hUKEGNEljeuaCLxfTERxuCal5xAN+DGtQaP7k19f
	7MgPBLRZrZtzPQVlUfp/l093u2myTz4aUuXdwHo2AtAiA8a2euEPA9aEc7HUrJ3MlL66IcR8v1ln6
	LbdFXSl99iLo/0zBeX4yAt7ZMGezIXctt9AvrYa0cfwyyXD1luE7TGfiksRJUBkdAfbmC4WtYV+M9
	oX/7U5RhMsMpyucFJNQ+uvdgVGv3CCdQl0YTJ5Xt7jf+0Jc6WrACjU+OxmJZVVUv+Z84vDmVla9fn
	4baYgdOM8cupr8FwO9ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE0TK-0001qy-WD; Tue, 17 Mar 2020 00:52:43 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE0TH-0001qI-Fy
 for linux-snps-arc@lists.infradead.org; Tue, 17 Mar 2020 00:52:41 +0000
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 02H0qAjb023264
 for <linux-snps-arc@lists.infradead.org>; Tue, 17 Mar 2020 09:52:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02H0qAjb023264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1584406333;
 bh=bTisUi+CZu/g6bO8aAotHn/SP8Hi7R+MiDzAL3ZUAfI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PiDufGefZuRu9e4zxb5+ExqdLDSk0FSpoRlJFUMPfGReoch32f+wSOhf/UeprSgeQ
 4ZiU90DJ8qTTFluuDP1sep+qVS9491BwThD1yRTG7PBg2VN713zwKKdHKmRphb3r5B
 yDS2dRwTpG1A62F18mb63LRgDy1rXfSWi5WtRapaJZKieRZLUyGOZ/vL9XQnjAmoSN
 m9xKbjNiPqCP4MC7oP8iiDtDvnxRIa6EujvCSCNkDr9UCoQJGztdF5zGA0hcx+YqKw
 nu9QPAFDpDf5muPsekFs0sq+8QXKrGb1WdVqxw4mWRYJMh8VxJzKe3fh9UHuZYQp+E
 R4uoY4ucjZKJA==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id i25so12743468vsq.9
 for <linux-snps-arc@lists.infradead.org>; Mon, 16 Mar 2020 17:52:10 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1hVYMYxzkGlDQCs/iWac0PQzBrfokCej6XFiqHpJgmy8wZiaZB
 zZZATaM3qggj3eb0iNEhKOjNXgboyemklu6ALjk=
X-Google-Smtp-Source: ADFU+vuYWhTKUDP6HaM3wuCYIV2TyqZ3Q6nfU58hUxaICMBE++bLTwLXAhjLlI1bkSpqjl4rONmhLJUtIcpDgx2iSMk=
X-Received: by 2002:a67:8745:: with SMTP id j66mr1824203vsd.181.1584406329863; 
 Mon, 16 Mar 2020 17:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200316112519.4375-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20200316112519.4375-1-Eugeniy.Paltsev@synopsys.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Mar 2020 09:51:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNATL1wApAN4uta_YQsdHmOAvRg1z7P1fun9Y8t0QjwBYxQ@mail.gmail.com>
Message-ID: <CAK7LNATL1wApAN4uta_YQsdHmOAvRg1z7P1fun9Y8t0QjwBYxQ@mail.gmail.com>
Subject: Re: [PATCH v2] initramfs: restore default compression behavior
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_175239_747021_45F0C1F9 
X-CRM114-Status: GOOD (  18.51  )
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

On Mon, Mar 16, 2020 at 8:25 PM Eugeniy Paltsev
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
> being set. Modification of all build systems either doesn't look
> like good option.
>
> Let's instead rewrite initramfs compression mode choices list
> the way that "INITRAMFS_COMPRESSION_NONE" will be the last option
> in the list. In that case it will be chosen only if all other
> options (which implements any compression) are not available.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>


Applied to linux-kbuild.
Thanks.



> ---
>  usr/Kconfig | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/usr/Kconfig b/usr/Kconfig
> index bdf5bbd40727..96afb03b65f9 100644
> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -124,17 +124,6 @@ choice
>
>           If in doubt, select 'None'
>
> -config INITRAMFS_COMPRESSION_NONE
> -       bool "None"
> -       help
> -         Do not compress the built-in initramfs at all. This may sound wasteful
> -         in space, but, you should be aware that the built-in initramfs will be
> -         compressed at a later stage anyways along with the rest of the kernel,
> -         on those architectures that support this. However, not compressing the
> -         initramfs may lead to slightly higher memory consumption during a
> -         short time at boot, while both the cpio image and the unpacked
> -         filesystem image will be present in memory simultaneously
> -
>  config INITRAMFS_COMPRESSION_GZIP
>         bool "Gzip"
>         depends on RD_GZIP
> @@ -207,4 +196,15 @@ config INITRAMFS_COMPRESSION_LZ4
>           If you choose this, keep in mind that most distros don't provide lz4
>           by default which could cause a build failure.
>
> +config INITRAMFS_COMPRESSION_NONE
> +       bool "None"
> +       help
> +         Do not compress the built-in initramfs at all. This may sound wasteful
> +         in space, but, you should be aware that the built-in initramfs will be
> +         compressed at a later stage anyways along with the rest of the kernel,
> +         on those architectures that support this. However, not compressing the
> +         initramfs may lead to slightly higher memory consumption during a
> +         short time at boot, while both the cpio image and the unpacked
> +         filesystem image will be present in memory simultaneously
> +
>  endchoice
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
