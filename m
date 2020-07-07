Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C650C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 21:32:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D49206BE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 21:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlW+ECmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D49206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Uw3XXphuvQdFLSCWEaNFuipLjufKoaV22hLapzXtFE=; b=MlW+ECmZrH1Tx2sw1wxI04FuW
	EQXmmeOmLrjQWRcAyBJjcgjZElpes3b1B1BJ8BKP29iEXEXkrz9kDJmr2Xo+ogPcV1DgRlPK8XaOH
	qOCiD4AYm75J44huiceovGkwqy15jUlmdYkbyBozn2/GBZD6qXtfkrroYfnEKpNV7rWSuoOETY9L5
	zg01rUH/TpSe9DWcIVKlvZnfLL4J0gg9+Ea5u5kmC/cyjCd20E4Qmm8BwxOVH7/ug78Dk3zhK1mWL
	UIUesTqPjfU3YpXwhAqZ/2g48Fpcs8d1QnV+DTV2a9HD2+vbXyTio88A24qAV8w4utZSL1AxKCGZ9
	0CyJq/1qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsvCK-0008KB-PE; Tue, 07 Jul 2020 21:32:16 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsvCI-0008JK-8P
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 21:32:15 +0000
IronPort-SDR: 1AWqyW0YQDwsJ0tKB64HJ3+AHNuav049C8AgGH/0Rn+TsiQRVR7D8cRDqYRPf8bkKRSo6YC/iz
 c7rQ4z4ah24/S/TiwUl170yCNhxEyUYpzp8KDldwB6l+Vng07CiZ7C5zYfz9V/YFQX+7qtwLOd
 b3p23T9KW4dJ/2trikNzxtGNBt8CKmH1MFng162GUdP1hpJnRMAcJZyrU8tbECV3crN1rqoSGq
 o9mR5MDS6GJ9F4XFGa6Xwc+oHVfuowpqN90/zfQYmlfUIUQ786r9AOLR3008FqKMS3IwzI0tGw
 5OE=
X-IronPort-AV: E=Sophos;i="5.75,325,1589270400"; d="scan'208";a="50810128"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 07 Jul 2020 13:32:13 -0800
IronPort-SDR: SyUIB12rlJ6I0V9ctfBzzQFv19z4561EpqTt/56JzpZB8N/+cuJA0ynzBeF9vZc9WrBTquvLHq
 0eBdT+ewRTwDZvwCSLzt8tbzmn2wkIlGS3bGf2b0+N39k+GkLeFWIKNoxk6972EW9QUYOz+KmV
 XY9oJEaGsAQeKvFfk1J7EPGYll/iBFzXnaLoAXahhO7rvQvH9MezqChaNZC337lEEz98HlJOLA
 3sQYg6lNqhqxqqpkvjw/tcX31q+a22C9I8pJm/W0RgDOxgZC8M8OlDv9LJuc1iARwcK0BTTqHi
 AQ0=
Date: Tue, 7 Jul 2020 21:32:07 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v7.1 07/13] ARC: Linux Syscall Interface
In-Reply-To: <0e3bf658-10b4-0428-02f3-f2ae01c77ddf@synopsys.com>
Message-ID: <alpine.DEB.2.21.2007072128060.16069@digraph.polyomino.org.uk>
References: <20200615201441.31820-8-vgupta@synopsys.com>
 <20200701000848.20492-1-vgupta@synopsys.com>
 <e9e2ae28-cd78-5924-c1fa-52b1499c245a@linaro.org>
 <64e18e52-9dc6-6d14-3e15-8c5ff1c0cdc2@synopsys.com>
 <a56d0e2a-cbc1-9a2b-b145-0d59318426d4@linaro.org>
 <5feda452-d571-2ffb-5cb4-a71dc7033503@synopsys.com>
 <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <0e3bf658-10b4-0428-02f3-f2ae01c77ddf@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_173214_446626_D89CFECD 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 7 Jul 2020, Vineet Gupta via Libc-alpha wrote:

> > Each implementation has it ows requirements so I can't really say if
> > a helper function does make sense for all of them.  For pause
> > specifically we can even simplify to since all architectures have
> > either ppoll or ppoll_time64:
> > 
> >   int
> >   __libc_pause (void)
> >   {
> >   #ifdef __NR_ppoll_time64
> >     return SYSCALL_CANCEL (ppoll_time64, NULL, 0, NULL, NULL);
> >   #else
> >     return SYSCALL_CANCEL (ppoll, NULL, 0, NULL, NULL);
> >   #endif
> >   }
> 
> But how is this compatible with older kernels (and perhaps this is a general
> question). I mean one/more ABIs minimum kernel would not have the ppoll or ppoll64
> so how will new glibc work with such a kernel ? Is it not required to ?

See commit 089b772f98afd9eb6264c6489bc96a30bf6af4ac, where I removed 
__ASSUME_PPOLL because all supported kernel versions now had that syscall 
for all glibc architectures.

In general this sort of thing needs a review of whether a given syscall is 
available for all glibc architectures in their minimum kernel versions.  
For the old kernels in question, that means checking the 
architecture-specific syscall table as used to dispatch syscalls at 
runtime, which used to have an architecture-specific format before 
unification work was done; it used to mean checking asm/unistd.h as well, 
but now we have syscall tables in glibc that's probably no longer 
required.  It also involves checking compat syscall tables for 32-bit 
binaries on 64-bit kernels, as sometimes a syscall didn't get added to the 
native and compat syscall tables at the same time (see the comments in 
sparc/kernel-features.h about various socket-related syscalls, for 
example).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
