Return-Path: <SRS0=W4z3=3G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EF5C33CB3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jan 2020 21:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB59F2192A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jan 2020 21:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="deRoNdor"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB59F2192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyG1VECc6/5pQQTJyKwZs2Y31UWpSGoYrKYJNegOwUs=; b=deRoNdorsJdRMB
	ATR11+nQs8UX0QgHktdA3RrQGoSj35ZF/uIEKMqxw3eI4VUofJ4tFUgncvPBclOnnoUtkZLtfpczW
	cztKmTlVS3NC32r/odCaRb1/OhnLkK6cQ7fUNT8ATlZ8xOeVAf5pIX8QC74tSsdCTdUfg9GOdlX8+
	mXCCkuKVXFl/wC18OoozNw9ux032fPKUILR5SUs+Hum2GCbKCF6vz6JlajlFvc65raIp1OQZ2KJEx
	0irdElt/cqhx+/paQ2mmB4SzPsc53eaV6dWpkO0F+mlHQGmUrOOu9loSJId5Ybcivb37Hi+Of040A
	MyGFJCO+pptkCASvjtig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isZbl-0003E2-RS; Fri, 17 Jan 2020 21:56:49 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isZbi-0003De-BB
 for linux-snps-arc@lists.infradead.org; Fri, 17 Jan 2020 21:56:48 +0000
IronPort-SDR: pfTl7/Wl/0hvxPpgK+SOu/KASXG2c6eUG9MmY5NvYSzRfmk5txo9jC8Wy3rOAmcADSI4izMocp
 vjx/fWpsqcg+nE2qW2n/6Pn0EW2Tx6TU5IvtTvjVw/o8tp5aIaeN9Ynru1pGlE+CvokHEvK2YS
 01n+NrBU+UEemQCbcbI/BEJ5m5UT0Z9jXcNRKspAo63CzaH6TV1hoDfo7O7Us1At4C4qRosfyj
 zcDWLQ+ZKAexmS3IlGsaXD2x5bfdfcuhjQoFttX2mjFlxzrpXgh6Zykr76XOw+XIwb9Q28KhTX
 fDs=
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="44983893"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 17 Jan 2020 13:56:45 -0800
IronPort-SDR: tiSvEsSybQLUp7A63FegprhaII/3Z1us9CDl4xP3iH+iMn5xHUhK6G6AmW9KsP255NhUxLen3Y
 bWGJF+R9ummQ==
Date: Fri, 17 Jan 2020 21:56:40 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
In-Reply-To: <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
Message-ID: <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
 <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_135646_447853_D7702719 
X-CRM114-Status: UNSURE (   6.80  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jan 2020, Vineet Gupta wrote:

> The public PRM is now available and I would like you to try and access 
> it so that any bureaucracy is out of the way before I re-post ARC port 
> for 2.32 !

Thanks!

There was one technical point regarding the glibc port I raised briefly in 
a discussion at the end of the Cauldron in Montreal: you should consider 
whether it would make sense, as a new 32-bit port, to have 64-bit times 
and 64-bit off_t, ino_t, etc. from the start, as RV32 is doing.  We don't 
have a specific policy for this, but it may make sense for new ports not 
to include ABI variants that either are, or will become, obsolescent.  If 
you require Linux 5.1 or later for the port then all or nearly all the 
architecture-independent pieces required for a 32-bit port supporting only 
64-bit times should be covered by the RV32 patches, which I think are 
quite close to being ready to go into glibc, though you'd need to watch 
out for any (new or existing) #ifdef conditionals that might try to use 
32-bit-time syscalls if they exist (which they don't on RV32) - and that 
would not prevent supporting older kernel versions later if desired, as 
the Y2038 support gets built out (including, in particular, the support 
for falling back to 32-bit-time syscalls in functions for 64-bit-time 
interfaces).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
