Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9656FCA5FFC
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2026 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+tOz6gE7DDi5zniIjdmZbRQuWg5Elm+yQsbHNTbVcM=; b=oYRSf7Da9UemAV
	EFBVcWoX2FM45lxCORhK04Hh9HLpYb15TuOvZbSV5MOjXs6t+KWW+Hy6SxSV5eJ4H6FBJLDuQn4N/
	4OYTEwdDMi/HIE4oOttUwRyKeyVtE6MBOxKAptr+PAqLQUHKY3xdaUkP3dioiZqqVd8ZOrpF3Bj1G
	ZU8Q9KYVdQtDTEds7q9Tq+vNaEXWEC1mGgGOoj/pprbU5Ecxt4ttdqz+t1TggDZwBRWLcYKUhsKkG
	Q1OimWeU6u6Oa6LJ3AgarRr5JXin5NGYzlamJo/zWYFks2U4KY/b1+kvS8D9z96n62XCNLEoi54gW
	lHBfPDyvi5bkBSIyJqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECfY-00000001P4j-1rc2;
	Tue, 06 Oct 2026 21:25:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECfW-00000001P3n-2vFH
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Oct 2026 21:25:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49ff680331aso34424485e9.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 06 Oct 2026 14:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791321948; x=1791926748; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzistxaYnghCdHKPFD1L5qK7yOScebgk7YUgF/bSWzI=;
        b=rC41vBSYRcQh2CEH37BHAs+mzB9nubCcrHizwQ9H9BLG9/JbT+/aSemnYIhGTnWacC
         HVNf2Bbr8WCxNZImVoB2vCEG9iiCK7KwlbGJuykYsfmcC8n17NbJH1LUE0dATAhB/4/j
         CfM4goFq1u8Nugq5MpnABeKi6bBPL5IJWZDOM26xmpUkSdE5BWnd9xLYmoUfPk0hj+oL
         xYwogxCbDpgv0kbCfsQTOt6IgLBEozERvQS/F82nz75bhFAA2hEc8G5Ycr4Dk3q7Nuwn
         vRsuT9yxqZ+FZ39pcV+FG/GtwSQg7oFEnuOlHGnJMPCiepmNTXBSo1pXmFumrT+9TFR3
         XVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791321948; x=1791926748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzistxaYnghCdHKPFD1L5qK7yOScebgk7YUgF/bSWzI=;
        b=kxMVhLeVBf3Z5MbNVwBGG1cyDlEL3qaD8DNHJYZll77zAYxNb3DeEth5svONOkfeZH
         Bgdw2khywaTDTdlqCK2zTT1/i4y2mxe6znDSBApL7qzNEIdWhP72RSFsuvjzxzQAsSLi
         EaZtqsg/g7j+YjgRvbSSG7MaSDmISmoom7APYYZca8Xefo5tWHJ5haKbOXUEawl/pR+X
         WwvUwOYBV2xOghw9k2B3tZgyshpBIX3uGj1Rfn/XtTyv5RPRs8XVmlSoUPdcYNHHgnWV
         bKp7doJJoOtaQG/8Jd/PxJpDKPxY6+KFaA9BRy8A+ZRwIck09a4EnKz03gxBXKA7morz
         tXFw==
X-Forwarded-Encrypted: i=1; AKwUvBxUB3/Df6aSvCxzcM5HnHeZfLJzgF+6W4hgYPp06iWB13cYM+60gHZ9rci8KRwAr4hT5vop+q6LULPw7Q7KDg==@lists.infradead.org
X-Gm-Message-State: AFuF++l2Bzqm/N8CWCmIJJV41H6SHQJa6naRW3udDV+JHKP1IkObsZI2
	iZBrQgXubaJYLtqCIR61sBULaHT/ElDS1YLh90rBHwyi1xPbgatoa5HF
X-Gm-Gg: AYBFou2B6DtLXHgIZmgfe4XLGlPiczHR1iHvEj4MF5gToTSQPiKVzjyI5DNfdSIBuNa
	lzDdD7dk2CeZji4isoi/9YKvuQ2jrryfhdksbMlCELrnlhOZmjn9DrbpKAAwAR8gBG781BrdZAB
	MwKbnuTQomQ6m/kwgTavEX/DMsYspuGEvyDLhhdAuw+mv50M5Pp8+5uUr7b7s4N4Wnzfg08LMHr
	OdG8TX+XhtfC3wQscqAVi5JlVjzjsVV0T3D29ci8/m3ZpvZgxGJzBSgcnrlm1cGzGU+UOIcLBGl
	nEicf0YX8hmnZeBg8nyPdUznDDJiEfCRFDsPhFtq26nA/VNLCQKLaFDQAC+X34YcuLKe3PvzWln
	kPEzh5CUmIyYIRecO5h8NL5dK5EhZQ7oLsW4/r5Ajn8KhSxgQQtmVHPdhsC4dTlh4bA8AxJulIB
	sBtzapK1lbJxb86pqExou3QUR2MBJB9igy34X/0fx/UlXzfRkU8PtL/kirwPpWEwPrpE+iq4uG5
	iD0JSECjpkKQ9j55s2VwQyHAkIw4tTUl2o=
X-Received: by 2002:a05:600c:1911:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a180661070mr1425175e9.22.1791321948177;
        Tue, 06 Oct 2026 14:25:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1802cea1csm3575155e9.3.2026.10.06.14.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:25:47 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:25:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
 vgupta@kernel.org, guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 arnd@arndb.de, glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp,
 dalias@libc.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20261006222546.6b667d1a@pumpkin>
In-Reply-To: <84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
References: <20261005120700.383058-1-brads@mainlining.org>
	<20261005190205.26f17469@pumpkin>
	<84b6f3c7-e498-4931-97c2-75ea5158b99a@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_142550_772792_00D8AF88 
X-CRM114-Status: GOOD (  36.89  )
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

On Tue, 6 Oct 2026 11:16:42 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Oct 05, 2026 at 07:02:05PM +0100, David Laight wrote:
> > On Mon,  5 Oct 2026 12:06:57 +0000
> > Bradley Morgan <brads@mainlining.org> wrote:
> >   
> > > This is v5 of the two-byte cmpxchg emulation series, reduced to the
> > > three architectures still missing after Paul McKenney queued the lib
> > > and sh patches, ARC, csky and xtensa.
> > > 
> > > The v4 attempt at these folded in a type checking idiom,
> > > (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> > > to compile. The kernel test robot and Vineet Gupta showed that idiom
> > > breaks real callers, fs/crypto/hooks.c passes a char * and an
> > > unsigned char * to cmpxchg_release(),  
> > 
> > That ought to be a bug...  
> 
> Perhaps it is?  Here is the code:
> 
> 	cmpxchg_release(&inode->i_link, NULL, pstr.name)
> 
> And inode is a struct inode, of which ->i_link is char*.  For its part,
> pstr is a struct fscrypt_str, of which ->name is unsigned char *.
> 
> But this is either a 4-byte or 8-byte cmpxchg_release(), depending on
> CONFIG_64BIT, which is orthogonal to this patch series, which provides
> 2-byte emulation.
> 
> Therefore, I see no reason to hold up these cmpxchg_emu_u16() patches.

True.

David

> 
> But please let me know if I am missing something.
> 
> 							Thanx, Paul
> 
> > David
> >   
> > > and the conditional expression
> > > then has incompatible pointer types, which is a hard error on gcc 14
> > > and newer. So this version only adds the case 2 dispatch, the
> > > declarations the architectures already have are kept as is.
> > > 
> > > The ARC sizeof bug that v4 fixed along the way is in mainline
> > > separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> > > to use size of pointed type not pointer"), so the ARC patch here is
> > > only the case 2 wiring on top of that.
> > > 
> > > On the why, RCU previously used single-byte cmpxchg(), which is what
> > > motivated cmpxchg_emu_u8() in the first place, and Paul has now
> > > queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> > > it into the architectures that need it is the missing half, and
> > > there are existing workarounds for the missing two-byte cmpxchg() in
> > > the tree, _Q_PENDING_BITS for one, that can make use of it.
> > > 
> > > Per Paul's suggestion each patch is standalone and can go in
> > > independently, they only depend on the lib patch already queued.
> > > Each one was build tested with the real cross toolchain, ARC with
> > > arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> > > builds Vineet pointed at, W=1, with the macro instantiated on
> > > u8, u16, u32 and pointer types, confirming the new dispatch is
> > > reached and no new warnings appear. The pointer instantiation
> > > covers the fs/crypto/hooks.c case that broke v4.
> > > 
> > > Bradley Morgan (3):
> > >   ARC: Emulate two-byte cmpxchg
> > >   csky: Emulate two-byte cmpxchg
> > >   xtensa: Emulate two-byte cmpxchg
> > > 
> > >  arch/arc/include/asm/cmpxchg.h    | 3 +++
> > >  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> > >  arch/xtensa/include/asm/cmpxchg.h | 1 +
> > >  3 files changed, 13 insertions(+)
> > >   
> >   


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
