Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C14BC61DD3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGzGqzQ6V6v0Rm5qTPxS0h9t2s6vqzaDzzfXTIucYnk=; b=0UIFuahOWrZXHy
	7DN989fKzJ9Yo1VrXqhpm84/z7qHwOPtZRItRUXM1/PAAbcA0M/dAmdXNU07kGB3JBjzSIELJ2Z9M
	F0cmAKR7iPlnYzDpDoOF1XEjt6HY72NGqza6QHwgBz+0sVyVwoy87zNmU7jHep3tJ+fKG7k/g+L5V
	+mrgAoNOoR+qtqKf277ALeK5702naA09Rrh1WoiSvIpAXGepln2xg6nGmFSkCz+LTj+yiUWVpHnfn
	93KtD4zhM9sdFHFVqwaYvp5jL+Icc9VctUIg6NRHMk8TWVPwXwnySycAUTPWs1F/HDnt0j1oKhGA+
	zsp2To3LkeXBOU8lL3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S3g-0000000CmWS-15mQ;
	Tue, 01 Sep 2026 17:14:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S3e-0000000CmVE-2Y5o
	for linux-snps-arc@lists.infradead.org;
	Tue, 01 Sep 2026 17:14:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A48686013A;
	Tue,  1 Sep 2026 17:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589FF1F00A3D;
	Tue,  1 Sep 2026 17:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282841;
	bh=rxSJ6upXAwrCdlBg+zPXUt0hwX65jWSdNQ6WR7zOubA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bbYz89cH6x21BWeJo0EoNiV5CO/mmEhDQeG8fKSGfNw/0OKcsb2v5SzBvd5oreK3r
	 xHLPN9IOaGzd4MIo0pXrZxLaUWPQ0KdBhowgr0Q3/jNSgW4J5EwLYeQT9yPZUFmwcF
	 2PCmZJiRWDXMZM1jFI13EFHvpAQL+Beb9gU2XqwaC5A43raFitnaChlwyJIA0tSC+k
	 9QQc3M4ji4T8Tu2aHBBgInAKiHGUmZ8eWLrX+4kryEgOoA1Pmckss38OOE7E1d+dAm
	 +J9P7HIIfxmObRhNHORbUbV5/n0+MdczaYHjRtEPIsTtBlY+23isyNNQQVOx6dI/HS
	 SUXxJWQc9yyZQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 67D9E1980083;
	Tue,  1 Sep 2026 13:13:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 01 Sep 2026 13:13:57 -0400
X-ME-Sender: <xms:xQeXaqV8loEGFnZexkyJCxP3rg-N4QYIToRp3rKjkDTxrnVQL1gS6A>
    <xme:xQeXag4Lh3DDrks_RrbzG2k8C8awQN9zc8XObGUj7pHz_2iNwoMm0pTbNT7CTAPNk
    vp0PQjkhXlbHPIb4iLRJEEruCXo0FxnN_E9iJQQljRa1p3y5LRtH20>
X-ME-Received: <xmr:xQeXaqU1oLe_Okvv0a9Qy1njv_x3ymejuVS52bmcLF3DCgzxB4uHGniaR1M>
X-ME-Proxy-Cause: dmFkZTFsVsS9QxzfNE8Zc/xkNjZIEuir/bwAcyK8hIwM2NebUd4sQatdwIPqNsbpB1XVse
    5uZUzDbqWNwZ48AG7ZVwmjvFiAKn4L3IYAvaFn4DQPDJPouw0ut3ChVPjAmMCRYrpQks/f
    1IjUjSdR6rGJ8PH/8ZN/bq9aaNcIwsIHJ+W10sXj73V3Ek8Vpnv1A6OHP+E9dr0YtgEEKV
    ds5NeYj4TkdU/h2OzTs/e9I3HeHw006SE6KQ22XcXsVtQ5Ridmg+p2UCCPMnSsCFJwXq+o
    NfKF1bGQIi/LvtSee1L5bRM3w76AYvrF/BqhfAU9qLCyleEU1XUiaHShW9MyXHSbVgJaOX
    hMwdwR4eftF02GCubB+SFa7Q4QpoVzw7JM1DRHGNHXFwhmRbAVug7W/IdOcLb/nrDMWef0
    KkUiA7nHVPxKD4AT8RxS/44MjP9xZYwD5jxu4rR1zHMmEvxhsrMZa1SDysOwuA7RUs7KJN
    4ytLSGjlddPPqpyqvZaXgCDNd6mWeyIrBhFBlxdH7EUzrGV3F7qSsiNCyyHYUX1Cb4RUj4
    hSni8vyJoXkGiivg9CkTIGCtDY2O1wlpN5xSB3Yzxu8Cf7vy8qmTAqMxZaY3f8YuCqBoRV
    m1CTaBp39x6fO7SaPEpIs4UyFfLgZpIfwcnGb6I9WUGCyXkqsD4X84Y2L0cQ
X-ME-Proxy: <xmx:xQeXau5SDPm8X9ZPVmC3nkfvnblsrbXXAB3UELP8S46KGzzjm75ZIw>
    <xmx:xQeXapmTRhWrJa2dimFLN6HQHdphUKlZ5N9N_s7BRhRL5RYJv6aymA>
    <xmx:xQeXaoZRRZdtTpR_oYP130ILceFgEOa8W9-fNA_pOWU-V2bjGgKeDQ>
    <xmx:xQeXalF_s7CzAQ-VbOU7soyFklnjyuRKWmz2tNRVxZ-CNHXwYzKvAg>
    <xmx:xQeXatt95GT14XoEAnDFWPH6gQb2fRXK3au_NtwTvG7r-BtoMwwQDwVx>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 13:13:39 -0400 (EDT)
Date: Tue, 1 Sep 2026 18:13:38 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 	Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 	Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, 	Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Guo Ren <guoren@kernel.org>, 	Brian Cain <bcain@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 	Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 	Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 	Stafford Horne <shorne@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 	Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 	Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>,
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
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, 	linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
 	linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org,
 	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 loongarch@lists.linux.dev, 	linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 	linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 Hugh Dickins <hughd@google.com>, 	Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 01/12] mm/huge_memory: zap deposited page tables after an
 RCU grace period
Message-ID: <apcHiE7jDQaFYXOM@thinkstation>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-1-5456a81c8212@kernel.org>
 <apbOlyF77yDCV4cF@thinkstation>
 <apbcoMTVlL42G5tg@gremlin>
 <20260901142408.GA56830@ziepe.ca>
 <apbiB51hjm-9pRzf@gremlin>
 <apbuO_QveZNAz3ns@thinkstation>
 <kasi4mkjkt56wxsrmphm5o2qfg2lwsdxf3tlmzx5tq6t7uez74@kozleoavd6r2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <kasi4mkjkt56wxsrmphm5o2qfg2lwsdxf3tlmzx5tq6t7uez74@kozleoavd6r2>
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

On Tue, Sep 01, 2026 at 11:54:47AM -0400, Liam R. Howlett wrote:
> Do you have munmap() performance dependent workload that you are
> concerned about regressing?

exit(2) path is performance critical for many workloads. Like, if you
need to restart VM.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
