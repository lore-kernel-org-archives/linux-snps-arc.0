Return-Path: <SRS0=KDTa=6E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3F2C3815B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Apr 2020 14:26:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B39206DD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Apr 2020 14:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PArqtELV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="DnvEUFzS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B39206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmF+bton+/SOSave9fGQw/LOm/Z9pBQzItiNsVrBBG0=; b=PArqtELVuSF2dc
	7OhVe7/icAnWjfBceuJmnyAtm94AKLehpSXKdMf3axiuVvH+jpdcpp/Qj7lZ14YKbJIVGASJHATh9
	N//G3hbopoZE2JaGOYGEKydbVZsZ7elG9X73bjRk+lhiitj6aSEqcl2C97zhYwgpix654EYDnBmey
	bRKoledgOM/byLpzP2hAmPrzOiJbaIs2AIPOYidIDH0QkpjAk3h51SwGEcSc5AOUPQZ83+2IEp/LD
	jvXkZJblgctX4F4e2pD7Qdy4lpj9UO8ta6Yc/OBQr1g0z6BICzeECGYGscxSnfI7ZmF/NtQYZzqpR
	4YPPHYcT2BHwWIJzJY/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQXNH-00017B-9d; Mon, 20 Apr 2020 14:26:15 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQXNE-00015w-Ug
 for linux-snps-arc@lists.infradead.org; Mon, 20 Apr 2020 14:26:14 +0000
Received: by mail-qt1-x842.google.com with SMTP id w29so8564371qtv.3
 for <linux-snps-arc@lists.infradead.org>; Mon, 20 Apr 2020 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=x4haHkUujR1fKPz5RIOI82+KmuZk6e+W1yh47eNmIvQ=;
 b=DnvEUFzSch8BOWv/K7yUwrGGEukS5excCJecSvcapVOhdy/OFYe7Y9x1bGe8SeT916
 l1+1chsImNg3ZkGKpfN6ahvWi6toqC2h9IrP5AAGTN0GSjdGn3qsRFRJ+RJKyRIC9tu1
 Dj3ea0wViCiibWw2vLnH2xAQFEOjXLO8KUs1T46qoBzPcqk7/mrvO1+D2/LejHD1ICpo
 KoyvCsqeLxeoDgKdlRyHMBD+KBeYlPJHqA50tfN8jzW6UL/Xp60Ax2PqCOWTXHM9g3GG
 cbNMSaz+pl+PNBKPTXdiSGvlo1iEHh3BDrH71SvZZsVGfYckGoh6BGUSunvfhu/heiMK
 xWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=x4haHkUujR1fKPz5RIOI82+KmuZk6e+W1yh47eNmIvQ=;
 b=qDX2rYd+mp9ju8JYvqwRN7Hy4Fj4DNEo9rldKZ4FYdOfGFdxtc3cUtT4AkS9k3HpdQ
 6IQCvGDxuM+rb17z4fzmouW5uvXuz32IxgOn2Jf/hk1zcFq5T8yHPd0cvef6QuTOW8w0
 fCL4FW5Uwyo1hOTXbd2EPSr4QKucFKaJnnkpr5Ybq3QBWTLEXurud/ra3yiZEnLwgmpX
 n6SsZWnza5lRcecrSlJu9O7Ktlr4oAnqKlBAhdiYljUrfYwF2fqciLlJDmaHsrLcryVW
 0NCkCvXpNLYSJybOFBH14ShHJPccBlbnPPzqNrx5JlbFWhzvMEzwtP6kDeqSW8Q1rg60
 bP1A==
X-Gm-Message-State: AGi0PuaFPID9DHI5WNleevXOkLoiiHWuxRBy1v4C5fRdUiDDGQW20lLZ
 gWBhSewqsVy2GfJd7r+YJNG1wA==
X-Google-Smtp-Source: APiQypK9hXIJAT9p6UDuSW0Ke/HoSOO0StxcY8aUeQ8xLhHHYW6L8ucFNnBF0yisbryde+2cyEFxTQ==
X-Received: by 2002:ac8:76da:: with SMTP id q26mr15821003qtr.168.1587392770907; 
 Mon, 20 Apr 2020 07:26:10 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id p1sm665290qkd.23.2020.04.20.07.26.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:26:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 15/21] mm: memmap_init: iterate over memblock regions
 rather that check each PFN
From: Qian Cai <cai@lca.pw>
In-Reply-To: <20200412194859.12663-16-rppt@kernel.org>
Date: Mon, 20 Apr 2020 10:26:06 -0400
Message-Id: <CF6E407F-17DC-427C-8203-21979FB882EF@lca.pw>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-16-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
 Baoquan He <bhe@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_072612_992312_DE3C141F 
X-CRM114-Status: GOOD (  21.95  )
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Linux-MM <linux-mm@kvack.org>, Vineet Gupta <vgupta@synopsys.com>,
 LKML <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



> On Apr 12, 2020, at 3:48 PM, Mike Rapoport <rppt@kernel.org> wrote:
> 
> From: Baoquan He <bhe@redhat.com>
> 
> When called during boot the memmap_init_zone() function checks if each PFN
> is valid and actually belongs to the node being initialized using
> early_pfn_valid() and early_pfn_in_nid().
> 
> Each such check may cost up to O(log(n)) where n is the number of memory
> banks, so for large amount of memory overall time spent in early_pfn*()
> becomes substantial.
> 
> Since the information is anyway present in memblock, we can iterate over
> memblock memory regions in memmap_init() and only call memmap_init_zone()
> for PFN ranges that are know to be valid and in the appropriate node.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> mm/page_alloc.c | 26 ++++++++++++++++----------
> 1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 7f6a3081edb8..c43ce8709457 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -5995,14 +5995,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
> 		 * function.  They do not exist on hotplugged memory.
> 		 */
> 		if (context == MEMMAP_EARLY) {
> -			if (!early_pfn_valid(pfn)) {
> -				pfn = next_pfn(pfn);
> -				continue;
> -			}
> -			if (!early_pfn_in_nid(pfn, nid)) {
> -				pfn++;
> -				continue;
> -			}

This causes a compilation warning from Clang,

mm/page_alloc.c:5917:39: warning: unused function 'next_pfn' [-Wunused-function]
static inline __meminit unsigned long next_pfn(unsigned long pfn)

This should fix it,

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d469384c9ca7..b48336e20bdc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5912,23 +5912,6 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
 	return false;
 }
 
-#ifdef CONFIG_SPARSEMEM
-/* Skip PFNs that belong to non-present sections */
-static inline __meminit unsigned long next_pfn(unsigned long pfn)
-{
-	const unsigned long section_nr = pfn_to_section_nr(++pfn);
-
-	if (present_section_nr(section_nr))
-		return pfn;
-	return section_nr_to_pfn(next_present_section_nr(section_nr));
-}
-#else
-static inline __meminit unsigned long next_pfn(unsigned long pfn)
-{
-	return pfn++;
-}
-#endif
-
 /*
  * Initially all pages are reserved - free ones are freed
  * up by memblock_free_all() once the early boot process is

> 			if (overlap_memmap_init(zone, &pfn))
> 				continue;
> 			if (defer_init(nid, pfn, end_pfn))
> @@ -6118,9 +6110,23 @@ static void __meminit zone_init_free_lists(struct zone *zone)
> }
> 
> void __meminit __weak memmap_init(unsigned long size, int nid,
> -				  unsigned long zone, unsigned long start_pfn)
> +				  unsigned long zone,
> +				  unsigned long range_start_pfn)
> {
> -	memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
> +	unsigned long start_pfn, end_pfn;
> +	unsigned long range_end_pfn = range_start_pfn + size;
> +	int i;
> +
> +	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
> +		start_pfn = clamp(start_pfn, range_start_pfn, range_end_pfn);
> +		end_pfn = clamp(end_pfn, range_start_pfn, range_end_pfn);
> +
> +		if (end_pfn > start_pfn) {
> +			size = end_pfn - start_pfn;
> +			memmap_init_zone(size, nid, zone, start_pfn,
> +					 MEMMAP_EARLY, NULL);
> +		}
> +	}
> }
> 
> static int zone_batchsize(struct zone *zone)
> -- 
> 2.25.1
> 
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
