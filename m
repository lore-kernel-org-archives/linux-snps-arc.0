Return-Path: <SRS0=m9uj=AP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D09C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Jul 2020 16:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97B220747
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Jul 2020 16:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ryI8QNFv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97B220747
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qP5Fvsy4yPFBDJxVQZ1QqTiyrQrON+UM+dD348asexo=; b=ryI8QNFvoMiwxzywmp2Q19KOu
	AcAqkM78Vlv85r/erLDjCktHjmcjiAr5Uoxoq+ZCKMgp6kII9bm59RK+HnujQWGJehv8Ns58gi9Hm
	KlK4ZOrYdqjktVFzKjbhvpYEI4Okcb55pM7co/SS61H/KLR2ubSKtG2fRXO11AA6udxqOLO3KtB4d
	6eEjIkDrrZ1FmViK/DFYeaqHSeNYxyLB0a7ju8cP1gI/L9BzIL8pZ245831E5mu9BENC7T4zZrnyZ
	LAXvXevtzcvNjHwyPwuUX8wpYCyBB5eEO1U69LxdQuBwRe4L/l3UmvZZvWT36wb6lnIb6TQR5RoxP
	0zwXoGR+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrkle-0008Rq-2f; Sat, 04 Jul 2020 16:11:54 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrklc-0008R9-MZ; Sat, 04 Jul 2020 16:11:53 +0000
Received: from ip5f5af08c.dynamic.kabel-deutschland.de ([95.90.240.140]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jrkkL-0000nq-Fg; Sat, 04 Jul 2020 16:10:33 +0000
Date: Sat, 4 Jul 2020 18:10:31 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Stafford Horne <shorne@gmail.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 17/17] arch: rename copy_thread_tls() back to copy_thread()
Message-ID: <20200704161031.lcln4ez6yehgffgq@wittgenstein>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
 <20200625211749.GH1401039@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625211749.GH1401039@lianli.shorne-pla.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_121152_835521_F7DE2DF7 
X-CRM114-Status: GOOD (  18.10  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-csky@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 06:17:49AM +0900, Stafford Horne wrote:
> On Tue, Jun 23, 2020 at 01:43:26AM +0200, Christian Brauner wrote:
> 
> > diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> > index d7010e72450c..19045a3efb8a 100644
> > --- a/arch/openrisc/kernel/process.c
> > +++ b/arch/openrisc/kernel/process.c
> > @@ -116,7 +116,7 @@ void release_thread(struct task_struct *dead_task)
> >  extern asmlinkage void ret_from_fork(void);
> >  
> >  /*
> > - * copy_thread_tls
> > + * copy_thread
> >   * @clone_flags: flags
> >   * @usp: user stack pointer or fn for kernel thread
> >   * @arg: arg to fn for kernel thread; always NULL for userspace thread
> > @@ -147,7 +147,7 @@ extern asmlinkage void ret_from_fork(void);
> >   */
> >  
> >  int
> > -copy_thread_tls(unsigned long clone_flags, unsigned long usp,
> > +copy_thread(unsigned long clone_flags, unsigned long usp,
> >  		unsigned long arg, struct task_struct *p, unsigned long tls)
> >  {
> 
> For the OpenRISC bit.
> 
> Acked-by: Stafford Horne <shorne@gmail.com>
> 
> Also, I would agree with what Kees mentioned about aligning the parameters.
> Sure that would be more work but it would be appreciated.

Sure, this is a mechanical change. I'll update the individual patches to account for that.

Thanks!
Christian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
