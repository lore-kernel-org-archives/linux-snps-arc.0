Return-Path: <SRS0=RPbs=ZN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B80C432C0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 Nov 2019 20:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88116206CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 Nov 2019 20:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZfuvqmbE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tuc6KGOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88116206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+TWrt2TWXFlFH4erm049uHF0fcx7Yj1KAhSIb90SIM=; b=ZfuvqmbEJzbiZ6
	SP6cEYnfghRVwkCd3ikbmsu7v8Gg6gIcwWdgyP4IJ8fGZ8mGfPCl4VAESm7DId7woJfdxucnVwaxM
	CW974JzofFhi8fY0+Y1Adp9NTmCEaqqpsmt3Se5grXt1dgix2GlE1XEd9lb13lk0QTBTYq45/TUNl
	UuQBiJKRhOahnWjvUWo6pwtb8HpFHS3YogjH5f0m0jru0A4SUDO7Kz/sK+LrPh8Dmxar3Bpo+Fy+m
	/84jlrVWlxb+qr4OmaXjBSLhrePAs0ENMQVhb9kvD97TjTqapH1ueqHjVh5veqVgs4c1hCoXADB8n
	p4hWqTfh04FV6OOiibEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXtEx-0001fu-QG; Thu, 21 Nov 2019 20:39:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXtEu-0001fM-Td
 for linux-snps-arc@lists.infradead.org; Thu, 21 Nov 2019 20:39:46 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 092F12068D;
 Thu, 21 Nov 2019 20:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574368784;
 bh=GbWBSZwXy5//YxtxQhup5maUlZh8jchQMsa14kDzrMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tuc6KGOL1LevDc9/W8fpCdLMZoDB4P1MfJtLy0gOHTkQ4aZ9w62ahm7ADjfMnK0Pj
 130bu0jpXGPTZHcbcCWWu9iqfGAyq9bZwhXj/4oX6IkgldabWEDLCUDMvZp/20Vaa9
 Acjk6oodsLxNBlV009yAVMQ4O+NP3vr2B6VYwNuc=
Date: Thu, 21 Nov 2019 21:39:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
Message-ID: <20191121203942.GF813260@kroah.com>
References: <20191022140411.10193-1-abrodkin@synopsys.com>
 <20191026131042.73A7E206DD@mail.kernel.org>
 <CY4PR1201MB01208D47B2BEB18DA6E1382AA17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB01208D47B2BEB18DA6E1382AA17E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_123944_996491_DF5C3AE2 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Nov 05, 2019 at 07:52:16PM +0000, Alexey Brodkin wrote:
> Hi Sasha, Greg,
> 
> > -----Original Message-----
> > From: Sasha Levin <sashal@kernel.org>
> > Sent: Saturday, October 26, 2019 4:11 PM
> > To: Sasha Levin <sashal@kernel.org>; Alexey Brodkin <abrodkin@synopsys.com>; linux-snps-
> > arc@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org; stable@vger.kernel.org; stable@vger.kernel.org
> > Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
> > 
> > Hi,
> > 
> > [This is an automated email]
> > 
> > This commit has been processed because it contains a -stable tag.
> > The stable tag indicates that it's relevant for the following trees: all
> > 
> > The bot has tested the following trees: v5.3.7, v4.19.80, v4.14.150, v4.9.197, v4.4.197.
> > 
> > v5.3.7: Build OK!
> > v4.19.80: Failed to apply! Possible dependencies:
> >     0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
> >     14f81a91ad29a ("ARC: perf: trivial code cleanup")
> >     baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")
> > v4.14.150: Failed to apply! Possible dependencies:
> > v4.9.197: Failed to apply! Possible dependencies:
> > v4.4.197: Failed to apply! Possible dependencies:
> 
> Indeed the clash is due to
> commit baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function") as tmp variable "j" was changed on "i". So that's a fixed hunk:
> -------------------------------->8------------------------------
> diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
> index 8aec462d90fb..30f66b123541 100644
> --- a/arch/arc/kernel/perf_event.c
> +++ b/arch/arc/kernel/perf_event.c
> @@ -490,8 +490,8 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
>         /* loop thru all available h/w condition indexes */
>         for (j = 0; j < cc_bcr.c; j++) {
>                 write_aux_reg(ARC_REG_CC_INDEX, j);
> -               cc_name.indiv.word0 = read_aux_reg(ARC_REG_CC_NAME0);
> -               cc_name.indiv.word1 = read_aux_reg(ARC_REG_CC_NAME1);
> +               cc_name.indiv.word0 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME0));
> +               cc_name.indiv.word1 = le32_to_cpu(read_aux_reg(ARC_REG_CC_NAME1));
> 
>                 /* See if it has been mapped to a perf event_id */
>                 for (i = 0; i < ARRAY_SIZE(arc_pmu_ev_hw_map); i++) {
> -------------------------------->8------------------------------
> 
> Should I send a formal patch with it or it's OK for now?

We need a "formal" patch that we can apply if you want it applied.

thanks,

greg k-h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
