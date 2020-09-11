Return-Path: <SRS0=Cy1g=CU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65841C43461
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Sep 2020 09:18:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4EBF208E4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Sep 2020 09:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJ7ZS7MQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4EBF208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FOLSbXKGPmo/lPcwMWF+9XdpszszT3kXeH99ypgcM20=; b=NJ7ZS7MQxw7BzJWA1ccko1wKQ
	aQLPQyx3rCi7tACtuL0LmvteZqHnVWwpJaif9LUFkBrURQ5ha4tBWQSnndnLgQMPfNsp1e5tgaU/N
	sjjMO1hzDG7gHcfsFuhKXAFkAZv9CoO1lm1G0rR5V0xVb9S+gvNDWdkS3L+N0KGDMkqf4Dldozpkg
	pCdKKbUssKJF161lbffSwrHwsWN2ORHcX1MU+OnKT1ZXdoRKtGLJusplf8jmU9pGPQFDeA37sQpH7
	dSHJLixnEreKJxqJ7bs6ctFHDK/M/0lf0oUxXVriZdd1AjdIw3NQSpkCpGa+v6IXsFOmDGKd+a6Y7
	ldMQa1gZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfCW-0000vG-N4; Fri, 11 Sep 2020 09:18:36 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfCU-0000uP-Vi
 for linux-snps-arc@lists.infradead.org; Fri, 11 Sep 2020 09:18:36 +0000
X-Originating-IP: 86.206.245.199
Received: from windsurf.hq.k.grp (lfbn-tou-1-420-199.w86-206.abo.wanadoo.fr
 [86.206.245.199])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 49DE924000B;
 Fri, 11 Sep 2020 09:18:28 +0000 (UTC)
Date: Fri, 11 Sep 2020 11:18:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2] binutils/ARC: cleanup
Message-ID: <20200911111828.5c9ea5d5@windsurf.hq.k.grp>
In-Reply-To: <3b18564e-be2e-91b3-def1-6c3591288ecc@synopsys.com>
References: <20191206221918.1c05e316@windsurf.home>
 <20191217213253.12446-1-vgupta@synopsys.com>
 <20191222224144.38603994@windsurf>
 <3b18564e-be2e-91b3-def1-6c3591288ecc@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_051835_108292_BA0958D4 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello Vineet,

On Thu, 10 Sep 2020 23:21:43 +0000
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> >> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
> >> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)  
> 
> Looks like we need this specific thunk anyways. When I select pristine upstream
> binutils (not ARC fork @ github), the above forces it to download from github
> which it should not and will not if the tag/branch has not been mirrored there.

So I guess you're talking about the situation where a host-binutils is
not enabled, and only a target binutils is used. In this case, indeed:

ifeq ($(BINUTILS_VERSION),)
ifeq ($(BR2_arc),y)
BINUTILS_VERSION = arc-2020.03-release
else
BINUTILS_VERSION = 2.33.1
endif
endif # BINUTILS_VERSION

will kick in and set BINUTILS_VERSION to arc-2020.03-release, which
will lead to:

ifeq ($(BINUTILS_VERSION),arc-2020.03-release)
BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
BINUTILS_FROM_GIT = y
endif

being taken into account.

What happens with target binutils is:

 (1) If a host-binutils is built (because Buildroot is building the
     toolchain), then we're using the same version as the
     host-binutils, which is defined by the choice in
     package/binutils/Config.in.host.

 (2) If not host-binutils is built (because we're using an external
     toolchain), then there is no version selection: we unconditionally
     use 2.33.1, except on ARC where we use the special ARC fork.

So I guess the decision to take is: do we want to switch to using the
upstream binutils, even for ARC, when no host-binutils is built ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
