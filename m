Return-Path: <SRS0=Gk/u=FG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD253C71155
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Dec 2020 08:46:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27446221FB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Dec 2020 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27446221FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5hbYih3sOdulKk+TsbLjKiX3WbpfRRDMXCV937z3aQ=; b=Mqc92z4YRT9fpaZ+nZQQO/j7C
	RDMdX0elCM5R4DzYOFk7gE592QNeIydzxoMdwy3Wu+O5HRZu8kRgTfpfggvtawGxVmFbeZ9sp79/K
	yXtUp62FjCFdCwL3rXx8TE78jM0T3dyufIXOgtGOd7LQ2HG3yVUP4WyKY/hgMP202L8k4Im0WhdMg
	gXD918sqHxKMR42pixZfZkc6CpRPy6veNCSQy+JaZumZiyEsbSU2xwCTTbCmCkV2U3CqYudgfDIvZ
	y/dSxDTTJIH5EocOT6Jomxlzf+4Hjg1hVg8li+nT9FHn72b87yShSeogZfsjtxF1Z7pluRUz+0bgF
	Usl4AWi6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkNmg-0004sP-B0; Wed, 02 Dec 2020 08:46:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkNme-0004rN-RO; Wed, 02 Dec 2020 08:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EgWbwhZanvcG3KDeapbwhWc86PAn7HkZxY3ELBxHx7c=; b=jFFK4+AenZ8fG43jB6uYB1OVZc
 U2ORttouuxGAcrpVnQ/4DgFb7rK/0XjR9MXteR2VE5qgh5UOuTWpmiF+Dt3Ie93nc64B1/PzU5U6m
 rxry57k0/IZnU8nQmFKzgLH4GfXQEXYWEXXMWqEjf0RZz3MX0cdkV1F+EI3Plew988r7LOYtU/hb3
 67fEvzDLswKqZ4dMNM6vQICEpWo7AqyiDFrzxq61UPOyZjx9A+HC5IY9XNJk3HVus//9sPZW+nCFi
 8BzyDcO4IchhjQ6h5DQTd3a3NtY48VtlxXAa/Oyq+zpXcFp07vAQK4e+S8sfjGaBNEN4SBgFh6YBm
 5JU3U6sw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kkNmc-0007Mi-JA; Wed, 02 Dec 2020 08:46:42 +0000
Date: Wed, 2 Dec 2020 08:46:42 +0000
From: Christoph Hellwig <hch@infradead.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Message-ID: <20201202084642.GA28110@infradead.org>
References: <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
 <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
 <CAMuHMdWRc8W7U0LKyH9u1hdMuN515PCZiTEJ12FrDaCx-eTdaQ@mail.gmail.com>
 <20201202084326.GA26573@infradead.org>
 <efc13ee8-ec6c-a807-d866-99f72a94e3f5@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efc13ee8-ec6c-a807-d866-99f72a94e3f5@physik.fu-berlin.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Dec 02, 2020 at 09:45:24AM +0100, John Paul Adrian Glaubitz wrote:
> > I've never got results.  Which is annoying, as debian doesn't ship an
> > ia64 cross toolchain either, and I can't find any pre-built one that
> > works for me.
> 
> The ia64 toolchain available from kernel.org works for me for cross-building
> a kernel that boots on my RX2600.
> 
> It's just not a fully-fledged toolchain due to the limitations with libunwind.

Actually, you are right, I did manage to finally get that working a
while ago.  I think openrisc is the one where I failed to get anything
to work at all now that I think of it.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
