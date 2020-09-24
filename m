Return-Path: <SRS0=2kue=DB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC010C4363D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 19:37:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3552220C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 19:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3NrWhu9g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Io+aEmAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3552220C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJb4Y3mQE+zbcX/z7LuehAiB9WEWVoKaJ8YqpK4upTk=; b=3NrWhu9gIujmV11jt71iXlbnZ
	AwyXugXC+Y6HeFZhreEBAHIJUqsUQSmEvbsbeIgkr5Yq8a6CNCHt2tM3/hhwmhOsXa9vdksQuemlh
	QPfmSt0tw8XwvkdtYZ/spvRQUc3g3wIoCbl9YDy1hW/vdDrE8YSczKJYrBzyNAQakkS62XGxai82q
	6NW7QwDFDzIqfn6UwjShU/UqV7+Ni95lmlO4qOfg2U8LrgUJSWZn+v4z5cq2UUHK7JJcHfyGdaGKs
	gSoPOTSjK+iCBhK2eySrZsLv12R07TDtZdnkM3rJKeXGmHJoZAnozGYANBmgnDs84AmQzmXetX8nU
	j6d0t8TLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLX3F-0003bi-KZ; Thu, 24 Sep 2020 19:37:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLX36-0003Wk-Lr
 for linux-snps-arc@lists.infradead.org; Thu, 24 Sep 2020 19:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600976219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twNrygaxLsVZPNKYCHY3ZfHX7UvhS+LdDIfmkCz5FTg=;
 b=Io+aEmAxSkCo4U8cov3aB7d3vrkWccwI79+NZCErN6wc82FtqJiA5vHbHNBzDm2fNPOP2i
 dXFr46rBj/FwAOWuf7EUdFRX81poWP7qNkS1zs+XqXcskRgXY1kWNTQKr0DjTIUi1mNXVm
 nv27B2GmrbWHLTdZj6YcsyCT2mwsvLU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-sULDzA23NKSpwJcjfgJYnQ-1; Thu, 24 Sep 2020 15:36:56 -0400
X-MC-Unique: sULDzA23NKSpwJcjfgJYnQ-1
Received: by mail-wr1-f70.google.com with SMTP id d13so80448wrr.23
 for <linux-snps-arc@lists.infradead.org>; Thu, 24 Sep 2020 12:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twNrygaxLsVZPNKYCHY3ZfHX7UvhS+LdDIfmkCz5FTg=;
 b=uO//UPvFCTCCPUg+FU9ugREkgVmB+G7ltcE4MPfyXfkrbGK3SKKJ7AQNRP37inMDet
 HpQPYUVaumPv4gohhnEMok9YDku3RVcUGH+O+Gj5aGmhRJ3BAZzhchIpm4zLQXY29fQY
 04FQeZ7uQVkazNNmxwOPNRQd4kuVjn2V+sZcDvurnt3U78CEue/srmqLEbUSApzSH86J
 CWC51lgyMS4UhIHsoyGpS87m5KTgDr8L2fjzcTYH8uxl8uPG3h1XFfnRvNDfOPJusOPx
 RuyNM18Hek/NTZpcWA5tGeS0x4ibbK8W/EyfOYtIt2ISGjCfbyI4KTkQfo9nT7KvBmLs
 kLjQ==
X-Gm-Message-State: AOAM5328nGE79FFCyoUQBtmF9jr2aFKnaW4k/Ybgcpnr0k57GOXJSMP1
 UBwSxjdDKJbbWYGshSrCxvRBJ/6Tko2hd2lKXo1qQUWtqTUHmMLx6rYkTL2ygBCkB1E8DkGgFxG
 4yav/jQfIz1Le2v8W2PwLiUcOSLkDXz9B
X-Received: by 2002:adf:f34a:: with SMTP id e10mr491640wrp.91.1600976215160;
 Thu, 24 Sep 2020 12:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynpHjsvPmbyspQelrDSoXiAKotSicrrWAZZ3D0g/KyVrY5rzQz/w0XAUEKgRr9DXJGglK1Gg==
X-Received: by 2002:adf:f34a:: with SMTP id e10mr491615wrp.91.1600976214950;
 Thu, 24 Sep 2020 12:36:54 -0700 (PDT)
Received: from x1.bristot.me (host-87-17-196-109.retail.telecomitalia.it.
 [87.17.196.109])
 by smtp.gmail.com with ESMTPSA id h204sm302746wmf.35.2020.09.24.12.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 12:36:54 -0700 (PDT)
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: peterz@infradead.org, Steven Rostedt <rostedt@goodmis.org>
References: <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
 <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
 <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
 <20200923115251.7cc63a7e@oasis.local.home>
 <20200924082717.GA1362448@hirez.programming.kicks-ass.net>
From: Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <7541acd1-65a0-0d55-4028-71cab544e90d@redhat.com>
Date: Thu, 24 Sep 2020 21:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200924082717.GA1362448@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bristot@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_153700_788583_CF9D1330 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
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
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Greentime Hu <green.hu@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/24/20 10:27 AM, peterz@infradead.org wrote:
> So my current todo list is:
> 
>  - Change RT PULL
>  - Change DL PULL
>  - Add migrate_disable() tracer; exactly like preempt/irqoff, except
>    measuring task-runtime instead of cpu-time.
>  - Add a mode that measures actual interference.
>  - Add a traceevent to detect preemption in migrate_disable().
> 
> 
> And then I suppose I should twist Daniel's arm to update his model to
> include these scenarios and numbers.

Challenge accepted :-)

-- Daniel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
