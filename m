Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC4EC8300F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:35:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234CE22447
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2dKmEG0m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KJf8zms3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VFptQlcV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 234CE22447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=BqBowjpnZ4XH+3Bv0tA3/rYCT4xdW/DJqfLUIpIRbso=; b=2dKmEG0maN9XO2edzmt1Ikaaf
	rD58FtCIYppn2/HHv/94CFRu1uFw6xbbk030UEHSTAr+ouM1pTJ6NIjYqIQEpAWOFtT//vZWTJa1B
	+eWAo/6CglC+awdaw0CgIOF2v1AMpliwsHU9fjbUMBFsJIVS8QaXsWzmenLCA3mzhtqiTmvMB4bxr
	MoevNU4dvldMLqslVGOywZucCpAIF+OvXxY460d7gNAadHd+foNa1x9XFS89BcHSHceXdkQeedrMy
	uq7Fv/U9JcUT8Hi7YEz7088vIG0rPAjsgc1YIGxeTjS8YGrD3qYfrpaOkwSe5bfaIK50j2t4exkaP
	rukAGL6Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtf8-00040Z-FR; Tue, 03 Nov 2020 10:35:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtdg-0003JN-N9; Tue, 03 Nov 2020 10:34:18 +0000
Message-Id: <20201103095859.632601906@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=BkU+tnLkRKR9tWKe3hevtehunqdIqgczXq1AHqpv3q4=;
 b=KJf8zms3zcTUg/g/XiQKKwBV2+EGVfb2u6h4vllDaW1ez/6EBzhuUPcV5jYjkgK7/2tTNT
 qa9meb2s93/KBKnvJtf7CaHAT8ZFpd7v/uDOmyc6h4+65DvAL8nMOPTgxeMwXec71wKviC
 gz+l4oJdNdRF681hb02MgaZ8n1LTFM12pOX0R3Y6kTHEtlSnwJNnKuWAQNeTkLaIi8i7t3
 B7yCZDHpTZLzl/MKlFABrQ2M+t1vry/EDo/Dfbd7n6CnEj3z8AhqyHdXDUxHJtlLsKb9Iy
 +K2WT76685XP/mxAZ6mzKSlMAP/ZbKhBPVY2/azsvsrUQ/qHyD8kIOTXSXqhkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=BkU+tnLkRKR9tWKe3hevtehunqdIqgczXq1AHqpv3q4=;
 b=VFptQlcVWRmmzZcgWUr7xM35WWw+Igz4v/KmNvEZ7Y4AvSm9gz9Y19AW04WlVkG++aOR3h
 ADLKc+FsTUi0cTDA==
Date: Tue, 03 Nov 2020 10:27:42 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 30/37] highmem: Remove kmap_atomic_pfn()
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_053409_124869_946BA7F9 
X-CRM114-Status: GOOD (  10.72  )
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

No more users.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 include/linux/highmem-internal.h |   12 ------------
 1 file changed, 12 deletions(-)

--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -99,13 +99,6 @@ static inline void *kmap_atomic(struct p
 	return kmap_atomic_prot(page, kmap_prot);
 }
 
-static inline void *kmap_atomic_pfn(unsigned long pfn)
-{
-	preempt_disable();
-	pagefault_disable();
-	return __kmap_local_pfn_prot(pfn, kmap_prot);
-}
-
 static inline void __kunmap_atomic(void *addr)
 {
 	kunmap_local_indexed(addr);
@@ -193,11 +186,6 @@ static inline void *kmap_atomic_prot(str
 	return kmap_atomic(page);
 }
 
-static inline void *kmap_atomic_pfn(unsigned long pfn)
-{
-	return kmap_atomic(pfn_to_page(pfn));
-}
-
 static inline void __kunmap_atomic(void *addr)
 {
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
