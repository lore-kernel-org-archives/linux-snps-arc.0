Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39474C5517A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 23:53:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB7F42071E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 23:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Br8nTAil";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zRWoFFCv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KMZe+VR6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB7F42071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mVpgqqGBtmTSlH9kKRxwB2A8eBLHTUm8JIrV4X8xUdI=; b=Br8nTAil2VC5c0l2bTAJXnMQR
	SBjFaCwbp1CrCgaSianFsWnKPEQZWNzpQn+CA2b5tWip4Rmb65aNxFbTjEbZVMETiWVBfnQaYmtun
	RsujFEM2ykHtnxGPWcy4QAPXs2Z5sDPiHeTBFUILA/YmSWLIFSV+vM2P798kim08IrVOgmNOG06i6
	M7hZeJ6D7U8TLRiP6hs8JKa9y+wCaarZrGR9R3BNVWfLKhCduSuaaYq4LomYUfeYgl6Bnq0pB8KPz
	T03UUHRS8YhkmWde/vF5qsYAyJs2qXuZmAU5qOy8ErLBiI2eeNCFJyhL/42w5032rxFiUDn7G4LyH
	VctpF/POg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYeCj-0003bL-Il; Fri, 30 Oct 2020 23:53:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYeCe-0003Zm-UM; Fri, 30 Oct 2020 23:53:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604101982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fz1Lo4xloh2gm7jGRA98jpsF7G0W8WZ1zm340/bMNFg=;
 b=zRWoFFCvgFXvkgiRgd2PrNXxw0olM8jN9MbSlnu8Yx/bkkIwLGoWTGgE5i+fkO7y7sfeaU
 x3+aPSzi0iAtwo1vhwTgPleVK5/xOYWH8N2RRruBT8TdPfY1yZYoa6ljibdSog6RQ3gP6b
 u9DvoOLBFkfo24RQ7jamXSeMyTSj793ZoUFCoaa1YGqH033ahp/DnCR4xlXAoXzFSpH1x6
 yOJ/OV0er2B/4NNw+gN17a5j9W4zYUWj6YivuiRxMsRVquNHl+BF1GTYOstjhD+cwgQEKq
 s06u8I7IY1uEbPndJCEK7r6MHG28vjegHSi8SyClVAIgl5+Ri/+FYGlgYb5bjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604101982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fz1Lo4xloh2gm7jGRA98jpsF7G0W8WZ1zm340/bMNFg=;
 b=KMZe+VR6xvtTrU+cGlKn5VqvqFkwQoQ6BREOoFpj295prEyjjry9cru4z4uwe8nMiBCbyb
 2nsiSuFASxudGAAw==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <87pn4zl2ia.fsf@nanos.tec.linutronix.de>
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
 <87pn4zl2ia.fsf@nanos.tec.linutronix.de>
Date: Sat, 31 Oct 2020 00:53:02 +0100
Message-ID: <87mu03l19d.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_195305_096034_B5652BF0 
X-CRM114-Status: GOOD (  14.19  )
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
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
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

On Sat, Oct 31 2020 at 00:26, Thomas Gleixner wrote:

> On Fri, Oct 30 2020 at 15:46, Linus Torvalds wrote:
>> On Fri, Oct 30, 2020 at 3:26 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> To me, your patch series has two big advantages:
>>
>>  - more common code
>>
>>  - kmap_local() becomes more of a no-op
>>
>> and the last thing we want is to expand on kmap.
>
> Happy to go with that.
>
> While trying to document the mess, I just stumbled over the abuse of
> kmap_atomic_prot() in
>
> drivers/gpu/drm/ttm/ttm_bo_util.c:      dst = kmap_atomic_prot(d, prot);
> drivers/gpu/drm/ttm/ttm_bo_util.c:      src = kmap_atomic_prot(s, prot);
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:   kmap_atomic_prot(d->dst_pages[dst_page],
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:   kmap_atomic_prot(d->src_pages[src_page],
>
> For !HIGHMEM kmap_atomic_prot() just ignores the 'prot' argument and
> returns the page address. 
>
> Moar patches to be written ... Sigh!

Or not. This is actually correct by some definition of correct. For
the non highmem case pgprot is set via the set_memory_*() functions and
this just handles the highmem case.

Comments are overrrated...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
