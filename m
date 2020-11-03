Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26900C388F2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 11:42:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B170206C0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 11:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIpcCusA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IBayNHLC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZQ5pkdX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B170206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Subject:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=/ZIZa+841hj5NgLWgfl9OaUc/qo9kS1dXYwYuZ0amuc=; b=XIpcCusAn063caEMCxU/+EmKf
	8Zr4Yo81dzf43XurGOMc+Tah50T/5r+DmYdGQbX9yjtV6XEOaN0louMVOvn9rY2AbOSX4m0DF8sql
	1j7UQ/pHGHENnPFV75lMesn64yOEKbTQqu9RIitmry9/ZF+Lc5uco5Wk4TcmU92dm5EEL7wkjyXv7
	6yEzEIBLAcpqbSWLeUE+wo0zDXxVme6ZWSjo2bvktzyzE0L40c6FFT4LDal2n0AvLn4xdrnzHWZ3s
	1flOusI8DEFtHaeiiRMmCq6uxB1/42yghKWGrEMLBRZg7Ba+ukzAWerwV4G8XeybEaPEpTa7VMGhb
	1J5doIbyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZuhX-00035I-KQ; Tue, 03 Nov 2020 11:42:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtd2-0002tG-KG; Tue, 03 Nov 2020 10:33:32 +0000
Message-Id: <20201103095856.870272797@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mHGaObavEXdpklPpAdB/Vc9tQphwJ4HtjtNI7fLm1v8=;
 b=IBayNHLC8hDXJPq5spbDcH2wKyiWbuyexwHwfVt89VcAakRhxfizYqbQCAAKER9L/0L/m1
 Kn6tmBkR3xWZrx6tJ/BA5rsYN4HGNPFD48Ua4frK3vrnlVg9aLM4m5aIJw9ym5mSbN61k5
 EHHJS0+GcvKD5mXRHapBzJaiaTtrRGQL9/oIkA+EXvVydTfP9WAjd4wBDbJghjylU6Hl+v
 cbUiIXxIilBIpfO0gAqBvTDU+ZaYnr+9b9dZHzEpb1hZtXN8oqnkWtU4heJMQKd9pbhu3F
 Udw+2wxDQStY2AooCfpVR6WbhoIEGNiJw2A//IRPpAYo18WAjI/Kj422cg4K+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=mHGaObavEXdpklPpAdB/Vc9tQphwJ4HtjtNI7fLm1v8=;
 b=ZQ5pkdX4DsEbSRpww8iUtueplpi1akZRVpDjtrypi3SvuIOi8H/SrYDmUdCkGKxD3wiqTh
 yikxYY0p6mIHukBQ==
Date: Tue, 03 Nov 2020 10:27:15 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 03/37] fs: Remove asm/kmap_types.h includes
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_053329_002077_2CEC2D64 
X-CRM114-Status: GOOD (  11.70  )
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
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
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

Historical leftovers from the time where kmap() had fixed slots.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Benjamin LaHaise <bcrl@kvack.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-aio@kvack.org
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org
---
 fs/aio.c         |    1 -
 fs/btrfs/ctree.h |    1 -
 2 files changed, 2 deletions(-)

--- a/fs/aio.c
+++ b/fs/aio.c
@@ -43,7 +43,6 @@
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 
-#include <asm/kmap_types.h>
 #include <linux/uaccess.h>
 #include <linux/nospec.h>
 
--- a/fs/btrfs/ctree.h
+++ b/fs/btrfs/ctree.h
@@ -17,7 +17,6 @@
 #include <linux/wait.h>
 #include <linux/slab.h>
 #include <trace/events/btrfs.h>
-#include <asm/kmap_types.h>
 #include <asm/unaligned.h>
 #include <linux/pagemap.h>
 #include <linux/btrfs.h>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
