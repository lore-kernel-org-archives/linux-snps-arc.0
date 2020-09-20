Return-Path: <SRS0=iBOu=C5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF20C43465
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 17:25:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D14D207BB
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 17:25:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CdS8XvgQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tzqY9X8f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ajg419VR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D14D207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VhxnXW9cjulHPzYPqtXaJdXvb7rBPQnAB0CmVjy/vOU=; b=CdS8XvgQnlvpUb8vt2lKYyzbK
	BNMxqpbWpA2EqpS+P9uU+lPExmqqyxiRVui4xzo53DpYlQSD7RqnbQwfrmmjfeQQKI6ruRHcZY4g2
	xPVvEigiADxhpsVtyrKjcLuNdQCOOVTmDWHo2/hFo5pUVCFMJaHIJMObjPYg8cucngS9SQ5wMUkpG
	/VmRjs3Nack1L8zCbvQZcKnixiAh17qxg0L5c7dhE/4lM98ILzxuD7YsX2CUZvHKQvc/u+oK4UM0I
	c4QNPcMQ1shENDUdh1nnUu8DBGl54oeopNPoD62SQgbG36BtT8+e+rf7RgUXHWt52os9bZlVFONgV
	whM77PjiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK359-0006gi-Sj; Sun, 20 Sep 2020 17:24:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK356-0006ea-Q0; Sun, 20 Sep 2020 17:24:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600622689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELUNMLCQYXoHQWzGjHTiBi/GvrgBrzUdsStDgdETjPA=;
 b=tzqY9X8fLvmtivfsbNK0pUu8YiUj7NKf7+bQzIN33nK/SwghNMa2rz52k7m9LEaGnDxB4p
 5uJRP8jzSGhdLLpPzoF07YS1dppzeAHFuaRXBxkQ6eQFewoBrpPutv3yBGdR9YKqd5UnMc
 Lfw64Wh81l4jTzfijbUVM/G1PeB+l9wpVjsRPd3Xz3aQUHw9+Bu78ZLn5k1aNaH9Pkc5ms
 Lg9Dct8esi3AxOTl0URAWW4pIL6LMaz6yDqISWtV082sZby+eUJYHhPHZSuxMGdcllbxYl
 qQ/7nvxbGePtOn6SDA8Bi+zAxXBj+TvBWAwr7ALWt4wsGLJLJU/NhQ4k2+3KDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600622689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELUNMLCQYXoHQWzGjHTiBi/GvrgBrzUdsStDgdETjPA=;
 b=Ajg419VRwVNBaCnESvnWBGYX1dQ8DDFprO3wwe5+UvEno+/XgboH3A5bxhtY6hr785JAXL
 VPGuKWoChMzzg9BQ==
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <20200920082353.GG438822@phenom.ffwll.local>
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
 <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
 <87pn6hc6g1.fsf@nanos.tec.linutronix.de>
 <20200920082353.GG438822@phenom.ffwll.local>
Date: Sun, 20 Sep 2020 19:24:49 +0200
Message-ID: <87h7rscqe6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_132456_944029_3C289F9F 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, Sep 20 2020 at 10:23, Daniel Vetter wrote:

> On Sun, Sep 20, 2020 at 08:23:26AM +0200, Thomas Gleixner wrote:
>> On Sat, Sep 19 2020 at 12:37, Daniel Vetter wrote:
>> > On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> >> I think it should be the case, but I want to double check: Will
>> >> copy_*_user be allowed within a kmap_temporary section? This would
>> >> allow us to ditch an absolute pile of slowpaths.
>> >
>> > (coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
>> > page fault you get a short read/write. This looks like it would remove
>> > the need to handle these in a slowpath, since page faults can now be
>> > served in this new kmap_temporary sections. But this sounds too good
>> > to be true, so I'm wondering what I'm missing.
>> 
>> In principle we could allow pagefaults, but not with the currently
>> proposed interface which can be called from any context. Obviously if
>> called from atomic context it can't handle user page faults.
>  
> Yeah that's clear, but does the implemention need to disable pagefaults
> unconditionally?

As I wrote in the other reply it's not required and the final interface
will neither disable preemption nor pagefaults (except for the atomic
wrapper around it).

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
