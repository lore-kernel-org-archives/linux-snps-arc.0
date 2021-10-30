Return-Path: <SRS0=oPyE=PS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D22BC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Oct 2021 17:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3A26101E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Oct 2021 17:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E3A26101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm81xmsVfMEsLatqrjS/WqsL4NEhxUf9lASjN1LTQBk=; b=KDLRjctslY2Dn6TfzqFAmhk2Hl
	p02fc5ZYZPzDVtm6im6UBZIysy6spsBfSKNaloLymOMrZMB5PWr+Xr/H+jqz/AnuOxIiCMS29+hI8
	BsHLt0PozbmldbvbJLrXRKak6IIKaiMZaIlv6Sy9eKY70LFY7Cq53DUZqoBChorDB8PyhfceNJZNG
	Ft4m43r5UEhq76/2US+qzIqcqRdu88O4VqR8rR84j0r22JvKXQxjFuc0247139ducCFViIbE7rAso
	FdGfnbgxoFfTvGfbxbKXv/8GN0OMa2s3N/YHdnZwqn4N6qjTQdAAv8+vu3disLAY06xzkPuXpm/Em
	5xrtTHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgsF4-00DJ1A-MN; Sat, 30 Oct 2021 17:34:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgsF2-00DJ0a-Ei
 for linux-snps-arc@lists.infradead.org; Sat, 30 Oct 2021 17:34:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 814AC60F58;
 Sat, 30 Oct 2021 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635615241;
 bh=rETsOY586mkHRn2jrZTu7Fl9LTxaOtLa/wBCHg1/Hx0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kbYEasq4U/rNSZwV00GO+qghPvUk/v5jDRTIWhr59cEJx7MksN5bgaAgutSw6Y3Td
 dqZoC4GLk8Gi7pmIMy6tUNIeTZoz2ui7yrkdqiMyrGR5nQJTcUFkQ1aZusL6sVMf/6
 lS5oyiUTLaWVwyA7e7eUfj+OGWohR/yYVkWaY1upkF7qGBi/nyQhxWJQxdTq+xD7KK
 zNoor0YfjeJjZPi2GAHypknVoo4yDeSqYgOex6A7rNWwDi3ANvpIDiASFOzv945kW0
 nTkz3zCaMn+XKfsK0zPrPyTiW6V0lzfZbxh26juVTSy13lAGAKoXU4AXgJ045hsf2p
 PEFrY9AQjF4qw==
Subject: Re: [PATCH] ARC: thread_info.h: correct two typos in a comment
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-snps-arc@lists.infradead.org
References: <20211030003134.20553-1-rdunlap@infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <a21e45ea-ebd4-6a1a-4508-2e2914603f7e@kernel.org>
Date: Sat, 30 Oct 2021 10:34:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211030003134.20553-1-rdunlap@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_103404_551651_51B69208 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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


On 10/29/21 5:31 PM, Randy Dunlap wrote:
> Fix typos of "separately" and "remains".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Matthew Wilcox <willy@infradead.org> # "remains"
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org

Thx for the fix. Added to for-curr.

-Vineet




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
