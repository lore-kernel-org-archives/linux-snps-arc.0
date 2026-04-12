Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8830FE937EE
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2026 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzX3XZW0yDmscOTsUiHm9MJ8zFZTJdT5n+RP8k1iXB8=; b=BR0vd3JChwYcjv
	/Ffz2IKIxF2N/Li02br2wQK/dtgcFSYuVAX+Yu8Ioxn4+Qhu1BI2SKygie1USY4GhXIU0UafLLGqt
	ireFg/YE6jansGt1ft2LEaZwvs42iUHN2JG9UccnlH9IKfrnSWpAKDCC62RvtZt455jY9bo+NEWLy
	n4JO7GBmgimphY01kfpk0vLJLfa36Ra+4MIaX7qnUuyGZrbOncxgvK9zVfWAri2/UWodNfsKLdqPY
	7QP7uKs91TwibIs9RHH+M/1dYZqffIvQNZ8qwlFn7WahVTB7wyNC6Iw3vUH7LqTWcnaBRAFjJbi/0
	hAaGOEHUDWZzmJ0MWF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0aa-0000000EdYe-0dYP;
	Sun, 12 Apr 2026 19:35:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0aZ-0000000EdYX-1nwh
	for linux-snps-arc@lists.infradead.org;
	Sun, 12 Apr 2026 19:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E1A160142;
	Sun, 12 Apr 2026 19:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B67C19424;
	Sun, 12 Apr 2026 19:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776022521;
	bh=dvLv0IP/69VOVw5CVBSALubmN7IIwwDFGkLUsmFR6do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cDQG1rvftoLGkOw/6Z0WgzXz9kzgmcspubSdKG/TXbudOkBRisxWsNUs1tEYG1PgK
	 eHJIB7s2oPqXlrhtYp0i+oOv7V1doeZdbY6OnvTlpUbbKJQ70TFyGyrLBmo8sREU7b
	 Ztud+RKslRZTUdIA3BgUtZBVftBlPvuUupOxp8eH8iFkzEpVteZ6WvkikohyiJPUGD
	 qdznMUFhJpl9oZTRRtArJ2wrVlmvXPZR1VdWSrIMrf2Jl3O92HNhwbEqxOsZ6Oc98/
	 n4k0V9gVLIXtv3sgPbsWcVEqi1XDoMayUBIAq1C0A527VcDb7IG5XuBspGyPF6J/y/
	 m736HEw5IelcQ==
Message-ID: <7ec72f1d-0d9d-46f7-aef1-74ed40c78129@kernel.org>
Date: Sun, 12 Apr 2026 12:34:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
References: <20260412171110.630639-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20260412171110.630639-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On 4/12/26 10:11, Krzysztof Kozlowski wrote:
> I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
> enabled.  No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>


I've queued it for next ARC pull request, after the rc1 since we are on 
the verge of merge window.


Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
