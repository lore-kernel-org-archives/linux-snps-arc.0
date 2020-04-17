Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B41C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 22:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2747A214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 22:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGKj+RLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2747A214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waWZN07WFtT5Nueos3LT6QZPDuwf6azFxeVaBa7vwIQ=; b=qGKj+RLVHBM/E4
	0p6t7NKO+djb3+/e4CsG7k3MTStf9IUMzLaYGGxuj+mJiqFxfWDEEp/eXjCqso7AKcXuOc9SAtvS7
	J2RyxvGYDPcmjsNQKOnbQFBz/ULgyGw+U8oSAYRIKlqEbXvMrYM1JalHEzP6u6e1IlF4TsKzl1yRg
	Oy2Mw1KIfI0cZyTdOzZi1EHYTZbtbJRLKd8WmCJPcP6C5z9jrdY6uJdPplG9x4ktEJKqCIg6/lSAS
	1nA/JQ7cRU3lCBs7gZ6Yqm8n7GZ9dA9K1aLywz3IGBQPxY8JzY5pYSUjOE+yG2kFIcQJYQbk8K0Lq
	ctNE8XevUo8QcYXHzecA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPZxk-0003pz-Ee; Fri, 17 Apr 2020 22:59:56 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPZxi-0003pd-Eb
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 22:59:55 +0000
IronPort-SDR: jRNYclMcNCiOmUcEhfZoh5lLhblbOFdlkZe6nxQ6Q6bTuqiKz1cROLNT6E7prlERhibYtBn6lQ
 gVabNfyhx18NyDEcBW1/0IKG/wPOCxsj73toC5t+KWYifice6+8n27Cza6VUg3BuxcaCrrcrOa
 9IPYyGnbsFa25VU5PeIOhhOh1zCnPxvUFruXgqt+c6pxOMNuQrcMdmIu1vnvtyQAYoMMXYWjpx
 48/KkHWDFl6qVGxqNk9j6b261AGNUPTKvw/CLZHLCvhphZ11aM9JK8y1bt0YT6D5l5cvwjxRZU
 o5s=
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="47930023"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 17 Apr 2020 14:59:53 -0800
IronPort-SDR: 1fBlcDF9qTgemxD3uc6Dda3ALaKUknKpQlP17zUZZW5Pzm0aWdqX7MVUdKiZF7kgXH7v0w2Yll
 WJB5V4z59ilHL65THdZ5jJyM1yGF4l5uC4vEOVz4tQyb0Yn3koCd9MbwVANa0c8xZ16PQ4qNmL
 oH1Suuw/m6t+EJ2Gv5oCHtUVad66SUjF/NEYsBfdkRyEbI4y1R0Ff9T80WEe9KCzZe1b0mzUrZ
 uJpwCmckKAP7XO9c3BlOfjhgx3mkGh+E4Btkb2q/XJx4UD6xYpVbhZ2Fn1+nBOVfFvejvxqnRv
 C4I=
Date: Fri, 17 Apr 2020 22:59:48 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 06/14] ARC: hardware floating point support
In-Reply-To: <20200409025615.27003-7-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004172254500.1082@digraph.polyomino.org.uk>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-7-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_155954_537231_EA95C185 
X-CRM114-Status: UNSURE (   3.75  )
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

On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:

> +#  define _FPU_SETS(cw) __asm__ volatile ("bset %0, %0, 31	\r\n" \
> +					  "sr   %0, [0x301]	\r\n" \
> +                                          : : "r" (cw))

This asm doesn't look safe; it's modifying an input operand.  I think the 
compiler will assume the register it puts %0 in is unmodified by the asm, 
because it's listed as an input.

As an architecture-specific interface, it's not very clear if the 
interface for _FPU_SETS should be that it modifies the variable passed as 
an argument, but I'd guess not.  My suggestion would be to define the 
macro (using do { ... } while (0)) to copy the argument to a temporary 
variable, and do the bit-set operation in C code on that temporary 
variable rather than as part of the asm.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
