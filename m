Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A52C46467
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 21:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxsF2oLdUonWc1/l+28j6I65ztbeYk6m3q+IcLuRsaI=; b=ACLieM92DFPD0u
	OPFUHs1n8NJlAThRP8Zz4g2sz21t/YsJXYo5gTJmcZ02hzDi9s1QmEgtsKroAQ5ggjzEslsPqtMqk
	yr72W/3kGuJsmsGvRwEU4pzjiycJr8lg06bEe36TOZ6s+SYlGf20DbRZSZO2BLZ6SoW73ftqu7qkF
	NKRDXjZHPhIkYJPntapkvdmRysEg2myKseLW6b4+Yd2KTQsf0HQc5dbZd275t2ePSdSbBg6hEfEmp
	PguOSYZQpRET5IEk4fM+nZrTteOh1oSQ+YksXFakiUk8JG9EOoRXBFaNuWe1tR1w8+9CAyeMtq6QH
	qXo3aiVyTD6BHuyVM/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFM64-008blt-3d; Tue, 10 Jan 2023 21:23:52 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFM60-008bl9-7e
	for linux-snps-arc@lists.infradead.org; Tue, 10 Jan 2023 21:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=HMyMBFRESow/WM9ygWpCSGTusSEWJqvkUIysz1wv1dE=; b=mBx0U3jxjMHQOE0pq78Ghngrd6
	yL+fwmUmdLpuk6/N8DUP3Ml3v2eqOkcgxNaHxpQLlzVliLQCofMrqhy/q0LOU8mkNjB7xWpGqa/sl
	Rhla/vldS+0AFV/FnfPE06TGlKpKwZBlYqFRMzRClUHtzOMfJdRGiPi1fwHkn2GaOyuLbB05+rk9D
	cdbNO4XlKpHIQLouUWyIGxHgoITsEEbEU2dYkwJWZNB+o4GmY/FzqqdeSH1xmFgud0iw3P3QTtXCx
	saQMvF9oFMKPydfH0i5SgQYHhTM3wvmBJ9KYgiHHZ5dyOatOjcLSFmCmNjeu+5gUP8uQfwK4Q4D91
	qNG3QIQw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pFM5n-0014fx-21;
	Tue, 10 Jan 2023 21:23:35 +0000
Date: Tue, 10 Jan 2023 21:23:35 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bit_spinlock: Include <asm/processor.h>
Message-ID: <Y73XV1SRtcpJQ1Vq@ZenIV>
References: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
 <b5e0bd90-ff29-d301-30ca-2f12028109ce@kernel.org>
 <f4aa7f0d-50a9-b5e0-e980-1e8e779b48bc@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4aa7f0d-50a9-b5e0-e980-1e8e779b48bc@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_132348_570145_7F61B0BB 
X-CRM114-Status: GOOD (  20.07  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 10, 2023 at 07:08:33PM +0100, Christophe JAILLET wrote:
> Le 10/01/2023 =E0 08:19, Vineet Gupta a =E9crit=A0:
> > =

> > On 1/8/23 11:04, Christophe JAILLET wrote:
> > > In an attempt to simplify some includes in <include/dcache.h>, it
> > > appeared, when compiling fs/ecryptfs/dentry.c, that
> > > <linux/bit_spinlock.h>
> > > was relying on other includes to get the definition of cpu_relax().
> > > (see [1])
> > > =

> > > It broke on arc.
> > =

> > It its just ARC that broke, maybe we can do something there ?
> =

> Hi,
> =

> It is all what build-bots have spotted so far :)
> =

> I don't think that "fixing" it in ARC is the right approach, unless I mis=
sed
> something.
> =

> <linux/bit_spinlock.h> does use cpu_relax(), so it should include what is
> need for that, and not rely on other black magic.

Umm...  That's not obvious - it only uses cpu_relax() in macros, so missing
include would not cause problems if all actual users of those macros happen
to pull the needed header by other means.

Said that, we have

1) defined directly in asm/processor.h, using nothing but the stuff provide=
d by
compiler.h:
	alpha, arc, csky, loongarch, m68k, microblaze, nios2,
	openrisc, parisc, s390, sh, xtensa
2) same, using something in headers pulled by asm/processor.h itself:
	ia64 (needs asm/intrinsic.h)
	hexagon (needs asm/hexagon_vm.h)
	um (needs arch/um/include/linux/time-internal.h)
3) same, but defined in something pulled by asm/processor.h rather than
in asm/processor.h itself; asm/vdso/processor.h is the common location -
those are the cases when we share the same definition for kernel and
vdso builds
	sparc (asm/processor_32.h or asm/processor_64.h)
	arm (asm/vdso/processor.h)
	arm64 (asm/vdso/processor.h)
	powerpc (asm/vdso/processor.h)
	x86 (asm/vdso/processor.h)
	riscv (asm/vdso/processor.h; needs several headers included there -
jump_label.h, etc.)
	mips (asm/vdso/processor.h, needs asm/barrier.h, pulled from asm/processor=
.h
by way of linux/atomic.h -> asm/atomic.h -> asm/barrier.h)

So asm/processor.h is sufficient for working cpu_relax() and if some
arch-independent code wants cpu_relax() it should pull either
asm/processor.h or linux/processor.h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
