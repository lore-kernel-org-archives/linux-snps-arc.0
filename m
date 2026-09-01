Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4645DC624D4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5xkCHcZyWEkqls1JyGjCJnBN7oXAt/S7wnDuVpYFXg=; b=NSlfwTbpZgozeB
	XRNIKTEaKdHE9B5wKKV6l094p4X1RM7VgdKQNiz2iropJ48UwyHoWjeDrqw5hErzuqoEpgQ+lNbFa
	J224tUgqXMGNOtW/38TFcMQEUQEpLqeWDluJ8FITh5u5MfkIie+yC7I9l/3DgfmDvA+swtX/brv4X
	yYvDblsZ7DrIIv1ruiW+aKN4a2Oh1VCfD1JL8/stjgtCelrIVtbLIU2LIRSQ5tiBRan1bIWi2DmvX
	TpaUKEjr7RY0XEr1QeboaEkbPg0maRVIku6I5DuEDv56nXVaMQaLfdzZif+View59ULI/cIm25v5r
	xmWGl04/mh+uSDQ60QVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OcO-0000000CE1h-3qH4;
	Tue, 01 Sep 2026 13:33:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OcN-0000000CE0l-29RS
	for linux-snps-arc@lists.infradead.org;
	Tue, 01 Sep 2026 13:33:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F62142E8C;
	Tue,  1 Sep 2026 13:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F39D1F00A3E;
	Tue,  1 Sep 2026 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269618;
	bh=jcbNqyZ4CJOFUcx+fZWWPKksNhyQwz/xPjmgvkWytSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndLlqhHlVeL1h7g7ph+Wt2NFtmrZ4rOV34TH/BkR1LV3hXV72TFKXBa6SSiWah+YS
	 osor63kOccehDjmVkh3sQpwcQSMSNYVcFsZhRDfV0BOZWC20X/uzVpPoz11vEPx72u
	 kLe6Dj8pgXjqMdQBlQ+iOksFRpcAk/cRL2f/1AsjTtd62N9p9KMdTkAyeamslLimmh
	 rePS6mrE/57HAXFkLSbWMR+W5a6VAq9eNnH/iI1RsHXSsazC5suOIyBDNrTwwP628+
	 9FLGn6PmlvlXDRo7ABVcbcGo7/AsOm/eX+GOgiWGn/e+QIZmVf+XE4geioRTZyxcRH
	 0zLk/FGxJh8gA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 57E291980064;
	Tue,  1 Sep 2026 09:33:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 01 Sep 2026 09:33:33 -0400
X-ME-Sender: <xms:HdSWar0zDxM1rzMXPVKSiiHY4KJJXKW9_dKFmXqdbTa_fmaDqPnrAQ>
    <xme:HdSWasJnHNfyfuCbnPXJ41QnOfMcQ3IsJbdR3mnGKXr-4wj9FELqFm8ZdfeRPj7fy
    bnm6jh3UIcKaloZqTodN2-BguOMyRSr9poABUPkwGcmSl04lFepx8g>
X-ME-Received: <xmr:HdSWamc0hBDzYeZ6meHT1N8NrjNwQDlG7ndA51A5p6yJYm1erjaIFQqZ_aA>
X-ME-Proxy-Cause: dmFkZTE7XYI88DUY2gRkJOK6+ZyCIFoNn8bzP7pT6CkwBKHBvKWUe6kvcLZyJKqoR/mFua
    tnuce/0i36y0TC7Im4WvZyoy/crD2rPu16GAU43MkToFESYNa+q/dgDmYeFoLAKy++6ZgW
    8jn2vUxLTK4d+JU7NpIMhvmFWN+lBL6CrhfWBNMDXcQ2eFN5VMfwvgG7wpe8357MD3J5gK
    7xFBRFrqPTsz4yMLY+EEChvmjl1qNNrFzTmc4wdkVOaUc1KRt3nz4X6b9lgB4AP7QFsDWQ
    tYyrUQvI3wO8SrGFb+1aGvYLJgVsklk3Kc0+LAmLAEM6pSFrAQvRZGfFtBIFEXt5smoDZ8
    0sIIODp3p+XbaMM1IQmfCvE2+2bbjw/rRlbPqyxvx3AWjW0wx69YF5Ocr+JktO0nTZOok2
    HEw0ft0H3myd2V1s6FmW7lpkinX5D+jdOQrkC/osJIL3mBMTcjL7XfwqTbI8tt3mank0qt
    BcT630GiS2PTitGfmJ6/iVLTorQObFhmiWUpu/4o8m4w+lLom0XGtnouU3SvS4FcugWWNZ
    7nEECz0GGK+6YbBSmEMxBhw/vyLb4HqtpoQS+cM14FfTsm1gjY737Jmi4qjcP7ghw4NaMo
    mSjmk0LJqLELQl49SSqDTw86/FRQj/i6o2/Z7vFbf6wnUbIU1mKMMzFy+Xyw
X-ME-Proxy: <xmx:HdSWaorGnJV8X3w6RQ6-yTLBHwkt_MBfkV8RsDaiRQlkH0hCDXuTig>
    <xmx:HdSWam_C35Dm2JBzL0A5fzPuG5ZvMut58CN7trPjhfIb_5hDuszCGQ>
    <xmx:HdSWaobzZlmDe5Y-27Rtv7XIlXhpki_IJYzJN_lp2MB6mY3t1TeGow>
    <xmx:HdSWam8XuaM7yobHeA1s3aD4FW-Jnsz8789jiGSamkl6EtIN7IErBA>
    <xmx:HdSWaoYZmoLC2txSUqseUpEqs0XigJd8k-YHiiGmmzkLSGyss1bakguf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:33:15 -0400 (EDT)
Date: Tue, 1 Sep 2026 14:33:14 +0100
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
Subject: Re: [PATCH 11/12] mm: make userland page table freeing RCU-safe
Message-ID: <apbSaL0YaQqtO9XB@thinkstation>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-11-5456a81c8212@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901-rcu-pagetable-freeing-v1-11-5456a81c8212@kernel.org>
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

On Tue, Sep 01, 2026 at 12:01:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> With this change in place the kernel policy is now that all page tables are

s/all/userspace/ as subject implies?

BTW, what is your take on kernel page tables? Do we want the same policy
there. pagetable_free_kernel() is not RCU-safe as it is.

> freed after an RCU grace period, and thus it is now safe to unconditionally
> perform page table walks under RCU, safe in the knowledge that page tables
> will not be freed underneath the walker.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
