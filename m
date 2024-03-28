Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE5FCD11DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3pSR5bqectLemWhcg0sGxh3W8aXXzd9hEORgw7K1Gs=; b=UErQDsg0t8AHRe
	DVetM0baJYLwTKsx13ZeK0LSXA0INE/GhxKNu/5gmxmwXesQmlE4Spfpy10WZ6a1Ufvs8b1aPonwO
	M2z/BB2xgSqV4wtWlRsctn4yaLHWh4xmuC4xRPTf1FBaPdQ/M6EK97ODhdhQO9PX1ceYcfbzGOqAa
	FFi5N2QedPjC7PUepm/T3e0Wvtfz14TFhaBvf574somJaIlKiXp+xf4YlOqpTnNbzwhz0Kjh3TkpR
	CoHAyLqk4YFUsaQzz3XklqbTFfUe0PqUveYCXegNQ4ME9Si2XJw1j3cCR4LZd07txZokysmLE9KHS
	rV3N/7I3B8exe+0m44ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuZV-0000000FCZt-08Da;
	Thu, 28 Mar 2024 18:33:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptSr-0000000Ey7a-3CJO
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 17:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03AA2CE2C2B;
	Thu, 28 Mar 2024 17:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8E9C433F1;
	Thu, 28 Mar 2024 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711646574;
	bh=qua/zmPT+EiKZ8b7JnambugGScyxnGAtKKDsUfi9O2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mpYK7CtE8kP2DP4Gu/JghUPoKhF/ix5wL8F/cGRw0BPfjxCHeQgzcRUhx36ZVsp80
	 BG6oCt60Yp9PzIXXfRAGmtYKTZKokjop+im8Zc7KcXJIyr4fSsGSKa/fwK1NHSxJMT
	 SP1YadUZAQyd5PFF/KSB5IJ56nULe28LhhTUD0aBAxCtqY0O1drmObju/epGG/bPOh
	 DM8iMm+aYuIKeJeyCDD9CFVcdE3GYCSCwo7z8ndISI97l+1PvGUkmEdHCPD7QvMzVe
	 SzMEnVMeeHuEcq1qhcD9ZnIvs6yJ8OQUVKZ0+uyLtquaHJ0m1wOlaSS29MCLtItglR
	 WrMzaodCMARog==
Message-ID: <abb3f8ab-c88d-4b04-ae75-62de0dddd343@kernel.org>
Date: Thu, 28 Mar 2024 10:22:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARC: mm: fix new code about cache aliasing
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
References: <20240328053919.992821-1-vgupta@kernel.org>
 <20240328053919.992821-3-vgupta@kernel.org>
 <2084d534-5e64-4a38-aba5-aeb03c9e71cd@efficios.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <2084d534-5e64-4a38-aba5-aeb03c9e71cd@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_102258_010236_6FD81F9B 
X-CRM114-Status: GOOD (  12.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 3/28/24 06:57, Mathieu Desnoyers wrote:
> On 2024-03-28 01:39, Vineet Gupta wrote:
>> Manual/partial revert of 8690bbcf3b70 ("Introduce cpu_dcache_is_aliasing() across all architectures")
>>
>> Current generation of ARCv2/ARCv3 based HSxx cores are only PIPT (to software
>> at least).
>>
>> Legacy ARC700 cpus could be VIPT aliasing (based on cache geometry and
>> PAGE_SIZE) however recently that support was ripped out so VIPT aliasing
>> cache is not relevant to ARC anymore.
>>
>> P.S. : This has been discussed a few times on lists [1]
>> P.S.2: Please CC the arch maintainers and/or mailing list before adding
>>         such interfaces.
> Because 8690bbcf3b70 was introducing a tree-wide change affecting all
> architectures, I CC'd linux-arch@vger.kernel.org. I expected all
> architecture maintainers to follow that list, which is relatively
> low volume.

Ideally yeah arch maintainers should be lurking there.


> I'm sorry that you learn about this after the fact as a result.

Please don't be, no harm done, the fix was easy ;-)

> My intent was to use the list rather than CC about 50 additional
> people/mailing lists.

That is true but I don't think maintainers mind that in general. I still
posit that any new interfaces to arch code should be explicitly run by them.

> Of course, if VIPT aliasing is removed from ARC, removing the
> config ARCH_HAS_CPU_CACHE_ALIASING and using the generic
> cpu_dcache_is_aliasing() is the way to go. Feel free to add
> my:
>
> Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
