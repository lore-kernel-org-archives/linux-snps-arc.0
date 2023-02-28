Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98500C64ED6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Feb 2023 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W00IOdrHbHecu+BuXuWDuuRnwrgy+NN1hOU6Fyv35NY=; b=YR8PH7Fk/uIc3j
	p5UqOm/nnnUOI57iZVxM+7J7OlJjNuOmBDsk1013R3w1oVnRUqYrfW7Tgksd8d4uSujiX+ZHZ2mn0
	xPNzUWOCRY7NEyB02v1or9w3ynD3vwrYzPb9zldYCJ0qHOShYX+H0cYpbpgnn/FUnZjrAR8/cWgbo
	rJJxiH7vzf8n9BNUvFKI58Wj/O0id3NJLBNws8ek/fYwNF8fS7r5s37v4ASIkJASbiN/PhDA6NrlR
	g+IpgHBST2PKsu7mUZ4kiTJug7O5GCOa9pgupTTTf/t0EruWJZPmLy7hFTzye1KqGRHYkwIb3157F
	2WrigiKpiyRZi8nK8eCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2nV-00Dl9s-7A; Tue, 28 Feb 2023 16:25:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2nU-00Dl9a-6J
	for linux-snps-arc@bombadil.infradead.org; Tue, 28 Feb 2023 16:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IgJ0EleCFg3su5svsEjIxOWjMFwN7SRHUtLfsnnNW5c=; b=sdAVUJ9KfI5PHWU6WUw5GPuE6f
	eilVdLFUjNzwCXvxLHYrMCgu/ZjKbAJwtfuiYUMF0WqmqzbVsoxl53yBoCub3t299qxpLf+uvw+pT
	tAkx0x9USJnQArUbXs4TwkERGaaTwK7z9Uojb61NpKMvguuU44lZ+asgLtpptLF0J2FoqqMdj0fCU
	IWofXCFryD0GtFUre3Keemt0eZ+TBZXao8vb5Epwsj/x/maHrBno01cjfYrWQZK3gjbKaDKt+AsFQ
	CgcnUrzAV9IW6WHJV5MK/ewk0/rWcXAeuhoAHezpGAGApoMM4BCGb7gB0JiJY1YkvuSFKqGwALQRo
	9a4McGig==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2nO-000yNy-6J; Tue, 28 Feb 2023 16:25:42 +0000
Date: Tue, 28 Feb 2023 16:25:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2 06/30] arc: Implement the new page table range API
Message-ID: <Y/4rBgumVbfvKA9X@casper.infradead.org>
References: <20230227175741.71216-1-willy@infradead.org>
 <20230227175741.71216-7-willy@infradead.org>
 <e62ebe27-a1f6-ebd5-9ee0-a78e14ec4d38@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e62ebe27-a1f6-ebd5-9ee0-a78e14ec4d38@kernel.org>
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

On Mon, Feb 27, 2023 at 10:34:05PM -0800, Vineet Gupta wrote:
> You need to split ARC and ARM into separate patches.

Ugh.  Looks like I inadvertently squashed them together during a rebase.

c228f5b4e007 HEAD@{121}: rebase (reword): arm64: Implement the new page table ra
nge API
22744c8ae873 HEAD@{122}: rebase (fixup): arc: Implement the new page table range
 API
11da1e433338 HEAD@{123}: rebase (fixup): # This is a combination of 2 commits.
d68d7ab9b184 HEAD@{124}: rebase (start): checkout next-20230225

I was trying to fixup an arm commit and looks like i squashed the arm
commit with the arc commit instead.  Will fix and resend.

> Also it'd be best to drop all the VIPT aliasing bits for ARC, they are a
> needless maintenance burden.
> I can send a patch which you could carry in your tree for easier logistics.

Works for me!  I don't mind if you want to drop the VIPT bits before
or after my changes; I can adapt to either.  Thanks

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
