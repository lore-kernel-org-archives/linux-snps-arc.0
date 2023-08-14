Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E63C001DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Aug 2023 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41CQMEedTgBRadZSza9erH0R3DJgQLVA6wdR87DuHQA=; b=PCMUqk6gh8NNCZ
	5GLuZ4LcbGA9oeE0LSG2M47apUNjsq07R5VMByNsi18kC/2EC636xNPFtQlTeV3J4ys6X9ZCu2ejj
	OuNoRlgsuEBlRVAGDCQYVZh/lYuqdO6OBIAA5Q1NslmDFw9fDnry0Dru1fDLlXfQ8Uumjo5IyIyGz
	psuap/DbDbQ9VfxNUg3fMumaLu8BnuUiCDHMJ5JxgDa13N2g8REMdTro4Nm+pON+9lFtohRcKp5mi
	pFtpWzIvESOtT0keR0/b9RO45kAR5MzEgax3xwP8NJMzBknlbS9xSGxn12Qbwmgk74khT2sA7wK5N
	o2LDD87MFpXgP6GQir4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVdOW-000EP1-2q;
	Mon, 14 Aug 2023 19:38:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVdOU-000EOB-0R
	for linux-snps-arc@lists.infradead.org;
	Mon, 14 Aug 2023 19:38:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F9036176E;
	Mon, 14 Aug 2023 19:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936D9C433C8;
	Mon, 14 Aug 2023 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1692041903;
	bh=Bz7cpfbYhqL+S84y/7VHFh3W2zaCgDp4VVm9/LO38lM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LjV04Xw6mVSzrm0RqdJGjrH3McZTb6ebGrRmfoxphD3SWcCHXfnK4cbu/MiewM7dx
	 xczn6g2udBaF4QCqvb0FBQsmDrNGGc3fNt/tgBgf8WmPQsHBDP7zGCDdWnnsKsRlQn
	 lZbq6xDBuPxiY5e0XYtKeR5OkHbdQ+Af7vtj3h2M=
Date: Mon, 14 Aug 2023 12:38:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, rppt@kernel.org, willy@infradead.org
Subject: Re: [PATCH] ARC: mm: retire support for aliasing VIPT D$
Message-Id: <20230814123822.f117e89873c9bfc62ed0df33@linux-foundation.org>
In-Reply-To: <20230813192543.474957-1-vgupta@kernel.org>
References: <20230813192543.474957-1-vgupta@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_123826_215277_B49916BD 
X-CRM114-Status: GOOD (  12.84  )
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

On Sun, 13 Aug 2023 12:25:43 -0700 Vineet Gupta <vgupta@kernel.org> wrote:

> Legacy ARC700 processors (first generation of MMU enabled ARC cores) has
> VIPT cached which could be configured such that they could alias.
> I added the VIPT aliasing support, with all the cache flush overhead to
> support all but 1 silicon. That is long bygone and we can remove the
> complexity and maintenance burden of that unneeded code.
> 
> This also helps streamline support for new features such as generic folio
> work.
> 

This of course messes up Matthew's "arc: implement the new page table
range API".  Are you or Matthew up for redoing that patch?

Alternatively, can you redo this patch on top of Matthew's patch (ie,
against mm-unstable or linux-next)?

Thanks.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
