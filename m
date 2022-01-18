Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DDFC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Jan 2022 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LD55sBQwmmDUxHOTwo7yWKKr+oZ6VclHSs09mFhFFxk=; b=e+AG1ybTprZg3v
	SUXAmjMWRqc9sY8OOzqs//SMQo6yK5V5rhM2nByb9QSrEqV36DZB3tSE4ASaIgGV02aGCGxNdJWZh
	t8Qfg59kUgQl27uUplsAarUeMr8JksJ0DO82m8zZsf3HyEy/yfG5MQw8jic/0dzLVodIlELE/5VXD
	6FKwo9XkBzYH3qJ/IfTN+Tmk5XGgiAJ6uyL6FyBEJRv+60+1w53284mvrMGEFm2w4I9e51Ihysl5r
	Sog5WdZiqyiOI4Zc2sUcMkF/zeOUeKg6Yt/cso/NvnzR+la0Mw3TDd521U7liM0/MzI9YdBbE1iRy
	Mzb4X8ivgJQ4HNTxcG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9jEW-000dT9-K5; Tue, 18 Jan 2022 07:48:48 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9jET-000dPP-Qk
 for linux-snps-arc@lists.infradead.org; Tue, 18 Jan 2022 07:48:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45C3468AFE; Tue, 18 Jan 2022 08:48:36 +0100 (CET)
Date: Tue, 18 Jan 2022 08:48:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, openrisc@lists.librecores.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@linux-xtensa.org,
 linux-kernel@linux-xtensa.org
Subject: architectures that still need to remove set_fs()
Message-ID: <20220118074836.GA20994@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_234846_041738_37EAAD0A 
X-CRM114-Status: GOOD (  11.32  )
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

Hi all,

you are in this list because your architecture still implements and
uses address space overrides using set_fs(), which are deprecated and
have been removed from all mainstream architecture ports.  To help
cleanup the core kernel it would be great to make progress on removing
set_fs entirely.

The following steps are required:

 (1) implement the __get_kernel_nofault and __put_kernel_nofault
     helper to access kernel memory without page faults, replacing
     the get/put_user under set_fs(KERNEL_DS) abuse.  Mips has a good
     example for a trivial implementation for architectures that use
     a common address space in commit 04324f44cb69
 (2) remove any architecture specific use of such constructs.  This
     only affects ia64 and sh.
 (3) stop selecting the SET_FS and remove all the set_fs-related
     infrastructure.  The above mips commit is a good guide once again.

Thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
