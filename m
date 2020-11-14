Return-Path: <SRS0=iMHQ=EU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CBEC5519F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Nov 2020 12:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6354922226
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Nov 2020 12:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/xjbrmC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6354922226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0lQgsHW5KDIf3+wvtvxzcOmwj7RzyPbkL7siIZQUQlY=; b=V/xjbrmCy963cXiNksMTyhSqs
	9GIN1xb7Lme/Pj1+5vAZ9FZ32JbIPUdg2TvziaTHmb0/xWf4I82lUffozDXZUOaInE5yueCt0Te4a
	UAC9gEpSARG2nRSglkDTtZNbWboQ4sWBxdqXtUARyHH/dQCLCelgmSNVqbAPCyQMc6MmqfLXw0NeO
	fSJtizfDluFY/cDQrpx6U3SoIdhswHwLCV/Q9Lk3VoCnRNK0CyK2iZT2dy58DYQlp+xpo+T0PP/pF
	6Gr8NSX7fvXic2KVcfzTMvyyN6rD+J9EqzYDlxHolklyVbA0XQC3cmbkyU8tfHPKAA1GAtRJYQaV6
	S47yq3/PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kduSn-0003ju-Ft; Sat, 14 Nov 2020 12:15:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kduSj-0003ib-BH; Sat, 14 Nov 2020 12:15:26 +0000
Received: from gaia (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D4BE221EB;
 Sat, 14 Nov 2020 12:15:20 +0000 (UTC)
Date: Sat, 14 Nov 2020 12:15:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 09/13] arm, arm64: move free_unused_memmap() to
 generic mm
Message-ID: <20201114121516.GA2837@gaia>
References: <20201101170454.9567-1-rppt@kernel.org>
 <20201101170454.9567-10-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101170454.9567-10-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_071525_483152_C88F3D4D 
X-CRM114-Status: GOOD (  14.64  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, Nov 01, 2020 at 07:04:50PM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> ARM and ARM64 free unused parts of the memory map just before the
> initialization of the page allocator. To allow holes in the memory map both
> architectures overload pfn_valid() and define HAVE_ARCH_PFN_VALID.
> 
> Allowing holes in the memory map for FLATMEM may be useful for small
> machines, such as ARC and m68k and will enable those architectures to cease
> using DISCONTIGMEM and still support more than one memory bank.
> 
> Move the functions that free unused memory map to generic mm and enable
> them in case HAVE_ARCH_PFN_VALID=y.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
