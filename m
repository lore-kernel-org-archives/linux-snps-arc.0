Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FF3C636CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Feb 2023 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plpcAgCIJ0F4zLHaL14qSgJDPQqls1IWVb59n7Ae/s0=; b=2G9r7QUqpKP8cx
	Bk6xF56EgcnCSl4TCDzKzdGJbHbP+AYDc6s7YIrdI7H28Al7ea3Eztf1dciEkDjoW/RiybizgahC2
	bbH08LphaN6H8at9oKHcC5u/iUcZszzfOu2bLrBgD9fQqld5cefh5fheYw982pft1pU+I3gB5XCPr
	0YkAlyKTBRPx9Y32a+dTlsQB5crLgaXyexQV8bcXkDOoIaG4NDZnJ5B8oE0ZO3RynGNi+HavhzK+K
	iLFyj6pUmirJDwFvFLfYdWK76uz6icHi9wYa6B/RmLifF6PZuhAh/o9bVHLld0gvJrwik8B6wxXLv
	TPSspogpBKyd7viy4yEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSWMi-008UEf-1I; Thu, 16 Feb 2023 04:59:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSWMe-008UE6-ES
	for linux-snps-arc@lists.infradead.org; Thu, 16 Feb 2023 04:59:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 874EEB8231A;
	Thu, 16 Feb 2023 04:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F407C433EF;
	Thu, 16 Feb 2023 04:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676523560;
	bh=QJv3xCjoWw/L1nefGYFtQZN89JBCKJRk4k8zlY33beQ=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=AYiVDdjzV/zQN5Odqz3m9JzdRkLr7fGvBO+Hi/kT6KTXQrjy7KLCibAOPNSZBe6uH
	 qibnIAVOT4YUPoAJzaO0G3vN2DdUxu3r9MDoTH0pwztBa+8yNPMkK7o+wEn7O/rt0r
	 1F9F6QaXAFuhJzq0COaLEGc0Qs9aZ5ZU9BXh+xYtu0ctwDY8RjxhilJdLGU7JvEK5S
	 sBfyGKTCPeIBvwhFa6WmWA2RI1/yc8efAKlrXFES91XobA4mDSpflUXUKTjPNQifnv
	 4i6GdI+U980i/21rqxH9/TQzGrrc62q4w5CNoSdJc244pQtWvH1fnS4QpOsPzld8EA
	 fbidPMi+Nb7MQ==
Message-ID: <4ebe9300-c694-5a49-7180-ca6c14ec11b6@kernel.org>
Date: Wed, 15 Feb 2023 20:59:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: How many colours does the ARC cache have?
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, linux-snps-arc@lists.infradead.org
References: <Y+Z5nuY/PaINgW0v@casper.infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
In-Reply-To: <Y+Z5nuY/PaINgW0v@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_205924_685826_F34112CC 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/10/23 09:06, Matthew Wilcox wrote:
> I see a discrepancy here ...
>
> arch/arc/include/asm/shmparam.h:
> /* Handle upto 2 cache bins */
> #define SHMLBA  (2 * PAGE_SIZE)
>
> arch/arc/include/asm/cacheflush.h:
> #define CACHE_COLORS_NUM        4

The initial aliasing dcache support assumed 2 colors but was later 
bumped to 4, w/o making the adjustment in shmparam.h

> (there are some other problems with the arc cache flushing code;

The VIPT aliasing config (which is pretty much dead and unused) or 
regular parts ?


> I'm working on patches to address them, but those are things I understand a
> little better.  I know nothing about the ARC architecture itself)

Legacy ARC700 cpus had VIPT D$. The cache size was configurable by Soc 
builder and the specific geometry could yield an aliasing configuration 
(e.g. standard page size 8K, 4 way set associative D$: so D$ > 32K were 
aliasing and needed CONFIG_ARC_CACHE_VIPT_ALIASING). Although there was 
ever only 1 customer who taped out an aliasing cache config.

The newer ARC HS cores have PIPT D$ and thus don't need the aliasing 
support.

FWIW we could rip out all the VIPT aliasing code as I don't think it is 
needed anymore. @Alexey can you confirm ?

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
