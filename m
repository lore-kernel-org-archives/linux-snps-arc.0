Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD15C7EE2D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Feb 2023 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoJ7EAuM5Ou6pzFAEs8VVGDpI9uFw4l44LXZziKKczc=; b=hJyKeA42VtQmdI
	v6tOhpJEJZ1yP5jKDkLZvBwCMpIOiJy+m9FEl1j0YEihHc66KZz7oJd8wljEtIkn7ipnXbZtFVE/B
	eE3TkUTTQDMzfeo7w8WZOqk/fLUA4/JnS0tzyY96ImBKkRh7HnZEP7YpBPPr5me3mds7SvVNk2i/Q
	6IFjNFfEWJO+X1mBeGyqGR++t5IilYNwuJ6D9887EzN5a2R8YEd2SQALa3nIYnsifwPKj8/VkuUYb
	9+wV0w0NMxk8/f9cZP2y0VFF0/k7/JbfcTKukf6+NThh5kF6ghOw1kJg2PhPNqNASokQZFy5YiSYz
	kuD0XOwDENye+TPlZ/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaFv-0097MN-Aj; Mon, 27 Feb 2023 09:57:15 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaFf-0097Eo-4N; Mon, 27 Feb 2023 09:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491819; x=1709027819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QoU6yA4OU0JwXW/AH29osWOnR5IWich2UMqOTYGbHiA=;
  b=Ri+tt2/czNTMcVLfXRjyPM25PJnF7ZeR1mO9crOUlcHNOqG6NXY9yVld
   ceD36sNtfTyj0vYDOuBdKGN7NFVJquPqkPyTSN0z+fvnGXfv5xbc0uCAB
   nG5ZIm7SXejqckeH3GC3pAC3pAA0P/Y7tQev6M1EbEIPT45t0CPHtOwG2
   ljVPHH0+pAhcA7Y1Yd8gMwZtmQWLxQQlpHTeFrMBBJFeoqmWFgI12dMjl
   Fo6uVGBfgR5jeEZLlD1PVeXe9lFcNTcfWOzJxeP20gPTdD4oUdd1tYtQB
   Us0+dza7yh8Xj37wR7EQZT06vwBOOrRLFSVNOpu+I42OaYSv0GdmPQNja
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="332545933"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="332545933"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:56:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="675796769"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="675796769"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:56:49 -0800
Date: Mon, 27 Feb 2023 10:56:47 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 6/7] qed: use __xchg if possible
Message-ID: <Y/x+XzSaHTo23F/H@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-6-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-6-andrzej.hajda@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_015700_133054_612CEBB7 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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

Hi Andrzej,

On Wed, Jan 18, 2023 at 04:44:49PM +0100, Andrzej Hajda wrote:
> Recently introduced helper simplifies the code.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
