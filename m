Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30991CA5FFF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 20:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ScHNHUtQbqa/6scMX1oQ0fy/09Xmxj2+S5DO/ieJ+dY=; b=wQM
	hvFduuhsp+La9vBoHa5G4qXPdtQueVoEJn9071YWkhcpnMRJl6/0OGB6tXJ0HDXB2SxmzzgwMxzJ/
	Y/N7lSfScCQjHXElXTuYtksJw7qUM07A8lBMcDUTRsfsVBIhccAJipBK/VvTvHo94f22dV6stQB5h
	+Iseb1/Qw8/WYBX6XcAZ/vk8CmiUbVGLFu4JVKQPJGo3QsS7ajD4N7YJXxgcQ9Yc32uSqxeTfjhjI
	oeb3Adwtc6QancLnNQC4IniUKxk9ENLiSNLVju3fXbDQJVI/GniiaKCwFnh12fR4/sl6ldzT+/5Md
	xB2ASrFRxMhnGi5GpbRFxjcBRvVEK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYMu-000000038kO-0MrC;
	Wed, 07 Oct 2026 20:36:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYMs-000000038jw-3S9I
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 20:36:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 478FB43835;
	Wed,  7 Oct 2026 20:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2261B1F000FF;
	Wed,  7 Oct 2026 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405362;
	bh=s2dr5ZtYxDvsJVmv19YUiGWV6zK4NMpNX2VkLiAlLUM=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=O+d/K0iJTokxmwTEPDNJiuOLU9sPsSxEA318JmC+Im3Uf7yyiy0vuK8f4nKkcWcWD
	 xBEJCJsje+nyjvM1sbmNt/0/hgldaLaJ3U3hHFFzQSAnkRMQ6qtSk1pmKSr/8ELRWx
	 mFdw7cu/Gi5Qrr6KpNsC1mXMFiW9nAUciUGnpuuPYeSCW/dnpwZu5lA0gF5FWl29eP
	 nLVZwWBH9Dm0YGPvDOloVX/uhBgfcDgAryF4hqSdFZy1IFHEsT2GkknUMOUEaEdHXA
	 N9NRVgybo7IByqFEj+EIeTsfHB984Jp16zzHvkc7VdraclLWZS0jfQfARnPSN/2WLY
	 L6aBRdPbOyM5g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ADEA5CE0D79; Wed,  7 Oct 2026 13:36:01 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:36:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bradley Morgan <brads@mainlining.org>, Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/5] Provide two-byte cmpxchg() emulation
Message-ID: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
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

This series provides emulation of two-byte cmpxchg().  Note that this
does not (yet) allow free use of atomic operations on two-byte operands
in core code because there are still a few supported systems that do not
have two-byte store instructions.  However, this emulation does permit use
of wide range of two-byte atomic operations, so is worth putting forward.

This series is being reposted on request in order to ease testing efforts.

The individual patches are as follows:

1.	Add two-byte cmpxchg emulation function, courtesy of Bradley
	Morgan.

2.	sh: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.

3.	ARC: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.

4.	csky: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.

5.	xtensa: Emulate two-byte cmpxchg, courtesy of Bradley Morgan.

#1 and #2 have the acks required to go into the upcoming v7.4 merge
window.

						Thanx, Paul

------------------------------------------------------------------------

 arch/arc/include/asm/cmpxchg.h    |    3 +++
 arch/csky/include/asm/cmpxchg.h   |    9 +++++++++
 arch/sh/include/asm/cmpxchg.h     |    2 ++
 arch/xtensa/include/asm/cmpxchg.h |    1 +
 include/linux/cmpxchg-emu.h       |    4 +++-
 lib/cmpxchg-emu.c                 |   38 ++++++++++++++++++++++++++++++++++----
 6 files changed, 52 insertions(+), 5 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
