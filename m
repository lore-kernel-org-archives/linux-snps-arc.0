Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB43C5DF9D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYQHd/OcRICyYLTEyMY36VzL+680dsUsx0buq7bnJ4Y=; b=NlWDdtaK/IzeuU
	7Xw7+lowx0ifQre0ltW27nSGDJEiNI7qSIgiGdnFEMKzDGJiT0SXaCub+Z3BDjClHvb8v2Pve5X9d
	qFbahfQ72zWZ2e3G3fjvNQ+R/Cfp5HKBdFTr85KjTsC0u+YFaNZK2CgGhLhnvAw3fHUsH/Im61wGb
	fMTusxkEY8SMhrsIACQmne92rmx6teUnq7ibrpOUCmwKH5AY0OqV6TYYm4GUrllAnes1I69LPy0uM
	LHSxdGAmGz4VlLPHN3Qcryjh5WBWzpijK2/30xObfbgy8EKzjaXYKQ7W+XI680Cm5xMkRXYDAB/t1
	D2fZVdikTY306+/XtzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP66-0000000G4gP-3IR0;
	Mon, 24 Aug 2026 07:27:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP60-0000000G4cZ-2b3q;
	Mon, 24 Aug 2026 07:27:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1173E600AD;
	Mon, 24 Aug 2026 07:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AFC1F00A3A;
	Mon, 24 Aug 2026 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787556471;
	bh=TDmng5bNiE+YiLBp1dwqj9DRhmUVXQIS/lif+VRO/fE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LisqMsMwto/kBuZ7gdbcgEJrUKMCvB31iYajSaP8VSdLEt16BVkX4Oh7MmltHH6/x
	 lgJMQ/bHIDKxJx2zSKHsCi53faclUGyXrEjtwgO9HglPDbBjmzSGM601uHETfiupKK
	 k9L2jhdovk2XzuRexJe8lI2Ja3+L6F1zhgtZeR57y04iBM9ZTxAg8R4/0hzvBRU/1n
	 j/yQ64IOrcqDTuW2xREKaopx2MCLiJJbnIajCPVW+gYaQ/oYq0qHnMHsDEPBeQlGIk
	 UAUiHCdZACNNtFoUCqb60H6mqsfCFPiGb92umTHv0AOcuZ/mH0PdZQm1D5ksQY3O+D
	 A0IEUUHfnBZfg==
MIME-Version: 1.0
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
Date: Mon, 24 Aug 2026 10:27:34 +0300
Message-Id: <178755645423.3606540.12945780031100652573.b4-review@b4>
X-Mailer: b4 0.17-dev
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

> Move ptrval_to_str() inside a header thus making the helper more generally
> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

I agree with David, include/linux/pgtable.h is better.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
