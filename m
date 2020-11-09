Return-Path: <SRS0=sYE2=EP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD17C4741F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Nov 2020 10:28:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C140207BC
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Nov 2020 10:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BLFAdZ5a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpY/bMSz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C140207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l1w3knCXeVsi42/yMAj3JVVcM000b9civQeH15Hez2M=; b=BLFAdZ5a4Qk8rlmOkUk7YQpAP
	uVuBmz4yq99v94TkgKFfJneIv13pg5AKR/tykLqeoerR6luNybGZZCU064SUhyByn5Dx6UjAwXMNK
	dbA+GYP4kEG2AFQDPih2wVTgAqmUx3wlsI3v8WnbAkxfnbztuKyNlrbw6ATJHKFyrv8jao1mdxexJ
	qAnPtLLDBcNgn8kO/KIZW5VhQqabt/WJzn8tssK7emzPJ6yA4Y0hXCNuzM9RIkUcig6HMyIWhhg2w
	XBscOUNp3g9v4H5nIft2vtvV8FFEQBHrKX56GjkWW7RLYHPeCed1y3CmYP01daPm2oqrlwRNJjLe5
	mjaa2FV6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc4PK-0007C4-Hr; Mon, 09 Nov 2020 10:28:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc4PI-0007BM-63
 for linux-snps-arc@lists.infradead.org; Mon, 09 Nov 2020 10:28:16 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52E5D206E3;
 Mon,  9 Nov 2020 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604917694;
 bh=F4DJfBvLNERc4ObqNHuoqD0PrLer0QzMxjwGTa9K7V0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BpY/bMSz5HZFttESVRrZzFD+mpD0ZfIPSjZqbDXLh+i2AbG/nrL074Z18cO9YQW6V
 24eT54LJ6QQjNIpG9rM9frhZ/tJLCYCCEhHXZY94w1Yu+If31ccCo2ha5y3xWBD2+R
 ElwYQeHkuqmmgGnc9HrSznCu+t6kw8hMiJpVLLTU=
Date: Mon, 9 Nov 2020 11:29:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"
Message-ID: <20201109102914.GD1238638@kroah.com>
References: <20201020021957.1260521-1-vgupta@synopsys.com>
 <9cec26bd-6839-b90d-9bda-44936457e883@synopsys.com>
 <20201107141006.GB28983@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107141006.GB28983@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_052816_338101_16083839 
X-CRM114-Status: GOOD (  24.84  )
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
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 03:10:06PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 06, 2020 at 08:27:44PM +0000, Vineet Gupta wrote:
> > Hi Stable Team,
> > 
> > On 10/19/20 7:19 PM, Vineet Gupta wrote:
> > > This reverts commit 00fdec98d9881bf5173af09aebd353ab3b9ac729.
> > > (but only from 5.2 and prior kernels)
> > > 
> > > The original commit was a preventive fix based on code-review and was
> > > auto-picked for stable back-port (for better or worse).
> > > It was OK for v5.3+ kernels, but turned up needing an implicit change
> > > 68e5c6f073bcf70 "(ARC: entry: EV_Trap expects r10 (vs. r9) to have
> > >  exception cause)" merged in v5.3 which itself was not backported.
> > > So to summarize the stable backport of this patch for v5.2 and prior
> > > kernels is busted and it won't boot.
> > > 
> > > The obvious solution is backport 68e5c6f073bcf70 but that is a pain as
> > > it doesn't revert cleanly and each of affected kernels (so far v4.19,
> > > v4.14, v4.9, v4.4) needs a slightly different massaged varaint.
> > > So the easier fix is to simply revert the backport from 5.2 and prior.
> > > The issue was not a big deal as it would cause strace to sporadically
> > > not work correctly.
> > > 
> > > Waldemar Brodkorb first reported this when running ARC uClibc regressions
> > > on latest stable kernels (with offending backport). Once he bisected it,
> > > the analysis was trivial, so thx to him for this.
> > > 
> > > Reported-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> > > Bisected-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> > > Cc: stable <stable@vger.kernel.org> # 5.2 and prior
> > > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> > 
> > Can this revert be please applied to 4.19 and older kernels for the next cycle.
> > 
> > Or is there is a procedural issue given this revert is not in mainline. I've
> > described the issue in detail above so if there's a better/desirable way of
> > reverting it from backports, please let me know.
> 
> THis is fine, sorry, it's just in a backlog of lots of stable patches...
> 
> We will get to it soon.

Now queued up, thanks.

gre gk-h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
