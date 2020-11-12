Return-Path: <SRS0=0uDb=ES=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE50FC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Nov 2020 11:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061F422201
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Nov 2020 11:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Syk4mSRj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IyNoaFai";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3CYfPdTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061F422201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lpqeRrLEhGWDj4LutZdq12fZM3Mwrf5qAAixWs8kNQQ=; b=Syk4mSRjjUx6xZKomoLmbA1ny
	Ijo6Kf0RhFgdwCoE0ZBajUavLURd6qd85r6XcdX5mcs4fPpKruE0V1KhZ3BVgLcENko20XuRLSRY8
	osqBoJeR+4y9WUKRySRpsJzqFuWvao8tY8Ca1+POaK2hjuq/f90wl4Ux5Z8gx7VL5mn91xGQRMYG+
	Zx7cukWLjuOkSKH2eTGq2AAak6pf5p1T3Wuwy2itj8WHsA0vwGufk7Dp1WBp2h1TMvonn+oBW+ntQ
	4Z2M2BwzakwaChsn8/YbVGMcIK7kxlx9fXHSsuT/ljNh0SBXrX4LJI0Y33XIqQ7vtTREspKT4Uxt6
	FgAw5CEjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdAO7-0001Re-W5; Thu, 12 Nov 2020 11:03:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdANw-0001Nm-0J; Thu, 12 Nov 2020 11:03:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605179001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyoQNma1D4GVgEfBEnD9HpKfLsmdKQZ2swCCbsJ89u4=;
 b=IyNoaFaiD+NM5KphnaangmvfL0El+UAOD+w5h3trf2Yyosfdrv/YLVOkMULOW/ZGBhg+Y/
 CdApJJvXGBIZ5Y44ibFQmafGLFWCU3g2FoxBkEzR7mbT6bdJj8sJZKMh9WrX346Yk/RRPA
 ObPEWbP1WIFj7Nu0oQW4DAuIZK/gvLY9xJn27pRRcuIRXasgXoUZIFo7CFG246Z8CyXPW3
 lDFsIyNmic0931dDytsaIyKfHvx6VLixbP2g5wvqVZcSxNyP0kB6LHCFDa/PWmE2zunoqs
 ONbIDGQXkPDZeN2NEzrt5DA5ZmFd/tf+3b4Z7uRwEDxb+zVSTZJFZcQwZtL5UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605179001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RyoQNma1D4GVgEfBEnD9HpKfLsmdKQZ2swCCbsJ89u4=;
 b=3CYfPdTtsJ7bzsqrZTQJEvt1hjj5oOsRpY9HRk4W6lYOEOtLJxrx+ZTCMYthtsl9eIeQcX
 u0l5A2sNhnUsiqCg==
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
In-Reply-To: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
 <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Date: Thu, 12 Nov 2020 12:03:20 +0100
Message-ID: <87v9ean8g7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_060324_242923_FC9EF358 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Mel Gorman <mgorman@suse.de>, Dave Airlie <airlied@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Marek,

On Thu, Nov 12 2020 at 09:10, Marek Szyprowski wrote:
> On 03.11.2020 10:27, Thomas Gleixner wrote:
>
> I can do more tests to help fixing this issue. Just let me know what to do.

Just sent out the fix before I saw your report.

     https://lore.kernel.org/r/87y2j6n8mj.fsf@nanos.tec.linutronix.de

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
