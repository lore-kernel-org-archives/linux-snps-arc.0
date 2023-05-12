Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95707C77B7F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 May 2023 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tddiQPUX7pqtxzfDgT48Y4wrs+Uu0p3vRjpBSPNBev0=; b=hyN/B0RjrSVSwZ
	LYUUv2keokOBo2lpC01kmZdva2RvWMGjmJh5mmHsZznhawyihYH/XHVV2QMBemVl6k8xRjAIj3R4N
	DmPAv6hYd8gJl0066ZfP2CkOpZBdOl3NLOM3HKRXfrlh++FE7RYFbSMX16MQ2DQruZYQcMWnEdt0o
	sm/xYL4DO9l0Zp3LQCn3GWhQDAl5NMqILAOtf7wbkMou2/bhZvkPLUhK+pTO933tzQEhQmkw4KRaT
	TmkFU+1/ZF56NgeJekbhFjMWXQaK2uPF3JBj22SkflxQofqxLWKDfxMi/Dit5yK+d9nV6ywmaIrGn
	OoWwVGvVLgn8palYOGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQFm-00BeFo-2T;
	Fri, 12 May 2023 10:44:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQFj-00BeCx-0c;
	Fri, 12 May 2023 10:44:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE91C60FED;
	Fri, 12 May 2023 10:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4185C433D2;
	Fri, 12 May 2023 10:43:55 +0000 (UTC)
Date: Fri, 12 May 2023 11:43:52 +0100
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
Subject: Re: [PATCH 08/12] arm64: vdso: Pass (void *) to virt_to_page()
Message-ID: <ZF4YaPObx4y8apj4@arm.com>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
 <20230503-virt-to-pfn-v6-4-rc1-v1-8-6c4698dcf9c8@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-8-6c4698dcf9c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_034359_286213_8D382F5B 
X-CRM114-Status: GOOD (  12.12  )
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

On Thu, May 11, 2023 at 01:59:25PM +0200, Linus Walleij wrote:
> Like the other calls in this function virt_to_page() expects
> a pointer, not an integer.
> 
> However since many architectures implement virt_to_pfn() as
> a macro, this function becomes polymorphic and accepts both a
> (unsigned long) and a (void *).
> 
> Fix this up with an explicit cast.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
