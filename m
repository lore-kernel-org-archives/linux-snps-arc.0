Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF8CA0FE7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Aug 2025 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBoogaHnh1UKRg2Nh0ZMSZbdp8g2PnJXkFiJUaHZYlU=; b=dNwaeKQumXYa47
	A1voUpKLcycTCsFhiMFgCZ1zlPd5dQ5/KNAe3TQVlaFjy18SiJiNchC7KQyLDBBYZE6ZWaF0+7C+u
	YHshACnhFjmbHWtsGbUz4KuvHggJEfP0CoeUOBLiIqJm4lWxIeN4thYh/CMP1+jTj9qtRpXUgkDuK
	5udYXsyDx9QQKYxdx4SL/OdF+PZ9sYibQ0lsoWqPfm+kV6ux48AEAHyyGa500YiK7xDsN7e+48S1c
	RQlQq+wVvatBYpdIRGLYqj5PczV9TSkBXoCl6cw5Cg8vqlQo33Kl25f5ws0nznSpNDE5Vnx+OnOpe
	q8aONAGmox6vLwdfHkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwxv-0000000ChES-19M6;
	Tue, 26 Aug 2025 16:56:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwxs-0000000ChDX-2Gry
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Aug 2025 16:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E54F5C628B;
	Tue, 26 Aug 2025 16:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00421C4CEF1;
	Tue, 26 Aug 2025 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756227367;
	bh=VOKcXvOVDMlVdIq/9YenDUzJQ2ngSu2wlVMbNmIoeR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4lD90DTmr0M65OhH9CjX56WieA/RvNicew8YlXel+J6eox/mEwaMNWxA1dsupz84
	 HBXNLYChP72S7GLSmod+6z+2ULll4VrxMikr4AeaWIH7SJ6Lbk0jJmIREydk3C+12j
	 emZUJpRLN+uUgJD7hCa/GYe9+gi1MeNKDZWoGMO4Cr6QeHJ/CFaDIOuV4KpSvMAZ3/
	 uGNnomU6smQeQNgMkwl9eSypvQmdPL1AloPTuppbsC5YRpKOh4ZDA5e3BxCTKMPOdh
	 LVihbOwl51wRKZ7z2d/ZRRTNPbcNgbckaw6el8wKdEpPJLofXRgWQMFkbszkTha+gS
	 CbvMapmh1J+VA==
Date: Tue, 26 Aug 2025 09:56:06 -0700
From: Kees Cook <kees@kernel.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: Yury Norov <yury.norov@gmail.com>, kernel test robot <lkp@intel.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arc: Fix __fls() const-foldability via __builtin_clzl()
Message-ID: <202508260955.2DE50A3FB@keescook>
References: <20250826034354.work.684-kees@kernel.org>
 <87ldn644d0.fsf@prevas.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldn644d0.fsf@prevas.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_095608_617594_A456DE75 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, Aug 26, 2025 at 03:08:59PM +0200, Rasmus Villemoes wrote:
> If __builtin_arc_fls() simply doesn't qualify for attr_const for
> $reason, I think it would be good to have that documented in the commit
> msg. If it does, I think a gcc ticket and link to that would be in order.

I already sent the patch to fix it. :)

https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
