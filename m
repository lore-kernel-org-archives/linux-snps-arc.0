Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE7CCA5FED
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2026 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNdJfXeORqXq/CWu6+HlDso8AFckt0I0hsuWAcRD6Vc=; b=jYI3r2vNo4jXAa
	HXCM+LbW9T9catO9DuRoPM3CL5H4YbN0YgUBnaGMIwlC4LY28n3GmFUyWN4/wQ5Lk3mUq/HeFnyjf
	kT6oTEeMwRSRxy7JFWdbltJM8GUBLwaZ1eFW7RpnirxUDgACuVOlDooLxIGGxPnbyumjEIYu/RSdW
	FfT++SQpumUBABwrj62Y/YWV1gj+i1JsjxtxMs57/74nsQDMMJSQELkB+FqbxViGiLh5JNeGadGmD
	7vGeN5zidWqARAshRUaJf0X9sNvfad65Wwu47FHX9PYtFLai53PAYG8MGmcyNYq2eNdQFNrYDXgGe
	gbNIjFRok7nfxAnpzXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9ww-00000001GhZ-1Hbj;
	Tue, 06 Oct 2026 18:31:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9wv-00000001GhP-17cV
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Oct 2026 18:31:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 077E4404D3;
	Tue,  6 Oct 2026 18:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85AF1F0089B;
	Tue,  6 Oct 2026 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311494;
	bh=L+CAyxMbNE0hdT9QbAIjobxPCVS61YUmS/QbI5hWDeA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CM0UcrfLZusPd377zOjzS+f364rvssPlo5XEF3IU7VZhMDJr74n3js/8abQ7hoSih
	 IP7LF/zvExfF2wVKMKFzIJHQQ8q7hoDwgs8a6gWWZNmm1CPlQA0Zh16UnbKB5mmvn0
	 uFF8HbLlApUlS+iODAdckeN8lQ8kGftAG4zykrdC9CnbJjbOWfkKx+jeJODGarqFVR
	 fzqfVQoIcTXqCayo6Vk4Y/dGJmdGxsaYLb3JI0nWyxfatqPXXgl91gswVhn0XRg+oc
	 Pn8U0rNz87Ez8Em7+ug3dpzCy5Lr0cRcOWt4LAc96DvB3UW9R3JjN2Q6tl+6MdAng4
	 EXOxROxFc6mcA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 92A59CE3A08; Tue,  6 Oct 2026 11:31:34 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:31:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
	chris@zankel.net, jcmvbkbc@gmail.com, arnd@arndb.de,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <01b489b9-f1e8-4079-b8de-9ab97ef61301@paulmck-laptop>
References: <20261005120700.383058-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
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

On Mon, Oct 05, 2026 at 12:06:57PM +0000, Bradley Morgan wrote:
> This is v5 of the two-byte cmpxchg emulation series, reduced to the
> three architectures still missing after Paul McKenney queued the lib
> and sh patches, ARC, csky and xtensa.
> 
> The v4 attempt at these folded in a type checking idiom,
> (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> to compile. The kernel test robot and Vineet Gupta showed that idiom
> breaks real callers, fs/crypto/hooks.c passes a char * and an
> unsigned char * to cmpxchg_release(), and the conditional expression
> then has incompatible pointer types, which is a hard error on gcc 14
> and newer. So this version only adds the case 2 dispatch, the
> declarations the architectures already have are kept as is.
> 
> The ARC sizeof bug that v4 fixed along the way is in mainline
> separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> to use size of pointed type not pointer"), so the ARC patch here is
> only the case 2 wiring on top of that.
> 
> On the why, RCU previously used single-byte cmpxchg(), which is what
> motivated cmpxchg_emu_u8() in the first place, and Paul has now
> queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> it into the architectures that need it is the missing half, and
> there are existing workarounds for the missing two-byte cmpxchg() in
> the tree, _Q_PENDING_BITS for one, that can make use of it.
> 
> Per Paul's suggestion each patch is standalone and can go in
> independently, they only depend on the lib patch already queued.
> Each one was build tested with the real cross toolchain, ARC with
> arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> builds Vineet pointed at, W=1, with the macro instantiated on
> u8, u16, u32 and pointer types, confirming the new dispatch is
> reached and no new warnings appear. The pointer instantiation
> covers the fs/crypto/hooks.c case that broke v4.

Queued for review and testing, thank you!

							Thanx, Paul

> Bradley Morgan (3):
>   ARC: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg
> 
>  arch/arc/include/asm/cmpxchg.h    | 3 +++
>  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
>  arch/xtensa/include/asm/cmpxchg.h | 1 +
>  3 files changed, 13 insertions(+)
> 
> -- 
> 2.53.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
