Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63802C77B6E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Mar 2023 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EM2xn3md+6/AKFmBWsC/9jnborh1uzzB22Iu5mXB5lQ=; b=pacy7rCTcsaSWZ
	gO8Uuz92rWEQ6wvshQUgTqmxGqgqpBH3Kmo/YWWUyavtUgs/BqAYV2mMWTZiiqPsMD8yQlxW+4jUU
	2oFpPT27qrach8t6pLJluTmPaLD6dlNzFY/3+Qra7KmqEXxuycCkWkEMFmXBA2L1i/jbqhqpcuHBT
	xsjRFAvfJ716S8c6skmgx3KAt+s5a6aBGd5c+AkH177j1RH8Jp3B0o+4pQG54w3S0nkj0IYZO2Y1t
	TZYBAeSCZmfOD9yPxksqOMtlZOJuIEcmIpjHw2Uz7y03sOBflFyna80PLuZGCI3FF6J3hQlWvHnS9
	B7BF46jLGc2S6PagbmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmRV-002rbj-2x;
	Thu, 30 Mar 2023 07:11:29 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmRQ-002rZy-34;
	Thu, 30 Mar 2023 07:11:26 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 91091581DB4;
	Thu, 30 Mar 2023 03:11:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 30 Mar 2023 03:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680160280; x=1680167480; bh=wG
	Aj9k8TObyqA6xHoUKa8szJrjCAJbphSDFQitQcQQs=; b=QVEDTKeVke/4u7Kg+r
	/f0Ng8qyMJQjA0k7T1uZbzE62G/ueNBnWjpEnArFMDM92zNIXQ0BVhpsTK81gyt0
	xSP5pbZY1IxVpqUBM+h72I4sgGKqPjbLqxNcKo6QCWkB1PzdfOUSKkfxHkuBpgbQ
	cYQ6HqJa3bwV0Vkf7hmy8ejQKyFDSRYDfGJpYSPAochCUC5d86UJcSmtdy6Sxo6B
	Jwxhii7JHhX5S3HrIP0mKrvU6BvYZqwsLNUfy16VYFyQuCPOCAze4qZ6sDRlwyQw
	F08a6VUS4QIWlJ5ptfnwv75T7l2QsYPv/2qWlc1FTlhkx6SDxxZZxa17eJWjG25W
	8QyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680160280; x=1680167480; bh=wGAj9k8TObyqA
	6xHoUKa8szJrjCAJbphSDFQitQcQQs=; b=oomTeCD59PNC83Jndx1U6VLOVE5Dm
	iHmSiz3n1GUnKD2uHg/nJb7LQ4xFS4iggJ6sXq9/uqeoafmTb21qaw3LmGDGWVXs
	zFRwDOtSbIgfSbefSTdQy+SDzfOWXM+Nas8Aqo7qkiw5wE6y4qdG6iwjS4DRWXtn
	XctTZFf5GY9RMg5ciHLqGdffXqZGKOwN45T9El3FCgUi5LSy7a/pQo0750iSwL/f
	RG+pNkv9fRAgzmmzo4HLa1cEOhymbMSIXzYbzI354FYA0THouxwTuuuM0yobQ3gk
	LFgzGrnAkD2cRuN42h7TslpEIGdInF1W2TSA3tfbtXeFABGM7k1iBb/7Q==
X-ME-Sender: <xms:FTYlZOrkzwdxpCxeIZzclV90hxzPUSC3ms8-E11J67_aPSJXJ1BIkg>
    <xme:FTYlZMrP3FZFc1NJSA8GIlQPVO9kl25CsPN1r07QL_dGO5vWTCxWy7o2eATgnKdQ9
    a578gSy3QQoXr1upcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehjedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FjYlZDNNTBCw6HhWBDqV-oUWPDwRI7BTNiBMI3iXI3sHS545zVmJ2w>
    <xmx:FjYlZN4cwCdj47vqSASOc6XR5L2duLCySn6_f-BJZvURW8Sn6XqTzw>
    <xmx:FjYlZN6Cp-M6Z89_Yu31L8qrA-V1bCiPBKi9s_taeLF3yPIrQttNLw>
    <xmx:GDYlZL7CJyRZz1a_FlDEKTyWBaiLrIUUjNVWWchrrS5Jr6hXYCWp0A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E08C7B60086; Thu, 30 Mar 2023 03:11:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <34f3e043-20eb-40b2-a7f5-b1b98a0d452a@app.fastmail.com>
In-Reply-To: <2668e232-ae83-4576-beaa-08e420236996@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
 <2668e232-ae83-4576-beaa-08e420236996@spud>
Date: Thu, 30 Mar 2023 09:10:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 "Samuel Holland" <samuel@sholland.org>
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_001125_506873_F4FDA83A 
X-CRM114-Status: GOOD (  20.90  )
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

On Wed, Mar 29, 2023, at 22:48, Conor Dooley wrote:
> On Mon, Mar 27, 2023 at 02:13:04PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> No other architecture intentionally writes back dirty cache lines into
>> a buffer that a device has just finished writing into. If the cache is
>> clean, this has no effect at all, but
>
>> if a cacheline in the buffer has
>> actually been written by the CPU,  there is a drive bug that is likely
>> made worse by overwriting that buffer.
>
> So does this need a
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using 
> zicbom extension")
> then, even if the cacheline really should not have been touched by the
> CPU?
> Also, minor typo, s/drive/driver/.

done

> In the thread we had that sparked this, I went digging for the source of
> the flushes, and it came from a review comment:
> https://lore.kernel.org/linux-riscv/342e3c12-ebb0-badf-7d4c-c444a2b842b2@sholland.org/

Ah, so the comment that led to it was 

"For arch_sync_dma_for_cpu(DMA_BIDIRECTIONAL), we expect the CPU to have
written to the buffer, so this should flush, not invalidate."

which sounds like Samuel just misunderstood what "bidirectional"
means: the comment implies that both the cpu and the device access
the buffer before arch_sync_dma_for_cpu(DMA_BIDIRECTIONAL), but
this is not allowed. Instead, the point is that the device may both
read and write the buffer, requiring that we must do a writeback
at arch_sync_dma_for_device(DMA_BIDIRECTIONAL) and an invalidate
at arch_sync_dma_for_cpu(DMA_BIDIRECTIONAL).

The comment about arch_sync_dma_for_device(DMA_FROM_DEVICE) (in the
same email) seems equally confused. It's of course easy to
misunderstand these, and many others have gotten confused in
similar ways before.

> But *surely* if no other arch needs to do that, then we are safe to also
> not do it... Your logic seems right by me at least, especially given the
> lack of flushes elsewhere.

Right, I remove the extra writeback from powerpc, parisc and microblaze
for the same reason. Those appear to only be there because they used the
same function for _for_device() as for _for_cpu(), not because someone
thought they were required.

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
