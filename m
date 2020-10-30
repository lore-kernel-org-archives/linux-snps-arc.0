Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C94DC00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 09:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0028420724
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 09:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTnkbrp4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DJVMSRd0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xjkTScsj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0028420724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QBefjeoxsIjvfRa0KQwS0bRqga2qIK1B+0OxNEvzcCU=; b=rTnkbrp4q/fxkaj7j69uwsdhz
	PoziJh/JMhYN6r4VmQVhf5+l/3ewtkCqzIbAtcXeyfKFMC0dRyAGUJ8HK2MnLgHYILdb8abO+BRSC
	8+AYfNOZvc7cW09f8xZKDPcji+s483MnsUuN1RzM+HtyZKT58kKQ69uGaQVnANhOEoX9Zn79En6c0
	UsbFbi6Jguz4IBEI3AdOsu71U1/0Z5HlXG6TinY2qHF/iELBdjeQU13Gr45JHa8S28Wxg5NJLHN/1
	H1eAzyPEAx73Yrum5w7/ndLuC3JoNWl0hbakKqvg1h4PI+z24vamIzRG2uWYjLygU63htjbBXLwv8
	vyoQ8/xBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQt4-0003QW-Tk; Fri, 30 Oct 2020 09:39:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQsw-0003N2-V1; Fri, 30 Oct 2020 09:39:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604050789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SAnK7jywPa1GOe2OuqwDJLyZGDzUuixXtlwihZHVsUc=;
 b=DJVMSRd0qSrh4qYCn9wA493aNBmMgpWEcC+DvdpwzaRDvlM9GLKnEgKej1q9Pjzm9R+Wbs
 SDi3g+IJ46Uix1vGIe/ZYW4m61MI+Iaw5AZAFaLpBqWgGMlssdhbZlo/f7rBhKNBzNp0ql
 AfNrswKRF+YJTa9uIYVgSjvVSA2hm+3Uo8FE2CUbADDpAaUi5+pLITUyecfHGq85dCGrM6
 ye41RcUorO4bMmTTQADOv++RFFw5xbZssFQqXyqHenRIXBZCR3WWb7IZDjqY6k6VEbvE3u
 Tfhh5ZTwPL+4DOCzh5iRmbXJG66Efnr9i/wjo97sHGpkIG/AcCkDrLPDQ7sJmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604050789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SAnK7jywPa1GOe2OuqwDJLyZGDzUuixXtlwihZHVsUc=;
 b=xjkTScsjovLjMF5jCfSAo4zF71pVuZpjsm7SHzu9Cw8PlE4P8sLRwcUur1ZnT3ITuwSffU
 9R+g3a6sInOEqeDg==
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <20201030072508.GA18471@lst.de>
References: <20201029221806.189523375@linutronix.de>
 <20201030072508.GA18471@lst.de>
Date: Fri, 30 Oct 2020 10:39:49 +0100
Message-ID: <87a6w4njbu.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_053951_511308_516B29FD 
X-CRM114-Status: GOOD (  12.52  )
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
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
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
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30 2020 at 08:25, Christoph Hellwig wrote:
> On Thu, Oct 29, 2020 at 11:18:06PM +0100, Thomas Gleixner wrote:
>>  - Consolidating all kmap atomic implementations in generic code
>
> I think the consolidation is a winner no matter where we go next.  Maybe
> split it out in a prep series so we can get it in ASAP?

Yes, patch 2-15 can just go without any dependency. The only thing which
needs a bit of thought is naming. See the other reply to Linus.

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
