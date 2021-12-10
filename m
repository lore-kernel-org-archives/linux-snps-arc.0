Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1F2C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Dec 2021 21:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vW9kUT79Nct7u4a3zBnvsH2tMwRbNWm/9pq05AQQrls=; b=WCZ8oW3bnb6p22
	39buG97V3JPDPsPZzulOd1LoyJt0TBw6rJYp9JG1exdvhaIDWbz5KE4Z9gBzS9N7JiKUafCOuDDPa
	omLW3nJyxygw81H6VV4X9mGr7CLgmKl7uE5X+PBxABfdzNEGqz2SMhbIAPGkoKo3ydh3k/vU1L1ey
	9SnF0oVD1jTjAruBBOMNDr9IdbTKyfuRYjQyr5ygoXJDgbsJVD6BI87CUb/Ln3Pn2KkUfTsursM3f
	4yOUzAzrI81zv1JQ5cL3iGjcHQP0egW5pJ+NWbE5bpDupydRMAGmgLkBYbZ3z8ujrP3mYZRCidYSr
	yyT4NW5ORimuB3zqC+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvnRC-003rZ3-0W; Fri, 10 Dec 2021 21:28:18 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvnR8-003rY3-7I
 for linux-snps-arc@lists.infradead.org; Fri, 10 Dec 2021 21:28:16 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A68572CC;
 Fri, 10 Dec 2021 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A68572CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1639171692; bh=D3rxAvM2lpCM9x6AXzPElDM8I+xzJC1BFwPU22pfeVg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dDlaOisdmbQcnSyGL6540KVKClm6/XbDnq3+NINT73PqAgD9SwD5m0kWRce66QDgC
 zl0cmyQ57+MrZx52qgGuBdsgPvBOkWJfnR4JKRRdYGJ7TCPIfsvZfTCapH7lKO+LPg
 po/dJhRtMLsEIotuBKY0E9QIdPUi+xUzF9x+g0mrmrQhwXohd470hB++4xLbzRuhjQ
 shcTQvqZVyaNXAYU6bahJORmx2GZO7fEeYyDDIBsF9RIA6fyeh9TY9b9zFQZ0+ZrLv
 qgQo1LS2BTao7vqC74tjeDMopDRzftBVdwmhmwAc213Sx3CACVVCftTWs3B38YdC7f
 8dhbbR+SiEa+g==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-doc@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org, Alexey Brodkin
 <Alexey.Brodkin@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] docs: ARC: Improve readability
In-Reply-To: <20211202215747.19923-1-abrodkin@synopsys.com>
References: <20211202215747.19923-1-abrodkin@synopsys.com>
Date: Fri, 10 Dec 2021 14:28:12 -0700
Message-ID: <87ee6kqheb.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_132814_283623_546FF4B0 
X-CRM114-Status: GOOD (  13.70  )
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

Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

> There were some things which made rendered document
> look not very elegant. That was because:
>
> 1. Numbered lists were formatted in more of Markdown way
>    rather than true reStructuredText and so were displayed
>    as a plain text with leading numbers.
>
>    Well, moreover numbered lists were not needed as in all cases
>    we were just listing a couple of options w/o any intention to
>    follow any particular order, so a simpler unordered list fits
>    better and looks cleaner.
>
> 2. URL's of external resources were added as they are
>    (which is OK in a plain text, but make not much sense in
>    a HTML where we may use more human-friendly link names
>    with URL's hidden.
>
> 3. Some URL's had trailing slashes which were not really needed
>
> Fix all items from above!
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vineet Gupta <vgupta@kernel.org>
> ---
>  Documentation/arc/arc.rst | 62 +++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 29 deletions(-)

Applied, thanks.

jon

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
