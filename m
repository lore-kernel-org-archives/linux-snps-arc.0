Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8642CEA8126
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Feb 2026 15:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNjTqIwr6bDjP31Dkk5mN68W+u/3fldliZoCsUW66+U=; b=FSm0Yj9xhLwF57
	/m/vZn3JXSlfhIug0cisTy7bYOMdsK/chGqnef3TpbtFLtTQwqlO7AcQsqcbeC4MkRMu4c9jHAkP0
	9yGrY2ChdlvVy6qZ3Nknq0tNM0Ev7b3aSi/dL7gakcVWW4zEwjPf9adk9O4ZdCyhjWebVA1/G10qc
	VxbzAHjIKCs/Zv8o2iw1ik0Yuxs8vqvJJzMNQBWw40OE1NNMuh3+VuQwKpkcOJOW4/MXDvb5iBEIt
	a1JVtyDLo3Cva+HajI9/gkZpZHY/GYshQcmeeNkOYLM49QSIVdtvNNmVtktrOq632D+PMW6eMGfyA
	hTMxsAhXoYlpQt1Yx9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppOk-0000000H6gm-1FYj;
	Tue, 10 Feb 2026 15:11:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppOh-0000000H6fy-3Nud;
	Tue, 10 Feb 2026 15:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6621B43431;
	Tue, 10 Feb 2026 15:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8C5C19421;
	Tue, 10 Feb 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770736287;
	bh=DrZA2lEnZtuNLdn/aPtjSDtEw66qk6VI5lqRaUZw6MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urq6vVA5/zKz3Gz1KYHkENaWXWCJIrhCTsYUwnayOnesr9oKXBBLBNMjlu+XBMlsX
	 uvq+Efs174+4yyISyJyhtDzzs/cN02rvp2iUIhXHkx/anXX8qt9ZAmETpPgSslZHmi
	 dOfA+PMsiB9phlzplVn1h4BGTREeTKK/mGvc6yXqdxvQxzLhPLxFwqFd5ksvBLgBcA
	 bXe2QTazQVXJjMFOS7sSTsI47jqhux9/INIvbsc/ERm/5Uzn5QYdEvPtT9gAmiWW1c
	 l9kJ02GWTagzlQ4QKwDTfsaZp4dl08KF0CAozjxLRxRQf1YPFG1TFMTQoA3lk8WvtB
	 TCA+9Vof32JbQ==
Date: Tue, 10 Feb 2026 17:11:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 2/4] mm: rename my_zero_pfn() to zero_pfn()
Message-ID: <aYtKjEYYiVDRi7vF@kernel.org>
References: <20260209144058.2092871-1-rppt@kernel.org>
 <20260209144058.2092871-3-rppt@kernel.org>
 <b932ac24-2465-4176-a5fa-d9b904600a15@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b932ac24-2465-4176-a5fa-d9b904600a15@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_071127_861788_CF2BED2C 
X-CRM114-Status: GOOD (  13.60  )
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

On Tue, Feb 10, 2026 at 02:52:56PM +0000, Lorenzo Stoakes wrote:
> On Mon, Feb 09, 2026 at 04:40:55PM +0200, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > my_zero_pfn() is a silly name.
> 
> Is it too late to ask for it to be renamed to lorenzos_zero_pfn()? I've long
> felt it was mine, due to the previous naming, and I feel like maybe it's time to
> make it official... ;)

It's not too late, but the pfn will go to the highest bidder ;-P

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
