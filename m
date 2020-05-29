Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948B5C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 04:07:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6097920723
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 04:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/mPBi9M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uODfEoK4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6097920723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDq0VW3sTmvKVz7FiVqbtYr1ydWLMU6+qQKlPPVVssE=; b=X/mPBi9M+I3JU8
	h+qosa1h0nA5+PqibTisoyyCNA8V13UuhkT0B1ixfaTOgk00oq0a/1blo7H+sqVKejCdDJhZRabc9
	N+fmyx0jLNX/7mcQWXpCD/qdPIdfj5Jkg3cTtwmrOXR3p5eb9xLsWXfzJIyi4vgRU3FdGT+/HjTeT
	dB8xNCHi/BYXlZoqaX/D24av3bdMLjlSgwMz1pGxlV6tuNEGWQsrMQUTM64UfttcvqMZb8/ZFuDIN
	vdA5jkfUihJ/MYabR0I0hmw431bL2N5t4eqUSDQucIIiHutBzPu+uZKeMUIo77dA7SKD9tHkBcFa5
	+JCO+tB4e75LadRXIJ2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeWIr-0008CW-R0; Fri, 29 May 2020 04:07:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeWIp-0008BF-GC
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 04:07:28 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22B7620723;
 Fri, 29 May 2020 04:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590725247;
 bh=UZKGsMHoRTCUxYj44XYyE1RuxSoMSD6kQH1W+kIDIhU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uODfEoK4QcZIZYSfP0ytkPrcmiCmgeSYmg46w3rpGlhqR9RbvjK5ga4rTg1QyyGib
 HaZ3SQrU3Smz/dn3dgf63RE4B8sY0ieuzM/vHaOdxJuPi8GPSrk6XGJCcU74pyApVh
 u2KJ8jFL+zb3rjqca/OCNTA8c1VYaAD2kvzrefJY=
MIME-Version: 1.0
In-Reply-To: <20200311134115.13257-3-Eugeniy.Paltsev@synopsys.com>
References: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
 <20200311134115.13257-3-Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 2/3] CLK: HSDK: CGU: support PLL bypassing
From: Stephen Boyd <sboyd@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-clk@vger.kernel.org
Date: Thu, 28 May 2020 21:07:26 -0700
Message-ID: <159072524643.69627.17142536778465322331@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_210727_557996_2BBE041B 
X-CRM114-Status: UNSURE (   4.93  )
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

Quoting Eugeniy Paltsev (2020-03-11 06:41:14)
> Support setting PLL to bypass mode to support output frequency
> equal to input one.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---

Applied to clk-next

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
