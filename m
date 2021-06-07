Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6593C4743F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 09:16:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913BA611BE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 09:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913BA611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BNC6XVsSx4Qr2sspvvH9BpQZO1cIi5VMptU5txor+I=; b=d7g0IE2PdKoyoy
	nlYPcLRYLuKl0yqfRrDQ9hvLLvnBaCIijiHCntW5g9pbMKCy1Kwd3Wyl7Ay/ZgjEqUayqhO7r+VyT
	aJ8/9/15zCNqJMkBMx5luCdjoLT8vEN8rJ8prEh6oZGpPf/Fxnh8dsVAq9UbJT5SXt6UrNszcAYf/
	jXGUN1zKzUX2MrqdbUTFLfJxhexe3FHOVFWqk76OoInuB+HHQgifwgia31CaChj08AvSkZUEp/EHr
	GJOfOT+/xkx5ERaX08umEyzo4+vQpqmeorQ2zbAGqDN7GZdWbpWCAcgDUa2wwvXscLXO35fZdGbcr
	aLoOM5ixJGPoBC/7GlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqBNM-002Wml-N7; Mon, 07 Jun 2021 09:16:52 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqAsV-002OEn-SN; Mon, 07 Jun 2021 08:45:01 +0000
Received: by mail-vs1-f44.google.com with SMTP id b1so6749738vsh.7;
 Mon, 07 Jun 2021 01:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMLFqpyinJNzmHBwsTXpi/IC86W5Z3EEdqUV4Gadqtw=;
 b=fmFAcpv+DRACv57tp4OUdlX8GXhs/1t8AhMHYBZ8/nL74qEx66e8rrNa1s9b1KSa8m
 usUhXLoEderfARHNoYneHIlYmyUpokm7U77m+2GP4oZCkrxGwqn189g2Hm2TqXsLxkTS
 Y5ptZ852pwMhxx8C6POdNN0txQOAjLin6hq8Rr8rgTRh0OFBecPmmtpOpIiSAlTXgCXB
 S9QT35TKaQc2lEDsjBjeQOJcwH0ZlgrTDEu+M64OzCuJ7iolWP9CK8H8P/+TkMyJ6GKt
 KkllpgBrQWHH1M1dUZHl6Nz9eak1T8zs+i+Myz0bCDRMqMtGJQA0ALITqmvfdpfk+e3o
 zuPw==
X-Gm-Message-State: AOAM532cR3ap1lUWFChVq48+GkHoLSoflIwEEQpgu+YCkrhviGhpxPhh
 uZ89RJt+nFgPvc26cIh6p3kZf8gRpC7471/pPO0=
X-Google-Smtp-Source: ABdhPJwMLHirwEQ4tJUPI7qaplUDz3bp0fsmhod8P88K7RhBRU2njU8TgCywfoM2VwxcEnVDrH/bezsBM2ie2giEJTc=
X-Received: by 2002:a05:6102:c4c:: with SMTP id
 y12mr3863270vss.18.1623055497041; 
 Mon, 07 Jun 2021 01:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-1-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jun 2021 10:44:45 +0200
Message-ID: <CAMuHMdWuOk2LBJunCsCjzjYnBDs1rZh_x=ez7N=gjYv_ETMAcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
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
X-CRM114-CacheID: sfid-20210607_014459_990314_BAAC009C 
X-CRM114-Status: GOOD (  15.75  )
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

You may want to fix the DISCINTIGMEM typo in the subject for v3, unless
you think that makes tracking series versions more complicated ;-)

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
