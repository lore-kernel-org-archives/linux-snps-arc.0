Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2218DC35E01
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 16:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CD9206E2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 16:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X8uL4IkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0CD9206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XwwfriPyr5ii5yfANoQJpnyleazZhik7beEhmwagFQ=; b=X8uL4IkBH0zY2H
	PAjBHpUf49XqCnBeC2Ws4z7NZ6FpIc0pvLKeIkhJbcxxJ/oNv+SgBi7J6Oi6fFJNJe1YVn1rDi9XM
	fDgrm2IFkyuLruxbkABzCPBr5V2LxAyLgWK9HkmlLQgOHSj/vitYpzJi65ugtmXS+1ksM3s92GN9K
	U/Z7QuCzV+GNjzOEr3REwCvqfULfL3QTudxSmVR0b39PdsUy6WS2S7P74Xyx5pJNJpJeExkp1/yv8
	/B6NsirFzxfT6ATdYmkqzWxEYm9caIbX30hVdJefU+iz3NIR4C32ZZ2I2tpY6I7DOHFN6GXLQO0WZ
	+QzLBZmbscZFG3fQz3HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6cnJ-00050c-VM; Tue, 25 Feb 2020 16:10:49 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6cnH-000501-0c
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 16:10:48 +0000
IronPort-SDR: HzZO03lHBMQ7LuADxr38cjybq3P72ESRRNJ1dEImNcgLPcjuHpFjuwFsYlsYOUCoL1xYYB3fSP
 vEXSiij4Q7PsRMeS23+yz5feeSeqE+cvzfuBx7oJnfR/9cmUPa95OzMdg1MMqrEpGKzd6WbWbE
 PbiCZoN5q+IfbEDug9Zg2s6/y2tNBk6Bhkuy/SqLw9jfeUK/ZPMHQs2RUOqLOvRWbq5Me3PAL2
 ZdBqiGRKL+bNBlLquMOOg2hq842nlzfFnzm8oaBuLCqgC2DRf3quYLIBuuGVDVX144HM1n9R5B
 lSE=
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="48083209"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 25 Feb 2020 08:10:45 -0800
IronPort-SDR: nXWjG5oiBDPKuZ8cPzcAHyRJK2IRzmK0BwHnPX1Eg1HvXGcqPolgiKWss0Tbn94qQCyeE78wCx
 xMfJn9VJFf0jYrxZ25l+t1tc3TmIBFTdgV1qKrVJcyqFzheiTxpvdOjxHVj1N14im/SZ4TjYjh
 pbC4PECDE7YTL3EXZxqGEtLDfN83KGLe7RPaXAswPCL84+Ak0Xb66lPQUZfbvozrtijRPwIxzo
 tgbpQ+8wlCMonROhxF8HgMFyO2pBxy/u0BP1XTC+xYDFf5mBkRTr9CvLlXF0tEzTs/N9iTl2Xo
 fUU=
Date: Tue, 25 Feb 2020 16:10:39 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <vineetg76@gmail.com>
Subject: Re: [PATCH v3] asm-generic ABI: Allow statx syscall despite fstatat64, 
 fstat64
In-Reply-To: <df3e9d71-7d5b-a03b-7b6f-4aa034684307@gmail.com>
Message-ID: <alpine.DEB.2.21.2002251609090.25788@digraph.polyomino.org.uk>
References: <alpine.DEB.2.21.2002250008160.23654@digraph.polyomino.org.uk>
 <20200225002941.20951-1-vgupta@synopsys.com>
 <df3e9d71-7d5b-a03b-7b6f-4aa034684307@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_081047_078463_BEC38E59 
X-CRM114-Status: UNSURE (   3.42  )
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
Cc: alistair23@gmail.com, alistair.francis@wdc.com,
 linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 24 Feb 2020, Vineet Gupta wrote:

> Oh wait. Can we avoid this churn by simply undef __NR_fstat64 and __NR_fstatat64
> from ARC sysdep.h ? And it will then automatically fallback to statx code !

If all files needing this information include sysdep.h, that might well 
work.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
