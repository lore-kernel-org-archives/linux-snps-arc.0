Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58B8C43463
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 20:25:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E845F20866
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 20:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K2NZdJet"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E845F20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=anQM1aZ1507qvLn51Ap+X7jk3U/BHUWMW1nhyjo1k/w=; b=K2NZdJetm/IdAFgwDJuwYEOCN
	H/9AVUQr5Ox/U75wci4Cj6LW6FRBRUxTI1SnSzbcRdyQmuTGEC/+Rmhytr/EPGVKmAYl4yVUtjhhK
	0Y3J5z6ZvY7OPv/KbmBzp7kzF0l54dShVbYjpPR7qAAcHne2eWxoRVtDneJPvuGiAWn4XxOJOQcjB
	AelJBeKJOm6+RqLwOu9gSQCGsYTdNgBWnVMrnpwXZG9BfSEamQoj3odCDqG6PXRSqhWs5+QRIZJrd
	UIgAVlSfEXaeKj2ql0+YnADnTRGg+k8l1fxP13Nr3UhRd+mYC9T2N5SsSdEGJpq4SuakPgQJq5Apq
	tytlxMG1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJjQS-0006QE-Ql; Sat, 19 Sep 2020 20:25:40 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJjQQ-0006Pb-DI
 for linux-snps-arc@lists.infradead.org; Sat, 19 Sep 2020 20:25:39 +0000
X-Originating-IP: 185.200.12.25
Received: from windsurf (unknown [185.200.12.25])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E98971BF206;
 Sat, 19 Sep 2020 20:25:30 +0000 (UTC)
Date: Sat, 19 Sep 2020 22:25:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH v2] package/glibc: ARC: use upstream 2.32
Message-ID: <20200919222529.2f8c694e@windsurf>
In-Reply-To: <20200916073033.1298697-1-vgupta@synopsys.com>
References: <20200916073033.1298697-1-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_162538_560341_141A8016 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: buildroot@busybox.net, Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 16 Sep 2020 00:30:33 -0700
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> ARC glibc port was merged upstream in 2.32
> There's no need to refer to github as it has the exact same version and
> can be retired in future.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> Changes since v1:
>   - dropped artifacts related to github version
> ---
>  .../glibc.hash                                |  2 ++
>  package/glibc/arc-2020.03-release/glibc.hash  |  7 -------
>  package/glibc/glibc.mk                        | 20 ++++++++++---------
>  3 files changed, 13 insertions(+), 16 deletions(-)
>  create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
>  delete mode 100644 package/glibc/arc-2020.03-release/glibc.hash

I've added the hashes of the license files in the glibc.hash you've
added, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
