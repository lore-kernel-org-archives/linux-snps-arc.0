Return-Path: <SRS0=W5Un=EI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B3FC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Nov 2020 01:08:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94EA22224E
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Nov 2020 01:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdHhACBZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XrgDk26V";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w804GlJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94EA22224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JqHl9F6Sq3wspn46lusUS5332AEURetxh+/b8Yi5cwY=; b=qdHhACBZndqPWMCLvQgvdfRcu
	lxFXIpX4BnqJfFfBoUP5eZZtaTHpk8B7PaN20fOouloFFjGfZFUkOKUPt3LyN5ux9uhiWYZyCG9qG
	InHRXF2UgvTVc2mwXyV779nRvcGVY0sRF0YuR8fokRHbLIw8pMgzdsHtc938um2W8m3xLE1fOB00j
	tYeh+ORrkcxPVd1uFXZ0xjb1XJYGKD4hFFHF4tXXpG0ELqUKCV7hWordhacRRy2PW27SiiqAV+6o4
	SNtfmcdHa5XTVkudw9wNk0MGAoNsOKbLsFX5DXxsWBCPcFHRc4R6hX/hglS07yRuxMMC0Kf4MHmCC
	qkIVaHe5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZOKt-00087d-7B; Mon, 02 Nov 2020 01:08:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZOKf-00085a-A7; Mon, 02 Nov 2020 01:08:32 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604279303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uGtzWR3XDWVzxJPeTJwUrr+92QjqUI1P4Rl6d07MCc=;
 b=XrgDk26VSw3lMWxT80X6p2BiIELFfSd45uXmpqg40hcbZPvcaSEbWpk3R+GxKbboSmpFo7
 63BVEl/BSGohNcNmokSUofaOuAyVB8TF4zkcITLfRQimdDp0/NzDabt6xoWCRv1KCKeW7F
 JBfHL2Zd4jfQiOa73d8ngQE8XEVUJ3AcbNTfvECT7y8NW8OaNw3Ie/CbXJDQBPmopC0hi6
 3UpqoW4N6M5pY4xkTcBxiJGRWb665zE7gX5m+PKTKEvvjyV6Hoqyt5gxZLMHwAEcjlgo+r
 WdCkNHrQQLMZuU+RDrUNzqVy0E0MpRf3weVrn07sYqVIDzra4XxQNgHUkZAAnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604279303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uGtzWR3XDWVzxJPeTJwUrr+92QjqUI1P4Rl6d07MCc=;
 b=w804GlJ3cTjryaWI6xXsdwM5po9NFzF1/LMSPDCaZtr/gWtzM/1QwrA9gqRhs9hURGxtuJ
 nFG9PzKRhgh+hKBA==
To: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <20201029221806.189523375@linutronix.de>
References: <20201029221806.189523375@linutronix.de>
Date: Mon, 02 Nov 2020 02:08:23 +0100
Message-ID: <87k0v48t14.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_200831_615807_C44812AD 
X-CRM114-Status: GOOD (  16.49  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29 2020 at 23:18, Thomas Gleixner wrote:
>
> There is also a still to be investigated question from Linus on the initial
> posting versus the per cpu / per task mapping stack depth which might need
> to be made larger due to the ability to take page faults within a mapping
> region.

I looked deeper into that and we have a stack depth of 20. That's plenty
and I couldn't find a way to get above 10 nested ones including faults,
interrupts, softirqs. With some stress testing I was not able to get over
a maximum of 6 according to the traceprintk I added.

For some obscure reason when CONFIG_DEBUG_HIGHMEM is enabled the stack
depth is increased from 20 to 41. But the only thing DEBUG_HIGHMEM does
is to enable a few BUG_ON()'s in the mapping code.

That's a leftover from the historical mapping code which had fixed
entries for various purposes. DEBUG_HIGHMEM inserted guard mappings
between the map types. But that got all ditched when kmap_atomic()
switched to a stack based map management. Though the WITH_KM_FENCE magic
survived without being functional. All the thing does today is to
increase the stack depth.

I just made that functional again by keeping the stack depth increase
and utilizing every second slot. That should catch Willy's mapping
problem nicely if he bothers to test on 32bit :)

Thanks,

        tglx


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
