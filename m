Return-Path: <SRS0=SNo/=6J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08977C55191
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 Apr 2020 16:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C422D206CD
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 Apr 2020 16:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pZDKMK23";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHfCSB7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C422D206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFkPgyPKZdSjeHn0VbK5SqvwojoXxWAmfpjU2bj8BXo=; b=pZDKMK23evTR5G
	tvcvA27SClB+HPRFm7lrGTrqKzO1pO9DAK9HAZcEs4jDrep8X2yOo6Vq9apvXUjw+pBNonuZwj4VL
	nlYCP06Rrg8jE2nkKd/EV7lyJwekfSnIdUBFyO6T58Vae03lDsCvVonVkzKVj6MyhX7XoGmwgsivY
	pvAeG8rhqCthZS8fNFuBTxhU7Emv8s4oTb5phhynV7i1uyHoybggJGqbGuYruup3IMXy+4ZF5wU8m
	BAA+kYFUPcelIQDxOR7i3b4rgtHjOi5gYZfJ5TL8iH4Q4GYI82Cq0ancf6IGOwVjbXa5gjz53WEia
	M0Qpa1N1dBhPjqaRYkNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSO0M-0007tm-3w; Sat, 25 Apr 2020 16:50:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSO0E-0006Xu-1o; Sat, 25 Apr 2020 16:50:07 +0000
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1798F206CD;
 Sat, 25 Apr 2020 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587833404;
 bh=0Sl4Z11RVRGJbUzY+39FiW21eIIyUSJn8sRyWLPh1QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHfCSB7lAtP8F/QOkzrMVovSds6GmLQXIYGNDyiWwar0dzDHihTkIxxJ4pzqN8dgI
 7dZgKIyfVdwKPgmTvqMYetG92FlxubtA/kMLwHHTJZYJXQvWWxFhfOf1YllMgm6pNJ
 zD7n7cmGOJK81H7mitUpRubrKW286wNtPWLOyYuU=
Date: Sat, 25 Apr 2020 19:49:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 15/21] mm: memmap_init: iterate over memblock regions
 rather that check each PFN
Message-ID: <20200425164947.GH14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-16-rppt@kernel.org>
 <9143538a-4aaa-ca1d-9c8f-72ac949cf593@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9143538a-4aaa-ca1d-9c8f-72ac949cf593@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_095006_149675_A05E7FA3 
X-CRM114-Status: GOOD (  18.68  )
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
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Apr 24, 2020 at 09:22:32AM +0200, David Hildenbrand wrote:
> On 12.04.20 21:48, Mike Rapoport wrote:
> > From: Baoquan He <bhe@redhat.com>
> > 
> > When called during boot the memmap_init_zone() function checks if each PFN
> > is valid and actually belongs to the node being initialized using
> > early_pfn_valid() and early_pfn_in_nid().
> > 
> > Each such check may cost up to O(log(n)) where n is the number of memory
> > banks, so for large amount of memory overall time spent in early_pfn*()
> > becomes substantial.
> > 
> > Since the information is anyway present in memblock, we can iterate over
> > memblock memory regions in memmap_init() and only call memmap_init_zone()
> > for PFN ranges that are know to be valid and in the appropriate node.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  mm/page_alloc.c | 26 ++++++++++++++++----------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 7f6a3081edb8..c43ce8709457 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -5995,14 +5995,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
> >  		 * function.  They do not exist on hotplugged memory.
> >  		 */
> 
> After this change, the comment above is stale. the "holes in boot-time
> mem_map" are handled by the caller now AFAIKs.

Right, will update in v2.
Thanks!

> >  		if (context == MEMMAP_EARLY) {
> > -			if (!early_pfn_valid(pfn)) {
> > -				pfn = next_pfn(pfn);
> > -				continue;
> > -			}
> > -			if (!early_pfn_in_nid(pfn, nid)) {
> > -				pfn++;
> > -				continue;
> > -			}
> >  			if (overlap_memmap_init(zone, &pfn))
> >  				continue;
> >  			if (defer_init(nid, pfn, end_pfn))
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
