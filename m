Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E386CA0FF0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Aug 2025 02:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbPeRqVC0ah6BTk9g7+PljDalAaQcVK7PN0uJ9bGbwA=; b=eue8Y2ZwNw4fui
	NXWAfGOf6jWGsK+nxU7Ccn/K4ET+btn0S1XWRO0mi4iGSGcmGwTQV0PdPe3Bozp0pLVPsoXNce1+5
	tZ7Go+DnAFYbdDDH9hHKfvCmc2Uc3zN0a6qPywtU69KHvldt+EM2qUaHK1EnpN0EN+Zsld8V2Cuyl
	S5dCLaJb7tH90LHsmkqhMpy/Q7ltlT4dKo1hJIJXlw2TOv6ENh5eFSg3uFlp2dEXJ+KrTQ2x2pOl2
	cHFA9yecH/cRtv2OPfa0CXb6+Ain++BXkijNYWbD7ouNVYvMHcLgKuKlx69GFnOG7qf33PMi9Q+qc
	bl6gAreR4DH2eNiwRg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5er-0000000DdoK-3P2Z;
	Wed, 27 Aug 2025 02:13:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5er-0000000Ddo4-0N07
	for linux-snps-arc@lists.infradead.org;
	Wed, 27 Aug 2025 02:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26C926022A;
	Wed, 27 Aug 2025 02:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9320C4CEF1;
	Wed, 27 Aug 2025 02:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756260783;
	bh=AFuDBk0eLL+Qy41VIQegDgTCTFROIcEB8P2huuPNwog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhUhZmhsbxOZ+lfXDAK8KkzQXW9IAzyP6K5mHeKz5Ahg+M56c5+phLxl7YpvWu6kk
	 W/x7Ykg31qwj2v77cv3SYjNFJPUV3LnAgdVzdiZecXiCvsmRsfix3QugEjBz5kY4D+
	 oVukQAZ237CFBzY3cPPJ9iXZRWPZ0WMbUBV07KepRFBYt6IAKa262QyhFYOyf2OUf7
	 HN9zGhRgCrq4lA8rhL0WhrMfjmhACnZKHVb4EjcJV4GWAR2DRDwgHa/a5XbOOYChsJ
	 iBtEN0syQrH7joaI7mR5TTQoTlXqWgo9tvTRAdMmA2GtNj0XeLUGsMbk/+sX24dIbG
	 oy58+u+trER+g==
Date: Tue, 26 Aug 2025 19:13:03 -0700
From: Kees Cook <kees@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <ravi@prevas.dk>, kernel test robot <lkp@intel.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arc: Fix __fls() const-foldability via __builtin_clzl()
Message-ID: <202508261911.ECB628656@keescook>
References: <20250826034354.work.684-kees@kernel.org>
 <87ldn644d0.fsf@prevas.dk>
 <202508260955.2DE50A3FB@keescook>
 <aK5eNDa5H-PNGHpj@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aK5eNDa5H-PNGHpj@yury>
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

On Tue, Aug 26, 2025 at 09:24:04PM -0400, Yury Norov wrote:
> On Tue, Aug 26, 2025 at 09:56:06AM -0700, Kees Cook wrote:
> > On Tue, Aug 26, 2025 at 03:08:59PM +0200, Rasmus Villemoes wrote:
> > > If __builtin_arc_fls() simply doesn't qualify for attr_const for
> > > $reason, I think it would be good to have that documented in the commit
> > > msg. If it does, I think a gcc ticket and link to that would be in order.
> > 
> > I already sent the patch to fix it. :)
> > 
> > https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html
> 
> I'm OK taking the patch if it fixes real problem for you, but it looks
> more like a GCC problem, right? Is Clang also affected?

Without it, KUnit testing of ffs/fls fails on arc. Clang is not
affected. Even with the GCC fix landed, all older GCCs with still fail,
and since it provides a improved code generation for arc, it seems worth
it (compile-time-calculable values will be emitted instead of always
running the arc instructions).

> If, say, Clang is not affected, and you expect that newer GCC versions
> will not be affected too, let's protect the new code with a proper
> ifdefery, so that it will be easier to drop the workaround later?

I think the codegen benefit is worth it as I have it.

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
