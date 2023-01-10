Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C0C54EBC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 13:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsDI4n4Cmb2/cvi3KbP51UpxFOoWCgu9ic7WEO6xC8g=; b=2+bVLa/FdlsSso
	OXgo+pYMTmXNY/RQRK5++ZybY/Z4yD6brn0oiZlIdIQnP1K4DSFCLR/NxRDfph+3+dITOMLigAawj
	MhZvrpHVNog6nyxQsa5jg5lHjB/gRL6fKZMRNw9GxHfegYcikOuHpv6FMa3QqYiutp1vRSbKsEtqI
	PtlDsk5yLCIgGDh+hzDjA0qgoGoD/LPhRYESfee98tKUkZQRFoPPOaP/C0F5Rj5tRsLq5VfpudcGb
	HTff5L3YhwkUYLqJ05LFraooz35Y1GPH4nM4WVZFfaCIyWKfmeCt9+Uj5D09CqCaIYg2JLeNEp1rd
	EZp/C2sEPiG3aGtcLw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFF3c-0078kP-SA; Tue, 10 Jan 2023 13:52:52 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFF3L-0078dC-9t; Tue, 10 Jan 2023 13:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673358755; x=1704894755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tp8Z9Ay/HrlqQE0qDFK7p4Fost9+vU0ggkXvi/hfbkY=;
  b=VVgix+pLiGRkzcympQ9gA+z6YdwdWEZRsYbGZcddr+yOd5qurq6xVqVb
   ai5z1p4Yg3wD2XI0seGCY3K9IP+jaO9TCl0reIHeHLcmv/PoCs547CNrQ
   q9z/FcJakx8omb4sJAAZgJD1CR7AfwpayxeYEPCEERuPMtTLzj8bPVzNd
   WY04eWRkrupZHIeQ/s6TeKkg6jpoZOk/God2rI5rnVlTAD84mZbMVbQei
   EuH8lVoPZqIW6Roqy3sQGqVXsjVWKGHG2lqJN/U+5v6/Dm/E4Y6+QV/js
   P459z9R3UETUeRVzFDfF6+5yAdRxvIBELBFWn4wDpjLaI+rIb3tDrN1td
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="387599283"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="387599283"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 05:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="830995823"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="830995823"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 05:52:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pFF36-0073E7-37;
	Tue, 10 Jan 2023 15:52:20 +0200
Date: Tue, 10 Jan 2023 15:52:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
	linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
	Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
	loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	linux-alpha@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [Intel-gfx] [RFC DO NOT MERGE] treewide: use __xchg in most
 obvious places
Message-ID: <Y71tlG23t0gH9K1t@smile.fi.intel.com>
References: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
 <20230110105306.3973122-1-andrzej.hajda@intel.com>
 <Y71G1tkmUzM4BLxn@smile.fi.intel.com>
 <1bfae3d0-8c0b-ea83-7184-db847a4a969f@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bfae3d0-8c0b-ea83-7184-db847a4a969f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_055235_444065_4D2D9905 
X-CRM114-Status: GOOD (  15.12  )
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

On Tue, Jan 10, 2023 at 01:46:37PM +0100, Andrzej Hajda wrote:
> On 10.01.2023 12:07, Andy Shevchenko wrote:
> > On Tue, Jan 10, 2023 at 11:53:06AM +0100, Andrzej Hajda wrote:

...

> > > +	return __xchg(&p_chain->p_prod_elem,
> > > +		      (void *)(((u8 *)p_chain->p_prod_elem) + p_chain->elem_size));
> > 
> > Wondering if you still need a (void *) casting after the change. Ditto for the
> > rest of similar cases.
> 
> IMHO it is not needed also before the change and IIRC gcc has an extension
> which allows to drop (u8 *) cast as well [1].

I guess you can drop at least the former one.

> [1]: https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html

...

> > Btw, is it done by coccinelle? If no, why not providing the script?
> 
> Yes I have used cocci. My cocci skills are far from perfect, so I did not
> want to share my dirty code, but this is nothing secret:

Thank you! It's not about secrecy, it's about automation / error proofness.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
