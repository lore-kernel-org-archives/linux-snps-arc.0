Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A93C61DD3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAcdWjHiY3dPSUjtPxFg5yUooaTvDtfuqyUkl5/EsG8=; b=cezcX/NwIelFMu
	VVB2m14XV/PHimXAbuFxUknXZSZ7P9O4rEj9psuttt6drDtJcXasxVmtFALhy64lUpUaUNZdWjLY+
	I4boMgn8uwk2TEk68yM4HgOWb/2NttSIbC00nEg5wYDT/IQAs7yGGHhvzY0ut6pESVMKt54UPY0f6
	MjuHa2gjavIEFR7j/Qir3twpwRFIwF49jjt7wGHIdrSdYy0cY2mppA+2+7gBXWQLyuiTg9J3s6awE
	En+K8bDB8cDj+kBU1Prke4vUeGQfx3bUKUd8XKB5qYUZ8OB6qcxJTRdqBQVRqa4e4mgQvcIuNTY9U
	zutdp6hKhgEcC0laO5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PPM-0000000CKOx-2Nqs;
	Tue, 01 Sep 2026 14:24:16 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PPJ-0000000CKNV-1fVa
	for linux-snps-arc@lists.infradead.org;
	Tue, 01 Sep 2026 14:24:15 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-92e55b62640so311537385a.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 01 Sep 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788272651; x=1788877451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMNw5MzyW2DJkQCetuS4jMUrMgDtCzVkmjImJH3QcQw=;
        b=CNBxLYgJP+8fneULJtygmwJKF57RMZRGoX3R9XfgEyJ7f4aHATM7dKrlYnyzrbOw3D
         hIVbjH43qsTIOR/179LE6drwoYIq/5bYS+InDOfL/5hoP+qNGmJ0kBqUaDVTQle41eou
         BljZcAZz0xX7S4jD19bjf6+Q6L+1P1PhoYroEei21lZG9JDZeOKDT+TLIyzazyxLaRow
         YtgwYwb9M8o2CwU4jdZPM+jdAVJpdxq6tmEIe9YDu+qtJGEXQ6lnXYOxALI7vG8ukLpJ
         goBpxKwXzhBz2Xw00tS2TlttdJkRLbi8yIH46F3Sah2ZGMmajA5e6UAeCZUvyDOIXNfT
         Jyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272651; x=1788877451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMNw5MzyW2DJkQCetuS4jMUrMgDtCzVkmjImJH3QcQw=;
        b=FsQrLmkN67Mu/BlyZMlyJ4ywfVttslnBf4lhS1S5hI2K6avAjZfnVDRyHZIZ6a2pJ5
         IW23vscl9c/vuvUTr9UBzn7b7OTWAM9Ou4m0uw+tkayQeTq3SX5J/g4Zy1d4I3t/fpVT
         7WGACAIFprsUS4D1DixMuONSHRw78CxpxF/tydvCOfBEaACX7HEd+1OhpBZG5J5Btahi
         DEoNLUehI8WRuON/WIAuX/6QrDgYYzJCjYr+q1PufmYxvFU3Vc32U+aQTREa9FHujnbH
         mJuqzNXTB686ZXFk6bSFKcAVyeB21na9aa8PKBZ3tmoBCvoxs4aFBWy6xxLiujiwxpvk
         0pGw==
X-Forwarded-Encrypted: i=1; AHgh+RpqPeTyik1Sp9/4/9skZfm50EMt+tj06WOIvenALi5zYwMFziqWZSYWyTDFn1e8i5qM/5OgKXGdvOXEGZkOvQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lhKOnSRqyAE80jVnEtSz8ImnL4yfR1PrMC6kF14QYvFO+6aHwj
	N7IWlQDRRZSzUcrvCiCczcYs9swNtLe4q08J/eZHy0cre2qeA9zUUIHShJuAjdLrHRw=
X-Gm-Gg: AR+sD10agKnzNmWb988lDOZh9ttYKr/VHE+w2f+HfTR47kxe1XjSlRTuY90Afr+zOSc
	03mIwp2+NGPILTWgzGAonfMfHf69HDv2paF9zrhOej/dUyiFpHLThWVcx798Y/V8pm3OJYRHYJD
	Kssw7e3jepn8DMca1GoF4pMwfHS4cuX23qiXvUtQW4LIgBc4srJAzBobs5Vzwykyc8V9RaUuqbG
	Xlm7ZaKMZAsUkCuW8Q9TAc61WxH7qAilWigEC/sKbFgDg6s6EeEoIOvGCrrckk390mbrd2fOwBc
	bFK11DGlxbJYyOhWPnpPFnu78apeYfHwk7/Z39wemA4u/MJEFaWezl8yPHZ/jDJgEOmErlpbyhw
	6IWH9rKtafjB+g1xs+tw+jf5BrqcRoir9OTEBoeSmiyZ4hRNGOOpagv+5ozOfMelwbBEg8FAbXf
	XqyN79GZ9yZUxTjKh0FUZWNrMX+qzOW8Uic0wT3xFTLSTux3ia28MF8xHJFWycMhq4nl2GBYcrl
	HZO5Vk2hV0kYYxznTwKjq1OfiNHadbKbOt/GLfvTALp6Q==
X-Received: by 2002:a05:620a:29d4:b0:934:ab73:ac53 with SMTP id af79cd13be357-939134fe550mr3924451085a.0.1788272649971;
        Tue, 01 Sep 2026 07:24:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917012b65sm1040535485a.2.2026.09.01.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:24:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PPE-0000000BgeE-10ID;
	Tue, 01 Sep 2026 11:24:08 -0300
Date: Tue, 1 Sep 2026 11:24:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
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
Message-ID: <20260901142408.GA56830@ziepe.ca>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-1-5456a81c8212@kernel.org>
 <apbOlyF77yDCV4cF@thinkstation>
 <apbcoMTVlL42G5tg@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apbcoMTVlL42G5tg@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_072413_547589_F82F6011 
X-CRM114-Status: GOOD (  17.24  )
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

On Tue, Sep 01, 2026 at 03:12:45PM +0100, Lorenzo Stoakes (ARM) wrote:

> It won't be costly at the time of the calls obviously as its deferred. Maybe
> increase some time spent in softirq but again is 512x that big of a deal?
> 
> I'm not sure how you'd both defer the free and somehow utilise mmu_gather here
> either really, certainly not without it becoming extremely messy.

The less costly version is to thread the page to be freed onto the
mmu_gather through a linked list in the struct page memory. This is
super cheap since it is just a singly linked list operation.

Then when the mmu_gather is flushed it does a single call_rcu using
the rcu head of the struct page of the head of the list. The callback
clears the entire linked list of pages.

Since you have to tlb flush anyhow, it makes sense to always use the
mmu_gather. For example the design I ended up with for iommupt
accumulates all the invalidations and all the free-able memory into a
gather then invalidates and frees.

This allows maximizing the tlbi efficiency too. You can't do call_srcu
until you flush the tlb and if you call once per table then you are
also tlb flushing once per table too.

So if the kernel really does want to clear out 512 leaf tables the
optimal implementation is one range tlbi for 512 entries followed by
one call_rcu to free the memory. Hence the gather..

Jason

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
