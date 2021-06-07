Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A0FC47082
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 09:24:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0AC611AB
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 09:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0AC611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SmeA+wF3ZWmYvqxC9uRSrezvF3Uqz1CvwpgkLwV9Mo=; b=Zl/8/8N1mSgHqn
	lG+qgXpic1gY1z+ah7cgC+5E/cFzVxJWb05LFsNMSti5Wq1cnaIBckJuV4RIAXoY5g+y/uxI3OgQ/
	UFnm+QDCeyGhBm013aHuDSuOFs9WHLq5R4Mcio6gbLJiLh+KUNdqoG8xZ0KMVWIKHvVrAz/4cm0ZK
	m7h+9hzPyF0thYgjFEMVDerwz8aE1Ue0+lYR0gZVz5i54UVCFrzYRTkvxxyA4UpwVzwKVxtjZS+5J
	BFrRHSIbhjzQ4IEor7yUGquctok0hB49ZSvp5aALudm4AAoGxEr/AbdfR99MHElPAdUNN6xK+wrzV
	gVZ8ijPciYSm0LAjYApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqBUd-002ZSe-F4; Mon, 07 Jun 2021 09:24:23 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqB0a-002QLb-VF; Mon, 07 Jun 2021 08:53:23 +0000
Received: by mail-ua1-f45.google.com with SMTP id l12so9292621uai.0;
 Mon, 07 Jun 2021 01:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7XwbZyFAy9rqQo5J7t8DRS+d/mueoOLl5p+cSQb+8Y=;
 b=hKBndH/5jrn5HhJNu1AcNO3JoGuCUsqjDgN34Df7a6h04SNBYeNU66G1XBjjDa/g8d
 aXxgvmRCSxjjeKuIw8sKMeUl4CBJ2tJt2mPh0104rwQ44ovGgk+AZoXw1Mw20laLb0QV
 Zw1n45neJGXonqUP2tENLz6VZeaXNdZB5h9MjRBuJstx3Z2Je529HZ9V+E6AwIwpeBva
 SoIQ+BJpwF+ZP+hYbF5PBLhvFis77WtR8F2DQKVEr3azyBQrHL4a97dU6i78OPmj9NHa
 ZMns71LYVkgmSuf5f4inEHv934G7EBbnUiS2Ot683q8TvLm13AXT0hxL6xk44bWraZvK
 xH+w==
X-Gm-Message-State: AOAM531wZ+zwERp6y/RqjDHaGktXtbsfhYmOa6zVnnu5TS19DaQf95DR
 gj72G0THqn7MyBzoF+DuiO4RTuaQy06Wkg69Krc=
X-Google-Smtp-Source: ABdhPJw70xfmNroh3KIu5QGmqKsYwQ+PKLyHQ50n7DeatYgE4iGl6TNz+FWGTOL2BBcrgRRRH99rMYwIPPT469OpB6M=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr6682382uap.106.1623055999326; 
 Mon, 07 Jun 2021 01:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-9-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-9-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jun 2021 10:53:08 +0200
Message-ID: <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, 
 Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, 
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org, 
 alpha <linux-alpha@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 sparclinux <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_015321_136219_B0E223FC 
X-CRM114-Status: GOOD (  19.83  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike,

On Fri, Jun 4, 2021 at 8:50 AM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> configuration options are equivalent.
>
> Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
>
> Done with
>
>         $ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
>                 $(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
>         $ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
>                 $(git grep -wl NEED_MULTIPLE_NODES)
>
> with manual tweaks afterwards.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

As you dropped the following hunk from v2 of PATCH 5/9, there's now
one reference left of CONFIG_NEED_MULTIPLE_NODES
(plus the discontigmem comment):

-diff --git a/mm/memory.c b/mm/memory.c
-index f3ffab9b9e39157b..fd0ebb63be3304f5 100644
---- a/mm/memory.c
-+++ b/mm/memory.c
-@@ -90,8 +90,7 @@
- #warning Unfortunate NUMA and NUMA Balancing config, growing
page-frame for last_cpupid.
- #endif
-
--#ifndef CONFIG_NEED_MULTIPLE_NODES
--/* use the per-pgdat data instead for discontigmem - mbligh */
-+#ifdef CONFIG_FLATMEM
- unsigned long max_mapnr;
- EXPORT_SYMBOL(max_mapnr);
-

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
