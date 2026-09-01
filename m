Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CD5C624D3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j436graEr+d+oRtodxCc76E7HfUd7TgX7HXu9ngBZFw=; b=ZjuM4/HwJfzKML
	aBjT6qt4FlehzOxK1GJ/af5Z+W9ods+H3DM4sfyksI5UnxyW5CMQCpsBYJkbgooPPbyIbBzA9RLNA
	RnHtvu8vsFGDRRZRWoRJpzsTHZ+kse5oghnpMHmsE+XlyHtwSDi8h6DphNqQpLGy8mDl+UwT4eSpM
	UxuB9Q8ATWD0TEf1uQEMrXmZJ5VknyGmPLvk5QiF9vhLI3ll/6PRRIumwWKukVqNC6LmXM58dRecC
	6EHdfP4YPk4arZ9jzTbsJH5JiFo+9IS71e9YMZR6MR1t5gWSb3RwMEIg+rGf8ilKu8Rx+BDIHxiCS
	is9jFo8Fl3vutubAUE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1R0B-0000000CcPv-2RQo;
	Tue, 01 Sep 2026 16:06:23 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1R07-0000000CcOC-1V32
	for linux-snps-arc@lists.infradead.org;
	Tue, 01 Sep 2026 16:06:21 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-92ea24a2dbfso10713785a.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 01 Sep 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788278778; x=1788883578; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqCXc1d2wL50duIrdszOJfzq0EqANvFRgXietPv5nSU=;
        b=CipmyFXprLXKCdf/YdPGgd6GanNr31BHGVcJyTIslXAa+F72TrHGnme9er/cbcnkT2
         +ERkBr4tOnWwbufL2WQL3Ap3iB1U0NA3WzCxui/lV2Ixcw2/GJcS+yD72yj0HZghrt+M
         ujNoOAe1BDD73hD7U44ipG60cvP4sp8BxxioX+3v/GmjNbcteFWromxN/IyU+wjE1WmU
         HLnO7lk03sn6Es03MApgQ/pqQr3PLnGmWslHkJdpGvguFQCqCY4V0LmK0k2t47zOqf/M
         bEx3LhsOhUhiHjvJ5dOF1adhKqBLERgvz/YdyjR2JHWdD6ppuw8Yon6exb+A4cjWJnpK
         YzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278778; x=1788883578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqCXc1d2wL50duIrdszOJfzq0EqANvFRgXietPv5nSU=;
        b=PAb9ANXcF4xstuM10aCut/RR4CaIm17CvrIRQS2SWfxFR2CrR1/OzzMkC9maUjT8oM
         ysO/MbOZTvX6LXytjK3PSYAjcXM3ewbX1sW+R17enDTkjmMijdqDVtgseXZk0sp9SUDi
         uSXmRdMfJs09VhTBKVDKjsmjlkAe1tZ1lHNBIgbSAWWSVgy7r4/cS60DbzGG1lat0JL9
         0LmXfhbaF3LJcYrWwp380KWu2sRMHbtGwRceMoEcsdxmyMaGClOT2aPw+4QLcV+VCpec
         cX3+f2/IZBol2YiKT/jHw33xe9wS4Vx4Dg7W6N1AKtzPNpALINs6OLWV4OLuRZiIce5N
         OIzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCLOKNwS7Wz5vdHpzlc+EMpmN0LOlxDLbUSBh5kIJ9F6jFSXhs0a9fG/5w2Bvs163fhImShIfxrDdFhJ4YaA==@lists.infradead.org
X-Gm-Message-State: AFuF++k2W0edYDiilGO6+c+TNh0QmTtg+gJzAnX9OKZqvgWQCkl3WBNn
	oQglbwzscfUMNmlff0b1Fb1ad7z9hcFMluDSykvDzKi+liVtm6sDJq5PoP0utIHGD6E=
X-Gm-Gg: AR+sD13gNnde2DLePI+6o/Asu8Bx0SXOayqwSN2Vl01AnCyeYWD/eM2jY2zODy87Mez
	EVFezTM8tStYIKnTeFPwO+w4qBSimK4lek3GevQBy2z574r9qLaK6m06t+XLOo76dYfY1fNgwy/
	8WlauqX6gz+1tvUIsZqXCDUSmR8i9gcnvnpWmfIh28SybftRpGCynS1pE9BnVNR9jUzaLgTtV9C
	P73wafxqcSB98w+8fph7kx00C4Vl3w8to7bNuzVTJIVU6gtGuOD6wzzMmtIUke4nujKXFOFYfG6
	atAnRt/rg3uW+CrXqdGhpK3GVyhA0MtjLpFtqyVktVqaDzwnZGUEjKXz06+pV6xSJsU3hY1Isjj
	x69WBgvjBPXaaO0/iQXtV8R6M7H7QYgCgkCd8nBhC8nbsNkectZnxJEVujD/Q+EHksGS+/XKr+i
	sSGyzN0VgTrM+U2r5b+uhHQOVb0WPG2iBx8+jkFyWX+pfgYrTrZ3XvKO/A6veOIFhasVBtCpmte
	91Iaue18GX4H4nrU6Z5ymi9aZEdZtMsyBqPaEBRMBjnug==
X-Received: by 2002:a05:620a:21d2:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-939139002d3mr3178331885a.22.1788278777843;
        Tue, 01 Sep 2026 09:06:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93922e5278fsm886283685a.14.2026.09.01.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:06:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1R04-0000000BtB8-1Fgr;
	Tue, 01 Sep 2026 13:06:16 -0300
Date: Tue, 1 Sep 2026 13:06:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Vineet Gupta <vgupta@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
	Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 01/12] mm/huge_memory: zap deposited page tables after an
 RCU grace period
Message-ID: <20260901160616.GD56830@ziepe.ca>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_090619_409712_AEFAB714 
X-CRM114-Status: GOOD (  23.57  )
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
> On 26/09/01 04:28PM, Kiryl Shutsemau wrote:
> > On Tue, Sep 01, 2026 at 03:41:17PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Tue, Sep 01, 2026 at 11:24:08AM -0300, Jason Gunthorpe wrote:
> > > > On Tue, Sep 01, 2026 at 03:12:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > >
> > > > > It won't be costly at the time of the calls obviously as its deferred. Maybe
> > > > > increase some time spent in softirq but again is 512x that big of a deal?
> > > > >
> > > > > I'm not sure how you'd both defer the free and somehow utilise mmu_gather here
> > > > > either really, certainly not without it becoming extremely messy.
> > > >
> > > > The less costly version is to thread the page to be freed onto the
> > > > mmu_gather through a linked list in the struct page memory. This is
> > > > super cheap since it is just a singly linked list operation.
> > > >
> > > > Then when the mmu_gather is flushed it does a single call_rcu using
> > > > the rcu head of the struct page of the head of the list. The callback
> > > > clears the entire linked list of pages.
> 
> If you are going through the trouble of doing this on your side with a
> custom rcu callback, it might be better to pack the pointers in a way
> that does not need to pointer chase through a linked list.

Well, I have 8 bytes of memory in a struct page and can't allocate in
these paths, so IDK there is another option..

Jason

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
