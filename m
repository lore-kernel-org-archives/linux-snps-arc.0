Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE6BC4332F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Dec 2022 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PsFHKeBwk+S86gIrKLnZwVU/Dg+B31pkO4Ml1W0q9w=; b=Kc4wahLkgpY73x
	+lPt6vDG9ipHbi4m3PfR3uYK9QUfyjGg7hy7kttDvKdf+yrO2CZmywu/TrzfI4FY/1zSeYVmICmOD
	wcFIwEmnWwClnqe62Rx+ydX7fQdQ77ufgVOBPEKRUWqN8dv4YyHq02deVkuSfHnX/V17q1KIljDDt
	fHCDK5sja6tujmn0jstgBmskHgAd2OKzWZdQKY5OllNi/aPEPr3fT53181M3zJAfNxPNIIXWHhzNp
	da2zcJnr6391MeLNDCRficZermgM2fZkJCobKI3EAy135QZOpXHhRqo6k7qKBMeZSYkjq2APbAGzf
	lboOaLVYCuMLXbdx0p0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ixa-008p2X-7c; Fri, 23 Dec 2022 14:23:42 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ixH-008osg-PP; Fri, 23 Dec 2022 14:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671805403; x=1703341403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ELTp1mLG7Y9aCL8aO+3yggqOoksNOYkU+LC/pmwgzyA=;
  b=AtSBPKuz3XgJdXNdETTMmwGGeKw993xnm5eTaZj4ngCeJRsIXYGc9vqV
   GIkiK+loR5vpmtjalL5LLjkjyD58NwPFb4y5f8U37y5xams7TQfL10raX
   7lBuzpz9IIiobDuMJs1RSvvA2gIpfnPQk+ZmBZeXP9UZiB+Uc66a5UC3B
   Mk50UWQgWdhYGIg3oJ7KAKothd8y0FEgIAj7J9BbwOJbLXdBlST/swzNq
   GIeMOe1fclETI4Y5WFY5x34ioMsbRUv2hFSdhpW8+gWQf+l+ESMv8D8oh
   +eKuxPtmte8appSO+Rpv5h/1P9JlO6P5ECj/t4JAiHNQaNE5/hDnJUVlT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="322279544"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; 
   d="scan'208";a="322279544"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2022 06:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="897539227"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; 
   d="scan'208";a="897539227"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga006.fm.intel.com with ESMTP; 23 Dec 2022 06:23:13 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2BNENBXm013561;
	Fri, 23 Dec 2022 14:23:11 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Date: Fri, 23 Dec 2022 15:23:00 +0100
Message-Id: <20221223142300.1820652-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com> <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_062323_912228_D0877028 
X-CRM114-Status: GOOD (  26.71  )
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

From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 22 Dec 2022 09:21:47 -0800

> On Thu, 22 Dec 2022 12:46:16 +0100 Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> 
> > Hi all,
> > 
> > I hope there will be place for such tiny helper in kernel.
> > Quick cocci analyze shows there is probably few thousands places
> > where it could be useful.
> 
> So to clarify, the intent here is a simple readability cleanup for
> existing open-coded exchange operations.  The intent is *not* to
> identify existing xchg() sites which are unnecessarily atomic and to
> optimize them by using the non-atomic version.
> 
> Have you considered the latter?
> 
> > I am not sure who is good person to review/ack such patches,
> 
> I can take 'em.
> 
> > so I've used my intuition to construct to/cc lists, sorry for mistakes.
> > This is the 2nd approach of the same idea, with comments addressed[0].
> > 
> > The helper is tiny and there are advices we can leave without it, so
> > I want to present few arguments why it would be good to have it:
> > 
> > 1. Code readability/simplification/number of lines:
> > 
> > Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> > -       previous_min_rate = evport->qos.min_rate;
> > -       evport->qos.min_rate = min_rate;
> > +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);
> > 
> > For sure the code is more compact, and IMHO more readable.
> > 
> > 2. Presence of similar helpers in other somehow related languages/libs:
> > 
> > a) Rust[1]: 'replace' from std::mem module, there is also 'take'
> >     helper (__xchg(&x, 0)), which is the same as private helper in
> >     i915 - fetch_and_zero, see latest patch.
> > b) C++ [2]: 'exchange' from utility header.
> > 
> > If the idea is OK there are still 2 qestions to answer:
> > 
> > 1. Name of the helper, __xchg follows kernel conventions,
> >     but for me Rust names are also OK.
> 
> I like replace(), or, shockingly, exchange().
> 
> But...   Can we simply make swap() return the previous value?
> 
> 	previous_min_rate = swap(&evport->qos.min_rate, min_rate);

Unforunately, swap()'s arguments get passed by names, not as
pointers, so you can't do

	swap(some_ptr, NULL);

 -- pretty common pattern for xchg.

Thanks,
Olek

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
