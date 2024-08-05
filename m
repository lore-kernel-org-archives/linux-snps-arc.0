Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1495C3DA7F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Aug 2024 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MYdvFqQM6hAikHQhdKwFCMObDSKJkEflYGKzSUQu9B0=; b=lU9
	fwioUioHr0RqX2nYN4o+HC4weCkWjjV1JLU6MOD5/mvWh7wxBd39l4tZNDRd+cdwNz4wrfyoczfeV
	F922vfMAcv/WRJNHgE4Y2lVbsRYQeBg4p5+6F2TPrnd1Jm1fmQVkeSRtTisu8F02CvX4tsJzzlETS
	SZ6XtF0FeRPa0AefhJb1dW674msUnr1jHDZG0sMZhP3ozdQ0ge6kbM3BYMwn7A2c13ETwEEp/+k7l
	9LwSKyQeRmABEMbr9EhyzvcvgnYIHZVZdSuBd2HEneYMzZ1U+lrEdY76BK2AxcDiaJ96naS1kLTFT
	CD6ke9hFyYT8lXIzguTG6QzLvoEo9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3Fz-0000000GzGW-0ytV;
	Mon, 05 Aug 2024 19:20:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3Fw-0000000GzFp-2QMD
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Aug 2024 19:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8013CE0B6D;
	Mon,  5 Aug 2024 19:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA8AC4AF0B;
	Mon,  5 Aug 2024 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722885630;
	bh=yDMt0EqrqAyLKxe7X4rCEOBXWgRTFVTEgyEZvPiduZo=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=aCHw9O+3I7TwTqw2bgfYVX6WUAu1hjbYIeBT6Tvsk5RZkdWLdrx1y79mOL30w9ic+
	 T3B2USrL8Lb6wosurq1IxTway3u1g6PZo6ctQ+rfZ/41S/ad2pfmEZ0CrBrhSrby6F
	 Yw23/AFYdNfctK6rax3X9KEaoWk8DzIzIeG+ospSOHPd0wlfaQUkVs9ECdl18vZYcZ
	 pOON4GD3hv3t3ETaOq+GIaJPOJQ5v3VWHEWl5TaTQjP2p7LKrDB+XYk6sm8eZjgaj6
	 IwEjGGRDVcgxCwlHZXSY3p27ALgGEhws0COdLj9PqOjJZkfcqrfoRf3n/a/xSZcmPW
	 LRA2d52n+Y2IQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BFCC1CE0A6F; Mon,  5 Aug 2024 12:20:29 -0700 (PDT)
Date: Mon, 5 Aug 2024 12:20:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
	peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de,
	geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: [PATCH cmpxchg 0/3] Provide emulation for one-byte cmpxchg()
Message-ID: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_122032_807584_3DCE76AF 
X-CRM114-Status: UNSURE (   8.59  )
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

						Thanx, Paul

------------------------------------------------------------------------

 arc/Kconfig                  |    1 +
 arc/include/asm/cmpxchg.h    |   33 ++++++++++++++++++++++++---------
 sh/Kconfig                   |    1 +
 sh/include/asm/cmpxchg.h     |    3 +++
 xtensa/Kconfig               |    1 +
 xtensa/include/asm/cmpxchg.h |    2 ++
 6 files changed, 32 insertions(+), 9 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
