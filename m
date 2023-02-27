Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B5C64ED8
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Feb 2023 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MigGeE2hkO070bQEELWCCIuyRttjRv30Ja+4jcJ/JI=; b=rC9LG6BwveZTsl
	nvfQFEYHZUgW8GfCfKOBwmhBuhP5RoV03AvwhvzdNrg5DdBVbfyS3bv3LuV6uwZHnXitnYNZJI8zs
	beqrc6T4f9QQGvYfwYVbChrWfO+TSLWpMw9yc2D6/Oo4yd+g+oIbEGnzjK6CM/EPN4i3UrwyXEWEG
	RVJrGg0xDtU39fJ8FxmRGMkbM3jHvx64vp8x280EohDtTYa8vJ7hueZwMlkijy6IlzPI35S67xIuR
	ZrqA+J2yt4oiRQ8/JRmAW4foDY/efbf+tWUJwqXSNpQRlCdn3TPfrG10rFbi9sJWXxLZbgGnCIhNP
	PEsX7hJrTyXCw8WnAtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaDz-0096WV-6e; Mon, 27 Feb 2023 09:55:15 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaDj-0096OG-A2; Mon, 27 Feb 2023 09:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491699; x=1709027699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rr6xwo2PCVOiBN2/EFJWwIunjAZhcH+OTt1joV7rt6Y=;
  b=jWKd9bXais7/EgYjrU9s4vs9XIRDdDyepV71prZiHfAg8otmbpptD5EL
   GTO969l0Ujvzkicc/nbrMRi419UTqtIbw1NWCEHDW3OvqBr9PXtvkryk1
   V/H/H5SJ2Nsn40jnLEceHZIWZIEqiI79rlS9tCniom3BDI4WMnH7AzdRB
   yQRVXBRXobfDjB5sRpHDSKbvm688u3RYs5pfqgKRKrbvQCizfh0pVz6I9
   lLob/EbgwkKjd5fx0iff6ufy2eATntug6cR+itTiwt3wLljq82euwhHq/
   fi0JE9Sm8fxVywbQondGoV3zuyr3UZHYKAvkRXiMO13A60imp6pxNlPzC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="398596722"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="398596722"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:54:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="706118261"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="706118261"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:54:49 -0800
Date: Mon, 27 Feb 2023 10:54:46 +0100
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
Subject: Re: [Intel-gfx] [PATCH v5 3/7] arch/*/uprobes: simplify
 arch_uretprobe_hijack_return_addr
Message-ID: <Y/x95g9aUmMdO7Hu@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-3-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-3-andrzej.hajda@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_015459_410284_BE63EA62 
X-CRM114-Status: UNSURE (   7.82  )
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

On Wed, Jan 18, 2023 at 04:44:46PM +0100, Andrzej Hajda wrote:
> In all architectures, except x86, arch_uretprobe_hijack_return_addr
> is just __xchg.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
