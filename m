Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FBDC3DA78
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Jan 2023 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGOg7yAqc/rVnVPFZyRCtg4f+EvOR2gr862aM0Ho8ag=; b=OjTD4wUsC9hdss
	x0H5gX+Uug3lNxdgfgdY4gVPZp972+lJ1PuVSkoJx5XkWInwuO/8ujqo+55MrwrsZXlZKSsg6Dq3J
	zrpF4b47JoQn+/xmZVfD7ovE6DF4IEHGFKitaFCM+5KWqhA/YFr6NXcqZXe4qa8zYn6rNcNy3mihz
	fZri9bj6Ar/+Z1baefhAmtRaGrZ8AU4PN9OU56mLS5Rqg4+S1qk5HCcsvJvax/q9fw4O10KRhs8LZ
	ZE6KOSZmiezcJK+pjy5XaV3IL0EXIW5QtJmJ2wDZc0/2deXcDcqCfj057MDWSHtyIwyYyAO6OIvr/
	CCSeZaEBOamJ0ws/84Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGO2H-003qBL-0A; Fri, 13 Jan 2023 17:40:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGO17-003pZ6-Tv; Fri, 13 Jan 2023 17:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cy2F0NK90EWaw0M5GPoEQP9ffyepR3s0fUS7pZNqVNM=; b=mgsygI+GVpRKAc6PqndPLE/EGN
	RBXy4FaTuRYaN2huyWrOk+neGZ1ufgqmyi0yXaCxDKbFxKLUFjjgGati04nsAxMUVMX6F93HAT5MV
	jCcjeKcAKc8BuBDKNvpyU4OjSZ3Cz+FrSGYf7cnR14hsABQZhPfPnMdvz6HtQe9qMx/+pGJhPDPZF
	/qyCY0jr74qxGY8j5oRSoOBymBNR8AWbho08oGYqS/eKId6CpeqD2QoBShcQEl28G2ynMmhKfr3vd
	JwyOoMKWaS5EaZC4VS2qmXffZvRjoZ/Ill46hfsEaDEG4akgzhKR6ntCiBFX87m79qo6FBnSd5kkP
	88vn84dg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36094)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pGO0i-0008DZ-DC; Fri, 13 Jan 2023 17:38:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pGO0d-0003KS-Da; Fri, 13 Jan 2023 17:38:31 +0000
Date: Fri, 13 Jan 2023 17:38:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Yang Shi <shy828301@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>, Nadav Amit <namit@vmware.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH mm-unstable v1 04/26] arm/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <Y8GXF/AgLKgWQW5p@shell.armlinux.org.uk>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-5-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113171026.582290-5-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_093902_007379_E60F838F 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, Jan 13, 2023 at 06:10:04PM +0100, David Hildenbrand wrote:
> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit from the
> offset. This reduces the maximum swap space per file to 64 GiB (was 128
> GiB).
> 
> While at it drop the PTE_TYPE_FAULT from __swp_entry_to_pte() which is
> defined to be 0 and is rather confusing because we should be dealing
> with "Linux PTEs" not "hardware PTEs". Also, properly mask the type in
> __swp_entry().
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
