Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B550C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:27:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67BE206DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FxE9cQ7z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67BE206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvagHh8hlQTi+N1SMnZZL9mfTISYNOM3SCst0cQs87E=; b=FxE9cQ7zBaf7UB
	kLwdh2mhFma+eENW2w998C4cUoGcUyFn+5xhSZDv/DeZ1OoLsyKXyNdrzRALq5+mCJwnzHzoPaL+/
	AyKnMhVdj0mq9fOHWiXJfmBvJh+xUNNxWyThmXueLA5LeGni8vTWcuAzw/9QJOUrS0+J5Sg38z0MU
	nuegw5Thbg6X/d7GZDK+WPMppSKAytTjO4fVvZyoL9r09cYRl6KhMmaN2K4P3JpGIeJVIN6pkUItl
	GHRgBgI9VIKEfFmVcBZLkpicnYpcAWhh2qH6yeGPmZdlu+bLw3t/NPAUmML/3T35ZvibZK7QXXmUo
	2bUw40gELRF5eTahWuAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOQH-0005Pk-U2; Tue, 31 Mar 2020 21:27:49 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOQF-0005PT-DR
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:27:48 +0000
IronPort-SDR: Zo7TT2WtoTdfS2iPZ2WNG80k2QeQhfDWsfkkhUa7jhYMXHSqgXMSJcGCJP1HpQrmhZ1JVMxJy0
 LEKzWt/8lMtq+W7ovQg4cSdLfR2g4Sf7tsbP5O9KWtU29HVrLfbcqCmC81Di8fsoKiiYeMVpMr
 ZP7qg1L2Ca1AL9fpN2n3E1sncFuNnAbM30yr7B+MdTz+XLU1R1EUAjje3PkINaLxUeyzdfaWbw
 ZZcNe11SP2PEOgnkviHXI8t0D5rA0PAaXMsoHdDbZ9oTQeHfS2rRILD88BYoNq1W4iH42b+cqP
 g3o=
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; d="scan'208";a="47362457"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 13:27:45 -0800
IronPort-SDR: c0do3LZlXYdRjAz07EIdam+Z7NtsRUBG8Na9BzjQKGtw9yEza1jfIoc0cDF4KdszPLAuKUHFns
 JfJu/U9Vk1/9qClryk8TkHMiUcNQl0WdttP1vkyktS68Jk6tCsJXLdFe2bPHRIA5Ds4/moHNdS
 8qkZ+RtxxuB9FSd2lQQvdSwIBN5fyvcYop6l+BXShoBOmlbgBseMXg27vEf6NvqwFj9SArKxNt
 x4LkLy0Oo3tCv0KlC3wFXO/1Val0tZvzxM812DHNOjmTdsLBNLvn5Ko/CJECE8CY1XM8I18tah
 23s=
Date: Tue, 31 Mar 2020 21:27:39 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: Big Endian support as multi-ABI (was Re: [PATCH v4 02/15] ARC:
 ABI Implementation)
In-Reply-To: <ddb994a4-f3f2-e789-7cc0-5e284076315f@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003312123530.30236@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
 <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
 <ddb994a4-f3f2-e789-7cc0-5e284076315f@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_142747_484559_A0B12390 
X-CRM114-Status: UNSURE (   4.17  )
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

On Tue, 31 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> But a BE system can't possibly be mixed with a LE, its not really a 
> multilib case

Indeed.  The Linux kernel does not support running BE processes on an LE 
kernel or vice versa, even when the underlying architecture does support 
runtime changes of endianness.  So all the pieces that are relevant for 
32-bit / 64-bit coexistence like that are irrelevant (but each ABI should 
still have a unique dynamic linker name).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
