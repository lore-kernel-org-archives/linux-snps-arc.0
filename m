Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201E0CA5FFF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGCFKIntOtoY+IT67F/XGsGXIATlrbSe+JMfbfUKp/U=; b=UsaXt29nw7fn4S
	9PgeZ+rI7QE1lcev7CArd0EQfOsulGqPHAvxPg9F2sg6A2B7bSE7v0NYEpjYfqhfLjUS9lLgGlCyY
	5rp/6lDum5sx8+VFNZrb/4GYH5Rboop7HPpupcSbocmA6pnO3qvoVHfXJz1gTxXh57ALswqJQk4eb
	WWL0MDrSkC1x+R6h02OXKgJEv1NXp8f/Be96YtRB/jXykDkfKMmY+eIiI/t+z2XvvoU43lcCzbskl
	Qs+roMoRnl/O19KTpK3xDMJALZqzA4dheZ8+vortptSvOL+XDMlq58DUbUIaAEoiwjc3opAPZAs+C
	ejGfQDawCm8ER0TBVwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMx3-00000001wDn-1xyn;
	Wed, 07 Oct 2026 08:24:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMx1-00000001wDg-2Vsu
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 08:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0BBD600C8;
	Wed,  7 Oct 2026 08:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028E81F0089B;
	Wed,  7 Oct 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791361474;
	bh=tEHk71hYPBCCE5NSj1/QC7/bFh+9rih0EHooMX+l+AI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=g4BIVvvibk1n55JtSi1PZH3NBzz0Q+6Y1F2jpAswWWxMhg8nWx4OTX0N/BV2lcK2Y
	 hk3M/xWmj3kkY6+WlwQ4pCpqfzff7dtvn9H6EBwjJUNeVdvIiQdCHGdGHhq+4FOQAr
	 FOGA0JRRdabHzQoH2OGLJjmgT85x6lLeaF6sBEw+cKllqMLyIgfUCcGtGskR/x0I2U
	 KsaX0/AvetYcEhxZMdw0xLbBMods4dNijg6csE3wJl2vixQLlNGV347HEr10+Skucq
	 aBZBojmFoiKc3y8aCkKpE1eIG0Nble7B/zYbqxBKOFh6J98fuQbgcJjBxtepWm690L
	 k1YQzQ5xfju7w==
Message-ID: <a8bc1396-fa38-4648-89c4-ac528fc1888b@kernel.org>
Date: Wed, 7 Oct 2026 10:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
To: paulmck@kernel.org, kernel test robot <lkp@intel.com>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
 vgupta@kernel.org, guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
 <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
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

On 10/6/26 17:44, Paul E. McKenney wrote:
> These patches need to be applied on top of my -rcu tree's "dev" branch,
> which supplies cmpxchg_emu_u16().
>
> Nevertheless, thank you for your testing efforts!

Sorry I don't have your tree is my git remotes. can u point me to the 
msg id of the series which was applied so i can fetch it and apply.
At this point I can't ACK/Nack the patch since w/o the pre-req it just 
fails to build locally exactly as the kernel robot found.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
