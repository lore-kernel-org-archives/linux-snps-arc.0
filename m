Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F9EC624D6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xzj/ylircQNphz9y9Pk4hJTvEdpR1OBCU1HTDPa8JJs=; b=ymJ2ZfdD2qYN0+
	t0sPUpQAwCKIAlFjqr4u/ID8q2AuJuNJrp8XMFziOPH8Vfjge873A+6vFmR7atQYYeqe9ccaioarB
	qBukmRe6hKTQNKFWPxLxof6aQLctl+InOSe5/o301wVTNjP/RKxzp2GpNvy2UDG/5aSx0z906aKQ+
	DgDioO0WS6s5HdxCwzfq3amAW6k5ONp27k27X2lXZvrNR7dN/feOt8wqD5jq0w9OxnXyI1FRDkd+X
	2u9rVG1oeIS5DqL0PYcJwfdJWTQs7KZesFuCNV6BQQW60xlcsxCPKExUeta4igY39tXeoFCutnd21
	4cQp6Iwghbeg6q6eRHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oze-0000000CGJZ-0arC;
	Tue, 01 Sep 2026 13:57:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oza-0000000CGIl-3uFd
	for linux-snps-arc@lists.infradead.org;
	Tue, 01 Sep 2026 13:57:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B1E743211;
	Tue,  1 Sep 2026 13:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A71F00A3D;
	Tue,  1 Sep 2026 13:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271058;
	bh=agwo4ogI1pqxdy5iNzHZWMq9fgC/4O+9PRQpyNWft68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MtJhN/fnwJpQ0jDMdX9aHpHd1KWLdoQ8RNyZmmbTur0MWWXkmPyj3DHXvlsvmWwoM
	 iSU3lqn5xllXqxFm2mSgQzIn8ghlKSIaO0g5Rmtqs9Znc70lZf3Af0QFtWE66UeMmD
	 hqK7yAgo/u0x5eWbnXk7HhHlszEZwZ6B3Xb9J9B/Y3l/S+1652MVDWGO7/3KgSHbSA
	 t7TKwr333d6Pek6ziq9tPkoZLuqMJqbrsiIWEM5cbbXgrruzzallxiqLoLW6sxnjAx
	 oNcctNxr/JWwdomR51woir0FpdUhsXHafeDZzCiqTZzSoXNrhOjyF05PMcuMDQvUYs
	 x8tUh8Jwj5I+g==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.ams.internal (Postfix) with ESMTP id 177151980075;
	Tue,  1 Sep 2026 09:57:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 01 Sep 2026 09:57:31 -0400
X-ME-Sender: <xms:vNmWahMoRfGHJylVp69tkl0ZxHuyu14twTOMSzDVmUdqODOOFCaOUA>
    <xme:vNmWamC04sA7HLbhLFXFetRTQirQ4BCq3h9mf_X9eZoWhHHweJXfeNQnDFEkN-eZU
    TNHprwg5j4bwG2-RtgLS24xR65NPMHQ58PhK4w0lkjNf7M__AtigCJf>
X-ME-Received: <xmr:vNmWaq3HcGhSb341ukDeOtyXnIIR93_LM4ZWQrR0RvGyHQIkedHYy9DG-ho>
X-ME-Proxy-Cause: dmFkZTGhE4xc2F35+/cH9QWJSP+T2sSz31kKWkLnMEla92oo5cnqKuXMLiYgktGt0fz0/P
    1nAHqKz2XC4RLt0sZBuXgNoB+I3Lv5/lZeidGsyd69PUr2tNaXTbLl4Hq1jVnQD2pxKsB5
    RUmimEN9ymjBpSBDK05+FgJk8e63uei569IciHBQw1D9FCH5SBdcJBtIvv01IcUYKhgTIS
    f90WviMk+GkUmSBdkywQGyAi+Kb+Qs4cZvbCzXW86phJx62/9vfGS9f/B1vGm3MjEXgufi
    xD125CxPznssp42WHeX1rGj2+Px0NTxJU25KbS651lVg+nwXVCAiD9QMRn4oxFx34KkMYx
    /ylDM1rHu63l41H8z2zMGbuFg+bbu5OoPfGY964XH8pFkw0h2B5akZ5tb7ZRd15sBoxvJ5
    9ZPlIQHmBss5JGvVitt5oDAdab0/sDuOhYj6IGcWNKZc4l5IguhFNv0eBdiZ2XkP48/xyz
    q6bQQrm1dnGYKm/bGEuYX/jvKq3w6ZA5D0pVnRf58fwOUna5/8IR1fgu8jrX3MTvyrkxwQ
    2WRtxks1DmwJsWM60SDXg8t4yPY+L4AyFb79enpcuanRGGerAd74MDz5L2Upjp9/rU+vza
    OvhtVRTr2CvEdlW0VE/ceLVnrcS0aqrnoB++f7ZsN6y8Joe2E6rYjhbsCAXw
X-ME-Proxy: <xmx:vNmWalhfMApERZzjpc7TJG7GtCgdX_4w67qtsX1G62pSARN2GZWDIw>
    <xmx:vNmWaiXm6FAPUBkUzXVBQI0eO7tHb2vPP-rixD6Ad7WIkQTws5E-Kg>
    <xmx:vNmWagSsKBNh9mcPCUFna8QpbE6wA1vVhKB8VhCwB5se-N496qRphw>
    <xmx:vNmWahXZHR9XIJgivKj91oeRT0NDLSv9qe3xafv6It9647nhJIe3lw>
    <xmx:vNmWajSxgwuhyjaLfEEt6Ejf2oTMeCpXSZHSN-d4vScBLmiRwr-9557Q>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:57:14 -0400 (EDT)
Date: Tue, 1 Sep 2026 14:57:13 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 	Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 	Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, 	Usama Arif <usama.arif@linux.dev>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>,
 	Geert Uytterhoeven <geert@linux-m68k.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 	Simon Schuster <schuster.simon@siemens-energy.com>,
 Jonas Bonn <jonas@southpole.se>,
 	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 	Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paul Walmsley <pjw@kernel.org>, 	Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, 	Alexandre Ghiti <alex@ghiti.fr>,
 Russell King <linux@armlinux.org.uk>, 	Vineet Gupta <vgupta@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>,
 	Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>,
 	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, 	Peter Zijlstra <peterz@infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 	Andreas Larsson <andreas@gaisler.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 	Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 	Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 	Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 	Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 	Sven Schnelle <svens@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>,
 	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, 	Arnd Bergmann <arnd@arndb.de>,
 Vlastimil Babka <vbabka@kernel.org>, 	Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 	Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, 	John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, 	linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org,
 sparclinux@vger.kernel.org, 	linux-alpha@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, 	linux-um@lists.infradead.org,
 Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 12/12] mm: change the contract for free_pgtables(),
 update docs
Message-ID: <apbUpMDJglS99_yK@thinkstation>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-12-5456a81c8212@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901-rcu-pagetable-freeing-v1-12-5456a81c8212@kernel.org>
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

On Tue, Sep 01, 2026 at 12:01:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..ff8ff3706485 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -386,9 +386,21 @@ pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
>   * be read-only/read-write protected.
>   *
>   * Note that free_pgtables(), used after unmapping detached vmas, or when
> - * exiting the whole mm, does not take page table lock before freeing a page
> - * table, and may not use RCU at all: "outsiders" like khugepaged should avoid
> - * pte_offset_map() and co once the vma is detached from mm or mm_users is zero.
> + * exiting the whole mm, does not take the page table lock before freeing a
> + * table.
> + *
> + * However, the PMD entry is cleared first, and the table freed only after
> + * an RCU grace period, so a walker that mapped the table under
> + * rcu_read_lock() stays safe, and the pmd_same() recheck in
> + * pte_offset_map_lock() detects the teardown.
> + *
> + * Therefore it is safe for "outsiders" like khugepaged to use
> + * pte_offset_map() and co. for VMAs that might be undergoing page table
> + * teardown.

Is it strictly true?

free_pte_range() clears the pmd without taking the PTL, so the
pmd_same() recheck in pte_offset_map_lock() can pass and the pmd gets
cleared right after.

Readers are fine -- __pte_offset_map() holds rcu_read_lock() until
pte_unmap(), so the table cannot go away.

khugepaged is an odd example here. collapse_pte_mapped_thp() and
retract_page_tables() don't rely on this recheck -- they take pmd_lock()
plus the ptl and do their own pmd_same() under both.

Can we say walks are safe and leave the write rule where it is?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
