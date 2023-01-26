Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0D1C27C76
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Jan 2023 01:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4CLBm4tKtz0Q2xjJvCQDgfHLqNl7tjhhmSfL12ljG4=; b=VhjGL8Mc46rzDZ
	zVqtyqxzcd1XUyuyh7KlkKtG58giTIh1UcLapwUa2A5iDU9EC8iax4Je2ckkz68jvlfNrcdpYPzQk
	DknnINMjsSZElWiVwSfVsT/sGs6kbPlvT8y1wS5TVBjMElRSZBfNoCymGIdrnlWU6x4amQ/W7qugn
	SZANj2cEhxFxeoHI4j1V6jXAwNa6j7Lk1yFVCDNpiw/37VtUo8SyBJ9Gu6+h71nP48KQGGRSJRo1Q
	d7qzcyCeT/E80Rs9qjNYmLk572Y/+O4rfPRg6DmozyJLuU86Py+4aRInaRxg5Bxvfe3e+J3MJKzRd
	K9Q3q+yeuht6uvVImOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrKL-009OSc-RP; Thu, 26 Jan 2023 01:45:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrKH-009OR6-Uv; Thu, 26 Jan 2023 01:45:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC90AB819AD;
	Thu, 26 Jan 2023 01:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32671C433D2;
	Thu, 26 Jan 2023 01:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1674697514;
	bh=7RpoJrPZS6SJcilZwJlgfOcy8VI5bDbkm1rwJIiWgGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QrUq5ATjY2oqR+jEAeForg1RvYMYo+bDZxJkpPvGEAQMtF9Wex3AsF6pj45qmjarD
	 FkXgKw35BmzCytgE7GIRGvCG25LoCH1q8w/sqjuafA+hP0s/EWoOXsqZwbktTsZyRq
	 n3OCsv9RwqATlbboWAh4Ya/cfUooerJ2jtkrgbTo=
Date: Wed, 25 Jan 2023 17:45:12 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Matt Turner
 <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>, Richard Weinberger
 <richard@nod.at>, Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vineet Gupta <vgupta@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux--csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 3/3] mm, arch: add generic implementation of pfn_valid()
 for FLATMEM
Message-Id: <20230125174512.ce5aed444cc8b8870825d8c2@linux-foundation.org>
In-Reply-To: <20230125190757.22555-4-rppt@kernel.org>
References: <20230125190757.22555-1-rppt@kernel.org>
	<20230125190757.22555-4-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_174518_177888_6CEF1325 
X-CRM114-Status: GOOD (  13.82  )
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

On Wed, 25 Jan 2023 21:07:57 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Every architecture that supports FLATMEM memory model defines its own
> version of pfn_valid() that essentially compares a pfn to max_mapnr.
> 
> Use mips/powerpc version implemented as static inline as a generic
> implementation of pfn_valid() and drop its per-architecture definitions

arm allnoconfig:

./include/asm-generic/memory_model.h:23:19: error: static declaration of 'pfn_valid' follows non-static declaration
   23 | static inline int pfn_valid(unsigned long pfn)
      |                   ^~~~~~~~~
./arch/arm/include/asm/page.h:160:12: note: previous declaration of 'pfn_valid' with type 'int(long unsigned int)'
  160 | extern int pfn_valid(unsigned long);
      |            ^~~~~~~~~


I thought of doing

--- a/arch/arm/include/asm/page.h~mm-arch-add-generic-implementation-of-pfn_valid-for-flatmem-fix
+++ a/arch/arm/include/asm/page.h
@@ -156,10 +156,6 @@ extern void copy_page(void *to, const vo
 
 typedef struct page *pgtable_t;
 
-#ifdef CONFIG_HAVE_ARCH_PFN_VALID
-extern int pfn_valid(unsigned long);
-#endif
-
 #include <asm/memory.h>
 
 #endif /* !__ASSEMBLY__ */
_

but I'm seeing a pfn_valid declaration in arch/arc/include/asm/page.h
which might be a problem.

v2, please ;)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
