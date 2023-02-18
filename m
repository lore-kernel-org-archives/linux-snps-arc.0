Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EA4C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Feb 2023 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Wv8CPUeR+9V9zq0ksISNEA09VOz1kEA9VJfNeGHets=; b=Q5BRrL2ViFoUsV
	4nsr8htVJwziLPy/aSvsBXicI4qWVklKOfpkJB++gfnFXpeck/RLe4iwcVnmoQ320+x19xNJ1aR0t
	CILOFhr7wUqcuIPIyQfRc4w6mMbiU+kVd+g1FyyaEBohD+8OP39DUMz+Qsj337j76E4LbT2iWkvqD
	9vqtWtHH9xp77MiBkI0HlqwBcLkGTFquVUQByVZKTfDhRQ9vPljvAyEUH3puo8knWu277+pvMS6ep
	Rxz9Uy7b3C370HhkpWGF978hjWBWqP23+qYHTIRLybYRgmnmQR++PNpFi079QOYi+QUmOQgrWf0mq
	qf5bepo3tWFE4WDXCVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTSV1-00HVq3-Jr; Sat, 18 Feb 2023 19:03:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTSV0-00HVpY-3M
	for linux-snps-arc@bombadil.infradead.org; Sat, 18 Feb 2023 19:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P659zNbO0hw8cfn4r4okqZRSsOpQfNoKGto3Dm6KKTo=; b=wKqt8KWWEez0MfnofvsNxsFzWc
	5HBAuZTQHzXCnDcTfWowBiFO+RDrIfJo8X//bS99uiMmLBZ5BEnmCddEh1bvLLjQ761/DLP72xrhJ
	gL8/VxbC+vGGDsJs6RzSLilH/5E8uUaHdJszUWkQaTMUML+tkryf/xDMZXOia1/ByT/7c0ugS6byW
	WHBxBnl6jU0xbZCTYmOtk1Bkl06Ikw5sdEaws/2agbKukJCDqJwUgV94zqc+6u1195uzNuHqdoyj8
	DxA2n938+kF9xU1loP7bu8GcQfFgF8Y92gcBLzrrxeSPf/lrOOeWjXFvAJskfzb+9cRqrzCBzd3B0
	lJwxEUew==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTSUx-00AMcB-NE; Sat, 18 Feb 2023 19:03:51 +0000
Date: Sat, 18 Feb 2023 19:03:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <abrodkin@synopsys.com>
Subject: Re: How many colours does the ARC cache have?
Message-ID: <Y/EhF1W9V+coccd6@casper.infradead.org>
References: <Y+Z5nuY/PaINgW0v@casper.infradead.org>
 <4ebe9300-c694-5a49-7180-ca6c14ec11b6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ebe9300-c694-5a49-7180-ca6c14ec11b6@kernel.org>
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

On Wed, Feb 15, 2023 at 08:59:18PM -0800, Vineet Gupta wrote:
> On 2/10/23 09:06, Matthew Wilcox wrote:
> > I see a discrepancy here ...
> > 
> > arch/arc/include/asm/shmparam.h:
> > /* Handle upto 2 cache bins */
> > #define SHMLBA  (2 * PAGE_SIZE)
> > 
> > arch/arc/include/asm/cacheflush.h:
> > #define CACHE_COLORS_NUM        4
> 
> The initial aliasing dcache support assumed 2 colors but was later bumped to
> 4, w/o making the adjustment in shmparam.h

OK.  Will you fix it yourself, or do you want me to send a patch?

> > (there are some other problems with the arc cache flushing code;
> 
> The VIPT aliasing config (which is pretty much dead and unused) or regular
> parts ?

I'm not sure.  This is incorrect in flush_dcache_page():

        } else if (page_mapcount(page)) {
[...]
                unsigned long vaddr = page->index << PAGE_SHIFT;

If the page being flushed is a tail page, then page->index is not
valid, so you're essentially flushing a random address.  I have a
fix for it that I sent out earlier this week.

> > I'm working on patches to address them, but those are things I understand a
> > little better.  I know nothing about the ARC architecture itself)
> 
> Legacy ARC700 cpus had VIPT D$. The cache size was configurable by Soc
> builder and the specific geometry could yield an aliasing configuration
> (e.g. standard page size 8K, 4 way set associative D$: so D$ > 32K were
> aliasing and needed CONFIG_ARC_CACHE_VIPT_ALIASING). Although there was ever
> only 1 customer who taped out an aliasing cache config.
> 
> The newer ARC HS cores have PIPT D$ and thus don't need the aliasing
> support.
> 
> FWIW we could rip out all the VIPT aliasing code as I don't think it is
> needed anymore. @Alexey can you confirm ?
> 
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
