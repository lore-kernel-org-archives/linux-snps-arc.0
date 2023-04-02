Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BB4C7619A
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Apr 2023 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfAbSvOsSe1fwpnZToJA2rRLuOUjpv03yS5J/7uHUCI=; b=p1i7PCQorV0GyX
	vYvRjEjMzlCFM7HsuCVMyOkukcMoXaNxeu6S9o326bmq2o+5CNakaWsRkX59/nAPhDPwhyP3j/Mp7
	ZbFIGLf1ftPaEl1GHMhFtYbIXo7v7HcrvOD6AMHCe1MS0hTn6J813BPkdv3uGFWJbqvEPaC8eGniT
	giOu5fwNpItbmazS5ombAT7WKaSCVV0XiPCYzUcbREcu3VyCqD07J8tkCA13YtslZhViQ0tht583E
	sm4aR3pkbHibNfhrr38H46lz0sYrNDsY5cMQ5F6OLN49NO9ffUe235YsCma3NAU0x0/b9sTDY93EI
	FHAik4CR8FPrISefDaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pirZf-00Buxb-1q;
	Sun, 02 Apr 2023 06:52:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pirZZ-00Buva-1h;
	Sun, 02 Apr 2023 06:52:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D26E960F78;
	Sun,  2 Apr 2023 06:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172F1C433EF;
	Sun,  2 Apr 2023 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680418330;
	bh=a/EFMMyTJLmdvL39oZFGsprYDxcAb3c4B++/AP48aI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pqQ8UGR2W/sRFjxT8DARJF1gEKMVmWBdp+qDC9PGt0i4TRAg0xAwoG7YQQxAtDcdi
	 4Pb253Uxof3u9uF71S5Xrs095QXIy4AdVj3153ZRySY7w6oib4sTzQ8CqAmyQSRayG
	 2EAT/e6m3unLAUSKk8zn/YhBr3R6k1eBeKiApm9beA6GV7oD5h7f9NbOa+/z/XcUUq
	 Wo1iHf9vVkeyRvdktceSDmuJx7kOOEGZtUZ6DOOxmfVTUgf0Rrb6I9FB+HQBZqNZ1B
	 jIzLWCQM2V8D9tYxUPIRptyXw28M0O5YuIe+Fd2OoUguwXFRn6X5yntmmRZtkvx66T
	 3696IoVFPDlHA==
Message-ID: <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
Date: Sun, 2 Apr 2023 12:22:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-14-arnd@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20230327121317.4081816-14-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_235217_627444_DA68513B 
X-CRM114-Status: GOOD (  14.13  )
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

CC Shahab

On 3/27/23 17:43, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
>
> Some architectures that need to invalidate buffers after bidirectional
> DMA because of speculative prefetching only do a simpler writeback
> before that DMA, while architectures that don't need to do the second
> invalidate tend to have a combined writeback+invalidate before the
> DMA.
>
> arc is one of the architectures that does both, which seems unnecessary.
>
> Change it to behave like arm/arm64/xtensa instead, and use just a
> writeback before the DMA when we do the invalidate afterwards.
>
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>

Reviewed-by: Vineet Gupta <vgupta@kernel.org>

Shahab can you give this a spin on hsdk - run glibc testsuite over ssh 
and make sure nothing strange happens.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
