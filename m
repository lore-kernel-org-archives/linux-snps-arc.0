Return-Path: <SRS0=fhZ4=36=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12131C352A3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Feb 2020 11:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13F92080C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Feb 2020 11:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YpGDrUSM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="qrkbsPru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D13F92080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeWA+W0PGAgrYTWJZwWRrLHBIuWc0rF5EqfQap3aqCQ=; b=YpGDrUSMZ0wRUe
	qG60fYEMXGqvEVX3OY++dqtsE3Q/w1HCTFBDcNnlctuXoa3fff4G9U3mqMTTAmGJe9eH8Bwcs6g6E
	WWhITayUmEtjnb+PxsaY6Sy01JkNJ5UdVTsdi/xXmUAvAMA8gDP7ZoWHl8+3/CBs3u3Y4bxjJ7N6Q
	SpyOn7ILNg3Jf7EM1t0S5mPzwNHIUvlr830/5TkU0M4ckinA8PyX/nCgb24kMiriVJca6NLGLFhLO
	728mAuZHUvMTF7NFSeVHOko9lSSNrym4SdZw1IzfJt7cwaOiWoSmxbdRjUm7t3QLyLk8F1uv1RiZq
	L4t981zTQwDPEP2yjsIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j16vU-0007vr-Kh; Mon, 10 Feb 2020 11:08:28 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j16vP-0007uW-Up; Mon, 10 Feb 2020 11:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTw2i6MUZITUD5eWPb+PW1VnYag/93bvIyoh66pK7Nw=; b=qrkbsPru1lr3ira5I9xWBowT9
 pYyZLn+zGIyBwT0E94NzTtGTmKxIJthJ13h6C97vIAIg0RliWwgKf+WmKWXxBlrndc+VYR8DqF0u8
 kLn5LP8E9C0yosgq5Zwl69HxjzG0vd3eUX37M0JzcOlOw0ylRSXG7MJNBvaf5Zjhmm+iVAuZZpi4P
 wkVwMkOhw7imN7PjDlbW9t8EGGVTegaRakCCh7775d7zk985OYH3cWbveigOQwvuzN1SoPIwwjGPF
 aJUGhEExIsLTHen8dY9vGmFUFIx9Q9xQJkrjq7idtYLtOfV3IdkZgc1cyFRmbJDqlBuxPFHLpFbxt
 Ho5+QgUHg==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:38428)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j16u1-0006Ks-96; Mon, 10 Feb 2020 11:06:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j16tj-0007pZ-6Y; Mon, 10 Feb 2020 11:06:39 +0000
Date: Mon, 10 Feb 2020 11:06:39 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20200210110639.GC25745@shell.armlinux.org.uk>
References: <1580897674-16456-1-git-send-email-anshuman.khandual@arm.com>
 <202002060619.wEOdAZU1%lkp@intel.com>
 <78d3ce6b-e100-2561-6b09-124c29731d1a@arm.com>
 <20200209205231.44d098f8749e88190b8ba10c@linux-foundation.org>
 <955229f7-f161-f720-0e75-a3163f63817d@arm.com>
 <aef1048f-68c4-d14f-e669-8f288ba9ac7a@c-s.fr>
 <20200210100200.GB25745@shell.armlinux.org.uk>
 <7cb3a5bb-eaea-a01c-4047-e3c000b7ad1d@c-s.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cb3a5bb-eaea-a01c-4047-e3c000b7ad1d@c-s.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_030824_264063_26468693 
X-CRM114-Status: GOOD (  31.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, kbuild test robot <lkp@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-alpha@vger.kernel.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-c6x-dev@linux-c6x.org,
 Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2020 at 11:46:23AM +0100, Christophe Leroy wrote:
> =

> =

> Le 10/02/2020 =E0 11:02, Russell King - ARM Linux admin a =E9crit=A0:
> > On Mon, Feb 10, 2020 at 07:38:38AM +0100, Christophe Leroy wrote:
> > > =

> > > =

> > > Le 10/02/2020 =E0 06:35, Anshuman Khandual a =E9crit=A0:
> > > > =

> > > > =

> > > > On 02/10/2020 10:22 AM, Andrew Morton wrote:
> > > > > On Thu, 6 Feb 2020 13:49:35 +0530 Anshuman Khandual <anshuman.kha=
ndual@arm.com> wrote:
> > > > > =

> > > > > > =

> > > > > > On 02/06/2020 04:40 AM, kbuild test robot wrote:
> > > > > > > Hi Anshuman,
> > > > > > > =

> > > > > > > Thank you for the patch! Yet something to improve:
> > > > > > > =

> > > > > > > [auto build test ERROR on powerpc/next]
> > > > > > > [also build test ERROR on s390/features linus/master arc/for-=
next v5.5]
> > > > > > > [cannot apply to mmotm/master tip/x86/core arm64/for-next/cor=
e next-20200205]
> > > > > > > [if your patch is applied to the wrong git tree, please drop =
us a note to help
> > > > > > > improve the system. BTW, we also suggest to use '--base' opti=
on to specify the
> > > > > > > base tree in git format-patch, please see https://stackoverfl=
ow.com/a/37406982]
> > > > > > > =

> > > > > > > url:    https://github.com/0day-ci/linux/commits/Anshuman-Kha=
ndual/mm-debug-Add-tests-validating-architecture-page-table-helpers/2020020=
5-215507
> > > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/power=
pc/linux.git next
> > > > > > > config: ia64-allmodconfig (attached as .config)
> > > > > > > compiler: ia64-linux-gcc (GCC) 7.5.0
> > > > > > > reproduce:
> > > > > > >           wget https://raw.githubusercontent.com/intel/lkp-te=
sts/master/sbin/make.cross -O ~/bin/make.cross
> > > > > > >           chmod +x ~/bin/make.cross
> > > > > > >           # save the attached .config to linux build tree
> > > > > > >           GCC_VERSION=3D7.5.0 make.cross ARCH=3Dia64
> > > > > > > =

> > > > > > > If you fix the issue, kindly add following tag
> > > > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > > > > =

> > > > > > > All error/warnings (new ones prefixed by >>):
> > > > > > > =

> > > > > > >      In file included from include/asm-generic/pgtable-nopud.=
h:8:0,
> > > > > > >                       from arch/ia64/include/asm/pgtable.h:58=
6,
> > > > > > >                       from include/linux/mm.h:99,
> > > > > > >                       from include/linux/highmem.h:8,
> > > > > > >                       from mm/debug_vm_pgtable.c:14:
> > > > > > >      mm/debug_vm_pgtable.c: In function 'pud_clear_tests':
> > > > > > > > > include/asm-generic/pgtable-nop4d-hack.h:47:32: error: im=
plicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=3Dim=
plicit-function-declaration]
> > > > > > >       #define __pud(x)    ((pud_t) { __pgd(x) })
> > > > > > >                                      ^
> > > > > > > > > mm/debug_vm_pgtable.c:141:8: note: in expansion of macro =
'__pud'
> > > > > > >        pud =3D __pud(pud_val(pud) | RANDOM_ORVALUE);
> > > > > > >              ^~~~~
> > > > > > > > > include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: =
missing braces around initializer [-Wmissing-braces]
> > > > > > >       #define __pud(x)    ((pud_t) { __pgd(x) })
> > > > > > >                            ^
> > > > > > > > > mm/debug_vm_pgtable.c:141:8: note: in expansion of macro =
'__pud'
> > > > > > >        pud =3D __pud(pud_val(pud) | RANDOM_ORVALUE);
> > > > > > >              ^~~~~
> > > > > > >      cc1: some warnings being treated as errors
> > > > > > =

> > > > > > This build failure is expected now given that we have allowed D=
EBUG_VM_PGTABLE
> > > > > > with EXPERT without platform requiring ARCH_HAS_DEBUG_VM_PGTABL=
E. This problem
> > > > > > i.e build failure caused without a platform __pgd(), is known t=
o exist both on
> > > > > > ia64 and arm (32bit) platforms. Please refer https://lkml.org/l=
kml/2019/9/24/314
> > > > > > for details where this was discussed earlier.
> > > > > > =

> > > > > =

> > > > > I'd prefer not to merge a patch which is known to cause build
> > > > > regressions.  Is there some temporary thing we can do to prevent =
these
> > > > > errors until arch maintainers(?) get around to implementing the
> > > > > long-term fixes?
> > > > =

> > > > We could explicitly disable CONFIG_DEBUG_VM_PGTABLE on ia64 and arm=
 platforms
> > > > which will ensure that others can still use the EXPERT path.
> > > > =

> > > > config DEBUG_VM_PGTABLE
> > > > 	bool "Debug arch page table for semantics compliance"
> > > > 	depends on MMU
> > > > 	depends on !(IA64 || ARM)
> > > > 	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > > > 	default n if !ARCH_HAS_DEBUG_VM_PGTABLE
> > > > 	default y if DEBUG_VM
> > > > =

> > > =

> > > On both ia32 and arm, the fix is trivial.
> > > =

> > > Can we include the fix within this patch, just the same way as the
> > > mm_p4d_folded() fix for x86 ?
> > =

> > Why should arm include a macro for something that nothing (apart from
> > this checker) requires?  If the checker requires it but the rest of
> > the kernel does not, it suggests that the checker isn't actually
> > correct, and the results can't be relied upon.
> > =

> =

> As far as I can see, the problem is that arm opencodes part of the API
> instead of including asm-generic/pgtable-nopmd.h
> =

> Here, the ARM has 2 levels, ie only PGD and PTE. But instead of defining
> __pgd and __pte and getting everything else from asm-generic, it defines a
> __pmd then redefines the folded levels like the pud, etc ...
> =

> That's exactly what the checker aims at detecting: architectures than do =
not
> properly use the standard linux page table structures.

There are good reasons for the way ARM does stuff.  The generic crap was
written without regard for the circumstances that ARM has, and thus is
entirely unsuitable for 32-bit ARM.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
