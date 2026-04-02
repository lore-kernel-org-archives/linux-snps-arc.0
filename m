Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E0D39410
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2026 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSUq2pgGXb1RWEt7F883WtMTGaNU0HCmYzBsb6Pnec0=; b=VoQEilXK66rLoU
	aJ9tdEDnfvYhh2e3VAD2IWJUMtV8hur2N3lp5SGErvHC8lzgKk54swvFhBrMQhQN6PsRLkFhst6oZ
	SMgpQOHixghAQ6ZHySoWc3FhQvseFkzFcAJTPric22mLOk+MND5J01mxpOgVsxzCwFg/MJtnwTMLi
	tXWWIxNeqbnflUHl3Sm17UIVYwb33MYSkJRtQ+cH7/Z+tgHHg9hVLSz47TDP+6k3o0OLFZ5HtJ+II
	IC1d/SgeDallGAGEjDR9l/asjIlQrG5r291Rqi7oWzX5Li3FH6CS0b9wWbQwi7DaK2Sv9m1xnVcDG
	DhSFmIdXd+OTqwKPPbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FaP-0000000HQpV-3ury;
	Thu, 02 Apr 2026 10:47:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FaN-0000000HQp5-3x64;
	Thu, 02 Apr 2026 10:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WuSnxkIyTO13mUz+vZ1/ml/c/eqQ5D0dK9NUy7xy4Pw=; b=fWHvfBdkYBp1lDE/7yjJLeJyG4
	TDG024jO+otVJtwiymsQjjwAfzXysI0Ne/Hap+hOUQ6HF3At22XcXejbtpYlWZVb7GLO9iSy8lBz/
	xXoiPgVJTNjnS6NdQ+JrLTq5kguJS2cahxS6gs3sXaw3b07PcCyOKgqMNnJYuSMZkSWQ1zbwrH1lL
	oQvCfWFVfYg2y5n87Si+3p5rgef7vqX5HJwvSTsRp8czWpsWUtQti6XMSrgnlzRPw7jmDhnI0sbSY
	FLNqQFUUhtoZK6LgqB9dMKy1Plr2pBXtNoo1Rj1bEdri+YGju2kRuh4KtAyO/E8p9i0u4EW5ey6u+
	j2zCRXxw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FaH-00000002G2g-3cX8;
	Thu, 02 Apr 2026 10:47:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 53C6A30301D; Thu, 02 Apr 2026 12:47:33 +0200 (CEST)
Date: Thu, 2 Apr 2026 12:47:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <20260402104733.GZ3738786@noisy.programming.kicks-ass.net>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
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

On Thu, Apr 02, 2026 at 02:56:01PM +0800, Hangbin Liu wrote:
> The old value passed to cmpxchg() is semantically read-only: it is
> only loaded into a register as a comparand and is never written back.
> However, the macro currently assigns it implicitly to a local variable
> of type __typeof__(*(ptr)), which triggers -Werror=discarded-qualifiers
> when old is a const-qualified pointer and ptr points to a non-const type.
> 
> To avoid this, let's add an explicit cast to __typeof__(*(ptr)) for the
> old local variable in the cmpxchg macros. This explicit cast suppresses
> the -Wdiscarded-qualifiers diagnostic.
> 
> The new value is intentionally left without a cast: new will be stored
> into *ptr, so silently accepting a const-qualified new would allow
> callers to store a pointer-to-const into a non-const location without
> any compiler warning.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---

Where is this a problem? I've never seen this. Also, new code should
probably use try_cmpxchg() anyway.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
