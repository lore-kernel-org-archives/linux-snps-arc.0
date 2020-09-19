Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE4FC43464
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 19:20:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553692075E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 19:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/OtbMih";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SNvzyY/D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 553692075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YL7nbrYqH8ZqpL3eE6A64UXeq0x/QW1RJ5GjZjwb5hQ=; b=h/OtbMih2hFkXG43+18/FKbR+
	8GtCHWkbzEJu1bV9MtIAlvZA5NCWY7BBnPF/6EAOgpvxrxcIqVX2DgT+4ZulhP7fwxM2WYAW7VOqW
	uTnRxFVpBN7fiRk3eLinZRDd96L+9+ZCSx7vKckXiKGbP3ELXU7HcefAUpNWLi5bXRIc2gk8kJr0+
	zVK8YilGKfms5Yo2c3NKFQF6tLumuvcJuH8cjW5YUd9SdyIFvRubDHwtQ8WBaih0L9asjJk2zc2vf
	VSDbvIgG8MtWtvoUifjs+22LqaVoQoGqSsH3hZf6xqM2l88a+sxPW1QpLb7VZzbFRh+cYhq8VWThH
	5XGnpp5Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJiPN-0002b2-E5; Sat, 19 Sep 2020 19:20:29 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJiPL-0002aZ-JP
 for linux-snps-arc@lists.infradead.org; Sat, 19 Sep 2020 19:20:28 +0000
Received: by mail-ed1-x541.google.com with SMTP id ay8so9149901edb.8
 for <linux-snps-arc@lists.infradead.org>; Sat, 19 Sep 2020 12:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
 b=SNvzyY/D28nrQ/9in1B6Dzi002SQEpeIWQ8e1hzmI9hVRDCDcHjzeJE8AlbYJKjj8B
 G7NnpY7h0luEeygyoDxqLDk2AWGbQCdyloo3Y9XIxWLvxZdXjZ/NeK2kaD/mL0YWoior
 T+0jhpZUK76WT2Sz7na41qAPiBNog2OUpnoIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10sVGN8u2TwfCpnAq/jp4iLrESxL2PzGGvVZbBHI37U=;
 b=qwbmn0LyCJG1BRjNT6H2E/m87BdX0nyX+3v2UTLrI4PojP2dF4UJ06NdBYXQJrgGrl
 5zSUV+9cpfDNYsUQ8ClJ/LBqcvdbX56BARlSFGgawhB4XxcDTsKwT8Py1rEIBvjJ1tXU
 mUWaTjoPytQZJI0HatWSAB/A7PgNIiQzpIr8qAIUQzjk9VxillmigeDuheIEdedj8779
 F1j1xmcvKz18rWEV4pBJX8JHbZbwbxCkWh3CkdtI4h6Q8P26w2SJm1SyE3Xq+O/RrDfD
 /G4JDopk6ihelq77sWE2awkfePxhq4xqb2dnebCK54LS2tP86jkHq1pxMrhuo+rYjT2U
 3nJg==
X-Gm-Message-State: AOAM531VbNOwn6PA3zCwRAWs3v1xIcKFlnGwRdS/GV2a4SBUI4EawQXy
 Wmv9VJjQ0O9WCzKoMbO8fpeETSk3SB1K+Q==
X-Google-Smtp-Source: ABdhPJyQ/5M2N6PLGTkKkjJGc7QlxeqssiFgrsFlTsbLHUtyg7Pyu2+74qq4cFbHKoMEWs47BkCJPQ==
X-Received: by 2002:aa7:d88a:: with SMTP id u10mr45216868edq.217.1600543226265; 
 Sat, 19 Sep 2020 12:20:26 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53])
 by smtp.gmail.com with ESMTPSA id x6sm4965558ejf.59.2020.09.19.12.20.25
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 12:20:26 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id l17so9113383edq.12
 for <linux-snps-arc@lists.infradead.org>; Sat, 19 Sep 2020 12:20:25 -0700 (PDT)
X-Received: by 2002:a19:8907:: with SMTP id l7mr12464193lfd.105.1600542797553; 
 Sat, 19 Sep 2020 12:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <20200919173906.GQ32101@casper.infradead.org>
In-Reply-To: <20200919173906.GQ32101@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2020 12:13:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Message-ID: <CAHk-=wgyVxGaYkL71DhHgmyU=tE=4rEHgAkOYRq=1-9+q_adAw@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Matthew Wilcox <willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_152027_652258_BABA84D9 
X-CRM114-Status: GOOD (  16.41  )
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
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

On Sat, Sep 19, 2020 at 10:39 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> My concern with that is people might use kmap() and then pass the address
> to a different task.  So we need to audit the current users of kmap()
> and convert any that do that into using vmap() instead.

Ahh. Yes, I guess they might do that. It sounds strange, but not
entirely crazy - I could imagine some "PIO thread" that does IO to a
page that has been set up by somebody else using kmap(). Or similar.

                Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
