Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92CDC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:44:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B84F206F1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puEMu6kL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4s8omJJm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U4tn/+pk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B84F206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=gZG9W5C2hLbpbrfVM4vBU6RClZGehhzaRdwFLWnLZd8=; b=puEMu6kLp9WqQl8k1jdbvoUsL
	s3+BFOM/CL9ImIl8/6ULzt/hg144BzXATbG9Led0pVERlzLwCHGbkbNQSWD7h4HF72yBDbgwig4mB
	sEZLVAk5sTT9TSXH/FSgI9mqZYgbb/x1XvwKsaSasVjOzxQoEeqpZF/UiMHQjSrpeSuaZdssT6FWP
	lnxE4WRh79rrL04D9flsEk7VxgGlJ8PxnE70Gs7ApiwFwoBAmNkrQqMdPuNrbHEXd6nvbwQbPP8wC
	sP4ZJrvvnLNdd+F8t/n4YyqNADb5bc3e6S3pesm81hOQGOH8AC7kRL9lTaDKEgerVLH0Tym/GKbQ3
	ys8j162jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtnD-00077f-Sk; Tue, 03 Nov 2020 10:43:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtmj-0006td-V4; Tue, 03 Nov 2020 10:43:36 +0000
Message-Id: <20201103095900.254775994@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=fathe5XQH1prv3cOh0IbfIOri3L6Dlenv7hGYFbTtOw=;
 b=4s8omJJmBJxpmEg2QlzSO+2D4D00kouw94LPizFXKTom4HVYkN1o6VhUYVjXFczGJZXWt6
 jcuI7M/Stlt9YLFWcRG639AknE1v3UGJre9Df69eIwRjf9YTAiuZlQltsoKHicCYv0XkOB
 tMyxElLRYReGvN4Pcl2amdoIzJ+WqApLJqAyPzA/Jqs47Dn+PWf6iFzctqWQ01kgsVlEs+
 1Ko7pw79T/pa0E4i3nSMi+6A0K8qzsp3/0oy+zVV4I8gfR55e/p9Uu4ya2uNvVxk7sYui2
 P+3BfUUa3cw0srOaWKmfe2rDqSUUj9AU19r7OCFMjiYKDFXVXEhQ3iKBruwOYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=fathe5XQH1prv3cOh0IbfIOri3L6Dlenv7hGYFbTtOw=;
 b=U4tn/+pk9QVOKUfGcyx1nvemACltstypD2THWsG3wL3LXLx1tDAUzM/HpmYQmwhLMtJxEk
 hA08G13TeSVN0TDg==
Date: Tue, 03 Nov 2020 10:27:48 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 36/37] drm/i915: Replace io_mapping_map_atomic_wc()
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_054330_601170_B9429B2A 
X-CRM114-Status: GOOD (  17.91  )
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
 Dave Airlie <airlied@redhat.com>, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 nouveau@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 linux-snps-arc@lists.infradead.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 Josef Bacik <josef@toxicpanda.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 spice-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

None of these mapping requires the side effect of disabling pagefaults and
preemption.

Use io_mapping_map_local_wc() instead, and clean up gtt_user_read() and
gtt_user_write() to use a plain copy_from_user() as the local maps are not
disabling pagefaults.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
V3: New patch
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |    7 +---
 drivers/gpu/drm/i915/i915_gem.c                |   40 ++++++++-----------------
 drivers/gpu/drm/i915/selftests/i915_gem.c      |    4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c  |    8 ++---
 4 files changed, 22 insertions(+), 37 deletions(-)

--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1081,7 +1081,7 @@ static void reloc_cache_reset(struct rel
 		struct i915_ggtt *ggtt = cache_to_ggtt(cache);
 
 		intel_gt_flush_ggtt_writes(ggtt->vm.gt);
-		io_mapping_unmap_atomic((void __iomem *)vaddr);
+		io_mapping_unmap_local((void __iomem *)vaddr);
 
 		if (drm_mm_node_allocated(&cache->node)) {
 			ggtt->vm.clear_range(&ggtt->vm,
@@ -1147,7 +1147,7 @@ static void *reloc_iomap(struct drm_i915
 
 	if (cache->vaddr) {
 		intel_gt_flush_ggtt_writes(ggtt->vm.gt);
-		io_mapping_unmap_atomic((void __force __iomem *) unmask_page(cache->vaddr));
+		io_mapping_unmap_local((void __force __iomem *) unmask_page(cache->vaddr));
 	} else {
 		struct i915_vma *vma;
 		int err;
@@ -1195,8 +1195,7 @@ static void *reloc_iomap(struct drm_i915
 		offset += page << PAGE_SHIFT;
 	}
 
-	vaddr = (void __force *)io_mapping_map_atomic_wc(&ggtt->iomap,
-							 offset);
+	vaddr = (void __force *)io_mapping_map_local_wc(&ggtt->iomap, offset);
 	cache->page = page;
 	cache->vaddr = (unsigned long)vaddr;
 
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -379,22 +379,15 @@ gtt_user_read(struct io_mapping *mapping
 	      char __user *user_data, int length)
 {
 	void __iomem *vaddr;
-	unsigned long unwritten;
+	bool fail = false;
 
 	/* We can use the cpu mem copy function because this is X86. */
-	vaddr = io_mapping_map_atomic_wc(mapping, base);
-	unwritten = __copy_to_user_inatomic(user_data,
-					    (void __force *)vaddr + offset,
-					    length);
-	io_mapping_unmap_atomic(vaddr);
-	if (unwritten) {
-		vaddr = io_mapping_map_wc(mapping, base, PAGE_SIZE);
-		unwritten = copy_to_user(user_data,
-					 (void __force *)vaddr + offset,
-					 length);
-		io_mapping_unmap(vaddr);
-	}
-	return unwritten;
+	vaddr = io_mapping_map_local_wc(mapping, base);
+	if (copy_to_user(user_data, (void __force *)vaddr + offset, length))
+		fail = true;
+	io_mapping_unmap_local(vaddr);
+
+	return fail;
 }
 
 static int
@@ -557,21 +550,14 @@ ggtt_write(struct io_mapping *mapping,
 	   char __user *user_data, int length)
 {
 	void __iomem *vaddr;
-	unsigned long unwritten;
+	bool fail = false;
 
 	/* We can use the cpu mem copy function because this is X86. */
-	vaddr = io_mapping_map_atomic_wc(mapping, base);
-	unwritten = __copy_from_user_inatomic_nocache((void __force *)vaddr + offset,
-						      user_data, length);
-	io_mapping_unmap_atomic(vaddr);
-	if (unwritten) {
-		vaddr = io_mapping_map_wc(mapping, base, PAGE_SIZE);
-		unwritten = copy_from_user((void __force *)vaddr + offset,
-					   user_data, length);
-		io_mapping_unmap(vaddr);
-	}
-
-	return unwritten;
+	vaddr = io_mapping_map_local_wc(mapping, base);
+	if (copy_from_user((void __force *)vaddr + offset, user_data, length))
+		fail = true;
+	io_mapping_unmap_local(vaddr);
+	return fail;
 }
 
 /**
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -57,12 +57,12 @@ static void trash_stolen(struct drm_i915
 
 		ggtt->vm.insert_page(&ggtt->vm, dma, slot, I915_CACHE_NONE, 0);
 
-		s = io_mapping_map_atomic_wc(&ggtt->iomap, slot);
+		s = io_mapping_map_local_wc(&ggtt->iomap, slot);
 		for (x = 0; x < PAGE_SIZE / sizeof(u32); x++) {
 			prng = next_pseudo_random32(prng);
 			iowrite32(prng, &s[x]);
 		}
-		io_mapping_unmap_atomic(s);
+		io_mapping_unmap_local(s);
 	}
 
 	ggtt->vm.clear_range(&ggtt->vm, slot, PAGE_SIZE);
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1200,9 +1200,9 @@ static int igt_ggtt_page(void *arg)
 		u64 offset = tmp.start + order[n] * PAGE_SIZE;
 		u32 __iomem *vaddr;
 
-		vaddr = io_mapping_map_atomic_wc(&ggtt->iomap, offset);
+		vaddr = io_mapping_map_local_wc(&ggtt->iomap, offset);
 		iowrite32(n, vaddr + n);
-		io_mapping_unmap_atomic(vaddr);
+		io_mapping_unmap_local(vaddr);
 	}
 	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
 
@@ -1212,9 +1212,9 @@ static int igt_ggtt_page(void *arg)
 		u32 __iomem *vaddr;
 		u32 val;
 
-		vaddr = io_mapping_map_atomic_wc(&ggtt->iomap, offset);
+		vaddr = io_mapping_map_local_wc(&ggtt->iomap, offset);
 		val = ioread32(vaddr + n);
-		io_mapping_unmap_atomic(vaddr);
+		io_mapping_unmap_local(vaddr);
 
 		if (val != n) {
 			pr_err("insert page failed: found %d, expected %d\n",


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
