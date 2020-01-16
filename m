Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBECC33CB1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 11:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1222073A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 11:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYXDbtI/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1222073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpPcOt0qeAd9zV2SBZeuv7AkC9Ib3bOTLEKOkwVWCis=; b=GYXDbtI/3c4E/t
	6O5gKscb7J631j0X/YtcyJSMY4FPPmQauQ+k1+/WMjpnNfVhpmTAOJoPa4c6UqeVCoH3QmFTNkHy0
	C6vS8VzonGz1qToAFteMhXqIqAJx9LfxgnuwfrQlU8UGoJEAZtnpi/0ci1kGa7VPftIFOMHFNHH/M
	hmZtvix0zTgRNU4xW70tX6f//QHYfvP+MtZJd2gXPggx3k+4vENYq15IceiYi4lDdSXNJyfFVd5Uk
	bFipmG5WplxdiP6pFXxTVtZLtDT5V4nSAF4qPnsqKzR1QGDBEW7T7pJ78CBDI8YlgFqt73PG9leKe
	mKKEjeC0ZyOpE4sYg4hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is3BJ-0000lQ-L8; Thu, 16 Jan 2020 11:19:21 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is3BD-0000kJ-S6
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 11:19:20 +0000
Received: from ip5f5bd663.dynamic.kabel-deutschland.de ([95.91.214.99]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1is3B9-0000wC-Lv; Thu, 16 Jan 2020 11:19:11 +0000
Date: Thu, 16 Jan 2020 12:19:11 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ARC: wireup clone3 syscall
Message-ID: <20200116111910.b3vhwudsdb4oe5b2@wittgenstein>
References: <20200116000948.17646-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116000948.17646-1-vgupta@synopsys.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_031916_039394_AB2A5059 
X-CRM114-Status: UNSURE (   4.28  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 04:09:48PM -0800, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
