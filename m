Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EA2C77B75
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wrj/zTkKKyZVm5CmS1wjVCvKh5asPZRr/6cQ26Hq88w=; b=v1LqaBvVk5dtUt
	gFOqH4IjlB6FJQ4AXiVoPvzIpsbGsOOSPww+wU5R2YLcXqNFtWOB24T+QBD+RT9nWKOH61uFdQlBk
	3tdnUM48BmaDIP61i6RG1niiX249Iq87zrGRnmL2K/xTbtfaPCIbyQ6Vfq/wej8h0MFoG8dqP3u5v
	xVF9EEo++grpLcCyWKVy53Itz2fU31IvdjQzFnQg3sqGvZ/cEwquUzxSQRDyOVwvSJJAng0QlacUv
	Kiduv+926pBZjT3cX1rNYiV7qw4oTky7F1M6fBuXn8nqwaaAj5dTINZ8uYDq4c6CKiyXVoMQJ39rD
	r2SUjWjOskbOOjbOnWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQG7-00BeVG-0c;
	Fri, 12 May 2023 10:44:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQG3-00BeS0-2S;
	Fri, 12 May 2023 10:44:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C11B46553A;
	Fri, 12 May 2023 10:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C95FC433A0;
	Fri, 12 May 2023 10:44:15 +0000 (UTC)
Date: Fri, 12 May 2023 11:44:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 11/12] arm64: memory: Make virt_to_pfn() a static inline
Message-ID: <ZF4YfJ8322Oi5rmT@arm.com>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
 <20230503-virt-to-pfn-v6-4-rc1-v1-11-6c4698dcf9c8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-11-6c4698dcf9c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_034419_842355_D150CF7D 
X-CRM114-Status: GOOD (  12.80  )
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

On Thu, May 11, 2023 at 01:59:28PM +0200, Linus Walleij wrote:
> Making virt_to_pfn() a static inline taking a strongly typed
> (const void *) makes the contract of a passing a pointer of that
> type to the function explicit and exposes any misuse of the
> macro virt_to_pfn() acting polymorphic and accepting many types
> such as (void *), (unitptr_t) or (unsigned long) as arguments
> without warnings.
> 
> Since arm64 is using <asm-generic/memory_model.h> to provide
> __phys_to_pfn() we need to move the inclusion of that header
> up, so we can resolve the static inline at compile time.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
