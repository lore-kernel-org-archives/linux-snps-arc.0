Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF3C47074
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jan 2024 19:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=PRvOxKXyadLRmOEnexo5spEjisMbhbWaMVeogymAgN4=; b=x90cwplFKX6BRh
	6Ptclq+BVkbjdR74TSJ6hu0Jexk7UG/o2Rgb6L0ytjmb81HtxqpIXwtINqMIXvkYyrQ3RUGDCuvfM
	a+YrQEInlyje8LwvsQkWUO6zoBu6VrJST9MqGguaN562U2GMPa09xTaluSsM3U5mWmVlMmLQs3GM1
	XX4cnkFFc23udreynBUHBkIEx9ksVDwd3Z+usoDPKfOaUeY3jAgokl1qElkYCjMCC6WSe7RDvg0ZZ
	MyFQ+NmZJAhJ2r/My3vsJflD6CHcQ3SG6jmuTVUCe2RgD8x8/P4xY9UE/KDxbS9NjTI1e2TFFE+9i
	AcWEFiepHpGpH5eLqDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLSzc-00F1A2-2z;
	Thu, 04 Jan 2024 19:03:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLSzZ-00F183-2o
	for linux-snps-arc@lists.infradead.org;
	Thu, 04 Jan 2024 19:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50BC6618EF;
	Thu,  4 Jan 2024 19:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F26C433C8;
	Thu,  4 Jan 2024 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704394970;
	bh=pdDJqTosF1wpqmERsL7jceNVtd6FJ+CFB3Sn8PiagBo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=su1nK90Q/5kiHsiIOBkGgj8NrS4dseBRz7EZ33bEovIH4NRBHkMi5qTsQrkvH1ZD9
	 VgtfWbNHi2zO7BKJceZmm+kC2BlFqzoehFmYnCopZAXXuGFEddyFUF4YfjM6vLffAf
	 xmw4X98h3NPFcCwO/T8GsI4APIJSoSHPpei3XWvtrFXDaXxlmD0gGMEooXwtVu65cL
	 b8dHGAQAkwxFg3XC8KKoF7p4cPQNG4NbasPqTMYrt9Ay9BYYZlCyo4oybh78L4R/TE
	 i0MmwTcvNLLzKBFDO1K5J5NqEkZ0WuvGOGMQj/Uwe+SNxePhsSFzENaJOrlSVGaO0d
	 a/lsoIPnaObrA==
Date: Thu, 4 Jan 2024 13:02:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH 2/8] ARC: Fix typos
Message-ID: <20240104190247.GA1823635@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62c7008e-d460-4314-b2af-2122b93d41dc@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_110258_031466_70D6BB19 
X-CRM114-Status: GOOD (  13.61  )
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

On Wed, Jan 03, 2024 at 04:31:31PM -0800, Randy Dunlap wrote:
> On 1/3/24 15:15, Bjorn Helgaas wrote:
> ...

> > --- a/arch/arc/include/asm/pgtable-bits-arcv2.h
> > +++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
> > @@ -66,7 +66,7 @@
> >   * Other rules which cause the divergence from 1:1 mapping
> >   *
> >   *  1. Although ARC700 can do exclusive execute/write protection (meaning R
> > - *     can be tracked independet of X/W unlike some other CPUs), still to
> > + *     can be tracked independent of X/W unlike some other CPUs), still to
> 
>                          independently

Indeed, embarrassing, thanks.

> >   *     keep things consistent with other archs:
> >   *      -Write implies Read:   W => R
> >   *      -Execute implies Read: X => R
> 
> > diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
> > index 0b3bb529d246..5414d9f5c40c 100644
> > --- a/arch/arc/kernel/signal.c
> > +++ b/arch/arc/kernel/signal.c
> > @@ -9,7 +9,7 @@
> >   * vineetg: Nov 2009 (Everything needed for TIF_RESTORE_SIGMASK)
> >   *  -do_signal() supports TIF_RESTORE_SIGMASK
> >   *  -do_signal() no loner needs oldset, required by OLD sys_sigsuspend
> > - *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implemen
> > + *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implement
> 
>                                                                          implementation

Thanks again.

Added these and a couple other ones to my local copy in case there's a
v2:

diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index f8f85c04d7a8..8ebec1b21d24 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -66,7 +66,7 @@
  * Other rules which cause the divergence from 1:1 mapping
  *
  *  1. Although ARC700 can do exclusive execute/write protection (meaning R
- *     can be tracked independent of X/W unlike some other CPUs), still to
+ *     can be tracked independently of X/W unlike some other CPUs), still to
  *     keep things consistent with other archs:
  *      -Write implies Read:   W => R
  *      -Execute implies Read: X => R
diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 5414d9f5c40c..3490d005e6d4 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -8,15 +8,16 @@
  *
  * vineetg: Nov 2009 (Everything needed for TIF_RESTORE_SIGMASK)
  *  -do_signal() supports TIF_RESTORE_SIGMASK
- *  -do_signal() no loner needs oldset, required by OLD sys_sigsuspend
- *  -sys_rt_sigsuspend() now comes from generic code, so discard arch implement
+ *  -do_signal() no longer needs oldset, required by OLD sys_sigsuspend
+ *  -sys_rt_sigsuspend() now comes from generic code, so discard arch
+ *   implementation
  *  -sys_sigsuspend() no longer needs to fudge ptregs, hence that arg removed
  *  -sys_sigsuspend() no longer loops for do_signal(), sets TIF_xxx and leaves
  *   the job to do_signal()
  *
  * vineetg: July 2009
  *  -Modified Code to support the uClibc provided userland sigreturn stub
- *   to avoid kernel synthesing it on user stack at runtime, costing TLB
+ *   to avoid kernel synthesizing it on user stack at runtime, costing TLB
  *   probes and Cache line flushes.
  *
  * vineetg: July 2009

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
