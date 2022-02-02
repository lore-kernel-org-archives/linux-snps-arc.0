Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD5C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Feb 2022 05:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4NO8RU4w5lGXPcSIyuHyAPLYFRDA03HgOu3lQmBSGk=; b=xJKPi2Ss43Y9B9
	ZrbAWS1bO+6J13NcXAlJ5KNumnzadNSEhN+5+8TdkZq4j2p3vdt2Rdz6P8CUuLAggoKLSJU/HOLIE
	p/VDgTAczFZf5aeQwhgbsMDRGsFZkB6bJRHLRTgQl1rhlryvX4RqCwR70lgraC5+iBDC9Kn6R3jQX
	AT4NWKfcrdDTuYK+1L+i3X70oydEJJl6XnjInBmrxEeC5CdlpDNLUZSDOkkG4HRVdl0K2NAw5E33P
	8YyWx54cEcXFa99C9IB9619liFDdlelBlBlHhoP9cPI1NYQbf7RP5YkP72LZXgasPVz94YkbKQmno
	WTNMZXpYkXfjvPClVh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF7yG-00EDNf-8B; Wed, 02 Feb 2022 05:14:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF7yC-00EDMq-6F
 for linux-snps-arc@lists.infradead.org; Wed, 02 Feb 2022 05:14:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E82FFB82FE9;
 Wed,  2 Feb 2022 05:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A47C004E1;
 Wed,  2 Feb 2022 05:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643778846;
 bh=imZtOHafnP0zyHSANkMNJsPmi5SRhpArWvz9iQCdVVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JBVpnR11KHjanIJM6HBTliz5N3+BdBOX56HYH+8AhtHdNfknE5NmKujtWTKW+EnU3
 D8RF1Zj1uvBoqe7gL7TDHLEbGrWJlyquHmYeBGrqT8mPOE50i4WeznjwUStmdLuLes
 1y+O7CE70RvuMrQ5fbvrGi34rA6dbbnTK8SMTvqi6Uaea1w0n715BaLABEphJa6WmW
 ZUXHs1OckTUk1fJCRESOYOPSGhB8jUpJuHIFSLl5SlQ/+HefMgB/tyZHsB+S1qBVe3
 +7bBQPp1QuReHldT9N8Eht+3B1d5sZJ6cyyFT4HF4Wy0rHEw+mNR7ifVejzZ/bAyvw
 mAYa3/SL4yEpQ==
Message-ID: <f0f5d195-cddc-3a8f-3503-bb1fa602a2b6@kernel.org>
Date: Tue, 1 Feb 2022 21:14:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/3] arc: remove CONFIG_SET_FS
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Christoph Hellwig <hch@lst.de>
References: <20220201145538.111192-1-geomatsi@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220201145538.111192-1-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_211416_429368_716B5EA3 
X-CRM114-Status: GOOD (  12.00  )
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

On 2/1/22 06:55, Sergey Matyukevich wrote:
> Hi all,
>
> This patch series removes SET_FS support for arc.
>
> Sergey Matyukevich (3):
>    arc: use BUILD_BUG for invalid sizes in get_user/put_user
>    arc: provide __{get,put}_kernel_nofault
>    arc: remove set_fs()
>
>   arch/arc/Kconfig                   |  1 -
>   arch/arc/include/asm/segment.h     | 20 -------------
>   arch/arc/include/asm/thread_info.h |  3 --
>   arch/arc/include/asm/uaccess.h     | 48 ++++++++++++++++++++----------
>   4 files changed, 32 insertions(+), 40 deletions(-)
>   delete mode 100644 arch/arc/include/asm/segment.h

Nit - in future please use uppercase "ARC" for prefixing patches.

Added to for-next.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
