Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A2C71136
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Aug 2023 03:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c3n/t9Fq3/iKR1pW0Bzs71OC8TZB/bni8hugbPwafI=; b=py9L6oHXmXK0TU
	mwWCzxJ20RGBYhL31TJSOsuYKJEx0AC9rAWz6ulT30lXCsl/wpBZIY3NCGR42BMZFKeC6wNa2crCA
	guLC9JaPBocXl99+0bXcydW20rlUGxgigxWur61+AZ9LSfkv/eVlY78/PQeU/uJoIESznifMKecRk
	vvnZGud8pnx0iW6qKWXxx3oO8ACf/kgEr5LcMHhZDK6+Tc3zM0hLyWOl9ZNgNscz7aqWtKT5ctL02
	AfvE1kqG2g7ql6x54/BPpK5SBGOyacPhKzjAXCWFbAvcYpLmCkFDk8w/Xe6bYGh2FOaTAMN0Lj3xI
	Ur0jsg+XcGNvrj3Ul6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWqJT-007cV4-11;
	Fri, 18 Aug 2023 03:38:15 +0000
Received: from out-52.mta0.migadu.com ([2001:41d0:1004:224b::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWqJP-007cSz-07
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Aug 2023 03:38:14 +0000
Message-ID: <2f77080c-6ac2-69cc-fd38-5d71a6cdc8df@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692329884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjJKtE8F8ZIEABqxYxO8DTnV0r5bB4/9fLe/dED26Rw=;
	b=Ww/U1WPJeiE6zjV2BKmgx/AQsBJ8ggHs/e9Wwm91qrUIiFMUUicq3RNaMqTXLyAu4QbP1L
	eBY1JbsiUYnC/MFyCSveDrGt73DsnFX2KDl5/4DnkQpJ0tnYmHtppp2nd9IKlMETbbqBC2
	54DrECSMdgA7J57VH+iP4f4tp7/l0gg=
Date: Thu, 17 Aug 2023 20:37:59 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
References: <20230815004813.555115-21-vgupta@kernel.org>
 <20230817120935.59181-1-kozlov@synopsys.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <20230817120935.59181-1-kozlov@synopsys.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_203811_661936_DACEEB99 
X-CRM114-Status: UNSURE (   7.68  )
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


On 8/17/23 05:09, Pavel.Kozlov@synopsys.com wrote:
> Hi Vineet,
>
> I'm testing your updates and ran into the same build issue reported by the build
> robot.
> http://lists.infradead.org/pipermail/linux-snps-arc/2023-August/007522.html
>
>> #define MAX_REG_OFFSET offsetof(struct pt_regs, event)
> This change causes a build issue for ARC700, as the event field has been
> removed and the MAX_REG_OFFSET macro hasn't been updated.

I've posted v2 for 3 patches. Please reapply/retest the whole series.

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
