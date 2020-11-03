Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D65C64E7C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:35:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3F222409
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eI0rv5LL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BWJY7YL9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W6vWFt0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3F222409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=3OZaK28ljIUz+spNELcjbN7zZHQ7K/8GtALVFP0JeEM=; b=eI0rv5LLvmDCXH1u/gLlBZ7dt
	1CjoxUrNW/LpCTG211aaripEN/qC7Gl/Q/Zw0ECnleJMF5N5Oi1+W0HkI3rYkF990uVVmY1umb9Mi
	MhOYSW4wRNqn6lN7EwSAvm54CJMXhZVf7HVrRdj+swBrccElwaVn3sxywtIqGhOhwjPRMqQc01EgO
	joGHEzLpxLv9Q3rQ8PUDhmIrY2TXokZzE6KMVV8lehd8kDhd8ebofJUUtA+rt5jqrSUeokS7eWfAU
	tI8EoRdoIw814EPRc/qNxk20wEvuvS+hFUIOwvzw+VTRzO+eEWQ6u05nhpuKdLOdHiuUZxu4Pb6b/
	Lc9BQyObg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtev-0003v4-Nc; Tue, 03 Nov 2020 10:35:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtdi-0003KJ-8L; Tue, 03 Nov 2020 10:34:20 +0000
Message-Id: <20201103095859.726187546@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=r3bRNSPyDxqBB2q1RmPpZiq/s1h+pWiITk0Gb+X4YiE=;
 b=BWJY7YL9koWIqQGO6oJX8GMg2970+m6CUIohd/XJevMmQ80PB19bJDJ6iS8RO72tFyrU5a
 zermc/VLuhpDSGwb6AlQ+XUnPAk/ooP0r2CdnCXy7SbeJDAVykp+GhIB7O+PeOHtxIB/kQ
 kGAzLI/8Albxroia7VjhmBhPwLPYvYm7buHcNBklvKblOslUE8GFJQxCNSKNTUzn67UA6c
 dCL9UHwiUeuSbb9mKfvGa5CyJx9FEPWWAQv536xf3Kv7je840+HegrNr76dqY6DZp1xmcI
 hfpxU76xevyfk1dRUoZcIUQ3vKAJLr6y/fVXGv/9UWFE20X3bXjqdNO7IqY7sQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=r3bRNSPyDxqBB2q1RmPpZiq/s1h+pWiITk0Gb+X4YiE=;
 b=W6vWFt0HyJmTC8mcOcU1LotSVA5E0cTby+uitrXhlUWJjwzfnwYugo9E0ZaVshQFT42zsP
 ckJmRhJkQSF0aCCw==
Date: Tue, 03 Nov 2020 10:27:43 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 31/37] drm/ttm: Replace kmap_atomic() usage
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_053410_745737_CF3F4941 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

There is no reason to disable pagefaults and preemption as a side effect of
kmap_atomic_prot().

Use kmap_local_page_prot() instead and document the reasoning for the
mapping usage with the given pgprot.

Remove the NULL pointer check for the map. These functions return a valid
address for valid pages and the return was bogus anyway as it would have
left preemption and pagefaults disabled.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
V3: New patch
---
 drivers/gpu/drm/ttm/ttm_bo_util.c |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -181,13 +181,15 @@ static int ttm_copy_io_ttm_page(struct t
 		return -ENOMEM;
 
 	src = (void *)((unsigned long)src + (page << PAGE_SHIFT));
-	dst = kmap_atomic_prot(d, prot);
-	if (!dst)
-		return -ENOMEM;
+	/*
+	 * Ensure that a highmem page is mapped with the correct
+	 * pgprot. For non highmem the mapping is already there.
+	 */
+	dst = kmap_local_page_prot(d, prot);
 
 	memcpy_fromio(dst, src, PAGE_SIZE);
 
-	kunmap_atomic(dst);
+	kunmap_local(dst);
 
 	return 0;
 }
@@ -203,13 +205,15 @@ static int ttm_copy_ttm_io_page(struct t
 		return -ENOMEM;
 
 	dst = (void *)((unsigned long)dst + (page << PAGE_SHIFT));
-	src = kmap_atomic_prot(s, prot);
-	if (!src)
-		return -ENOMEM;
+	/*
+	 * Ensure that a highmem page is mapped with the correct
+	 * pgprot. For non highmem the mapping is already there.
+	 */
+	src = kmap_local_page_prot(s, prot);
 
 	memcpy_toio(dst, src, PAGE_SIZE);
 
-	kunmap_atomic(src);
+	kunmap_local(src);
 
 	return 0;
 }


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
