Return-Path: <SRS0=Z+JP=32=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E300C2D0B1
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 08:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3DC0214AF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 08:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQdhyCSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3DC0214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaS0UzF9G+zr8stNKKqWwCnb2kto3t2rFCoCvV4HEy8=; b=WQdhyCSIMJRwMk
	1Shm13zEK5Nz7ZDdLB5XlGDAbmBNxDo+UuFG726m19VxWBtsl3mgGReD084xuWuJ+7NL0OLD5WiWf
	iVEoL157VW+iK2Gh6PkMZQn1e1E+rk57VxsNmxYtLmyKukU1wch8n+ipFhVHlV0jPozrOsqjCdJOk
	uLeub5laTKntcyeedc02yh4/alEww10CbXr8cfIgbhVsDGiZLQpYvRTszLeLFliazdZDTHGc6SEvg
	AWOwBHMjwjZfw3OZEZGTOKtwoUBRpEWT6PQevofIJIMTyLxPII3AZPURx99yhFiXhcPHbgxjwNPbG
	UhTzh6bGMpoTUcKXkblw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izcPI-0000yd-Km; Thu, 06 Feb 2020 08:21:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izcPD-0000wm-Pu; Thu, 06 Feb 2020 08:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A4DD1FB;
 Thu,  6 Feb 2020 00:20:57 -0800 (PST)
Received: from [10.162.16.51] (p8cg001049571a15.blr.arm.com [10.162.16.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 822673F68E;
 Thu,  6 Feb 2020 00:23:20 -0800 (PST)
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page
 table helpers
To: kbuild test robot <lkp@intel.com>
References: <1580897674-16456-1-git-send-email-anshuman.khandual@arm.com>
 <202002060619.wEOdAZU1%lkp@intel.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <78d3ce6b-e100-2561-6b09-124c29731d1a@arm.com>
Date: Thu, 6 Feb 2020 13:49:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <202002060619.wEOdAZU1%lkp@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_002059_928088_392E96F5 
X-CRM114-Status: GOOD (  19.26  )
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
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-alpha@vger.kernel.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


On 02/06/2020 04:40 AM, kbuild test robot wrote:
> Hi Anshuman,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on s390/features linus/master arc/for-next v5.5]
> [cannot apply to mmotm/master tip/x86/core arm64/for-next/core next-20200205]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-validating-architecture-page-table-helpers/20200205-215507
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/asm-generic/pgtable-nopud.h:8:0,
>                     from arch/ia64/include/asm/pgtable.h:586,
>                     from include/linux/mm.h:99,
>                     from include/linux/highmem.h:8,
>                     from mm/debug_vm_pgtable.c:14:
>    mm/debug_vm_pgtable.c: In function 'pud_clear_tests':
>>> include/asm-generic/pgtable-nop4d-hack.h:47:32: error: implicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=implicit-function-declaration]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                                    ^
>>> mm/debug_vm_pgtable.c:141:8: note: in expansion of macro '__pud'
>      pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>>> include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: missing braces around initializer [-Wmissing-braces]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                          ^
>>> mm/debug_vm_pgtable.c:141:8: note: in expansion of macro '__pud'
>      pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>    cc1: some warnings being treated as errors

This build failure is expected now given that we have allowed DEBUG_VM_PGTABLE
with EXPERT without platform requiring ARCH_HAS_DEBUG_VM_PGTABLE. This problem
i.e build failure caused without a platform __pgd(), is known to exist both on
ia64 and arm (32bit) platforms. Please refer https://lkml.org/lkml/2019/9/24/314
for details where this was discussed earlier.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
