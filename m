Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B833C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThzVy/B+s5ElPzKMSWQY8TKJ6EeS+COEjO5i3/oeEnA=; b=ZdWTdBWSDGxHr37x6qpG51od+C
	NTIAI4fd8vLvIwBuNXITmopgyn3cNrAO47r9jtahJLmgWBQGv270CZ+mimNmhoxBL2sWDOcscT9Qo
	lerHzAkQD6y8JhcikITqqV0RSfN3CrandTJC2FYvgQAU/pK9u/fbLmjVTWmr5hFFYxQ2ajffCJDPt
	+WKI8DuErK374GpyuP/x3Etp8opLYq0hc15z3wGJOaL0pRBx1zLn9t+0AdRzXqeYNbWBp3AO0/EkS
	l9ZTPkvAphnBYy6wct0Eeg5vC/scU08Yl1QodcI2gwbxP6xdnr8lH8vWmchzHhj0CrWj2TtwnagRd
	ShkT9AoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWzf-000Ruy-II; Mon, 18 Apr 2022 19:25:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWzd-000RuN-9D
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:25:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81F8D60B8D;
 Mon, 18 Apr 2022 19:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38D7C385AA;
 Mon, 18 Apr 2022 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309899;
 bh=XO6QdT0AxcpOfTrBUN8I/egwTmX28Rqx6jsl8iAbxFE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZyGusz2Ixuba0KZlwLtaw7gFz5yMbl7ZTz0fCUaAXA6wj3fb4eHSBKBmZjPkihQUb
 wlSwqgp0d7Tb4ZAM3idlCf2cYpd2zhiUiSRrTz0ZIz93RXIMUBGEyuWEUi9gPyoUNj
 zHxwW/erY4UkoofX6OLskgqgrLrq90/U2UdDEubdXXXpF/SqHuBVhNJLDtFeMy5m4D
 E8gdmDf/NbQN7EUesis8T/AVn4/08zBZXgs46kU1foFV0wsvaDKGA0J2xGRhG9ZG8Z
 cLUl0ze48T9vAGM3vomn5jmeV+tXBHBy1ReKg1fbYMQCFiMrLjdCUBt7PMjGp5oEtM
 rXDzqhmbt+Xdg==
Message-ID: <39f4141f-3ec8-1929-e029-9916a495e49b@kernel.org>
Date: Mon, 18 Apr 2022 12:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arc: drop definitions of pgd_index() and pgd_offset{,
 _k}() entirely
Content-Language: en-US
To: Rolf Eike Beer <eb@emlix.com>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3749315.OSCKaROI16@mobilepool36.emlix.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <3749315.OSCKaROI16@mobilepool36.emlix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_122501_413955_182851B5 
X-CRM114-Status: GOOD (  10.04  )
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



On 3/28/22 01:15, Rolf Eike Beer wrote:
> They were in <asm/pgtables.h> and have been removed from there in
> 974b9b2c68f ("mm: consolidate pte_index() and pte_offset_*() definitions")
> in favor of the generic version. But that missed that the same definitons
> also existed in <asm/pgtable-levels.h>, where they were (inadvertently?)
> introduced in fe6cb7b043b6 ("ARC: mm: disintegrate pgtable.h into levels
> and flags").
>
> Fixes: 974b9b2c68f ("mm: consolidate pte_index() and pte_offset_*() definitions")
> Fixes: fe6cb7b043b6 ("ARC: mm: disintegrate pgtable.h into levels and flags")
> Signed-off-by: Rolf Eike Beer<eb@emlix.com>

Indeed I missed the upstream change when doing the rework for paging levels.

Applied !

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
