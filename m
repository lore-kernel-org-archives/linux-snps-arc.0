Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CBACA5FFC
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2026 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEy4f8jrFlgVlAwxnNTsBoIMBg33NBKFSu1/1mePXsg=; b=vnqzFzDmdRM4/J
	UmRiNFVnEwpuAOf2Hzf801i9H+lbz0EQEJ8IbmbH8L+gbWnhBu+Uld3Xf+6MktY1yS3PwNhxeh/SO
	fKlT6sf2MXPlmN0tKnVLIIm1kDf08kACaKwhKdlx2IO5ROSy5lW9jKZ6gWF82YbxsGeGpE1uJl3TJ
	lF7e8uc5dVs7/lLseuxCpz3JKVCZ27AVQfr4gMQvERYY4ONZgJ5Zo+oPRiBlktvhZUCahlJXXxKSo
	MaboOkNvpzuh1Nnq7mV23ZP+Dq06hxqDaj71V107GHRZEja/uqLfFzsdaGzs542voZCpeSeZI5w7/
	pB8EgQj7032wFYFjztUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9iX-00000001FLJ-1vlp;
	Tue, 06 Oct 2026 18:16:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE9iV-00000001FL9-349O
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Oct 2026 18:16:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EE3A40F0D;
	Tue,  6 Oct 2026 18:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1941F0089B;
	Tue,  6 Oct 2026 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791310603;
	bh=SOZ+aI+KSR1UAkYe0gazlY4BGayfc1zklSYDKuyOR0o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=nV3+PNfB1rqBHlAapHoj1VOlOJmURxsIifQ5jciLn/K5aUBq+0HV4KdAfazxkutMb
	 UfJJBeugVtFOIkRGadW14XuzlTQn+QRr5DCe7uV4q6fkzHZoyo0kIbLVcPdqamnvFI
	 +uWh8NDP5WByahQ7vdbO/FbHbWrME5l2EbpFH4vl+wsC46R8gWp7QNZ4BKGA5IYYd5
	 nGI9Lz2XoBeIyy5cvq9RtL/9K8g+XzQW65NnCfzf6TL+5P7CdqOa4SsNDdRvSdTLXa
	 HAE4JyhL2+f+x2jREbzJzlJTvHHQreoLL154QM9z6JyQ12et0cNtEUk3WhbIDsCsM6
	 hNTgIFrOvE36A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BD4F7CE3A08; Tue,  6 Oct 2026 11:16:42 -0700 (PDT)
Date: Tue, 6 Oct 2026 11:16:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, arnd@arndb.de, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
References: <20261005120700.383058-1-brads@mainlining.org>
 <20261005190205.26f17469@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005190205.26f17469@pumpkin>
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

On Mon, Oct 05, 2026 at 07:02:05PM +0100, David Laight wrote:
> On Mon,  5 Oct 2026 12:06:57 +0000
> Bradley Morgan <brads@mainlining.org> wrote:
> 
> > This is v5 of the two-byte cmpxchg emulation series, reduced to the
> > three architectures still missing after Paul McKenney queued the lib
> > and sh patches, ARC, csky and xtensa.
> > 
> > The v4 attempt at these folded in a type checking idiom,
> > (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> > to compile. The kernel test robot and Vineet Gupta showed that idiom
> > breaks real callers, fs/crypto/hooks.c passes a char * and an
> > unsigned char * to cmpxchg_release(),
> 
> That ought to be a bug...

Perhaps it is?  Here is the code:

	cmpxchg_release(&inode->i_link, NULL, pstr.name)

And inode is a struct inode, of which ->i_link is char*.  For its part,
pstr is a struct fscrypt_str, of which ->name is unsigned char *.

But this is either a 4-byte or 8-byte cmpxchg_release(), depending on
CONFIG_64BIT, which is orthogonal to this patch series, which provides
2-byte emulation.

Therefore, I see no reason to hold up these cmpxchg_emu_u16() patches.

But please let me know if I am missing something.

							Thanx, Paul

> David
> 
> > and the conditional expression
> > then has incompatible pointer types, which is a hard error on gcc 14
> > and newer. So this version only adds the case 2 dispatch, the
> > declarations the architectures already have are kept as is.
> > 
> > The ARC sizeof bug that v4 fixed along the way is in mainline
> > separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> > to use size of pointed type not pointer"), so the ARC patch here is
> > only the case 2 wiring on top of that.
> > 
> > On the why, RCU previously used single-byte cmpxchg(), which is what
> > motivated cmpxchg_emu_u8() in the first place, and Paul has now
> > queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> > it into the architectures that need it is the missing half, and
> > there are existing workarounds for the missing two-byte cmpxchg() in
> > the tree, _Q_PENDING_BITS for one, that can make use of it.
> > 
> > Per Paul's suggestion each patch is standalone and can go in
> > independently, they only depend on the lib patch already queued.
> > Each one was build tested with the real cross toolchain, ARC with
> > arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> > builds Vineet pointed at, W=1, with the macro instantiated on
> > u8, u16, u32 and pointer types, confirming the new dispatch is
> > reached and no new warnings appear. The pointer instantiation
> > covers the fs/crypto/hooks.c case that broke v4.
> > 
> > Bradley Morgan (3):
> >   ARC: Emulate two-byte cmpxchg
> >   csky: Emulate two-byte cmpxchg
> >   xtensa: Emulate two-byte cmpxchg
> > 
> >  arch/arc/include/asm/cmpxchg.h    | 3 +++
> >  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> >  arch/xtensa/include/asm/cmpxchg.h | 1 +
> >  3 files changed, 13 insertions(+)
> > 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
