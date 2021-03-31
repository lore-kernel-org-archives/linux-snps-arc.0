Return-Path: <SRS0=3lBo=I5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FCBC433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 31 Mar 2021 09:38:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A890661963
	for <linux-snps-arc@archiver.kernel.org>; Wed, 31 Mar 2021 09:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A890661963
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7NNphiZRy5xEVq7W7qY2OA2ZNSWoLpdFuvx2Hh9QkvA=; b=WpQevYMcJy35mD03UaF6sgLvg
	CyiCQqVWVPqtwzRyRwUxVG4jo463IHma2UYOabHBxjGGMt6dxxTSJ+UShYrGX/9OemZQ7NKDt293o
	QaxwaeQURt9ze6fGzHd7NkJYRhIpyw/9c19NSHreyL5EdeeHw/RmJAq5gf9hxFPwxz/eaLKLLfq4/
	/XZeO0ECCBW+PjCM9+cZP5pA1TF6xHxBRg7sJG/N9XawfIuy+oyvMaoHyrLPmwO5IutVVXUzyJFJn
	cb3zMNg3166i6p4r4f3DP97dEYEJpA3ejRZDiQchEXhPrnB7ufP4kt7/HN8VoeYhULQt8pbg1C9F1
	+1PLIz0xQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRXJM-006Ap9-13; Wed, 31 Mar 2021 09:38:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRXIk-006AYt-1S; Wed, 31 Mar 2021 09:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g5jil2A5p1wkLzsVeTmgtclSOGELktvkEXEKlZIjYVg=; b=XiJ+OxK9qQFp9pb3iCkwBlOXp
 SMJ3LhDQZ76ImMGs1+23oQ/WioU0hWz9YYebFqQSGNvQ9UoNd6HpZZO1Sjlw6ufxhQGjsXhlyq1yL
 Rg135ndoOTaxrliAkRSdtcBfX2vfDfUyJu5lpt9Qx1ISZiGbjOFZL9lbJbIgPizvs5nTWoRI4FLnx
 IITtjbSu3y+aMQU0qpykWL/nQFeQEL15bN2ggOwffKUuT89Wrfg/HzYa88LdxJKrx3C6YUip0LQa6
 pzMLGWk3w8Fc3V7dXGDMahXGdpM/gmApUuTa+Zg5+b0cW019JI5maq8g7N3s6BN2W+w/Or1ItM82H
 Rqn3lcuqg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51970)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lRXFB-0001b6-Rl; Wed, 31 Mar 2021 10:34:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lRXF0-0003oo-SH; Wed, 31 Mar 2021 10:34:22 +0100
Date: Wed, 31 Mar 2021 10:34:22 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Huacai Chen <chenhuacai@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
Message-ID: <20210331093422.GU1463@shell.armlinux.org.uk>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_103816_213466_FCFE906F 
X-CRM114-Status: UNSURE (   8.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Mar 17, 2021 at 09:52:10AM +0800, Kefeng Wang wrote:
> mem_init_print_info() is called in mem_init() on each architecture,
> and pass NULL argument, so using void argument and move it into mm_init().
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Acked-by: Russell King <rmk+kernel@armlinux.org.uk> # for arm bits
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
