Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E3C021AA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2025 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=vOZ3URGAIXRXHDeId+NGDd7N4CRFg7qqa+rsN2+WUCk=; b=TWj
	OnBeYcunNkO4+lZdXtAeIwF/gVW10Em4XjTGsZJ2g5Y2FK0h/rpvZyi7Wgae+A9PuMIkTxlYDzGH4
	0g06I44Hsw6YFFUd29rxjYvcveIkFw2XeaLLsFwrmb6E1JTegW4+YDjPhnnjcwsHy7H0OuH7LLmGJ
	qfh+jUtEOy8wlDiRXTfaP2acvKK09anYoBPAcX6S8x9PyKqPe1+Ip2QhM9T7v2J+z0J9qxy4ZRqxY
	6Xu0+BaipIs9jqe/PHuO2K4q03yDvpzBJx3QMcWEdJViTQdRx7TiCN0w62qFbrZIqAPilxy9OC0W9
	YBNx6sVA1UsIaHqxDS0kdfxyBwdQ9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8L-0000000DsLg-3gSV;
	Wed, 19 Feb 2025 16:41:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkiv-0000000DBWR-0G6J;
	Wed, 19 Feb 2025 14:06:50 +0000
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD261343050;
	Wed, 19 Feb 2025 14:06:42 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linmag7@gmail.com
Cc: arnd@arndb.de,chris@zankel.net,dinguyen@kernel.org,glaubitz@physik.fu-berlin.de,ink@unseen.parts,jcmvbkbc@gmail.com,kees@kernel.org,linux-alpha@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-csky@vger.kernel.org,linux-hexagon@vger.kernel.org,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,linux-mips@vger.kernel.org,linux-openrisc@vger.kernel.org,linux-parisc@vger.kernel.org,linux-riscv@lists.infradead.org,linux-s390@vger.kernel.org,linux-sh@vger.kernel.org,linux-snps-arc@lists.infradead.org,linux-um@lists.infradead.org,linuxppc-dev@lists.ozlabs.org,loongarch@lists.linux.dev,mattst88@gmail.com,monstr@monstr.eu,richard.henderson@linaro.org,sparclinux@vger.kernel.org,x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <20250218175735.19882-2-linmag7@gmail.com>
Organization: Gentoo
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Wed, 19 Feb 2025 14:06:40 +0000
Message-ID: <87cyfejafj.fsf@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060649_120856_6A90FE15 
X-CRM114-Status: UNSURE (   3.15  )
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

Lovely cleanup and a great suggestion from Al.

Reviewed-by: Sam James <sam@gentoo.org>

I'd suggest adding a:
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

thanks,
sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
