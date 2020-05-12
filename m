Return-Path: <SRS0=6ApH=62=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534D5CA90AF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 May 2020 19:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22ED3206A5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 May 2020 19:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q413OnLc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22ED3206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkWWBA4YdyYixTmR2wBjnWwuz7Xkkybb1vRB/psrQ5U=; b=q413OnLci9UU1Z
	2dKm5aAvoJNGXJymIJBuZyVtVEu7nVZ/Z3WscnFeGvH6tIgu2G0zpCoZZXGx+CTGMCQl6EbdmtGSl
	XmDEQMWVBwz4Bdy5/BtqA3mLCu52RZjv6c9JnhQCGg4RBi0a0QAsn6Srsc0AG4AIW2Ic8E/vrYZMq
	Wt+FhKkHrofBzbCoWX1Zw8GNGEcp3oyG4OdXEvSb6pMKjzqZ/356OVEIrELuzNcsOWQoIScNvKvIG
	ZuRZFwjva8wMdawlAjTcGb6LdE4+Lsa1wIimzkbsQwmZ0qayIOuIRGGGx/duMaEjO1G+MjjiK9WQM
	P9nyrOWj9QUn6Pclbhmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYaS4-0001Eo-Ue; Tue, 12 May 2020 19:20:28 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jYaRp-00018p-Bh; Tue, 12 May 2020 19:20:13 +0000
Date: Tue, 12 May 2020 12:20:13 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 03/12] mm: reorder includes after introduction of
 linux/pgtable.h
Message-ID: <20200512192013.GY16070@bombadil.infradead.org>
References: <20200512184422.12418-1-rppt@kernel.org>
 <20200512184422.12418-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512184422.12418-4-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, May 12, 2020 at 09:44:13PM +0300, Mike Rapoport wrote:
> diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
> index a093cd45ec79..701a05090141 100644
> --- a/arch/alpha/kernel/proto.h
> +++ b/arch/alpha/kernel/proto.h
> @@ -2,8 +2,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  
> -#include <linux/pgtable.h>
> -
>  /* Prototypes of functions used across modules here in this directory.  */
>  
>  #define vucp	volatile unsigned char  *

Looks like your script has a bug if linux/pgtable.h is the last include
in the file?


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
