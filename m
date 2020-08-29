Return-Path: <SRS0=NLdX=CH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFECDC433E2
	for <linux-snps-arc@archiver.kernel.org>; Sat, 29 Aug 2020 12:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB452076D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 29 Aug 2020 12:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rdEiDaxW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fp5ElYe3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB452076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IFBpVLGI+oQLzRKrNw0DycOrH/iD2seO3LsDtQy6d9s=; b=rdEiDaxWTBQ7gggHK2gg9+ESf
	36aCKarR8ULS0SVFqUMVBWbhxEduuyYoGPGNiKOtX4KFj3+u4+YjqjhpNNLF+/dGlMflfhXlFntj2
	+eDZowh5jNRQGMuo/oaQT+WNtq+9KSNPC50OCLNZ8h3gwVEGr8+GLuHJuxgz9Vwm6G8SaSbbENXpH
	U4Wfm4/bE42gdNH+aYCXwCOJpTzK2fjpceko5ZZ4UMJ1nv9ZQUa2eilZVWPjdNFrJUVsEu1hJ5Euo
	L3DjG0aq7O20kK0Z+MLKmG//pxNmJ1hLXeo0ppMh9XSxtkmLWYn2A1y4idAa2RVIvQsaf5iKICVOv
	4rRyTCQ1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC0Im-0006Qz-0F; Sat, 29 Aug 2020 12:49:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC0Ij-0006QM-Na
 for linux-snps-arc@lists.infradead.org; Sat, 29 Aug 2020 12:49:46 +0000
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81F632076D;
 Sat, 29 Aug 2020 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598705384;
 bh=k3j6O2PJb0vk0vB1utniG9jS/JNcBt1nSQmcyDZTxCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fp5ElYe3V0tNNYpfnbellfFzvYFhu/hM6TDdL6MLzB7lB6xJFfBdT3twyM3Ik9KF4
 qW/L9lOfjkxhTAp1ClFSWecSw7q3I6BPL7fNizx6Zk7MjanQ8xOIcpJ0n/rBAULZUf
 Wnzl/OyhxuFFh4scxt16q5UFwEoufAwPOrAl+okE=
Date: Sat, 29 Aug 2020 15:49:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] arc: fix memory initialization for systems with two
 memory banks
Message-ID: <20200829124937.GH69706@kernel.org>
References: <20200828163902.4548-1-rppt@kernel.org>
 <5595f585-810d-c84d-3562-34398eccce10@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5595f585-810d-c84d-3562-34398eccce10@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_084945_948954_608FEFC0 
X-CRM114-Status: GOOD (  32.84  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 10:17:28PM +0000, Vineet Gupta wrote:
> Hi Mike,
> =

> On 8/28/20 9:39 AM, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Rework if memory map initialization broke initialization of ARC systems
> > with two memory banks. Before these changes, memblock was not aware of
> > nodes configuration and the memory map was always allocated from the
> > "lowmem" bank. After the addition of node information to memblock, the =
core
> > mm attempts to allocate the memory map for the "highmem" bank from its
> > node. The access to this memory using __va() fails because it can be on=
ly
> > accessed using kmap.
> >
> > Anther problem that was uncovered is that {min,max}_high_pfn are calcul=
ated
> > from u64 high_mem_start variable which prevents truncation to 32-bit
> > physical address and the PFN values are above the node and zone boundar=
ies.
> =

> Not sure if I quite follow this part. We should not be relying on truncat=
ion: the
> pfn should be derived off of zone addresses ?

Before the refactoring of the memmap initialization, we used

	free_area_init_node(1, zones_size, min_high_pfn, zones_holes);

With min_high_pfn being u64, min_node_pfn would be 0x80000 (presuming 8k
page and haps_hs.dts). But since we explicitly passed the min_node_pfn,
it will be eventually used at zone->zone_start_pfn, so HIGHMEM zone
would span from 0x80000.

After the refactoring, we use memblock information and architectural
limits for zone extents to detect actual zone span. Memblock uses
phys_addr_t to represent memory banks and if we still calculate
min_high_pfn using u64 there is a mismatch between pfn (0x80000) and
physicall address (0x0).

> > Use phys_addr_t type for high_mem_start and high_mem_size to ensure
> > correspondence between PFNs and highmem zone boundaries and reserve the
> > entire highmem bank until mem_init() to avoid accesses to it before hig=
hmem
> > is enabled.
> >
> > Fixes: 51930df5801e ("mm: free_area_init: allow defining max_zone_pfn i=
n descend ing order")
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> =

> Thx for the fix. I verified that a 2 mem bank system with HIGHMEM enabled=
 now
> works again.
> And I've also added a couple of lines to changelog to describe how to tes=
t such a
> config.
> =

> |=A0=A0=A0 To test this:
> |=A0=A0=A0 1. Enable HIGHMEM in ARC config
> |=A0=A0=A0 2. Enable 2 memory banks in haps_hs.dts (uncomment the 2nd ban=
k)

The second bank already enabled in the dts ;-)

I think its worthwhile adding this to the wiki [1] since it's not likely
people could dig this from the kernel log.

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/How-=
to-run-ARC-Linux-kernel-and-debug-(with-MetaWare-Debugger)

> > ---
> >  arch/arc/mm/init.c | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> > index f886ac69d8ad..3a35b82a718e 100644
> > --- a/arch/arc/mm/init.c
> > +++ b/arch/arc/mm/init.c
> > @@ -26,8 +26,8 @@ static unsigned long low_mem_sz;
> >  =

> >  #ifdef CONFIG_HIGHMEM
> >  static unsigned long min_high_pfn, max_high_pfn;
> > -static u64 high_mem_start;
> > -static u64 high_mem_sz;
> > +static phys_addr_t high_mem_start;
> > +static phys_addr_t high_mem_sz;
> >  #endif
> >  =

> >  #ifdef CONFIG_DISCONTIGMEM
> > @@ -69,6 +69,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u=
64 size)
> >  		high_mem_sz =3D size;
> >  		in_use =3D 1;
> >  		memblock_add_node(base, size, 1);
> > +		memblock_reserve(base, size);
> >  #endif
> >  	}
> >  =

> > @@ -157,7 +158,7 @@ void __init setup_arch_memory(void)
> >  	min_high_pfn =3D PFN_DOWN(high_mem_start);
> >  	max_high_pfn =3D PFN_DOWN(high_mem_start + high_mem_sz);
> >  =

> > -	max_zone_pfn[ZONE_HIGHMEM] =3D max_high_pfn;
> > +	max_zone_pfn[ZONE_HIGHMEM] =3D min_low_pfn;
> >  =

> >  	high_memory =3D (void *)(min_high_pfn << PAGE_SHIFT);
> >  	kmap_init();
> > @@ -166,22 +167,26 @@ void __init setup_arch_memory(void)
> >  	free_area_init(max_zone_pfn);
> >  }
> >  =

> > -/*
> > - * mem_init - initializes memory
> > - *
> > - * Frees up bootmem
> > - * Calculates and displays memory available/used
> > - */
> > -void __init mem_init(void)
> > +static void __init highmem_init(void)
> >  {
> >  #ifdef CONFIG_HIGHMEM
> >  	unsigned long tmp;
> >  =

> > -	reset_all_zones_managed_pages();
> > +	memblock_free(high_mem_start, high_mem_sz);
> >  	for (tmp =3D min_high_pfn; tmp < max_high_pfn; tmp++)
> >  		free_highmem_page(pfn_to_page(tmp));
> >  #endif
> > +}
> >  =

> > +/*
> > + * mem_init - initializes memory
> > + *
> > + * Frees up bootmem
> > + * Calculates and displays memory available/used
> > + */
> > +void __init mem_init(void)
> > +{
> >  	memblock_free_all();
> > +	highmem_init();
> >  	mem_init_print_info(NULL);
> >  }
> =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
