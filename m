Return-Path: <SRS0=Bfkp=CY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4250BC433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2020 13:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7FA321D94
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2020 13:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lr84+cpb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7FA321D94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=obIKUw0Dd2x6JeQy+sk+RfjJjkUZ67Zu0nrOIwnYT0A=; b=Lr84+cpbVRCop0/68GHk4U5SS
	OFd+LMANS8U3I66T8x0q8ALkcPy0eZuM2nKzfrw7g3nI9KKAhCuhmoy95CsXnVYUJKAd39fWj1gNL
	ySO6esj0FbQrzC2EyXPaGdjSPEEuzcCKa8EMDzJaFSUvjWdKB+VWNG74+sIytNao1f1/jyVTptVJN
	h36qUILoofgbCyTaEsjR8HgTlJ1xmJh/G6Hp/fkNjIRkRboqPm4Bu6rjM3KKM8BYSJEIMa4+9dLcR
	qzHAdpaHwZafn7IMlZ8zFgdlYju7FVUGG1vx9fyEso0s8BE4NwlB3Y7rO6tyi1CDutu58Cpiijw8J
	Bji9AcTgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIB5R-0004oZ-Sc; Tue, 15 Sep 2020 13:33:33 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIB5O-0004nh-Bx
 for linux-snps-arc@lists.infradead.org; Tue, 15 Sep 2020 13:33:31 +0000
X-Originating-IP: 86.206.245.199
Received: from windsurf.hq.k.grp (lfbn-tou-1-420-199.w86-206.abo.wanadoo.fr
 [86.206.245.199])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 647C620002;
 Tue, 15 Sep 2020 13:33:25 +0000 (UTC)
Date: Tue, 15 Sep 2020 15:33:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
Message-ID: <20200915153324.318c612b@windsurf.hq.k.grp>
In-Reply-To: <20200914213748.3953423-1-vgupta@synopsys.com>
References: <20200914213748.3953423-1-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_093330_500747_9F8EEE35 
X-CRM114-Status: GOOD (  12.19  )
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

Hello,

On Mon, 14 Sep 2020 14:37:48 -0700
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> ARC glibc port was merged upstream in 2.32
> There's no need to refer to github as it has the exact same version and
> can be retired in future.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  .../glibc.hash                                |  2 ++
>  package/glibc/glibc.mk                        | 20 ++++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>  create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash

The hash file for the ARC-specific glibc version used on Github should
be dropped.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
