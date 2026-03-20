Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5606E108B8E8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Mar 2026 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTCp1RX+1GQ4foSX2kojmelXw1vDzMX7WNHt2ZavR3s=; b=wSJzmLcIpEEp2h
	uOKlWb6qOeyRgoHAax5ZYW4ur2fTvbX9RhYADjZVxRcp0tvj+f3PK+JVJf98oM5dTi22X2nuzkYWa
	YwbhPMkiNXuBDdGE00xOxp9JpUxSkKaDxpGUNG9R0EFYU9Ap8DKTmYNybkK1rZnktTL6atrp+xQ9/
	zcSL0KY6AO84iRfPKvqcUqTS4TA+Tt3CVmADjqDh0XJOT1IM3d8A+Td0T6gf+FTqhk362QtGh3N9L
	I6+mI7oFlIkj0nf0aGNXD0nmhqHBsf97qdFOR10NyBiKOaAyV9Q1rbkA2hPnoStKe9DPxV3u1xsmn
	4oRE/pOJvqrPL6hu137g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wit-0000000CXza-2hrs;
	Fri, 20 Mar 2026 10:04:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wiq-0000000CXyC-2PVA;
	Fri, 20 Mar 2026 10:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96C7D4172F;
	Fri, 20 Mar 2026 10:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5136FC2BCB1;
	Fri, 20 Mar 2026 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774001091;
	bh=SlqXACEW1bvWaBbKKIpFc5l9X0bOJT5QGbTI1CG7U9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D+ceYj6QItOJroZYLEyyE2MBeFVEH6IM75Vi5G/PN8ZodL7Zj2nolMyC/N6rcOzkO
	 gTCj46ngQl60VkkqPpRigcsp0XQiO42A067h6OTJgyefrwGzF90ZZtEs132xst3EGv
	 ke8Hl2sGVHG/IkTdRc9G/zU6xxL8fF4oFp0Ar2N9JRwlsGuLC+7u/6vxBxw09AWcEj
	 wZJweQNUPpvxCo1otppn/Rx/k/XQG4Ouo5iXXkmaQrjxicqq3obmIZPMt/6B5YVhLa
	 1Sl2cxlTleUBCVRG3Iv6gjwGNTfScFbagjQpLmpHaNteEB95xldtKJALrkvf9Y3A4/
	 y7TCZZbtJpalA==
Message-ID: <17a34a6d-8fb0-4010-8318-faca575823e1@kernel.org>
Date: Fri, 20 Mar 2026 11:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] mm/vma: introduce vma_clear_flags[_mask]()
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Michal Hocko <mhocko@suse.com>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
References: <cover.1773846935.git.ljs@kernel.org>
 <b2edda6f00c10ef63013257f282cf155fb371b06.1773846935.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <b2edda6f00c10ef63013257f282cf155fb371b06.1773846935.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_030452_655852_2D4FAAEB 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

On 3/18/26 16:50, Lorenzo Stoakes (Oracle) wrote:
> Introduce a helper function and helper macro to easily clear a VMA's flags
> using the new vma_flags_t vma->flags field:
> 
> * vma_clear_flags_mask() - Clears all of the flags in a specified mask in
> 			   the VMA's flags field.
> * vma_clear_flags() - Clears all of the specified individual VMA flag bits
> 		      in a VMA's flags field.
> 
> Also update the VMA tests to reflect the change.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
