Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7FDC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Feb 2022 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ygL143jKWgwidxf17qSQV3sKGQIBBJTIlP8kylRv8g=; b=FBlGaOCSS0Ck3w
	r46pglBfrNYl1zJwl+ytFBluNNFqDg/KSTV4f63rTxDDDDI64p8AfW7Nhaq99ZVrfrglgUThPN33Q
	Wh59fOD6D2wIACo3Bo6jg8lynyCHSYYuo0cRvFRgd14LcdErU+UerFwSgFHVGBCfTlHbMYRLbfQV0
	oucvaFJAz4VRTQBoxWgL+fhhqtJhg1hC9zMXXmhQJlEpFLa1dFUPUgS+2kUnKPJdjdz3KEiexSTD+
	dLSKH8lezTQR4JZrSiSjPz1hUSi37nT+7zhwnm4nJfR4MOSVSrBMsyHBAveu0pu9ECjRPOexj0wwG
	QbV1Na8HG9nN/gapzM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM990-0063Ou-V2; Mon, 21 Feb 2022 13:54:26 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8hK-005tkv-1I; Mon, 21 Feb 2022 13:25:54 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nM8h9-0001Eo-00; Mon, 21 Feb 2022 14:25:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id E4525C25DD; Mon, 21 Feb 2022 14:24:56 +0100 (CET)
Date: Mon, 21 Feb 2022 14:24:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 nickhu@andestech.com, green.hu@gmail.com, dinguyen@kernel.org,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net,
 richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
Message-ID: <20220221132456.GA7139@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-10-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_052550_444193_53F5634D 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> 
> diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> index db9a8e002b62..d7c89dc3426c 100644
> --- a/arch/mips/include/asm/uaccess.h
> +++ b/arch/mips/include/asm/uaccess.h
> @@ -19,6 +19,7 @@
>  #ifdef CONFIG_32BIT
>  
>  #define __UA_LIMIT 0x80000000UL
> +#define TASK_SIZE_MAX	__UA_LIMIT
>  
>  #define __UA_ADDR	".word"
>  #define __UA_LA		"la"
> @@ -33,6 +34,7 @@
>  extern u64 __ua_limit;
>  
>  #define __UA_LIMIT	__ua_limit
> +#define TASK_SIZE_MAX	XKSSEG

this doesn't work. For every access above maximum implemented virtual address
space of the CPU an address error will be issued, but not a TLB miss.
And address error isn't able to handle this situation.

With this patch

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index df4b708c04a9..3911f1481f3d 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -1480,6 +1480,13 @@ asmlinkage void do_ade(struct pt_regs *regs)
 	prev_state = exception_enter();
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS,
 			1, regs, regs->cp0_badvaddr);
+
+	/* Are we prepared to handle this kernel fault?	 */
+	if (fixup_exception(regs)) {
+		current->thread.cp0_baduaddr = regs->cp0_badvaddr;
+		return;
+	}
+
 	/*
 	 * Did we catch a fault trying to load an instruction?
 	 */

I at least get my simple test cases fixed, but I'm not sure this is
correct.

Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
for the 32bit case ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
