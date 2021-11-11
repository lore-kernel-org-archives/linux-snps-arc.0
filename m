Return-Path: <SRS0=FKsm=P6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A09C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Nov 2021 20:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA8461268
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Nov 2021 20:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FA8461268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIsSW9wIfFiNHK0AukU12Vo3tdWaeG968xe/loWMw9I=; b=e0f33F/omY6fePY2bF+P/gx3Yn
	g1Wwx5qIXt8FyVy9VKp+Tam7DMhXdWOeEwXW3HZRT9phJHLkE0VpI7eTDeZ061bim4aJCtkDOUo13
	PWCza7YyjwM45sIB/2Os2z0A+d4CTDMDP9WQjfw1K2P6/STdfIHbC9qU24vL7zOOG1ppa+aLhaaRB
	1C5oLiGMCt7lNkFQ/NhkjizNIs4uYKLzBgbgBEhQ9cP+376ROagPf1D8pV/SlzD5gmsTJI2NaI/EQ
	7HGgDPmVtfZvoP3oVCkqZ1bBhsAX9ZMveC+G/AIF0pzQZoWurOZfMKdxFMynhC0uH1lXAg7377O4I
	a/ME3GFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlGcY-008hWX-S4; Thu, 11 Nov 2021 20:24:30 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlGcW-008hVw-K7; Thu, 11 Nov 2021 20:24:28 +0000
Subject: Re: [PATCH] docs: Add documentation for ARC processors
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20211111201036.5692-1-abrodkin@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <70f4ba74-9e0e-579b-3e17-9144490c73d2@infradead.org>
Date: Thu, 11 Nov 2021 12:24:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111201036.5692-1-abrodkin@synopsys.com>
Content-Language: en-US
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/11/21 12:10 PM, Alexey Brodkin wrote:
> +Important note on ARC processors configurability
> +################################################
> +
> +ARC processors are highly configurable and several configurable options
> +are supported in linux. Some options are transparent to software

                     Linux.

> +(i.e cache geometries, some can be detected at runtime and configured
> +and used accordingly, while some need to be explicitly selected or configured
> +in the kernel's configuration utility (AKA "make menuconfig").
> +
> +However not all configurable options are supported when an ARC processor
> +is to run linux. SoC design teams should refer to "Appendix E:

              Linux.

> +Configuration for ARC Linux" in the ARC HS Databook for configurability
> +guidelines.
> +
> +Following these guidelines and selecting valid configuration options
> +up front is critical to help prevent any unwanted issues during
> +SoC bringup and software development in general.


Rest of it looks good.

Thanks.
-- 
~Randy

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
