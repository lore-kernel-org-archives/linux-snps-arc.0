Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02C9C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 09:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923F1207D3
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 09:41:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XadPph94";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4SWVhgk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923F1207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zN/djQwE578Lu4gZVjI/kW8jwgZaxGNmb2mB+urNNGo=; b=XadPph94hzbR0N
	A5hYX69J+aLPgzjC8Ka1j3GtU9YuerBwFxTE+DZhFx2LszIyl5ZScJI3tmBdfgU637o8NT0FABWZh
	seVjQL5Y1oTtf/wm3N984IADItWm3+t8t63SYimet9YDkLWgnof8IrVzjcLrxknpYflwoOpdLRyQG
	fNWnH4itOtrOImK/2foOjUgkkIipPNxVUtroPQZmWwGHCcRqB4ig/xd0Sm6ZHa995q8z6lIxxO3/E
	ufQv6JCoze7PoNA286K+0OXlI1t0La/RktqhRHGqcuR4CTnf9V45NAKIqGAAKiqgZWcac7TMxe/n+
	gjN52yePXsz5qmxaeKsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgmNq-0006Vt-J3; Thu, 04 Jun 2020 09:41:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgmNj-0006Nl-9p; Thu, 04 Jun 2020 09:41:52 +0000
Received: from kernel.org (unknown [87.71.78.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F3FDC206C3;
 Thu,  4 Jun 2020 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591263710;
 bh=1Q3d66uzBYSZVsxgnp/NnELnCNnx2g8D9fS4fWf1tZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4SWVhgke8okNdSNThzzm+pvB0BBxC+L9XfiRpfWwdENE32NTRySuxE9r/7AGBN52
 VQ5bSYln8QHw7vVdtvRzDfqt4APeQDd4kA7Xe8CNmHjvD48410i6h4eSQt1s7mqDXL
 qqxMB94j2dQ/XCuBIdXsQpiPRrpdWdkx5G8lu2ug=
Date: Thu, 4 Jun 2020 12:41:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604094133.GC202650@kernel.org>
References: <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_024151_384428_DB64AE65 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> 
> sparc32 smp images in next-20200603 still crash for me with a spinlock
> recursion. s390 images hang early in boot. Several others (alpha, arm64,
> various ppc) don't even compile. I can run some more bisects over time,
> but this is becoming a full-time job :-(.

I've been able to bisect s390 hang to commit b614345f52bc ("x86/entry:
Clarify irq_{enter,exit}_rcu()").

After this commit, lockdep_hardirq_exit() is called twice on s390 (and
others) - one time in irq_exit_rcu() and another one in irq_exit():

/**
 * irq_exit_rcu() - Exit an interrupt context without updating RCU
 *
 * Also processes softirqs if needed and possible.
 */
void irq_exit_rcu(void)
{
	__irq_exit_rcu();
	 /* must be last! */
	lockdep_hardirq_exit();
}

/**
 * irq_exit - Exit an interrupt context, update RCU and lockdep
 *
 * Also processes softirqs if needed and possible.
 */
void irq_exit(void)
{
	irq_exit_rcu();
	rcu_irq_exit();
	 /* must be last! */
	lockdep_hardirq_exit();
}

Removing the call in irq_exit() make s390 boot again, and judgung by the
x86 entry code, the comment /* must be last! */ is stale...

@Peter, @Thomas, can you comment please?

From e51d50ee6f4d1f446decf91c2c67230da14ff82c Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Thu, 4 Jun 2020 12:37:03 +0300
Subject: [PATCH] softirq: don't call lockdep_hardirq_exit() twice

After commit b614345f52bc ("x86/entry: Clarify irq_{enter,exit}_rcu()")
lockdep_hardirq_exit() is called twice on every architecture that uses
irq_exit(): one time in irq_exit_rcu() and another one in irq_exit().

Remove the extra call in irq_exit().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 kernel/softirq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index a3eb6eba8c41..7523f4ce4c1d 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -427,7 +427,6 @@ static inline void __irq_exit_rcu(void)
 void irq_exit_rcu(void)
 {
 	__irq_exit_rcu();
-	 /* must be last! */
 	lockdep_hardirq_exit();
 }
 
@@ -440,8 +439,6 @@ void irq_exit(void)
 {
 	irq_exit_rcu();
 	rcu_irq_exit();
-	 /* must be last! */
-	lockdep_hardirq_exit();
 }
 
 /*
-- 
2.26.2



> Guenter

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
