Return-Path: <SRS0=iBOu=C5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8969C43465
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 18:04:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600542078D
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 18:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIqUVGop";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aTcZkpnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600542078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MAYvRLwDlRS8cbNWtHQwwsS2D0DMfXhvPpcdw6DF3p0=; b=SIqUVGopahjxI0yQdqOTKGGw/
	/PTZksKDv9B/OL+PIpU9xA/y3By+PC2s3nYjt9qiogM3Y9XguxQ0e6VaB4bZMDUVLdMHlYYo7KJNL
	kQXKaVF05/Vr6NMCwdX0W4F6V/HN6UHX9HwzWniAPQAL61r65pac8W4eVnB1yV/WA899RebW3ASJZ
	JHBtzfJ0ORk+M3qp/AJIns7kjmu7it/TouMsLDlYgaI8OSQNBEWvY/keagMqbWWR59tEUgeBz22vq
	vv40fqNbh4i9Er1XAocWEnytjmpylrdsu4WDHoYTU72p4lrAka/Lmx+61yr6Va2RjAXWDnWJt3FJq
	M7jOddxMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK3hc-0000YZ-A3; Sun, 20 Sep 2020 18:04:44 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK3ha-0000Xi-3N
 for linux-snps-arc@lists.infradead.org; Sun, 20 Sep 2020 18:04:42 +0000
Received: by mail-lf1-x144.google.com with SMTP id 77so4231826lfj.0
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Sep 2020 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10vFh59zX+qrXR+btNd9keaZllR85H50W0pZVqW9mvg=;
 b=aTcZkpnkgiAVVoqRXBCAnYw8B8YS7QD0nmh7mtbe8Dtb85AdAYIiPcbXVjdrb/fbX9
 3yTs920flMKnlnbAGz7q1CYoJs0994Dvfor1DakKOqSDUOemiqgeakXoqfK/+swxI5fB
 0DUfGVYXrHTR7XO61iz2Eybc+W0Ekg5v+dkh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10vFh59zX+qrXR+btNd9keaZllR85H50W0pZVqW9mvg=;
 b=bn5wOOx/seYkSu6t7jS5qN53sXugHZRScxii32UN7qDpmdfdTVI3tQ3rKY9TWd4wuS
 12eODVQhoBWhk0GDMUZ+ZPi79iOtLorT6XJjz5PDKIIlqeU7puxHMfnTB6jt3LakKvXy
 b4LknbO4Vk7KQQoH4/bPDIu4xxYsWjisbWSkJ0NeLwma2HwbzQ580CfnbzxS6jYSnk9L
 Ksn06PJ9/2dErdBbDSS1olW5s0N4o+FbaSVqLoYWIh/klAMLNDla4bqy3eSEys0DqbFB
 RgRwlNDBdoP4Py/KnwJmQKRFa/PCb1hm6Q8JV9QNN4mtUD8kBPTmhZdp+JGc8F7e97gU
 5CvA==
X-Gm-Message-State: AOAM531MbjiSW4WxA1RGR2DZlBZhZbWdlc/+UbAs26ppSalqg0ZweKfS
 8OQt2u1TYV+fGp+ymEJPIjLl05Rg81Uk3A==
X-Google-Smtp-Source: ABdhPJwr8kAMjG33GPIBkZLYWtBT2F/8JGxQUsnu7e/Ad07aquoZl4D8ajCRc4HhTgSOUJZigiwrbQ==
X-Received: by 2002:ac2:4d83:: with SMTP id g3mr13156328lfe.317.1600625080255; 
 Sun, 20 Sep 2020 11:04:40 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id e2sm1970713lfb.275.2020.09.20.11.04.39
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 11:04:40 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id c2so9197282ljj.12
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Sep 2020 11:04:39 -0700 (PDT)
X-Received: by 2002:ac2:4ec7:: with SMTP id p7mr12591149lfr.352.1600624746105; 
 Sun, 20 Sep 2020 10:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2020 10:58:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_iVgA3H7CVvAzDoYC1gC1AKbLmv_mCeUnVxg79_9y8A@mail.gmail.com>
Message-ID: <CAHk-=wh_iVgA3H7CVvAzDoYC1gC1AKbLmv_mCeUnVxg79_9y8A@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_140442_149270_B97CB08D 
X-CRM114-Status: GOOD (  12.90  )
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

On Sun, Sep 20, 2020 at 10:42 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, that looks much easier to explain. Ack.

Btw, one thing that might be a good idea at least initially is to add
a check for p->kmap_ctrl.idx being zero at fork, exit and maybe
syscall return time (but that last one may be too cumbersome to really
worry about).

The kmap_atomic() interface basically has a lot of coverage for leaked
as part of all the "might_sleep()" checks sprinkled around,  The new
kmap_temporary/local/whatever wouldn't have that kind of incidental
debug checking, and any leaked kmap indexes would be rather hard to
debug (much) later when they cause index overflows or whatever.

                Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
