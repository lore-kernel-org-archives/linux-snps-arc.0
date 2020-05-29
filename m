Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27A1C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 04:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C44C42072D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 04:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZmiZcHb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHq95+kZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C44C42072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8lv8jea79g/872fLjtHqvK1VYcnoGANdVXaB0VtkQI=; b=FZmiZcHbR2RxhH
	+N5MhqO/I1G/xCBG3EO+pe6LP2YLi66o5Sd7Ovd4JYyPeLA28Wdx9t/2iaAE+cIkOJ1ikrMQydbzH
	izlydl3JHL+ubYAqCOFDBfeKV3M4HzJBwbO75EOnsSJUOit414qnOq8ZZhvTqp5hWZ9tuM9ZdVtlT
	K0ms0VClBgex18bqKDf2jF+ueSvaQueZ419qbRZyKNYcRYWY1oVEA8CzA5Sz6vwymaDQbSVhzdQfT
	9ZDntPjxaWn0AtWm5nUbHzq34nX2IA5l2M3FEcjzJmRmNFI6vX7oAoNvFlP+N5qmIveV00Jy7TUvA
	jaHvjD/p3ACTXu8EcvpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeWIo-0008Au-My; Fri, 29 May 2020 04:07:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeWIm-0008AV-JX
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 04:07:25 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3463220723;
 Fri, 29 May 2020 04:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590725244;
 bh=h0pxr9/wzLOF/9tz6TDv1ocdVyQnEr4jdBl3VKWu6Zs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CHq95+kZOxfgFU58Zs4UZF12+xWI7UbACdIs7Xr1QTy+PP52K+8qHPgi/fP5VoWVx
 lE5aUUsDKCQGTEB6m6dHVJ5CY87umFj9wn27nIjWPiwhbyB5cq4yXF+8U/rfGfI+66
 4BHkmlO/qiuV5KPnhy44kH9zIHzZLKawAKoCuCkI=
MIME-Version: 1.0
In-Reply-To: <20200311134115.13257-2-Eugeniy.Paltsev@synopsys.com>
References: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
 <20200311134115.13257-2-Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 1/3] CLK: HSDK: CGU: check if PLL is bypassed first
From: Stephen Boyd <sboyd@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-clk@vger.kernel.org
Date: Thu, 28 May 2020 21:07:23 -0700
Message-ID: <159072524355.69627.3014845775029445369@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_210724_660010_892E6312 
X-CRM114-Status: UNSURE (   5.41  )
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

Quoting Eugeniy Paltsev (2020-03-11 06:41:13)
> If PLL is bypassed the EN (enable) bit has no effect on
> output clock.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---

Applied to clk-next

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
