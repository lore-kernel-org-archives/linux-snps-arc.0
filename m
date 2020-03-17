Return-Path: <SRS0=S7jJ=5C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BB5C0044D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Mar 2020 00:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9432E20679
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Mar 2020 00:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPohj45e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="GiCnmEy7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9432E20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuGFtNW6UHQMRMyhGvLglC6vJ6iDdxqTZoOzAtc4Shg=; b=iPohj45ezwT0ZC
	GlexybRYgmRSkXavP+mRQZqLqjjkSSEfB68nPRiJCG36S6nxBk+wEydHJ/EYhghrO7TZPKQt/V6XR
	7PLTCo6W6HjHRzVFD59CgUCT187TQdTZXFAlvhgBmmVa4XbpYtZOLexvY3B7shc9o6cvQ2kH3xF+U
	weQC1AvM+Ty3oePJKk7UIf8Ot5PWZdFIMsxAehiuRm3KKpjHfu6rv0LGyrNewpfveKbHSa0GsOZmV
	VPi/qZ+kk0eWmqSBwAsESUH/UMD7+0SSweR5S3wsm1VF6xkHLSEHwY9PlK5jCTfGv/+X7gHohiwnJ
	9ZIoEaGYZc26KaC5R9nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE0Z8-0004XR-Bn; Tue, 17 Mar 2020 00:58:42 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE0Z5-0004Wn-1y
 for linux-snps-arc@lists.infradead.org; Tue, 17 Mar 2020 00:58:40 +0000
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 02H0wAuJ003952
 for <linux-snps-arc@lists.infradead.org>; Tue, 17 Mar 2020 09:58:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02H0wAuJ003952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1584406691;
 bh=+VzaV5sFRtxKAoH7rppPTz7vYTx/ptvPFYNX1JZhr8I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GiCnmEy7O3U4VXa+yfMjIQmZAPzU4/Ct1ZwiT6pnC+/5xY3EEiJ80n63iZBpCIYPp
 +L/hDvKxtVjfs3I6C6tuEEl0j9kWZuF7L6sqzO9A9YWhYw4aK3C6w6TWMzSY0noU/s
 Y00VJjswqHfczNpIyce/5eQ8ryhBk1+bl1B+WdFlm20ZlT65KEW8WEUfoPHlMEzP9W
 Hk0wfP714TUEi+SziukauXYljnwJBW5n/nt8EB2hVuQIxDUwqKkysXyNUm4/ylLN+q
 jWExfKOYHXwzZaI2MDns3toWx/a/EpdXxk9F7mPbgB4LafM3nJrbDckREk9kKMV7Cf
 2AKV0kFsSokNA==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id a33so7346667uad.11
 for <linux-snps-arc@lists.infradead.org>; Mon, 16 Mar 2020 17:58:11 -0700 (PDT)
X-Gm-Message-State: ANhLgQ29LqB+FjezvH5IJ99rOvl9uZwcFpLiiDj1abAxWSYxEnTS27Hk
 2MD+dKFV+jLcpQdU1JR/Z20R2vcj1vPVGgP4Lao=
X-Google-Smtp-Source: ADFU+vuBMyABnImUl6b7dOsBe/MmCPk6aP5Z95Lob+zvXfebQ+cT0BPcRz9rBKi3g9swgrYAnym5uBEh+XpBuHhH+wc=
X-Received: by 2002:ab0:28d8:: with SMTP id g24mr1921244uaq.121.1584406689827; 
 Mon, 16 Mar 2020 17:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200311102217.25170-1-Eugeniy.Paltsev@synopsys.com>
 <CAK7LNARSNBOMK9+s9pmVsVtnzr2qqFxHNr+GhJd_BnbgNW4SSQ@mail.gmail.com>
 <BY5PR12MB4034829B9DC8EC77C5164439DEF90@BY5PR12MB4034.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4034829B9DC8EC77C5164439DEF90@BY5PR12MB4034.namprd12.prod.outlook.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Mar 2020 09:57:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATj_p0PaTiuY2q3+AA-Hf87bG2YFoqfxCAfaXWqhRZA+w@mail.gmail.com>
Message-ID: <CAK7LNATj_p0PaTiuY2q3+AA-Hf87bG2YFoqfxCAfaXWqhRZA+w@mail.gmail.com>
Subject: Re: [PATCH] initramfs: restore default compression behaviour
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_175839_322681_BEDB499F 
X-CRM114-Status: GOOD (  14.42  )
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

On Mon, Mar 16, 2020 at 8:22 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> Hi Masahiro,
>
> >From: Masahiro Yamada <masahiroy@kernel.org>
> >Sent: Wednesday, March 11, 2020 23:12
> >To: Eugeniy Paltsev
> >Cc: Linux Kernel Mailing List; arcml; Vineet Gupta; Alexey Brodkin
> >Subject: Re: [PATCH] initramfs: restore default compression behaviour
> >
> >Hi Eugeniy.
> >
> >On Wed, Mar 11, 2020 at 7:22 PM Eugeniy Paltsev
> ><Eugeniy.Paltsev@synopsys.com> wrote:
> >>
> >> Even though INITRAMFS_SOURCE kconfig option isn't set in most of
> >> defconfigs it is used (set) extensively by various build systems.
> >> Commit f26661e12765 ("initramfs: make initramfs compression choice
> >> non-optional") has changed default compression mode. Previously we
> >> compress initramfs using available compression algorithm. Now
> >> we don't use any compression at all by default.
> >> It significantly increases the image size in case of build system
> >> chooses embedded initramfs. Initially I faced with this issue while
> >> using buildroot.
> >>
> >> As of today it's not possible to set preferred compression mode
> >> in target defconfig as this option depends on INITRAMFS_SOURCE
> >> being set.
> >> Modification of build systems doesn't look like good option in this
> >> case as it requires to check against kernel version when setting
> >> compression mode. The reason for this is that kconfig options
> >> describing compression mode was renamed (in same patch series)
> >
> >Which commit?
> >
> >I do not remember the renaming of kconfig options
> >with this regard.
>
> Ok, I've checked it again - looks like I was confused a bit by
> "CONFIG_INITRAMFS_COMPRESSION" option
> as in v5.5 kernel I have in ".config":
> CONFIG_INITRAMFS_COMPRESSION=".gz"
>
> And for v5.6-rc1 I have in ".config":
> CONFIG_INITRAMFS_COMPRESSION_GZIP=y
>
> But they are different options actually...


Right.

There is no prompt for CONFIG_INITRAMFS_COMPRESSION.
So, users have no control of it.

Because this is just a matter of the file extension,
commit 65e00e04e5aea34 moved the logic to Makefile.




-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
