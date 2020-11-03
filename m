Return-Path: <SRS0=dVtP=EJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01243C388F2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 19:00:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2083A20786
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Nov 2020 19:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWf0igaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wh43mnWM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="STcwQ6Ra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2083A20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DPBz5l+GtWlyhhFtud7MGuA9h93ueXfSXmLz6HEKV+g=; b=tWf0igaAbZzgFrvmjYRHqUZMY
	fNwOuIsxfrfYHZ9ipdIIhKdyuZ5PzuCrq7FAcipJ+7DQzUk8aIWeUFkzc86GgMJe4TUY8Bhssdc0x
	HZt/ZCRUCNiU1zLUXJqX156YEndYLDUZH3yDZYH51/dh0i2RtLK83g2QcbQyePVK3ZLdwdoC074jQ
	YT7xqkZqanHMSVOxUoCg53CbZC1n6lFDKUhuvJaFwDl0IEB5uZR1XwoqSsZPOb2Bh9i5+PRn40aWf
	pQptcLPX4RA6tVrozV9gW0XydNV007SPIEecqzfYW34oVPv9CPON33DGkvSMLZ6uVUrcK6QPtE0T+
	rZ5U4AmmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1Xi-0003sh-Bp; Tue, 03 Nov 2020 19:00:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1Xd-0003q6-T3; Tue, 03 Nov 2020 19:00:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604430021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7vA0Pp8Yw32NcCmeGMglrNZNTsusNNmUR0JbokXn0s=;
 b=Wh43mnWM8kdYti+K6Ejg70IQfa+GmZ8DCSo20FQE/hkLNmxVT4iphQnlk6m40FPrmWktQO
 8ayXKz0ztE1cqx/iEhmcbhojQh9yCHEkFANOGr1w8fGEwrPOcrWAWxi/OenSb5evTEILWa
 oclhRZDu2W0eltn+sc+1j25HCEzKjNSXz+4io/CbYUyMFuxTbNnNJEiCm1jMBn8PGej5s3
 E3JpbZR0aFWpI6lV+SZv22HUNUyPWbXG8oMYz+BmJikgi+ivLhTWpXqqgXf53DcJR+Ltrn
 dCfpJUdQQNPCTgPlSMPzbs0whzNCaCVS/fZbTm34UVovthqkFff3qyFpeY0sbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604430021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p7vA0Pp8Yw32NcCmeGMglrNZNTsusNNmUR0JbokXn0s=;
 b=STcwQ6RaI64DeextSGHfCvrA9zLqnmZlfhd6kn3GgHfcpWRfVbJIkhHpoM7lA8B8jXR4lp
 QBLUYE/euA+zomCg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V3 22/37] highmem: High implementation details and
 document API
In-Reply-To: <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
References: <20201103092712.714480842@linutronix.de>
 <20201103095858.827582066@linutronix.de>
 <CAHk-=wg2D_yjgKYkXCybD3uf0dtwYh6HxZ9BQJfV5t+EBqLGQQ@mail.gmail.com>
Date: Tue, 03 Nov 2020 20:00:20 +0100
Message-ID: <87y2ji1d17.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_140026_073524_911005C1 
X-CRM114-Status: GOOD (  18.98  )
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
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03 2020 at 09:48, Linus Torvalds wrote:
> I have no complaints about the patch, but it strikes me that if people
> want to actually have much better debug coverage, this is where it
> should be (I like the "every other address" thing too, don't get me
> wrong).
>
> In particular, instead of these PageHighMem(page) tests, I think
> something like this would be better:
>
>    #ifdef CONFIG_DEBUG_HIGHMEM
>      #define page_use_kmap(page) ((page),1)
>    #else
>      #define page_use_kmap(page) PageHighMem(page)
>    #endif
>
> adn then replace those "if (!PageHighMem(page))" tests with "if
> (!page_use_kmap())" instead.
>
> IOW, in debug mode, it would _always_ remap the page, whether it's
> highmem or not. That would really stress the highmem code and find any
> fragilities.

Yes, that makes a lot of sense. We just have to avoid that for the
architectures with aliasing issues.

> Anyway, this is all sepatrate from the series, which still looks fine
> to me. Just a reaction to seeing the patch, and Thomas' earlier
> mention that the highmem debugging doesn't actually do much.

Right, forcing it for both kmap and kmap_local is straight forward. I'll
cook a patch on top for that.

Thanks,

        tglx



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
