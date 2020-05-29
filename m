Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E32C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 04:07:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A9920723
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 04:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tcfIUtft";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eg7zg5GZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95A9920723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eayrZrEd22N2pWMVr+sOGv+XqfwTAQ8Mc5idi9bODKQ=; b=tcfIUtftxLoeId
	wN1+4teQ61S7z0yw0ONLICeU3j97lDARRL5AV38iPkscqwlzfPvmJfNbRQtYeFRKZM6fGT1/JcCPv
	8FhHqtge2k9Z77swVQsZDWfCJ/shrRq0iaz9TDtjh/73LlNtY/weu3TKHZbVPBydR9poe1sIpbP1S
	1CXbALbUwhfZaatNqp9N05nyYIs7zGpeucxRka8gR+jhff1JiILVngALif0iT5+vkNXNoX0ug0CIG
	8+0TwRDiDikNR+qYXY3kDZpUEuKUtMKUsnDgB/xhgsXWy3fzAVyuqUZDYdKlRB3JC+o4SDR7MtyAq
	ycZrg2Sd+2w3qeQlBtaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeWIu-0008DW-V3; Fri, 29 May 2020 04:07:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeWIs-0008Cw-Qz
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 04:07:31 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D6E52072D;
 Fri, 29 May 2020 04:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590725250;
 bh=FQn45qgKvIYKTKJhdW3v228CfAspxcLkSY3po02npIM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eg7zg5GZrpoOAJuzFeZpFF0aW8OsE98BzawVzJN/avMg7OrDWqnJMvT4tH9e0SgaO
 ZWmgUUetUEx3vVqdab3G4+f3R0RcJIuO0sI5TOco2k5ReHcMvu6798MTq8gAKjO3w6
 vhkP2j0IlHc6WjkfebBywp6B5MuPddjEpAfJz3SQ=
MIME-Version: 1.0
In-Reply-To: <20200311134115.13257-4-Eugeniy.Paltsev@synopsys.com>
References: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
 <20200311134115.13257-4-Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 3/3] CLK: HSDK: CGU: add support for 148.5MHz clock
From: Stephen Boyd <sboyd@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-clk@vger.kernel.org
Date: Thu, 28 May 2020 21:07:29 -0700
Message-ID: <159072524956.69627.10946881962902731416@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_210730_893363_4CDCD61F 
X-CRM114-Status: UNSURE (   5.42  )
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Quoting Eugeniy Paltsev (2020-03-11 06:41:15)
> Add support for 148.5MHz clock for HDMI PLL
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---

Applied to clk-next

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
