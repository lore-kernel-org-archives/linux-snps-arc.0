Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927A7C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:06:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B964214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldZ90qSg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B964214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=825scBEWjcFpS+z2uvOtumsKLCGbuOJw8tZyXR92Q08=; b=ldZ90qSgtvYKFh
	dT0PIVEIJQ4RtTGCOAMvXCpJ28OonzXdag851ZQTTv13X/jryTRP6VUAXgI4Gf6jH5XNpIFJ5cN+d
	etQZvjaZGFCsBdjhkH71NDRYNoF3slSHyXntnQM0Hou6TVQRW+l9ltUR3yP9ud9LI8ryOGQRqROtu
	47do00/v+x266PAr7q0Gw6DIsxUq2Tt/F6itBmes07NN9zbWpNMgUFNOzv/+a56iFVJ7gjlxSCSOU
	Qbr1ICrECJnsfnoRY1vDRRQmx7AniDUh8JP/WTZwYsoNAjXzffFrmLh/Uhh9FrMWcnISwhciNLUO6
	EjvIH44VKHBh7qU96Nng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPa3j-00010U-Ef; Fri, 17 Apr 2020 23:06:07 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPa3g-000100-Ln
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:06:05 +0000
IronPort-SDR: q+0eyefK/WnnJEqwe7OZFYtLwp+GZh07FjxVxUgxKu2YFwkKJuo5TXOkem7bQwVfGyqDJBjMmR
 IGOiU137KAs63THabrTWt4WMy7viHtXiPzRY2a8qmsog99UlYy0yZ2HHFfJJ+CSBpLE6BbgGyT
 SXqxJMNzFWldPI0GGWCyorjW9gG+TINvLzxSciIC7RUzln0mjC510diU2ZpWRuWbUYqBirAnG8
 kU4s+gVOKm6u/joggMkN7/PuPOC97wuvdfofqIbCQgu1nbAOtjyI3cmff4DoLAmvYO2MItvm6p
 vSY=
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="49929801"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 17 Apr 2020 15:06:04 -0800
IronPort-SDR: VBf5cGs6HvURYCa1OT4OwRjICGMnZy4+fjadwyS8sBih9vlVgz4EMNRJHQ0+2j9OokdYze+ivZ
 5uSC2wJHxyxHl9DSd/xeePxA7uSCFxGiOCJ+AwsSrRN+69gIFw7egK/DN/CnPMOncbkzQDHIv7
 nW0LnxtIgaFLsZnpbzPDFH+d3J/5Lv0t9MelIHzfDArlLXWU0mRDRJD+X+I94xRJoNBrQ7EMeG
 1XY1r8X1Zlyd4PB6mebAgEAd3qsWDiw1uOwmkzqLnvWHnl35bsLew90bkXvbIlXXmBccnIjdHT
 W5g=
Date: Fri, 17 Apr 2020 23:05:59 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 11/14] ARC: Update syscall-names.list for ARC specific
 syscalls
In-Reply-To: <20200409025615.27003-12-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004172305550.1082@digraph.polyomino.org.uk>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-12-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_160604_717910_34B2E9C7 
X-CRM114-Status: UNSURE (   1.75  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This patch is OK.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
