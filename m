Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14C606B065
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fDpjrBWR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXmvtNOq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1PJBsUT3LKZzGxjHYOFXJ70I5bflB4Y2r4rTN4oHpdU=; b=fDpjrBWRCyugScubmJWMaxSFQZ
	zETkGDJxoLH8ptXeHOakxDLCSd/+lABgnZu/lcM9/cpCv45TGliO0B6m/HiPSEilTMQbO4LivV2HW
	3YJTTkE5u3YDyleUJo1RTrToWotJ5Gs6bv5HCPboir1CW6y4nO9ipBuIOwT2sYXchS97wms4on6Xu
	2XuCacvrouwxVUaHIKf5YcD6cT0z0AZ/6DwyNrqEg+yoa/jzF96+EYdZBePg0kyaquIs2WbXHs1l0
	KmZaRmxvO+wxAqcM5Uwp2I4EmyNpIxI7GFhxU+aX1lMBqzn/6ANcnw7OZkSYbZUPHrl29NTZXD/GY
	wH0yrpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqe-0000000Ezzd-32PO;
	Sun, 01 Nov 2026 22:16:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqI-0000000Ez5e-0lus;
	Sun, 01 Nov 2026 22:15:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE2954401A;
	Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEAA1F01578;
	Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571357;
	bh=22yhHEiHUWVm81OxkB+6UNZ5/HC7Jn4HF5eln+k49OY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AXmvtNOqtLjopWWCQdkY1kf58r2tsshOv49SBa++XWevEZbozepPlSlFvrN1dcXpb
	 9cANlomEUPj0ZBiZL28+j2QgAXsMv3s2laIiduoGI+ce38Y8h1u9SB0tbHS5wH5wGm
	 +MC9Oi6Swj6nPVmYgaYL1CAKQ9ojJ66d0jdnEvjYS8ncAFvCnZtFlP7tikcjqtWDG5
	 Nh59YfDcc4DI14trFqfgqkMwwd0YKiYIlqlolp6obAZrN5CV473iUawTOR6ZCcdra9
	 V8ouXGtGQ2ZtYTopFX4ZriYxCryYodGD8Ier/J+MdgFsg9Z8lfVl/h7OVFyYY5TBQC
	 LvCqYqw3qq3fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D5B538003B8;
	Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/12] mm: make userland page table freeing RCU-safe
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357135604.2624073.12750471724213497880.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:56 +0000
References: <20260925-rcu-pagetable-freeing-v5-0-31e91065fea4@kernel.org>
In-Reply-To: <20260925-rcu-pagetable-freeing-v5-0-31e91065fea4@kernel.org>
To: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, kas@kernel.org, guoren@kernel.org, bcain@kernel.org,
 geert@linux-m68k.org, dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux@armlinux.org.uk, vgupta@kernel.org, monstr@monstr.eu, chris@zankel.net,
 jcmvbkbc@gmail.com, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, davem@davemloft.net,
 andreas@gaisler.com, richard.henderson@linaro.org, mattst88@gmail.com,
 linmag7@gmail.com, catalin.marinas@arm.com, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, chleroy@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, arnd@arndb.de, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com, ysato@users.sourceforge.jp,
 shakeel.butt@linux.dev, corbet@lwn.net, rdunlap@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-arch@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, hughd@google.com, qi.zheng@linux.dev,
 linux-doc@vger.kernel.org, gerg@linux-m68k.org
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 25 Sep 2026 21:09:35 +0100 you wrote:
> The majority of architectures in the kernel defer page table freeing until
> an RCU grace period has elapsed, this series converts all remaining
> architectures to do so too and eliminates CONFIG_MMU_GATHER_RCU_TABLE_FREE
> altogether.
> 
> This is important because it enables safe lockless page table walking under
> RCU alone.
> 
> [...]

Here is the summary with links:
  - [v5,01/12] mm/khugepaged: deposit a newly allocated page table on collapse
    https://git.kernel.org/riscv/c/eb823057e092
  - [v5,02/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for most 2-level architectures
    https://git.kernel.org/riscv/c/d22254fd57f0
  - [v5,03/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for MMU riscv
    https://git.kernel.org/riscv/c/5ae75414416f
  - [v5,04/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for MMU arm
    https://git.kernel.org/riscv/c/8e645d98fb78
  - [v5,05/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for arc, microblaze, xtensa
    https://git.kernel.org/riscv/c/799bd3c4be5f
  - [v5,06/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sparc64
    https://git.kernel.org/riscv/c/461a24a81215
  - [v5,07/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for m68k-coldfire
    https://git.kernel.org/riscv/c/ccdaaf591664
  - [v5,08/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sh-X2
    https://git.kernel.org/riscv/c/a72df945113a
  - [v5,09/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for m68k-motorola
    https://git.kernel.org/riscv/c/0f5cbeebe00e
  - [v5,10/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sparc32
    https://git.kernel.org/riscv/c/35dd856770f3
  - [v5,11/12] mm: userland pgtable freeing is RCU-safe now, remove leftover bits
    https://git.kernel.org/riscv/c/35e340a47888
  - [v5,12/12] mm: change the contract for free_pgtables(), update docs
    https://git.kernel.org/riscv/c/a5c0a39d0e57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
