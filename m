Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E7DC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 23:41:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2154A20739
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 23:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gfkf/xcX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SXAxpB4O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bPrOV2Mu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2154A20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ne0R/BL9+fqpGu3mZJ3Hj+TkflJHPYB/icFCBW3+Zxg=; b=gfkf/xcX4V/JQghzQYvSq4lbD
	FmZ09oIs1CqqQETg9A8whfXEmg78eS3fMOOyppksmAM/q8tnmO2jHTlnzW1tV2guzKDKql9M86Rlu
	kVUaI7Rhbn6mSVzeoOpqcRrlr2NZh9roncx9p0P7NOHM7lZc6RTpIS62Or6zHeHt0yAXQ/PDNwc+G
	+Nt0MtJGYmkiwMJyGwo9839w8DgX9xHFRHDgK7ICL24jjfj1v+xBBDDUpIUwBFtQrHKzWgHLeeKHs
	RjeC91NVHe0gyuq7rWDbgDufek5Lkv3iqpVG3+UfApfQLupmMfuABGgiJhLd9mQwyJLR332TXV8i7
	ifSU8D+tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYHYA-0007tQ-2S; Thu, 29 Oct 2020 23:41:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYHY6-0007rn-3F; Thu, 29 Oct 2020 23:41:43 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604014900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dWuiBG8a+NnkPGmw23LTYR8bRuWLPOcTs2J9m+57N30=;
 b=SXAxpB4OrSZM8KanRhq0SHKbbqNdcUZGBDuuY0dpE3HzYsV6X3WGBvormMPwGgBe13WqGS
 zl+c6uDF44lRL3XYTntNDOXhWi1enb8HJyzyEjQMqxw3GSIbeAvode6e1x0/HUh1LOV13D
 iGoRdWEQcslmNVQBlZot50CD5jCjvafIrM9wdZgJj+TIzPSwNqWmbdAFeVqjadC2jU11Tb
 rGfBMY/MMEh+koaNaMVZhxHbfDry4hkHFhwfoBCQ7ddPNZj4c2CDLBpYqBLzdFm2N74+mY
 zh6t2OfFuG8Sz0WmlH9mRTGpAIOiGIUlj2fJM+MCYBQBz4iunYGWpWFAsyGP3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604014900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dWuiBG8a+NnkPGmw23LTYR8bRuWLPOcTs2J9m+57N30=;
 b=bPrOV2Mu8WrqdxWFrt3BZte7XxWkrcHXKqjiK4x7RufHzyISYL2psldkYUi2DujbGIhU51
 +7ZFtIMezAsqNiCA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Date: Fri, 30 Oct 2020 00:41:39 +0100
Message-ID: <87pn50ob0s.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_194142_270133_265D4AAE 
X-CRM114-Status: GOOD (  17.35  )
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
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29 2020 at 16:11, Linus Torvalds wrote:
> On Thu, Oct 29, 2020 at 3:32 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Though I wanted to share the current state of affairs before investigating
>> that further. If there is consensus in going forward with this, I'll have a
>> deeper look into this issue.
>
> Me likee. I think this looks like the right thing to do.
>
> I didn't actually apply the patches, but just from reading them it
> _looks_ to me like you do the migrate_disable() unconditionally, even
> if it's not a highmem page..
>
> That sounds like it might be a good thing for debugging, but not
> necessarily great in general.
>
> Or am I misreading things?

No, you're not misreading it, but doing it conditionally would be a
complete semantical disaster. kmap_atomic*() also disables preemption
and pagefaults unconditionaly.  If that wouldn't be the case then every
caller would have to have conditionals like 'if (CONFIG_HIGHMEM)' or
worse 'if (PageHighMem(page)'.

Let's not go there.

Migrate disable is a less horrible plague than preempt and pagefault
disable even if the scheduler people disagree due to the lack of theory
backing that up :)

The charm of the new interface is that users still can rely on per
cpuness independent of being on a highmem plagued system. For non
highmem systems the extra migrate disable/enable is really a minor
nuissance.

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
