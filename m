Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E174BC4332F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 29 Oct 2023 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaOSv8Sr/AKOjVZHXOJ0CFv0XOoNqEnQvyHylFpha1U=; b=3SHQ7PUs+7iVHj
	aIi6OxN3811q42uSbEEUsZXsy23q+op4j4ZF48K8ZuhrbOHNHtiv66BwIHn5UBi961usSvdBbvqqM
	8ylCDRd/2NaY4UuTEfnB1EepbmrabD9dhiOKD7qDFS7ZAryVEHw54iX2QVUjFCVhgErDvWxRTgmCC
	eOGdkRAesuxFe/kmHdgyDbnUPo3Xq2cPzV2KzzdOlPSRD3VGX30MCSUSfCM36amrH0L998GntBLEO
	zUjD7BRbzUxnRyJn7Z9EmbdfFT1rf2GmI0iM6LpEtYdzWUBRL9OfLB26x8WHJCpCoX6oOBylEvBAL
	r3i4eo02dDnpVBLrZRrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwwRw-0016Cl-0t;
	Sun, 29 Oct 2023 03:26:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwwRt-0016C5-27
	for linux-snps-arc@lists.infradead.org;
	Sun, 29 Oct 2023 03:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF10060B2B;
	Sun, 29 Oct 2023 03:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF026C433C7;
	Sun, 29 Oct 2023 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698550007;
	bh=Dxg6gKT37gNrEbIymPEkWrKefREoe2HMLWEPq1+CyG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CF8eXqsVK3bQmCBlfBRv7gQUNyWqRIXagijv3yKwshN3DDk6N9AN61Evlyld9tsdz
	 OZWPKJ7VMtagFHuK5W1R30GlUyiczQBei55TbKocH1GioONITN85PTtZ/ogJkUasc5
	 VAs2tDdRTb7Zu89s93K43Z/BUPQP7ELcMEVGUeL6ujHUUPNFqkk0TpIhF+atctlTcV
	 JwebTOnJxkxEfVUb723D40QT6TaqK8VfsApm/R4iK43cQOjJZ9C5AICuuj45WUd6q0
	 jbDHHex0ABxo5uqB58OcdZJfr4grRCsrb8F1ZQ5YotrSxm1RjkhmxgyzcyeRyG8yYD
	 xRs22YMJRYjQQ==
Date: Sun, 29 Oct 2023 12:26:41 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>, Vineet Gupta
 <vgupta@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Andi Shyti <andi.shyti@linux.intel.com>, Palmer
 Dabbelt <palmer@rivosinc.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-trace-kernel@vger.kernel.org, mattwu@163.com,
 linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH 3/3] locking/atomic: openrisc: use
 generic_cmpxchg[64]_local for arch_cmpxchg[64]_local
Message-Id: <20231029122641.a8c90d5e6bdfa6e7175bbe97@kernel.org>
In-Reply-To: <99f9c3d4-0c9e-4542-9511-796f719c36e3@bytedance.com>
References: <20231026073932.702197-1-wuqiang.matt@bytedance.com>
	<1e3aba7d-89ac-4b62-840e-992527115a70@app.fastmail.com>
	<66f5645c-f9f5-4c53-9503-a1f8470a9bee@bytedance.com>
	<20231028214918.e32265f1dd2ef26fd9d2d1c2@kernel.org>
	<99f9c3d4-0c9e-4542-9511-796f719c36e3@bytedance.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_202649_821871_A9B2DD9F 
X-CRM114-Status: GOOD (  34.05  )
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

On Sun, 29 Oct 2023 00:40:17 +0800
"wuqiang.matt" <wuqiang.matt@bytedance.com> wrote:

> On 2023/10/28 20:49, Masami Hiramatsu (Google) wrote:
> > Hi Wuqiang,
> > 
> > On Thu, 26 Oct 2023 19:05:51 +0800
> > "wuqiang.matt" <wuqiang.matt@bytedance.com> wrote:
> > 
> >> On 2023/10/26 16:46, Arnd Bergmann wrote:
> >>> On Thu, Oct 26, 2023, at 09:39, wuqiang.matt wrote:
> >>>> arch_cmpxchg[64]_local() are not defined for openrisc. So implement
> >>>> them with generci_cmpxchg[64]_local, advised by Masami Hiramatsu.
> >>>>
> >>>> Closes:
> >>>> https://lore.kernel.org/linux-trace-kernel/169824660459.24340.14614817132696360531.stgit@devnote2
> >>>> Closes:
> >>>> https://lore.kernel.org/oe-kbuild-all/202310241310.Ir5uukOG-lkp@intel.com
> >>>>
> >>>> Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
> >>>
> >>> I think on architectures that have actual atomics, you
> >>> generally want to define this to be the same as arch_cmpxchg()
> >>> rather than the generic version.
> >>>
> >>> It depends on the relative cost of doing one atomic compared
> >>> to an irq-disable/enable pair, but everyone else went with
> >>> the former if they could. The exceptions are armv4/armv5,
> >>> sparc32 and parisc, which don't have a generic cmpxchg()
> >>> or similar operation.
> >>
> >> Sure, better native than the generic. I'll try to collect more
> >> insights before next move.
> > 
> > So I will temporally remove the last change (use arch_cmpxchg_local
> > in objpool) until these series are rewritten with arch native code,
> > so that the next release will not break the kernel build.
> 
> Ok, it's fine to me. Thank you.
> 
> 
> > But this must be fixed because arch_cmpxchg_local() is required
> > for each arch anyway.
> 
> Yes. I'm working on the new update for arc/openrisc/hexagon. It would
> be better resolve this issue first, then consider the objpool update
> of using arch_cmpxchg_local.
> 
> >>
> >>> You could do the thing that sparc64 and xtensa do, which
> >>> use the native cmpxchg for supported word sizes but the
> >>> generic version for 1- and 2-byte swaps, but that has its
> >>> own set of problems if you end up doing operations on both
> >>> the entire word and a sub-unit of the same thing.
> >>
> >> Thank you for pointing out this. I'll do some research on these
> >> implementations.
> > 
> > arc also has the LL-SC instruction but depends on the core feature,
> > so I think we can use it.
> 
> Right. The arc processor does have the CONFIG_ARC_HAS_LLSC option, but
> I doubt the correctness of arch_cmpxchg_relaxed and arch_cmpxchg:
> 
> arch_cmpxchg_relaxed:
> ...
>          switch(sizeof((_p_))) {
>          case 4:
> ....
> 
> arch_cmpxchg:
> ...
> 	BUILD_BUG_ON(sizeof(_p_) != 4);		
> ...
> 
> _p is the address pointer, so I'm thinking it's a typo but I couldn't
> yet confirm. There is not much about arc processors in the web :(

Hmm, indeed. This seems like a bug but it depends on the 'llock  %0, [%1]'
can take a 32bit address or 32bit data register. Usually it should
check the size of data, but need to check with ISA manual.

Vineet, can you check this suspicious bug?

Thank you,

> 
> 
> > Thank you,
> > 
> >>
> >>>       Arnd
> >>
> >> Regards,
> >> wuqiang
> >>
> > 
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
