Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEC1C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:52:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D1322384
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 10:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taLRzyUy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="by+mddR8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="otNm1FLh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aDUoEgUs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D1322384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=G6EVD1lt5j8sqUx5Ra2PNvobTcVO+Tg3msL3OH4NH6U=; b=taLRzyUyDJR6iugwhEiv6wS3B
	ZOGZJP6YogXxp4+k6Wzx6o1ANku8XWq4nbyfRqS/wzxIAdAXtbB4AnZkzQeVd3hY4Lmgk8vOiO73H
	UR422v9aCFlw3IKaYGE5IIP+Fdocn+sZgAx3U6LUehc/u4++jLt0/1H9DHbdq6BV+zzLbwHWHinli
	KlAe7UWVpCCjWq8TMO3BrPQnbPyP7Tb72862D8q/9zWcrxN/jNiYZ1eQo08Vz+HtVajgDfBQUpqVm
	MBBfPGiuhSj6QbIGtzxQJ6Wj8YB1jtMRwKZyo62nAJw7W3uk/8/aKyJubkhnzYWiqOUzFxW9ZH6jY
	RLR7Dx57w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtvQ-0000EE-ED; Tue, 03 Nov 2020 10:52:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtvF-0008Ve-BJ; Tue, 03 Nov 2020 10:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-transfer-encoding:Content-Type:
 MIME-Version:References:Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=GQtIeN+bNrXtdDJbIY1/lT5u2Qlmlecyg45ylimAqeo=; b=by+mddR8IbKFxoGvBd3NUx5xrE
 WlK0vspEnIx+wx1vfrJhvkPJgCJeG6Adf/p/G3sNpEJU6ZxFZA9z0aW/u4M3oTRgPvGaaQth1B8FJ
 /e0lSEYw7DVyT3felP0ENWK4Ur2mMA+B02Kb7e2WK2BXG6Z4ETsvgCxVyBDvhm6UfpV0tzkMau4Dw
 IdGzgDQokBLnqQhmDIb1o+FgE5y1OZhBay2r+McgbB7F0nzKg0s1naApz/2KNbaojjIWz/I2ZoNOL
 1Xl39auL1Nlc84m3OtH4sGJFimJ6HeWXsL/a3OYTfuTVeJqAkWuffCedONUUMgpw5kivgC6vdszv7
 uNsw/YsA==;
Received: from galois.linutronix.de ([193.142.43.55])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtdR-0002Gw-Ju; Tue, 03 Nov 2020 10:34:28 +0000
Message-Id: <20201103095858.734064977@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GQtIeN+bNrXtdDJbIY1/lT5u2Qlmlecyg45ylimAqeo=;
 b=otNm1FLhC7ruMh7oNXQtNETNU6+54RFk+t2LyeEF9d9+kDoZ9Kh8ZPgA+UB8A6JQ1ZXrGj
 0TPeQl8iy37SQzf3hhxJ0YH8tjvvuOPaAqFoJKHafSPmEiutw0Ud/5TB6XtJVn4M9v5QlN
 Kc0YPCEkVxgY8QSHdaCi6xZgLgOgc1LgMVaGrZjI4AUGq0ZlUKuDX4Xk4y+i0m9xE3dk86
 7GNBZMVBc/q+vRf7Zxdqgcl3bL7dPvuY81X2pyGhr1m48UNO2c+I7V2+wunozMP8FhvNCm
 gkFktETWxncmi0cgpUqLzaSL8knV0VimchG0Urhi5o5DvILy9hDHjs2CmUtXqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GQtIeN+bNrXtdDJbIY1/lT5u2Qlmlecyg45ylimAqeo=;
 b=aDUoEgUsKRf0mAVHG33KZuw3tdfR+OUYkG1a4FnTBJVD3Vb06TvF7LUgRRezOsbA4xMida
 qFHqtJWvRi1kHPBw==
Date: Tue, 03 Nov 2020 10:27:33 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 21/37] Documentation/io-mapping: Remove outdated blurb
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_103354_860127_09D0298E 
X-CRM114-Status: GOOD (  12.66  )
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

The implementation details in the documentation are outdated and not really
helpful. Remove them.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 Documentation/driver-api/io-mapping.rst |   22 ----------------------
 1 file changed, 22 deletions(-)

--- a/Documentation/driver-api/io-mapping.rst
+++ b/Documentation/driver-api/io-mapping.rst
@@ -73,25 +73,3 @@ for pages mapped with io_mapping_map_wc.
 At driver close time, the io_mapping object must be freed::
 
 	void io_mapping_free(struct io_mapping *mapping)
-
-Current Implementation
-======================
-
-The initial implementation of these functions uses existing mapping
-mechanisms and so provides only an abstraction layer and no new
-functionality.
-
-On 64-bit processors, io_mapping_create_wc calls ioremap_wc for the whole
-range, creating a permanent kernel-visible mapping to the resource. The
-map_atomic and map functions add the requested offset to the base of the
-virtual address returned by ioremap_wc.
-
-On 32-bit processors with HIGHMEM defined, io_mapping_map_atomic_wc uses
-kmap_atomic_pfn to map the specified page in an atomic fashion;
-kmap_atomic_pfn isn't really supposed to be used with device pages, but it
-provides an efficient mapping for this usage.
-
-On 32-bit processors without HIGHMEM defined, io_mapping_map_atomic_wc and
-io_mapping_map_wc both use ioremap_wc, a terribly inefficient function which
-performs an IPI to inform all processors about the new mapping. This results
-in a significant performance penalty.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
