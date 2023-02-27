Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9DBC64ED8
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Feb 2023 09:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMnEj8mEWBe4C8xU6bGicMdTeW9qU1I4JCliHRFnnnw=; b=F1tMVutgCvnIV8
	2GKCWF4ur0akVPr1S1oeO+amSYgh0K3Od8QNbumD5p1wc0iEwbjIYlpFcgbEHqe1hNM4f3sgNq4q0
	wOoh3o8v4sAJqKfyQaX9VuLnKBiNSc1M54Mb/j8WsDoGAhKym461lo1gn+b5S9nDYrDSkIEKDJsyp
	Z/K23IaopRrN/Gi9DOq+/UFU6NGNYrsUsQaGVlte9FuANjSZDSlqj+Et9KXIB9DdDbVxL9ddhckIF
	0JRKX+Dhid8xZFASf0rJRMX9ebWWg28iLHJO9aNTwO86/fN83vAy/bh2UPGmlhsjbPYjNafTjoQES
	AzQf6Ag8qjMaWNv5yu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaCI-0095xq-RX; Mon, 27 Feb 2023 09:53:30 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaC6-0095u9-6d; Mon, 27 Feb 2023 09:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491598; x=1709027598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dwUo3BFORgMJVeDfksL8jP7HkkuWEuVDbhgyCpyAFqs=;
  b=MtwkTam2FpXDlthKfc5/A8GReacYd7JQDOaZzdeL0ZxelNVOJyjByTaL
   yilA9/D1YCmvxchWqjZUv5V1/ibkGNqXXJTiRBtsG1q9/TQ5XZnU4ZX3p
   NKpat0DgaNMpB5wEGx9fkys46Sc6C7+k9le69nYotpG4sONiZCahG4lTv
   mUgVuwL/e2ZjwZ/aAuSKBLaGnw7X6apODo2dj/tZvQHBm1oPn30riqbsc
   w/sBOM3RCxan7hDZZzmW2DJ38ZL0ipOt0hfwxbADFaXMX0lKsqcSCrK9M
   he/b2N+a2BzJ4qlWnukfKRULTB6zNK+z0gtb7b7WsWTGbPPGclIRZjAQC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="336101819"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="336101819"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:53:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847756370"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="847756370"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:53:07 -0800
Date: Mon, 27 Feb 2023 10:53:03 +0100
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
	Palmer Dabbelt <palmer@rivosinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/7] arch: rename all internal names
 __xchg to __arch_xchg
Message-ID: <Y/x9fxS1cFsa1ylP@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_015318_324485_FE9DCDA8 
X-CRM114-Status: UNSURE (   7.87  )
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

On Wed, Jan 18, 2023 at 04:44:44PM +0100, Andrzej Hajda wrote:
> __xchg will be used for non-atomic xchg macro.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> [riscv]

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
