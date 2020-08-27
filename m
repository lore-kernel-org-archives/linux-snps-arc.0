Return-Path: <SRS0=SwnV=CF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6A9C433E1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Aug 2020 07:01:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D4D22B49
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Aug 2020 07:01:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EU1YxrpR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G2uSblVi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oZT0Hngx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D4D22B49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BnhVZt7t3kNujXxzWBoiNkimUR3MjNcv8W6vPs2+ZR0=; b=EU1YxrpRYFWYz2VwhDaDagk7u
	nClxkMsjs4p2y+EDihdZJcVCzGMA5vqQECfDbpP5kLSP35ZQ95GaXcMNEg7UVl/+ybv9RMoYkKZFK
	RLTOMxOt0pcIMoGBCKyD5yI/QI1LXBN9Klc3ciNSz7YAztLf2sl0VnxFdyWfD2SARVezioCMdIuc6
	J5kfU9bea5Hmcp9mNhZhyRNdxNzvUbqOQT/CH7t5xhUao5ZYwcE+h1ddLNXEN1m5Ry0yax6eOoC0t
	u1GfEDhhAbO9uflY2vKagA5+q/mhX9rRYkzVfDuC00OLXHZChxAYedDGf6pmHPa6BZOxIXE+RpwsH
	7rl76J4XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBBuY-0003P4-9x; Thu, 27 Aug 2020 07:01:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBBuV-0003O7-Sr
 for linux-snps-arc@lists.infradead.org; Thu, 27 Aug 2020 07:01:24 +0000
Date: Thu, 27 Aug 2020 09:01:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598511678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=itEhm3ICnTlf61Ty9BCh/7cEb9lcU3yOuFeK2GhTwb4=;
 b=G2uSblVikAoFcxDsI9Sm/BYHrpRdQ5YAGhD8SVJfhDxEFkdIG2+a6yy16t1gUsz4ZtG+zR
 o4kL5Tt9U5TSNVX24kqXLpi21nPQIYkF5+IK0wvWqD+ut9R8hRqfcCOXWizpWcTSqxBzjk
 6WhWWNOnnVeR0d4Nu1ywg38v/E27VDDDQm6pCjnmAbZtbYAZmOwAA5VeRplpXqZRsx2v96
 0pFnTja2EjQyeNhPh73EIFIgNNV0lJEEvawvQLgv9GAejJ8nFw2DT/KGw7KRI30Qa3eZan
 3E4egBGJD4gzL1p7Ls0quPWptINF6Sd9sG7wsHy8FPYJu4rncCmYFlq6d1kGcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598511678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=itEhm3ICnTlf61Ty9BCh/7cEb9lcU3yOuFeK2GhTwb4=;
 b=oZT0HngxFDUsOO9emAWLUc7TaJbw9jcadPk/yXL5zjhzfAassSApVT4p0v3Vy15S9Vhvv8
 KwpFcxlcM5bl4fCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2] irqchip/eznps: Fix build error for !ARC700 builds
Message-ID: <20200827070117.fdmu4wxulop43mam@linutronix.de>
References: <20200825072152.725jmtlcqah5oos4@linutronix.de>
 <20200825180518.25300-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825180518.25300-1-vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_030124_040127_D743AB72 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2020-08-25 11:05:18 [-0700], Vineet Gupta wrote:
> eznps driver is supposed to be platform independent however it ends up
> including stuff from inside arch/arc headers leading to rand config
> build errors.
> 
> Fix this specific reported error as quick hacks as the correct fixes are
> too much work:
>  - copy AUX_IENABLE from arch/arc header
>  - move CTOP_AUX_IACK from platform header
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://lkml.kernel.org/r/20200824095831.5lpkmkafelnvlpi2@linutronix.de
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Thank you.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

in case it is not too late :)

Sebastian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
