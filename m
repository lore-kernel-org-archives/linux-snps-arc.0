Return-Path: <SRS0=CVFw=5R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDE1C43331
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 07:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E770720714
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Apr 2020 07:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRR6KjbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E770720714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8WVQsx/4McXr5d4oFP64FoCkKhGJNYAasjABBTStnI=; b=fRR6KjbSPciTg0
	bDnzRS51/rZfO318KfEGLRCkxVk2jZ0ujfuILXq8/NjJ73AvFfKTSs4KsaYmvycv6pcjtibQOriBy
	eORq62HswNc4yJGQgXhJ1xfdLM/LH8pRVIzOI+3SaN4jZLnssI5JCJrzITtUNo8TwVEt/KIr6a1s0
	IhxAgpB2WoWVrVIQE6Y7gmfcy+JGxIapKzeBlbT5oksmZgYjMLw2HON09AwgIXsDz62o8Qb3SCBq2
	0WVIyXx03VVPExqnye6rxwQ1p2J3jVWLcP1ZB7gwP4BWRCRbwM2bbkelJgcpplWkit4lmZ5ozXV2B
	XPPzwE9QNLrF7540QuUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJYGs-0003nZ-Gv; Wed, 01 Apr 2020 07:58:46 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJYGo-0003i1-TA
 for linux-snps-arc@lists.infradead.org; Wed, 01 Apr 2020 07:58:44 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sdqd72BFz1rnrS;
 Wed,  1 Apr 2020 09:58:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sdqd56BVz1r0cX;
 Wed,  1 Apr 2020 09:58:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id zc1hdgaLgktd; Wed,  1 Apr 2020 09:58:37 +0200 (CEST)
X-Auth-Info: XAuBR+WS/3jeS+gxkH1qjsTU8dOvHgAlAvEIycx81jN+4+1USPxacIxx+rsVw+Eg
Received: from igel.home (ppp-46-244-165-166.dynamic.mnet-online.de
 [46.244.165.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 09:58:36 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 761E62C0C15; Wed,  1 Apr 2020 09:58:36 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: __syscall_error (was Re: [PATCH v4 13/15] ARC: Build
 Infrastructure)
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
 <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
 <alpine.DEB.2.21.2003312246280.30236@digraph.polyomino.org.uk>
 <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com>
X-Yow: Life is selling REVOLUTIONARY HAIR PRODUCTS!
Date: Wed, 01 Apr 2020 09:58:36 +0200
In-Reply-To: <3b5edadd-b29d-f138-c440-ed6d38da6a67@synopsys.com> (Vineet Gupta
 via Libc-alpha's message of "Wed, 1 Apr 2020 00:44:15 +0000")
Message-ID: <874ku3zlg3.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_005843_087981_1A526E22 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Apr 01 2020, Vineet Gupta via Libc-alpha wrote:

> Looking as RISCV code, they opencode __syscall_error for !IS_IN (libc) which I was
> hoping to avoid.

But that is the right way to do it.  The syscall error handler must be
local to the library, it cannot afford to go through the PLT to call a
function in a different library here.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
