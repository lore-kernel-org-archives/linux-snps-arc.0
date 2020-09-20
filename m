Return-Path: <SRS0=iBOu=C5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A16C43463
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 17:50:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9201B20866
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 17:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n33WPHaC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cBDZkiv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9201B20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kRA9J2VkczBHr4+Thtll1ApSMpFOc25wGP7vkWlWDNc=; b=n33WPHaC/STqbMyVqm2VN4o3e
	Kdz3RyNjT/YUJAFIW6/f8gEEuKJwxRft299SVKcor2waT1udZ6i/ti2tVvzpp60jbMq2kDZtyuxG+
	k11dmbEOjnc2hhad4W8CBkYQ2cpsbSoM5JxP5kL+ryEHrqZWI/yJw/K7utAC64vWGVdaD34AoJP9k
	IjXpoMaXoupwP7p3L7E1f5z3fEbz/WKIKFSs26qd7YfZhmGgEgNMzthgacvtKYDb1KfkT1JH2P+zO
	Y8s3fNO+qJp6SKZB/nUAdG/xdS50tae/O32xqBEOLY+IbXjm+uNrXPJCva0+zQ0a9qld0ZhhUbpaK
	+WlGBfvgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK3Tw-00087Y-Rh; Sun, 20 Sep 2020 17:50:36 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK3Tv-00087B-5l
 for linux-snps-arc@lists.infradead.org; Sun, 20 Sep 2020 17:50:35 +0000
Received: by mail-ej1-x644.google.com with SMTP id p9so14647618ejf.6
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Sep 2020 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ejz/GOVvBNgiciatH4EjBRwlfy2MnL1tDSObr2BrKeg=;
 b=cBDZkiv4uiqeUChUbmqRPD8tkvllq4angLGjbI6fcWbyt0pYNQ1SGMQdEdmcewXaXT
 IE5S9J/GFuNXr/rpY1dC/0Yf7uyzIPTs0u+8f3gLaQ3BI+ak5trluGhkQvuTa+ZLZ3HS
 UcueGtftJ4Q3p1fqvR6MgwdAfAMUTTFhAr56U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejz/GOVvBNgiciatH4EjBRwlfy2MnL1tDSObr2BrKeg=;
 b=JJM7BA2KO9upjvXT4Ac5KM5+K4BWQOQ8qe/XI/UrcSdt1TcysurLsVyliefcHyvqrS
 1aRFzeRV0TZAFtO85vewY1CxoYbl05HOFtRa+3cTGMMWJbT/7BUXhfgnn2EeKXB7uweX
 /aaU3UfFbpISPvIjzvKPnBkAFaPUqVQqa9WbG6WgAQe5TeU7oBM1lYk9XUHtaTOCOcy8
 R9BudqB47zg0hjiIbhQ1Pc/5YRFRJ3pM5hzkmWSGglEMSRuAWS6Ho23vzvr0qNoZwCj3
 J44dV7oEXM+oJ8s6Bp3sV4ppqMT3p6Av8Rz3WDPdg29I0ORKixGjI+X1FnrLC+O033XD
 cUrA==
X-Gm-Message-State: AOAM531nBWXq5m62CnJekAmV1/Dw88LUNv8TxSV3z0MdpPTasRUS1cHe
 NfQfRLW9lLWg6ugdnRLw446zS//tGrNamw==
X-Google-Smtp-Source: ABdhPJwt2Zdf8wuHVUgwbMrqfXswlnsQ998tvC4swj2mDxLtXossPQP/lrJhg/3B0GQEaSmaIcHp3w==
X-Received: by 2002:a17:907:2173:: with SMTP id
 rl19mr45406946ejb.514.1600624233756; 
 Sun, 20 Sep 2020 10:50:33 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49])
 by smtp.gmail.com with ESMTPSA id p17sm6959956ejw.125.2020.09.20.10.50.33
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 10:50:33 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id w1so10705608edr.3
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Sep 2020 10:50:33 -0700 (PDT)
X-Received: by 2002:a2e:84d6:: with SMTP id q22mr13708479ljh.70.1600623791519; 
 Sun, 20 Sep 2020 10:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87eemwcpnq.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2020 10:42:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
Message-ID: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_135035_228832_77051461 
X-CRM114-Status: GOOD (  11.97  )
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

On Sun, Sep 20, 2020 at 10:40 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> I think the more obvious solution is to split the whole exercise:
>
>   schedule()
>      prepare_switch()
>         unmap()
>
>     switch_to()
>
>     finish_switch()
>         map()

Yeah, that looks much easier to explain. Ack.

               Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
