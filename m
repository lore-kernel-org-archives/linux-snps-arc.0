Return-Path: <SRS0=/NyP=C6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F93C35257
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Sep 2020 19:28:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7028220757
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Sep 2020 19:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HAThFxNM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HxqY5bgm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K+USVXwN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7028220757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LV0ukpZ2Ch9MaE7NhF+y5R6bANLfmZlvVQ4RdGnq3Fc=; b=HAThFxNMIVLnAWZ5prhGbavss
	iIXwcCHpPrxSZzcemtB+nulCwAWVON5JVmngf1G1S11qJ24pxTI8G9aC/mNBz4v7tRFAnK8azbOix
	jKDVqx7Xq1URu9ot/sek7fnfG/R+a5G9643eEbDuMsQmIycXkX45l6KBSyyyOxrWlHS0bHAsYVr1L
	JOjDuyvjaqy7bjlFxmixydukZaAjaHIlAnz/IwECxyjcb0ApPnSKpXW87QrdvqADj9WX/Kf/xBPEX
	Sf6pZu6hT1iGl76TkjCgo9MFqghRAk/CgexeY55WHP5fkzNcGxUcQR24AQRBFXuTBvqY+jo9UXknn
	iwmj3fpOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKRTp-0001JZ-7l; Mon, 21 Sep 2020 19:28:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKRTj-0001H6-Nc; Mon, 21 Sep 2020 19:28:00 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600716477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NioanSWzd78GxCsWYULMNfEWngL7gbmu+5wZKJGKPtI=;
 b=HxqY5bgmLL1k0f3vQQxKwcT5ry3L+n9eWbaa33JpgBbIQhQKyF5a3ij8mv6CpgblAufPcl
 /NboBbVSLMzTqFGT0TjywuRmfs5bzTYeJmHXAxo0CVpHx+Vc+AcZ01mg2TfMdqQ2YBFUr0
 T0biE/Xj6CpNppEeI1NN60+4LlXdME7cpu0hU+LkVE2Ap5bde7RRe7hWtZJQkXhhKWa8iV
 9G4YL/t1/f3WBUyUCaKsXVKPluf5ho1Tri7IYKrkld4lHHpsIFR2kj//UAVDisud0CvF9E
 Y+o/6lfteq1OBhGqZU5+eNzFDwvEzWDxVn5dG5jL6fLqKaz4jlZKqLWOR91+lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600716477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NioanSWzd78GxCsWYULMNfEWngL7gbmu+5wZKJGKPtI=;
 b=K+USVXwNO19/CLwxF7hr/zQjzSe76M0Cqo3jC86XX3is24rhnFQjsCVAxPA8kns3xbx5QG
 vlmVOJebsjPrOqAg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
Date: Mon, 21 Sep 2020 21:27:57 +0200
Message-ID: <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_152759_882368_94D5307D 
X-CRM114-Status: GOOD (  14.89  )
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
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
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
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21 2020 at 09:24, Linus Torvalds wrote:
> On Mon, Sep 21, 2020 at 12:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> If a task is migrated to a different CPU then the mapping address will
>> change which will explode in colourful ways.
>
> Right you are.
>
> Maybe we really *could* call this new kmap functionality something
> like "kmap_percpu()" (or maybe "local" is good enough), and make it
> act like your RT code does for spinlocks - not disable preemption, but
> only disabling CPU migration.

I"m all for it, but the scheduler people have opinions :)

> That would probably be good enough for a lot of users that don't want
> to expose excessive latencies, but where it's really not a huge deal
> to say "stick to this CPU for a short while".
>
> The crypto code certainly sounds like one such case.

I looked at a lot of the kmap_atomic() places and quite some of them
only require migration to be disabled to keep the temporary map
stable.

Quite some code could be simplified significantly especially those
places which need to do copy_from/to_user inside these
sections. Graphics is the main example here as Daniel pointed out.

Alternatively this could of course be solved with per CPU page tables
which will come around some day anyway I fear.

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
