Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542DEC982EA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ox9+C1664bqovc3l9VCunina1bm8yqfbSJqKAOxuZ34=; b=1vmyV1GG9GI5gg
	sLhhCtlFzeUatROfFXjAZo0kwGoMuGzd+obWD64/3vPH1EkLsdXivYw4Hka+ErKjfwbsU8CkMHsaS
	UUt3zCfFh1FGYmJJQ0lG07mJHT3N5CSd/ThG0RMmsqpzMlKuaxYc+O7mxWWHXQJmiel0ldA7aqCV+
	lXkBcPkXGN1xLkh6FqlSVd3wvT3ZCzBhCPGbuyfvlkrEGcwP0mhwHJ+m/BDAHHDECDho+Ia3Ye6l8
	sK3EpqMbLAUX7Dx8+zr07k6+Rm27zZf1IeF513Ej5UZuylhqewxee09BGFIRgNcrF2Y38kwl3JxSs
	7SLyf1MsyYnDL9N7+eDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LKT-000000086ao-4Avj;
	Wed, 23 Sep 2026 11:40:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LKT-000000086aI-0sgi;
	Wed, 23 Sep 2026 11:40:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6993540DB0;
	Wed, 23 Sep 2026 11:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8711F000FF;
	Wed, 23 Sep 2026 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790163599;
	bh=eLrpgKuhQkoqnu0vp0p8SbJmXaLTmBHhu9O+CiN2Vjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BVRkS6gt4XoYQOeCEfHPhRO7ByeHkhEEqQphfsSe4SuC1tCT0cXzY7rwECIeYfmTQ
	 3re4dkJjl7SIZd81ZkMc56LvPd1cysERrJMNbmXFLXhsqS3rtneWLoeLPSSv6Uv8w9
	 NqkNMMg1o3qPDa9QeTRxreqsGE9tRJkygczoThYC6QrTl2ldDxoW9x8DTR+mvQh2uK
	 s2F7yV0/wbhQRtUjiExmkJXBbJDhmPYa+/Zos6QWnaG7zkq3Gk8Aeud5bark6jRmzS
	 Xv0T5RU8A1tfwnKhxw4IPFOwigl65eC/Zok10skwSamz+CrUYHC1z0FbIRAVJRQIwx
	 NnBagpGL/fxrQ==
Date: Wed, 23 Sep 2026 12:39:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
	Stafford Horne <shorne@gmail.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, 
	Vineet Gupta <vgupta@kernel.org>, Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, Hugh Dickins <hughd@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/12] mm: make userland page table freeing RCU-safe
Message-ID: <arO6UpHLChZqAjBm@gremlin>
References: <20260922-rcu-pagetable-freeing-v4-0-fe1ad1f1e303@kernel.org>
 <20260922160021.a2fc65d05d9b867a141e5457@linux-foundation.org>
 <9dcde7e4-dadb-4644-9dff-7fd8a26e29a6@kernel.org>
 <arOVbT5B1FOMe1wb@gremlin>
 <77db2f8f-dfc2-49c6-82f6-8e6c4f7c1fd0@kernel.org>
 <300f92ef-1526-44d9-a01f-e9b8f3fc0cd1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <300f92ef-1526-44d9-a01f-e9b8f3fc0cd1@kernel.org>
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

On Wed, Sep 23, 2026 at 11:39:27AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/23/26 11:15, David Hildenbrand (Arm) wrote:
> > On 9/23/26 11:04, Lorenzo Stoakes (ARM) wrote:
> >> On Wed, Sep 23, 2026 at 10:45:33AM +0200, David Hildenbrand (Arm) wrote:
> >>> On 9/23/26 01:00, Andrew Morton wrote:
> >>>>
> >>>>
> >>>> Do we have reason to believe that anyone is seeing any effects from
> >>>> their arch's failure to rcu-free the page tables?
> >>>>
> >>>> This sounds like a rather long-standing wart, yes?
> >>>>
> >>>> The patchset is thinly reviewed and mm.git is bursting at the seams
> >>>> again.  I'll play wait-and-see on this series.
> >>> Do we want to nudge arch maintainers to review?
> >>
> >> (Just to note that I replied separately, 'thinly reviewed' is incorrect, it's
> >> been in -next for weeks and the whole thing was reviewed by Kiryl.)
> >
> > Ack.
> >
> >>
> >> The only places where that would be useful is m68k motorola, sparc32.
> >>
> >> But in any case it has been heavily tested including on every single arch
> >> listed with stress testing performed (I think I cover that in the cover
> >> letter).
> >>
> >> The changes are not controversial so I don't think that's a blocker, but
> >> it'd be nice?
> >
> > I doubt we'll ever get sparc32 reviews :)
> >
> > I'd definitely appreciate some review on the arch bits from arch maintainers,
> > but if they don't reply within the next weeks I wouldn't wait on that.
>
> Indeed, for minor arches like this the lack of review (it would be a whole
> cycle by the merge window) shouldn't be a blocker for important tree-wide
> progress.

Thanks appreciated!

Greg from m68k has had a look so seems we have movement there anyway! :)

--
Cheers, Lorenzo

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
