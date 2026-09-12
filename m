Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B37FC79FB6
	for <linux-snps-arc@archiver.kernel.org>; Sat, 12 Sep 2026 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rru9avlxyHS0J7fxUoHqhWgQrKMjKyNNbh1VcDo+W7A=; b=DVvyTcHdWFFKec
	vWZZ4MuRbZTqNq8QucNhMXpTdc3Ht8/WLOl51AVWHnuVtMDid5ks42myok5yL1Fhk2BqH1/5dq9v1
	I2ltgJNd/zni89KXG9cUGIKsvXKWbga4Jdc/OLk4FobZkgs604hObVPJdK140P8IT5X2xr9Ik4Mby
	j+hYqzTyNTU8wE2z9TBB1sFJUbEiwDfPE9eOEyG/wpZfynXkNGlzTHwUOXs9cRgyNBQ3mrlGoa2wN
	bvvUhQYbaBUv1YqVKvpwoHXBnz5LIF5ZYkGZSRJSYK5vb08f/+VzV+DUpmqZRtWyIy1+rtz+4wZm6
	C5G5B2XUDHNWF6YNdTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5K4X-00000000kHU-31q3;
	Sat, 12 Sep 2026 09:30:57 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5K4Q-00000000kFz-3f5Q
	for linux-snps-arc@lists.infradead.org;
	Sat, 12 Sep 2026 09:30:54 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7355e411so329225e9.1
        for <linux-snps-arc@lists.infradead.org>; Sat, 12 Sep 2026 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789205449; x=1789810249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIDaovYKooHqH78d/6XZ6tf1fVeqSDWOw5EQD+FAKCk=;
        b=WMiAb2triWWbk9pIFjqk+aN4wlflpPANspaeP7Y46eu5cwM5VzdjwWR8wkDdDL3EOg
         BA6GFjJrH5C2TgCmHihBsS2D1bUtASU9dPcFEIHIWGiQBbsrb+YjrKGfS4h2LCzE5D20
         BgyeQG7m5xQ2IQrb49R87rSeJhpo7PbYEwFzzT7wivpthNQsplsRNxfFEe721K6f5Q7M
         kAEIhHXgCN5ihpU0dsqXbxS5dqaee+LPvTJoRUxkDbltUq0FF0oj4HDk0jKNOYxmQRAy
         QZI52Ln3gABi6SQjTXGKmBWQIi0hLoHRmIBKJO0KnCrF445S7iuMgS8Osl24CndTC7IJ
         +MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789205449; x=1789810249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIDaovYKooHqH78d/6XZ6tf1fVeqSDWOw5EQD+FAKCk=;
        b=oR8U+23nc/7QBWXz2FaCXBhwh45tDDRjzxTdCA9wc5U2BEgsFRQIXKb4Uulpgb4vW2
         fZXQD4kp51xyZisvk+E7Eu7I7jRrkrh9UA68pCRuOLs+OizelUoeiDxcEZhtNyaU9kF+
         GK5GEKLrZ+qSQvX/e/+2ke/PyeRAUQXp8zS4ZnhNSI+gksK2diDXMXihdMbUErH7PZgC
         PJIzoOQR2mLQHjeuOPv9QDHrOQlNuWoohvb/+9Mby4h02EROk06tyfxXhX5J4x5O+WFE
         9rr65RFfk5xEIVVL4f7Z1QnuaedUhPtSKo6QHH48qQSUeFnkZh464fDUlAC2GpTDUaVv
         zWIA==
X-Forwarded-Encrypted: i=1; AKwUvBytTv5pxFPI6X/vwexzCMF3k9QfwQ8KFYttZzS9fBJvUTpLcoibs2glqMTDgKqygOjymmWXkSGvC4ifqnL7DA==@lists.infradead.org
X-Gm-Message-State: AFuF++lUU/isTjyWi0yStK5AKk5Y8yWsepXUv0cY0/82vyDhu/wzealk
	tqaHJiGCCWrUfZyC+IE71Y3gQRAHVdLvimegAN5SMHDFVYHW8dGwBcBf8/duQydb
X-Gm-Gg: AYBFou1XJvtSZEpbyq4LdwCpUJq7MoF8Wg/7IuF6wOsriMFC2K2KPQHxpr457qnMXUc
	0aImTln6bQC4tjxxUfiIhp310khxPCohfiqyQ51MQ3q1B8sepAy2X5lm32jMfytv6/Aezo308o8
	XIRETkxzhZRCfMgXF9EhiVxaThAHQKYMjzcpmCLZAPj0VSDqnyKyttiXio96iJWxI8Dpawp8OfZ
	W9ffD6oNobqpNBTQD/br/T8uBQuwXkMV8i+bQGjb+mRXsj7ilnpGyBPTe40RS/1sfZnlqcSEnXV
	JRcJu/Oow74+vHzxgUs6wrZi/XcgjAJXaKFruAG4IXqMruITUQJs0Uyx5EwjQwZfRT/Q6x4JaRD
	N29pDQcP8S70qtsXuub44tnbMIgVPqtAjvjmvpWLis2mFQz8xTtMebS3tc5nxhhXdJS/1imQhOm
	N1VzrOa7oFhUnL/986+P8nl6Q9uwQy5gBSQD56B2XuSDO55fxMEATLWzBZYGIUj02K4lWlWeUPb
	ZfGetg+DXdQw9yISNiG4dnyYw+iahw7vhtW
X-Received: by 2002:a05:600c:8411:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49e619f5049mr195258665e9.11.1789205448684;
        Sat, 12 Sep 2026 02:30:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e706d0c1fsm26523335e9.1.2026.09.12.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:30:48 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:30:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, Vineet Gupta
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260912103047.1b95bb03@pumpkin>
In-Reply-To: <d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
	<20260911231017.550f8cd1@pumpkin>
	<d0ef7beb-6952-49cc-9b33-e7542e831ba6@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_023050_980963_827F0F3B 
X-CRM114-Status: GOOD (  32.20  )
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

On Fri, 11 Sep 2026 16:09:16 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 11:10:17PM +0100, David Laight wrote:
> > On Fri, 11 Sep 2026 19:25:34 +0000
> > Bradley Morgan <brads@mainlining.org> wrote:
> >   
> > > cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> > > cmpxchg() for the architectures lacking native one-byte atomics.
> > > The same architectures also lack native two-byte cmpxchg(), where
> > > such an operation is not supported and either fails to compile via
> > > BUILD_BUG() or fails to link, because the bad pointer sentinels
> > > these architectures declare are never defined.
> > > 
> > > Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> > > word with READ_ONCE(), splices the two target bytes through a union
> > > and loops on cmpxchg() of the full word until the compare succeeds.
> > > Like cmpxchg_emu_u8() it is fully ordered.
> > > 
> > > The Kconfig symbol gating this file is renamed from
> > > ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> > > selects both the one-byte and the two-byte emulation.
> > > 
> > > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > > ---
> > >  arch/Kconfig                |  2 +-
> > >  arch/arc/Kconfig            |  2 +-
> > >  arch/arm/Kconfig            |  2 +-
> > >  arch/csky/Kconfig           |  2 +-
> > >  arch/sh/Kconfig             |  2 +-
> > >  arch/xtensa/Kconfig         |  2 +-
> > >  include/linux/cmpxchg-emu.h |  1 +
> > >  lib/Makefile                |  2 +-
> > >  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
> > >  9 files changed, 40 insertions(+), 10 deletions(-)
> > >   
> > ...  
> > > diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> > > index 998deec67740..fee8171fa05e 100644
> > > --- a/include/linux/cmpxchg-emu.h
> > > +++ b/include/linux/cmpxchg-emu.h
> > > @@ -11,5 +11,6 @@
> > >  #define __LINUX_CMPXCHG_EMU_H
> > >  
> > >  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> > > +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);  
> > 
> > Why uintptr_t? Shouldn't it just be u16?
> > (Which probably means the code would better if it was just 'unsigned int')  
> 
> I suspect that Bradley is just following my cmpxchg_emu_u8() example,
> which also returns uintptr_t.
> 
> I remember that *something* broke when I made this be u8, but I cannot
> recall what the problem was.
> 
> Bradley, could you please try making it be u16 as David suggests just to
> see what happens?  Who knows?  Maybe it was a compiler issue that has
> since been fixed.  Or maybe the macros and asms using cmpxchg_emu_u8()
> need that uintptr_t for some reason.

I think the uintptr (unsigned long) cast is needed to stop a compile
error when exchanging pointers.
But that is an issue with the #define not the called functions.

Possibly changing the #define to have:
	unsigned long ul_old = (unsigned long)(old);
Or even, with the type check from:
	unsigned long ul_old = (unsigned long)(0 ? *(ptr) : (old));
(with the same for 'new')
and the removing all the casts where the value are used might be better.

David

> 
> 							Thanx, Paul


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
