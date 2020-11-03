Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9402DC4742C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 12:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1023422243
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 12:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WF+Opcsw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3ilUxfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1023422243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6XXEzLED46hJZxwLK/U0muVMVOSywYsEYj9Jn4MsAMQ=; b=WF+OpcswVfQn9cyiJByO63RMD
	owOAs80qb4+M7F5CqkRMU8DlBVKvxk3NOI0laOfBQuP2744CPkw5VHeYRy377P2CftbAacMSwwii2
	bLsMgTFCC/8FfZ6kgrlOUBZrbZaJ3VCVCP6INKeAnedmku3GzojNsWejFw5p3r6XnP/iEr6QAP7LD
	VUjQTcaxEPhVYbaaw13V2qTAVBiYZK41cEtRc6erawlGOxIUS9sObL5rMNA4hoHkMJOnoyGefc5Uv
	Nx+BcmVk52C0063aaj6GZGAaNR7/7wZXemLFnWWnF6f0CFGfx5eyK3AwgJ1VOc66Ypyu2wUockW3x
	apArAoZEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZvNr-0002WV-NM; Tue, 03 Nov 2020 12:25:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZvNi-0002Ql-KR; Tue, 03 Nov 2020 12:25:48 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2489122447;
 Tue,  3 Nov 2020 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604406345;
 bh=JnG9AEM3urtQJZbyh27ncRK5xtNjXhkMpT9pLY6ruAw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S3ilUxfLmh/0Pv4skyGqFEAG0vwDSS5i5psimoXmAELMEWHSH2fW4IuM4Z+qMebRf
 WAXWrrJnkn0me0BHoC6LmAQbdfefgrg1IUndUDBw+RKZdCT9Ym0K7hlLMGCU1lFFO3
 Zsx6vPAhW90E/61D8322HI52wvm4X0FuC5QxUJR0=
Received: by mail-wr1-f51.google.com with SMTP id k10so17011017wrw.13;
 Tue, 03 Nov 2020 04:25:45 -0800 (PST)
X-Gm-Message-State: AOAM530CNUqB/a8aNDcqSEC8d99uFsjQu4YxKM70VVZCuvsdHQq5mCsQ
 8+5VYRTAQkIGy/rTKu5qPiOmmzQLiU0Ih+G3xGE=
X-Google-Smtp-Source: ABdhPJzaMTU0V4sDEP7WFi1D19pueRl5ySNY/GA/QmiGvW8mi19ZpCI6gDmcGIwe2rHXpOPoRB6cN5TL6gD3Vvt/QEU=
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr19654094wrn.165.1604406343518; 
 Tue, 03 Nov 2020 04:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.078043987@linutronix.de>
In-Reply-To: <20201103095857.078043987@linutronix.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Nov 2020 13:25:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3q1O=vTLHpjkufNhspj+OJFn0BkMD6XaPZvN_0D+=FFQ@mail.gmail.com>
Message-ID: <CAK8P3a3q1O=vTLHpjkufNhspj+OJFn0BkMD6XaPZvN_0D+=FFQ@mail.gmail.com>
Subject: Re: [patch V3 05/37] asm-generic: Provide kmap_size.h
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_072547_604504_BCFC1449 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio <linux-aio@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 sparclinux <sparclinux@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, ML nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, virtualization@lists.linux-foundation.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:27 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> kmap_types.h is a misnomer because the old atomic MAP based array does not
> exist anymore and the whole indirection of architectures including
> kmap_types.h is inconinstent and does not allow to provide guard page
> debugging for this misfeature.
>
> Add a common header file which defines the mapping stack size for all
> architectures. Will be used when converting architectures over to a
> generic kmap_local/atomic implementation.
>
> The array size is chosen with the following constraints in mind:
>
>     - The deepest nest level in one context is 3 according to code
>       inspection.
>
>     - The worst case nesting for the upcoming reemptible version would be:
>
>       2 maps in task context and a fault inside
>       2 maps in the fault handler
>       3 maps in softirq
>       2 maps in interrupt
>
> So a total of 16 is sufficient and probably overestimated.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
