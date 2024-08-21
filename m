Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFA4C531DC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Aug 2024 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJwuNmhKB2Z+LekN5l3oLCj5OqVOcpuLNaldxlyN9EY=; b=2dZbmbr7qru+1b
	DOAJ6CM3YoKfsk5jGcJEgK3LoAw7iNTCcweefXAC47piPjHXH9VJVjFlJhLgUnH4ScXM4PGGdSq/g
	Q0pUSp4pgK9dteYIHjCMnr9SekRrnZH2RoLXnWkpXoiacEIr2LP6M1NNkHvniSEdp88V0aQddztUK
	2bZ2XeWqKZCfOq9LFc53mH/n6rTyQy6RHPWsdP7964NLrP/bjDIuyNj9gTZtUmV2syG2hfyrvGVCz
	di9ARdA/JKLR5QPG559qecDe7sJf25MDhiNL7su/MB+fypGEohljDln/kh440CheOZNrFuJkHRspQ
	VTjdUcnit2E/HmzSGMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpf6-0000000A08E-0nB3;
	Wed, 21 Aug 2024 18:02:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpf3-0000000A07O-2uPw
	for linux-snps-arc@lists.infradead.org;
	Wed, 21 Aug 2024 18:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63D89610AB;
	Wed, 21 Aug 2024 18:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07ED8C32781;
	Wed, 21 Aug 2024 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724263339;
	bh=McNAGRZDnJ7u79fmlszPR8St8pd0flKr5dQvmUicyWg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=c9fH/UCwU4ovqXBiXcpHiMBfm5emz7PVbY4+KAe+V9wvRs5Y8v9Z0V4ajuP1Q26a6
	 skPF4b52M7xH25Xneik/dnR35/M3KAGhdOSCczgMjdN18xPLgpNBCcMcXLDwFtqwVf
	 C8CjdOqD862ATRW1q5+ER0btPtUzdL2sRmDL2oc03TbX6cbtJdA8KZEPjYf1/vfozI
	 xXANc7Tqiqjo3rf37jLTZk2saQJoIVNh24SX89MS3k4pittEFa0a8MIIlDnBX1pwbk
	 ytbfRZzuwg15DBxxOwqjjG+UdREaDVK2EgHrSYNSqUnXIwAYAFgRPH8RQup57RUvN8
	 o+bclw4MRIsfQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 99434CE160F; Wed, 21 Aug 2024 11:02:18 -0700 (PDT)
Date: Wed, 21 Aug 2024 11:02:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
	peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de,
	geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 cmpxchg 0/3] Provide emulation for one-byte cmpxchg() for
 v6.12
Message-ID: <04a6010c-536d-4906-bf7c-b2335a2f54b0@paulmck-laptop>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_110221_817956_2B7B9104 
X-CRM114-Status: UNSURE (   9.52  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello!

This series provides an emulation function for one-byte cmpxchg(),
and uses it for the remaining architectures not supporting these in
hardware and not providing emulation.  The emulation is in terms of
the fully ordered four-byte cmpxchg() that is supplied by all of these
architectures.  The emulation has been used in mainline since v6.9
by csky.

Once this emulation is in place for all architectures needing
it, RCU Tasks will use this capability in place of the current
rcu_trc_cmpxchg_need_qs() open-coding of this emulation.

1.	xtensa: Emulate one-byte cmpxchg.

2.	ARC: Emulate one-byte cmpxchg.

3.	sh: Emulate one-byte cmpxchg.

Changes since v1:

o	Add acked-by tags.

						Thanx, Paul

------------------------------------------------------------------------

 arc/Kconfig                  |    1 +
 arc/include/asm/cmpxchg.h    |    6 ++++--
 sh/Kconfig                   |    1 +
 sh/include/asm/cmpxchg.h     |    3 +++
 xtensa/Kconfig               |    1 +
 xtensa/include/asm/cmpxchg.h |    2 ++
 6 files changed, 12 insertions(+), 2 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
