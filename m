Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A147FC4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxNEQNQxn7O+IVJffwEgNrpI2Nj5PV5k+QGnMCaZOrU=; b=cho/doro99Z/2/
	U3Ll4rcZQFGzvlcWGZY/xuKY+/nXcGxvsTP5GEooVSaNsS+fF8bSsBvkY1DsSDHHO/0FCTBhKMKIf
	XZcnbeL9wf36euP127AayWqFCbzewzOfKdzXAhKTlEh4HOrBHTMGv7VCbguF6MHvLQz3CmF0OioBn
	5VDlk6xYjefxLYOlHHAS1E1VWpjqAia/m1ioAGtW4UmZqNGMO1pgTVGgF7TFN1n4aqNWXvI5rTUCA
	DRxRaisxbhSDWtV9KoAdY3gXcJfkzEcNpuEuWiJ5o5JsEV9j1goDJHrZd0U5kDsq++iM99AiWoDl3
	GU+8B/8L/7RNjNH0aSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LzF-00CcTt-SI; Thu, 22 Dec 2022 13:51:53 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KzM-00C2Bm-Q1; Thu, 22 Dec 2022 12:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671713276; x=1703249276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UPM8RDFaM30ZmFrIb8CKMZ1JANhWUp662jbH45qLr6M=;
  b=K2etaX872S+4MUR9/eIj4wJsmme9tOOLNeERDeBxFXkNeqawDUM/WuSn
   usZwU+wyzttHHtW5gO4j1iOXRXmLzGYc3o3sDnHXDtRLL5h4QtCFOgRko
   gBs4ZO3/yH6Dq2ict8r+HkIx/n5EDCuxIt7OUdE0ehzYxiN1hClBz5XWv
   WzlynD5sEqa8QwqVtWgN+9IyI6G6RL4TJK9U/nGNTLxTgsUljl5cdFGPI
   OBfOfX/qbmzFnNzhEbygBpCC7jubYjKiv3IG1kPk+QZmOsxfXioXYwD7g
   KWZa4R/5MAMpRmndig3VsyHq0xdbH6DEcKhH8dDjcMOzTx1djO4NgW2hV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="322031546"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="322031546"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 04:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="897213732"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="897213732"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 22 Dec 2022 04:47:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p8Kz8-00Duf4-1e;
	Thu, 22 Dec 2022 14:47:42 +0200
Date: Thu, 22 Dec 2022 14:47:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 18/19] linux/include: add non-atomic version of xchg
Message-ID: <Y6RR7hPZUN22ytap@smile.fi.intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222114635.1251934-19-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221222114635.1251934-19-andrzej.hajda@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_044756_970198_A5956BCB 
X-CRM114-Status: GOOD (  18.97  )
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

On Thu, Dec 22, 2022 at 12:46:34PM +0100, Andrzej Hajda wrote:
> The pattern of setting variable with new value and returning old
> one is very common in kernel. Usually atomicity of the operation
> is not required, so xchg seems to be suboptimal and confusing in
> such cases.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  include/linux/non-atomic/xchg.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/linux/non-atomic/xchg.h
> 
> diff --git a/include/linux/non-atomic/xchg.h b/include/linux/non-atomic/xchg.h
> new file mode 100644
> index 00000000000000..f7fa5dd746f37d
> --- /dev/null
> +++ b/include/linux/non-atomic/xchg.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_NON_ATOMIC_XCHG_H
> +#define _LINUX_NON_ATOMIC_XCHG_H
> +
> +/**
> + * __xchg - set variable pointed by @ptr to @val, return old value
> + * @ptr: pointer to affected variable
> + * @val: value to be written
> + *
> + * This is non-atomic variant of xchg.
> + */
> +#define __xchg(ptr, val) ({		\
> +	__auto_type __ptr = ptr;	\
> +	__auto_type __t = *__ptr;	\
> +	*__ptr = (val);			\
> +	__t;				\
> +})
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
