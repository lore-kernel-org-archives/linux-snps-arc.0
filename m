Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9050DC5B549
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Jun 2025 04:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=po+aG8lk8prgAWe2NcRLk6I6atbcHcuyr59lSU9+JXc=; b=sR/WNkuz/rZoP/
	ZORkCxf0oaTV2Vk+Rf5Ei2siZqDhARwBzi4ssztytWHf3agtK7jqf+JXFj1yKkoFjQevjKM3hkzLG
	O7Fn9bFwAuSaajiCR9ObnFK8BURtmgf/Y3SZ21ffZBuf+K4lisEgFKrV1AymR6kzUDukAkrt5ax4r
	q37nrN+su7tw6rPz4mIJMJor9BfMCeGzqVPILLP5rOQh63pGIjHmBwSiBiQxt9Rv3yJUZBKTZHsMh
	UEv5VibnUJuNzqwkD/O8F1GuZwyPXD0PKpF+Wxa0by/hJam59NiRABdmAUjCtVW7bc0jROoUQ2BND
	r+m7qGVAnt2J2+OUIzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwYk-00000006fGb-0ftW;
	Mon, 02 Jun 2025 04:14:02 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwWK-00000006f1y-1M2J;
	Mon, 02 Jun 2025 04:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iuH08HhCzFKCMOC8/O0swKDH+rpWOadfk7Rm4fI946Q=; b=cDLc7AG1xVeGrDIh1peeN0IWEk
	zSPl9poJhEGT0YoB/3XnvH6rSM6bY3xjL0IUqjUntiObN7RMhtlCPHuD3A62GgdK0UEACC5R8vd1k
	nGJkZRQS6J7IpGD5Cac8ckt2eGuQw0ldn0T1SIMMph5HBpFztRTyZBhVmy8+xkbQoA7OwVtDKj3OZ
	76BRcTLzVJZLqbCzOHiBTXoFLI5gsn+T2zZ4MU1RCovTNxA1K7wQ4w3A4hqY1qW3qspeqQLRXJ12A
	qO/+nks1w4qOwDF7mdiodEdOvdFTMW5W0MgrK6eRVtCQ084Z11K100prR+Fy/v0Uyq+f2T84t8Tki
	2y66Yf/A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwW6-0000000BUl8-1UDJ;
	Mon, 02 Jun 2025 04:11:18 +0000
Date: Mon, 2 Jun 2025 05:11:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linmag7@gmail.com, Al Viro <viro@ftp.linux.org.uk>, arnd@arndb.de,
	chris@zankel.net, dinguyen@kernel.org, glaubitz@physik.fu-berlin.de,
	ink@unseen.parts, jcmvbkbc@gmail.com, kees@kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	mattst88@gmail.com, monstr@monstr.eu, richard.henderson@linaro.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Sam James <sam@gentoo.org>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
Message-ID: <20250602041118.GA2675383@ZenIV>
References: <87cyfejafj.fsf@gentoo.org>
 <87v7rik020.fsf@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v7rik020.fsf@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_211132_354271_52D395DA 
X-CRM114-Status: GOOD (  13.72  )
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

On Sat, Apr 05, 2025 at 06:09:11PM +0100, Sam James wrote:
> Sam James <sam@gentoo.org> writes:
> 
> > Lovely cleanup and a great suggestion from Al.
> >
> > Reviewed-by: Sam James <sam@gentoo.org>
> >
> > I'd suggest adding a:
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> 
> Al, were you planning on taking this through your tree?

FWIW, I expected it to get sent to Linus as "please, run this
sed script before -rc1" kind of thing, script being something
like

sed -i -e 's/int pte_swp_exclusive/bool pte_swp_exclusive/' \
	`git grep -l 'int pte_swp_exclusive'`

with suggested commit message...  It's absolutely regular and
that kind of tree-wide change is easier handled that way.

	Oh, well...  To restore the context: Magnus had spotted a fun
bug on Alpha back in February - pte_swp_exclusive() there returned
pte_val(pte) & _PAGE_SWP_EXCLUSIVE as int.  The problem is that
_PAGE_SWP_EXCLUSIVE is 1UL<<39 there, with obvious results...

	I looked at the originally posted patch and suggested to
make pte_swp_exclusive() return bool instead of int.  All users
are in explicitly boolean contexts:

include/linux/swapops.h:        if (pte_swp_exclusive(pte))
mm/debug_vm_pgtable.c:  WARN_ON(pte_swp_exclusive(pte));
mm/debug_vm_pgtable.c:  WARN_ON(!pte_swp_exclusive(pte));
mm/debug_vm_pgtable.c:  WARN_ON(pte_swp_exclusive(pte));
mm/internal.h:  if (pte_swp_exclusive(pte))
mm/memory.c:            if (pte_swp_exclusive(orig_pte)) {
mm/memory.c:            exclusive = pte_swp_exclusive(vmf->orig_pte);
mm/swapfile.c:          if (pte_swp_exclusive(old_pte))
mm/userfaultfd.c:               if (!pte_swp_exclusive(orig_src_pte)) {

	Magnus posted patch of that form (see
https://lore.kernel.org/all/20250218175735.19882-2-linmag7@gmail.com/),
got no serious objections and then it went nowhere.

	Bug is real and fairly obvious, fix is entirely mechanical and
affects one line in each asm/pgtable.h out there.  Linus, could you
run that sed script just before -rc1?  Commit message from the patch refered
above looks sane:

mm: pgtable: fix pte_swp_exclusive

Make pte_swp_exclusive return bool instead of int. This will better reflect
how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
problems on Alpha due pte_swp_exclusive not returning correct values when
_PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
