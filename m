Return-Path: <SRS0=Z+JP=32=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB12C35247
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 21:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A0121775
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 21:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ht9El4A2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A0121775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxLhzU2dah3EHFmVgtDPLBxVsO8iYd4Bgb+UEZNk4I0=; b=ht9El4A2nes52y
	4wvI7hPo1jYORBr4soZOA6P1p8sFrMNtYaBfox6SGeJIyWIqawVNZ57I8wHP5cbYvVGin1l6XLd2X
	Rs2lrW2cgzvzhL0K2+qzyqDvyQsXZ0WtSQEohbOACaeLfZnZD6R6DpEKCfqaydHJmao41p3r5ERMY
	uBOnodByOS96LCRk89wK1FzDYh4g6fwQRaMuPb0FfedDgRT0oJjS/an64j8OpuAh7YAsZCYeRf9U/
	a3r21osECIXGSzJCf5xydxujv2w371JQyPoPf0kkIDtXQzqgIzUeDJnZY4nQBH//rb2O7fBynO4BP
	Gj3LlWItEKCJcerNZQLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izp3J-00064g-Hm; Thu, 06 Feb 2020 21:51:13 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izp3H-00063k-Cm
 for linux-snps-arc@lists.infradead.org; Thu, 06 Feb 2020 21:51:12 +0000
IronPort-SDR: h49x27p+m/kgUOx+18KsUUYbe4YzfqUJyH/4RKrlG1bA/Saz6zLchbZtnuh4JkL2rJUeetkujm
 ClNxscsZBSsogkqEQCWCR6m31bMUp2WRHUjqO09uk1tGn4bbOG+N1rM1n0+WxapHXXmrioEFMa
 K97D/xMe3u1MRVDpJwqajs0vVgoMGhL/FOSZoOLotl13bXb6QvwOX5PBZSyNB2fnGuuXLf2hr7
 X/Hc4cBC8xM5mezCZXSKr96cmo84aHMVtQAorm4LeHeFKgMAIy7lnYu/mUsNp1WkD+zPZEil1u
 1Vw=
X-IronPort-AV: E=Sophos;i="5.70,411,1574150400"; d="scan'208";a="47513497"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 06 Feb 2020 13:51:08 -0800
IronPort-SDR: ldNQ1LP1iD+idwrn4M7yyYKd8ImpuNB9dhmull8zOEb9P0CgrPiBTEKSEjNDD9+spgv9CJMqBq
 tLDF4hElLT8Mw5vaRUUdeFC/PHconUqq1m3lHQd4I8zS6IqoZ5K+mFNHc3F9GSt4p9YQsfaor3
 ARWOnEb3RlTdfzgRSbasJ8vanGxI5ISdWjxbpnE82AatcKOthPUsL/RWpy5mTZqHfnRKt+/nnF
 d1e4DL+fIYOeCkVmtRaGXh/ucMXsmpkSwQkO3fFAH3NcqXxX19o2+7SyQhkgpadAaNK9b+Hu93
 TFQ=
Date: Thu, 6 Feb 2020 21:51:02 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
In-Reply-To: <8311a699-183e-6811-cf24-3ad85ff80321@synopsys.com>
Message-ID: <alpine.DEB.2.21.2002062149360.22384@digraph.polyomino.org.uk>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
 <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
 <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
 <8311a699-183e-6811-cf24-3ad85ff80321@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_135111_442749_19E22079 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 6 Feb 2020, Vineet Gupta wrote:

> >  If 
> > you require Linux 5.1 or later for the port then all or nearly all the 
> > architecture-independent pieces required for a 32-bit port supporting only 
> > 64-bit times should be covered by the RV32 patches, which I think are 
> > quite close to being ready to go into glibc, though you'd need to watch 
> > out for any (new or existing) #ifdef conditionals that might try to use 
> > 32-bit-time syscalls if they exist (which they don't on RV32) - and that 
> > would not prevent supporting older kernel versions later if desired, as 
> > the Y2038 support gets built out (including, in particular, the support 
> > for falling back to 32-bit-time syscalls in functions for 64-bit-time 
> > interfaces).
> 
> Ok I see patches in flight on the mailing list. Would it make sense for me to
> start off in parallel with ARC port which will take it's due course of review and
> rework and in that process upstream y2038 work settles down and I then
> rebase/switch ARC to that. Or would rather wait for upstream to settle down and
> then I adjust/post ?

I'd suggest posting patches that are on top of the RV32 ones (maybe 
there's a git tree with RV32 changes to current glibc that could be used), 
and that only support Linux 5.1 and later (so you don't need anything much 
of the Y2038 support beyond what's in the RV32 patches).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
