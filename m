Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078A0C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:52:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38ABE22384
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHOv5xLp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h6sbkXca";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CdqukbVB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pfa+TpRf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38ABE22384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=NlNFo09VydvI2DdljSjwpVehfxQCGNWMNuXVstrX/jg=; b=VHOv5xLpuj7FpWv9nr8nKRbnK
	VgSt6RzPztHdrJc/0I/Y+OZVt19fWbjro/ieIc6OsXcHqAcjontN4+I/zs9Wc29VVyL74DF2ZH1Eo
	wbMvPf0jQ8leEm2RYokjXTrXIjxlKIMRXFhGlsCzWAgOD0vETxIsBl1ronneo9OoezU1MOVdjWWbt
	Tk9QJlfvTZ+4rmIemCNhhyws9b7sGvrataX7VXiVtvlR1MKJtjwdx0+PAxRIakXbQxt7mvSwWZtNY
	eQLx0u4onTr9eICaIJ/PxdpJ9lyclDSZWLhrF5t+6VnKj/QCjMToIuGi6pJpLnFIRjWzY3sWKYdek
	YnV5rGokw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtvE-0000Bt-BA; Tue, 03 Nov 2020 10:52:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtv8-0008Ve-B4; Tue, 03 Nov 2020 10:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=XzZnXq40Xta6eAd8+Z4XomSn8j1A2hSECk29QnRRbws=; b=h6sbkXcamaGvCKpZfAGaOfROFa
 KkR1WwTxes2M4FTP6Du8bI51/A70jftiRZVVxrkosK2ZI0QSiIwLx0kP0j21fLc00dV3YbIZ+wUH2
 wfY1OvIbM6pT6sUY8rLJJrlE1yOZkxRb1Y28LzNIex0hi8GjguMg1wD9z6MLPNmTrdhplPrcg9Gv2
 s/qbyS1eQiF8KMiKXYaxmk1E+mrDZS93yW8LHOifZl9fPni+uFtLyoqs87CUsb1gmX4odL6un/OgR
 a4j1OOfx8RB6ojC11qXrhuH5t074mqDJiGAM8hxeBpAF0XUQX5Hd4ZLm6RBijnbSYSE9NAeBta5xD
 3+9tBwxw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtdu-0002Mu-66; Tue, 03 Nov 2020 10:35:06 +0000
Message-Id: <20201103095900.367260321@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XzZnXq40Xta6eAd8+Z4XomSn8j1A2hSECk29QnRRbws=;
 b=CdqukbVBWMYI/RONrhSGzX6/xMHlDVBTWtfJrQb8BGeECEJqjOAzrpgd/S5gcYhw2K5fbn
 Eaab3vE9c+BoonfV0tN18iO2mipbe36uJxmY7lt1Q+Y/DUZ/Lt4ranrEwz1e8nCX8rE7ib
 zUEarU65A2JKzY8kRhVSr0Mov+N333GuC6WgQoQRke1a5GsVBT4qs+q/yyCNm0M0BVOUKi
 wwWaobx9qhLoUV9tFHktWx+AG8+ArEEhZ4OLWEEinwZC+qMmqYYw2bnvpObjtaVxDm8Ir6
 h+E3LFBQps2vHJjH1B0mTeQMdmzvDlwqg7xu3fUjiEVpzfRq4Nob09i6lYhuzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XzZnXq40Xta6eAd8+Z4XomSn8j1A2hSECk29QnRRbws=;
 b=pfa+TpRfmsyoL3kfRqJUVU2S9UUvIXMBP/3UXjO0TEtWrbhDCiNU865DGow3SSMVJwemxu
 95CKXmp2zPH8LuBg==
Date: Tue, 03 Nov 2020 10:27:49 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 37/37] io-mapping: Remove io_mapping_map_atomic_wc()
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_103422_779473_0FB182DC 
X-CRM114-Status: GOOD (  14.96  )
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

No more users. Get rid of it and remove the traces in documentation.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 Documentation/driver-api/io-mapping.rst |   22 +++++-----------
 include/linux/io-mapping.h              |   42 +-------------------------------
 2 files changed, 9 insertions(+), 55 deletions(-)

--- a/Documentation/driver-api/io-mapping.rst
+++ b/Documentation/driver-api/io-mapping.rst
@@ -21,19 +21,15 @@ mappable, while 'size' indicates how lar
 enable. Both are in bytes.
 
 This _wc variant provides a mapping which may only be used with
-io_mapping_map_atomic_wc(), io_mapping_map_local_wc() or
-io_mapping_map_wc().
+io_mapping_map_local_wc() or io_mapping_map_wc().
 
 With this mapping object, individual pages can be mapped either temporarily
 or long term, depending on the requirements. Of course, temporary maps are
-more efficient. They come in two flavours::
+more efficient.
 
 	void *io_mapping_map_local_wc(struct io_mapping *mapping,
 				      unsigned long offset)
 
-	void *io_mapping_map_atomic_wc(struct io_mapping *mapping,
-				       unsigned long offset)
-
 'offset' is the offset within the defined mapping region.  Accessing
 addresses beyond the region specified in the creation function yields
 undefined results. Using an offset which is not page aligned yields an
@@ -50,9 +46,6 @@ io_mapping_map_local_wc() has a side eff
 migration to make the mapping code work. No caller can rely on this side
 effect.
 
-io_mapping_map_atomic_wc() has the side effect of disabling preemption and
-pagefaults. Don't use in new code. Use io_mapping_map_local_wc() instead.
-
 Nested mappings need to be undone in reverse order because the mapping
 code uses a stack for keeping track of them::
 
@@ -65,11 +58,10 @@ Nested mappings need to be undone in rev
 The mappings are released with::
 
 	void io_mapping_unmap_local(void *vaddr)
-	void io_mapping_unmap_atomic(void *vaddr)
 
-'vaddr' must be the value returned by the last io_mapping_map_local_wc() or
-io_mapping_map_atomic_wc() call. This unmaps the specified mapping and
-undoes the side effects of the mapping functions.
+'vaddr' must be the value returned by the last io_mapping_map_local_wc()
+call. This unmaps the specified mapping and undoes eventual side effects of
+the mapping function.
 
 If you need to sleep while holding a mapping, you can use the regular
 variant, although this may be significantly slower::
@@ -77,8 +69,8 @@ If you need to sleep while holding a map
 	void *io_mapping_map_wc(struct io_mapping *mapping,
 				unsigned long offset)
 
-This works like io_mapping_map_atomic/local_wc() except it has no side
-effects and the pointer is globaly visible.
+This works like io_mapping_map_local_wc() except it has no side effects and
+the pointer is globaly visible.
 
 The mappings are released with::
 
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -60,28 +60,7 @@ io_mapping_fini(struct io_mapping *mappi
 	iomap_free(mapping->base, mapping->size);
 }
 
-/* Atomic map/unmap */
-static inline void __iomem *
-io_mapping_map_atomic_wc(struct io_mapping *mapping,
-			 unsigned long offset)
-{
-	resource_size_t phys_addr;
-
-	BUG_ON(offset >= mapping->size);
-	phys_addr = mapping->base + offset;
-	preempt_disable();
-	pagefault_disable();
-	return __iomap_local_pfn_prot(PHYS_PFN(phys_addr), mapping->prot);
-}
-
-static inline void
-io_mapping_unmap_atomic(void __iomem *vaddr)
-{
-	kunmap_local_indexed((void __force *)vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
-
+/* Temporary mappings which are only valid in the current context */
 static inline void __iomem *
 io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
 {
@@ -163,24 +142,7 @@ io_mapping_unmap(void __iomem *vaddr)
 {
 }
 
-/* Atomic map/unmap */
-static inline void __iomem *
-io_mapping_map_atomic_wc(struct io_mapping *mapping,
-			 unsigned long offset)
-{
-	preempt_disable();
-	pagefault_disable();
-	return io_mapping_map_wc(mapping, offset, PAGE_SIZE);
-}
-
-static inline void
-io_mapping_unmap_atomic(void __iomem *vaddr)
-{
-	io_mapping_unmap(vaddr);
-	pagefault_enable();
-	preempt_enable();
-}
-
+/* Temporary mappings which are only valid in the current context */
 static inline void __iomem *
 io_mapping_map_local_wc(struct io_mapping *mapping, unsigned long offset)
 {


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
