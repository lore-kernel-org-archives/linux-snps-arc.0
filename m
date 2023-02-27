Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F6FC64ED8
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Feb 2023 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A15gDJQfk2MdL3ZXhOa4f7JJDbFLwJu0W9vdrlIQikY=; b=Oozugfa8VxfBMl
	mmGDylIDBuYFuDtePFSi1FF+hPK2Qa4JbeZso17LIiVJs60Z/FKsbw77oG9UzpiIoc/EoblziZP2q
	omHaXEd2HnDw6IBub2ZN4uuBVPDwsIZQgM7QOgUofW1X6Fd0mu1o8Zo2FnTI/lDQq6mDy7SlouiVC
	ajUxyBhUVAt73PvpSxrOvi0uDSC/12yyNtA2S5+pABtmL1D6ct9VUljiJotdQC92TeTibQAHhErZk
	0weuIlJd3NExFT+QwSkQgBlbaA4lDWKz2UPZcESaDHOwqlRsL7iqQZJusVQ02aZCKobMTjULcnIyD
	rHwo8IbSlSoNigb5lPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaDA-0096Cm-7N; Mon, 27 Feb 2023 09:54:24 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaCt-00966Z-TW; Mon, 27 Feb 2023 09:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491647; x=1709027647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f/bLJaqaLfK7yUfdWWThO9xflQ5SoY/AGk04yxsIRKk=;
  b=kwI7Q9l5oxIxbWMJiKs7tsQAahX6WUk4KL9FiveQ0EJEMs/89+t3miQq
   6OJqiRlyyeXapppgnvpDOeAif3fhSMARYOtg6+PPvgwRQRii5XaT+KanF
   9cN49egZ5B0p2b7qtIIcSido6qDg4II3j/1tIhcQxbcP/UlfrooeEt0vQ
   MbrKxwZimKAtoi0I5H3KHuDbOLCp0Mc+3N7UWRB4+CWTsyRWpR573z6rM
   sAatqULG1Xawj68naHHoONFWfDTqwgSNzdN+WDdTha3Zs6kKeAOK4OJvj
   M2Ie7w4XTKcaXrgbqoa+3907tLYyildmErYxG4rd2WytLQmU5CLVRGUUo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361379827"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="361379827"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:54:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="919240678"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="919240678"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:53:59 -0800
Date: Mon, 27 Feb 2023 10:53:57 +0100
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
Subject: Re: [Intel-gfx] [PATCH v5 2/7] linux/include: add non-atomic version
 of xchg
Message-ID: <Y/x9tclWV/lqBMzZ@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-2-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-2-andrzej.hajda@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_015408_096169_2450295B 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, Jan 18, 2023 at 04:44:45PM +0100, Andrzej Hajda wrote:
> The pattern of setting variable with new value and returning old
> one is very common in kernel. Usually atomicity of the operation
> is not required, so xchg seems to be suboptimal and confusing in
> such cases.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
