Return-Path: <SRS0=2Xzh=DN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F41C41604
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 04:55:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F7E208B6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 04:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UFeS5/SC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F7E208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qjaIlmwDCgJIOGArnwjIfhgyDJRizK1GqKc0vE2XkOE=; b=UFeS5/SCKiHVpTjGfevOfLMPv
	U0z/6QaEJserlUeFBw8+5CJrusYSTTDfL9IK2YP2Ke1lVLZChzJsUXsm124M/Gp83YWun1RWOTVbx
	4jHAfcJmrM3a2CiSlHHUoUww/OOskut+sQgnGzdlU35QQirG6sGAO8RCJsvwFKgixB/2Tz5ZrNtl7
	gMefVNSDaQciAxS+ZfTZ2nUy8l0nl1zzUtrE0lI9ZwDzFnQgUPr6cqj4gOUpESXiI0wYCLeQNRV6x
	UZuUSc5oj7EeceyxV4YyP53qg3/VxYyXVlt1mOxPFnLnaUcP46lDBfrjXBUdFlH5S0Oo/0TWNGEFd
	klejPKTzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPf0I-0000Js-6W; Tue, 06 Oct 2020 04:55:10 +0000
Received: from smtprelay0128.hostedemail.com ([216.40.44.128]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPf0G-0000J7-Ga
 for linux-snps-arc@lists.infradead.org; Tue, 06 Oct 2020 04:55:09 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id E8DE618025614;
 Tue,  6 Oct 2020 04:55:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: smell79_1c14f78271c4
X-Filterd-Recvd-Size: 2318
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue,  6 Oct 2020 04:55:04 +0000 (UTC)
Message-ID: <92c4f9bd1d43b80a424a52131fcbc6a1a416de64.camel@perches.com>
Subject: Re: [RFC PATCH] DRM: amd: powerplay: don't undef pr_warn() {causes
 ARC build errors}
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>,  dri-devel <dri-devel@lists.freedesktop.org>
Date: Mon, 05 Oct 2020 21:55:03 -0700
In-Reply-To: <9c86375d-34a9-6584-0069-452b193076d6@infradead.org>
References: <9c86375d-34a9-6584-0069-452b193076d6@infradead.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_005508_608877_600BFBBC 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
Cc: Evan Quan <evan.quan@amd.com>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-05 at 21:50 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> arch/arc/ implements BUG_ON() with BUG(). ARC has its own BUG()
> function and that function uses pr_warn() as part of its implementation.
> 
> Several (8) files in amd/powerplay/ #undef various pr_xyz() functions so
> that they won't be used by these drivers, since dev_() functions are
> preferred here and the #undefs make the pr_() functions unavailable.
[]
> --- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -52,7 +52,7 @@
>   * They are more MGPU friendly.
>   */
>  #undef pr_err
> -#undef pr_warn
> +//#undef pr_warn
>  #undef pr_info
>  #undef pr_debug
>  
> --- lnx-59-rc7.orig/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
> +++ lnx-59-rc7/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
> @@ -54,7 +54,7 @@
>   * They are more MGPU friendly.
>   */
>  #undef pr_err
> -#undef pr_warn
> +//#undef pr_warn
>  #undef pr_info
>  #undef pr_debug 

These are bad ideas as all of these pr_<level> entries
may become functions in a near-term future.



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
