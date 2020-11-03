Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE57CC64E69
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:35:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E62921D40
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0Hdrf7D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UCiLeToK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iNcZKx8F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E62921D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=iTz+Gpuusuu/kyW1fNFJBvkcBTtznawQsCLxu6pm8L0=; b=Y0Hdrf7DTSHvTS2dmFb3UrcWW
	t2MKXpNdBAH3jFfJpNlNgWvRq4xRLoJ15zywAKjosJw6kQkpUTgU5aTJNgHttPZyYLPy9PMoiqm7l
	AOsW8+u+Da8n2y9W0C5GKCM+N2PccjSFhnD6gikNPS0gJ+8MbmSOjVqhI01/4oMMN8cP4pGIk+cAw
	OlEHDltoAbpIU2N3++MyGOu6suv/+cU7HWUCbFIgfSla8toOSGIiYqt9+PlnFmR+eusqUvz0z9uKh
	04vmQcd0QHrmyv92O3kr97fagGh7zx9eEMS7xetfcv9KPzn1FROURluCsfUWrBsdU9NQS/uLVlRy0
	hfiXYpfdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtet-0003tL-Ke; Tue, 03 Nov 2020 10:35:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtde-0003Hr-6q; Tue, 03 Nov 2020 10:34:18 +0000
Message-Id: <20201103095859.538827102@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=37l2/9hMoX995irJwwZT0VNkjmk/OwZo72GhT72QTX4=;
 b=UCiLeToK4AIC+9Dmx7LG5rV2mjuvYVd6Coif2Sdjhi7Si2K86UL165usKvCu+1M57a5ZTs
 3lGdAzYJonKcTuvyMgrOXNx+UrIY8LVcTVNso2JLtpbkE1oygEe/wl748JnAW6AS6EsTrD
 c2VWZi0Trd4Jp1S58g19SzXtzA+u8eA2qRCth6y4qBL25KfIk14Y8/pIC7Pk9xx9opLe+Y
 fYTupCtZR4FQC2/b1qBabqi8Jfeh2ZKqUrq+V0zmNc17uiUhxxjlvxwBR152OCIcLA02mF
 vb+4tkvTlRO1TXdeUxGxjDkLW4Yer0R+EYHQyA+pAWiyVIPp/wbrw75o+T0ZJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=37l2/9hMoX995irJwwZT0VNkjmk/OwZo72GhT72QTX4=;
 b=iNcZKx8Fg9QYlTcIp7Z3u6IBgHA5T+EwXNMLuSSTvrJb/3r4DH72OAUwbFyp58bawCPYfQ
 dJ5wikkjaG3JOhAw==
Date: Tue, 03 Nov 2020 10:27:41 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 29/37] ARM: mm: Replace kmap_atomic_pfn()
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_053406_762967_0073794D 
X-CRM114-Status: GOOD (  16.10  )
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
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
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
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

There is no requirement to disable pagefaults and preemption for these
cache management mappings.

Replace kmap_atomic_pfn() with kmap_local_pfn(). This allows to remove
kmap_atomic_pfn() in the next step.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
V3: New patch
---
 arch/arm/mm/cache-feroceon-l2.c |    6 +++---
 arch/arm/mm/cache-xsc3l2.c      |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

--- a/arch/arm/mm/cache-feroceon-l2.c
+++ b/arch/arm/mm/cache-feroceon-l2.c
@@ -49,9 +49,9 @@ static inline unsigned long l2_get_va(un
 	 * we simply install a virtual mapping for it only for the
 	 * TLB lookup to occur, hence no need to flush the untouched
 	 * memory mapping afterwards (note: a cache flush may happen
-	 * in some circumstances depending on the path taken in kunmap_atomic).
+	 * in some circumstances depending on the path taken in kunmap_local).
 	 */
-	void *vaddr = kmap_atomic_pfn(paddr >> PAGE_SHIFT);
+	void *vaddr = kmap_local_pfn(paddr >> PAGE_SHIFT);
 	return (unsigned long)vaddr + (paddr & ~PAGE_MASK);
 #else
 	return __phys_to_virt(paddr);
@@ -61,7 +61,7 @@ static inline unsigned long l2_get_va(un
 static inline void l2_put_va(unsigned long vaddr)
 {
 #ifdef CONFIG_HIGHMEM
-	kunmap_atomic((void *)vaddr);
+	kunmap_local((void *)vaddr);
 #endif
 }
 
--- a/arch/arm/mm/cache-xsc3l2.c
+++ b/arch/arm/mm/cache-xsc3l2.c
@@ -59,7 +59,7 @@ static inline void l2_unmap_va(unsigned
 {
 #ifdef CONFIG_HIGHMEM
 	if (va != -1)
-		kunmap_atomic((void *)va);
+		kunmap_local((void *)va);
 #endif
 }
 
@@ -75,7 +75,7 @@ static inline unsigned long l2_map_va(un
 		 * in place for it.
 		 */
 		l2_unmap_va(prev_va);
-		va = (unsigned long)kmap_atomic_pfn(pa >> PAGE_SHIFT);
+		va = (unsigned long)kmap_local_pfn(pa >> PAGE_SHIFT);
 	}
 	return va + (pa_offset >> (32 - PAGE_SHIFT));
 #else


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
