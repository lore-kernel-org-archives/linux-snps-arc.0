Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83CC636CD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Feb 2023 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RtIzVgxs2vR67vcL80q41fa60tB/tZMENlwhBHz0iTI=; b=Ndw8RT4MdpGih1
	mk7jCuyjVbhyKaxZ2dKxQiAyQn9GeP7MBR8+Tju2yRdFzG2353M8LYeazVPyIptuCA2l/WmUTPj0l
	PvyKsSc7K8QgsCBoxpJ+VIv1mwVQbcQ+DkRxaJwhAcnSKOplSPEvsLVtfZL6tIfledATsWjYScuiP
	Sqk7O1R11GHK727Ccb1rRSYQUqlmbkyPmUbsDHfvRrofM7ZSBBribJLWBd5678UqtGEQ2l+5hxVHq
	eZEMqAHmN0Z+ccDKAa2PUZLVF71ye+Zezxkspy9assQsyNYrUK+obXyI1K/D7EOUGrv7ZqQTMLowg
	izMOZMBBV+Xr0hpG6S5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWrC-006fV7-2q; Fri, 10 Feb 2023 17:06:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWrB-006fUI-1S
	for linux-snps-arc@bombadil.infradead.org; Fri, 10 Feb 2023 17:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QnGuTFUCTIO7rix/+M56HivEUJ0JskWeuG6VLUB/yNY=; b=kKtNrgzK6T32SXspWBH5+W85ch
	FL0L+8jrtbbjeZmM6F8uIVjR+BkqiR42DuQ8GvVdXpT1XArwVtI7QXSPGr5zgqwSrHLXtKIrv/c6Q
	yY9RH02XDPsUCTUGROFTTaHU6YCUUA3XicSU78R/FLKdoh6viHSsSoN1qu5ijn1H8kNKPhDjsZSuc
	x+sCL2/bSGF1USuAxeUspQn6wzEq9qsI54hV7S4yyc0rLODiU5lxMLa0ugxRZrbcrVvraX4htaYAn
	8Msh5umuUsmluRha/5Hmhff2yZOLFNIvJU6OqwFEzZFFNxWwlsN39bUAZ+/8YjhWzspwK5Aa9/R7L
	vxVqoekg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWr8-003HkD-Sd
	for linux-snps-arc@lists.infradead.org; Fri, 10 Feb 2023 17:06:38 +0000
Date: Fri, 10 Feb 2023 17:06:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-snps-arc@lists.infradead.org
Subject: How many colours does the ARC cache have?
Message-ID: <Y+Z5nuY/PaINgW0v@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
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

I see a discrepancy here ...

arch/arc/include/asm/shmparam.h:
/* Handle upto 2 cache bins */
#define SHMLBA  (2 * PAGE_SIZE)

arch/arc/include/asm/cacheflush.h:
#define CACHE_COLORS_NUM        4


(there are some other problems with the arc cache flushing code; I'm
working on patches to address them, but those are things I understand a
little better.  I know nothing about the ARC architecture itself)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
