Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1645CA0FF2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Sep 2025 01:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbCN9Gc5Ghmw38XId2cCDUYq55x+pae0apK8wObyMkI=; b=HakZhfpJdIW++r
	PSZhXBCZCWShxddTTeRX+NrS9l10q/TkHneRhhwI8q2JqOPRCuSFI94GhLPBZGeI5aLKEIyJr8bwM
	cZQ3JJvSg6QT6dUhtKzOO/uCt9DVzKCrOv5+ze3LEiQ05BjHAP2Cw2FG6MTPGQRVE/z9MkfA9FcCl
	YPLI6fqRlyfFuhoIAOnLQ5ORV11k2W2kDTMMn2Dx9IYt8DjRiXqfcASrrNovLBgqOLq3yr+WAzNrH
	YOIDsrzv8QDRGWWEVB3qPB7O9qEYH6TBY0TfZDFv4+xek72/QPRP6Gmshy+x+wRpQ6sSc7wg0M76R
	b2ddcZZEAIM/5LQccyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ustlT-0000000AvKp-0C1F;
	Mon, 01 Sep 2025 01:55:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ustlR-0000000AvKi-0KSE
	for linux-snps-arc@lists.infradead.org;
	Mon, 01 Sep 2025 01:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 109C1601B5;
	Mon,  1 Sep 2025 01:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA76C4CEED;
	Mon,  1 Sep 2025 01:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756691718;
	bh=y9uUD5rhZqWaFwFllOW9Bnz7ZPvxhH94nppg8HPo8WM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JuzNmjA/vCoP7TafQO8Xv9Ns+jfihrA0K3Wh9SzcJbJdwMp77YZE+2O+80JPZ4fHr
	 um7vfZfN1rXqBklwR8YjKwjvJ0I/UIereHZNhyMrRe/1irSBdEjO1ASVe+tgIHYsnJ
	 tiz7Gk7tJP2CsAvBVjxHZNZOWo66lhjX3Mr1OMPAOxX08sVybRgj+OK6ytw66vL1BB
	 8Sh1+Y5KfKQmrgTwe0pQZCJ1Adq75AUaYSrKxEUBUMH7IpfxAEdfPgwpTOHaAPbGkx
	 yCCg70sCBFhfSO1HdxqD3Eh5nU8OozG0yxdo5cjmxkZqm33jIDsgEhKFxEy4HfjR6s
	 2tzcg/78Vnrnw==
Message-ID: <bfad9056-7ae7-4bd8-8600-a603ab8439ca@kernel.org>
Date: Sun, 31 Aug 2025 18:55:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arc: Fix __fls() const-foldability via
 __builtin_clzl()
To: Kees Cook <kees@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Vineet Gupta
 <vgupta@kernel.org>, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20250831022352.it.055-kees@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20250831022352.it.055-kees@kernel.org>
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

On 8/30/25 19:23, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
>
> For arc architecture with CONFIG_ISA_ARCV2=y, the __fls() function
> uses __builtin_arc_fls() which lacks GCC's const attribute, preventing
> compile-time constant folding, and KUnit testing of ffs/fls fails on
> arc[3]. A patch[2] to GCC to solve this has been sent.
>
> Add a fix for this by handling compile-time constants with the standard
> __builtin_clzl() builtin (which has const attribute) while preserving
> the optimized arc-specific builtin for runtime cases. This has the added
> benefit of skipping runtime calculation of compile-time constant values.
> Even with the GCC bug fixed (which is about "attribute const") this is a
> good change to avoid needless runtime costs, and should be done
> regardless of the state of GCC's bug.
>
> Build tested ARCH=arc allyesconfig with GCC arc-linux 15.2.0.
>
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508031025.doWxtzzc-lkp@intel.com/ [3]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Phew ! Thanks for taking time to track this down and also submitting the gcc
fix, like a true open source Good Samaritan.
Please let me know if you want me to take it via ARC tree, just be advised it
will be delayed due to slow'ish development.

Cheers,
-Vineet


> ---
>  v2: clarify commit log (we want this patch regardless of GCC being fixed)
>  v1: https://lore.kernel.org/lkml/20250826034354.work.684-kees@kernel.org/
> ---
>  arch/arc/include/asm/bitops.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
> index 5340c2871392..df894235fdbc 100644
> --- a/arch/arc/include/asm/bitops.h
> +++ b/arch/arc/include/asm/bitops.h
> @@ -133,6 +133,8 @@ static inline __attribute__ ((const)) int fls(unsigned int x)
>   */
>  static inline __attribute__ ((const)) unsigned long __fls(unsigned long x)
>  {
> +	if (__builtin_constant_p(x))
> +		return x ? BITS_PER_LONG - 1 - __builtin_clzl(x) : 0;
>  	/* FLS insn has exactly same semantics as the API */
>  	return	__builtin_arc_fls(x);
>  }


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
