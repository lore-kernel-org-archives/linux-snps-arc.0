Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB44C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Feb 2022 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TGn6LX1eRQKSaaarGJB91QK4gjAhYYLuWLooDMjpxY=; b=qHLpwzZS3WpULs
	PakGdQ1pfbMyLMpz/UrzaQBfJFi9rXz79C8eH5GUFlmwIdWEnm+ZuhLy+WA7GxaB1RHNsEQulO2gE
	uiSvtq1Fa5VA1PX9DI59tBB3BUqHdWAV/Sjj1+8UpLmAonigXq0weVV9kFWR2ZSVFh0pgOpnq6HjH
	lGGvc+jn6zq2kswqOleaRDfdFz6IDGud5Ozc/B/XUFjlBiXpMbUmHNE2+fKG7yTr3B/c17x8TUBeC
	F1Mo4jsoT9t43h2L8moGpgrpW08VoTBsZYl+K8Xj50is8vay5EnicKQ5jjBf/gt8SXH0Na5xRg1pH
	sqeg7NeZSDI9ogd356ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOe6d-00BpEn-0N; Mon, 28 Feb 2022 11:22:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdim-00BcnG-6j; Mon, 28 Feb 2022 10:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DM3iere1mz4IiAwYCVyOTU3E+xuCTYR85Md0nHyvzDc=; b=QSz7tR2zlZoaBSWZGCaio7Oilq
 VwpNbxcqDPOH5Kt8OjbQhKwhks/heDAW4JFpmDfExgUTPmIf+TJ10GIXRaXS+m7eIwuh+Zrmg7ard
 JKb4cBAyp9suGksD5aOyDCbwX+GG/5CmBp/gJRuLB3YTEup0rKS6dKesQIWN1THmbCdg+fDs9npwW
 3G62kcQtbbdR93/Yp8xWQeqnioTzargs6Wc3dgV6A9bObOsm+8HNJnnVTRueD5kTaHC4WKRDrKhk3
 sYEtwY/WuFW1YR5ryQKZcakT/DA1fRo7nFdF8mglYtoE5o2X2pzfPHjvtIcfU/vD9UYjeVFBIOfpb
 OWrBs5aQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57554)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nOdiU-00087R-Ua; Mon, 28 Feb 2022 10:57:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nOdiQ-00064t-9z; Mon, 28 Feb 2022 10:57:18 +0000
Date: Mon, 28 Feb 2022 10:57:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Christoph Hellwig <hch@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-parisc@vger.kernel.org, openrisc@lists.librecores.org,
 linux-um@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_025740_464510_BA506403 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrote:
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed.

What I would really like to know is why having to run _code_ to work out
what the page protections need to be is better than looking it up in a
table.

Not only is this more expensive in terms of CPU cycles, it also brings
additional code size with it.

I'm struggling to see what the benefit is.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
