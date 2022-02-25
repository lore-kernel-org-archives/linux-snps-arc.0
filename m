Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90E4C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Feb 2022 04:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7JHGH1zuBk2TPoMc18S//oIeddkejN1mebEMA4DfCU=; b=c+AUp+UQCEpRtJ
	JYCu0uc4HVIiLjV2ZQwvr+A297HTzgZjGJ3EZniICqL1uMrIbwaBL3A4d6yy0f/4Ar2k1nNs/bLKf
	9J9216B7pzuya7B1wqM7kQhbE0J1N5gobG147UmNEP4FCXhvJImhKZbvUwdmabGJBW+NMVssM0JcT
	oUvLVldCrOe5/MOc8E4YxoUmMFfImMEgKZ5wB6eHINriT/OATWRlYL2smFQrzP0TzR6/uC9QYyz4X
	mF3iKcMVDhgch/CRCZNiB8qJUfrvTwvQ/7DO8Pu/9jyTKbUw0Csvhcv9glVc4hK4EMkkDVtWKQcfj
	L/hbkrIiUT1LJLOfDwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNSIu-003J00-Oo; Fri, 25 Feb 2022 04:34:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNSIo-003Iwi-KC; Fri, 25 Feb 2022 04:34:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D636B829CF;
 Fri, 25 Feb 2022 04:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F6C340E7;
 Fri, 25 Feb 2022 04:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763634;
 bh=uh4UnFdDR53Ujc6m18f6ctjt+AIyhJXv2xufWpNaVhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uvtrsu50Hf9ISgTqjw2cZIY/fdalMvrStTdfqoQM3mdhWwRTlcM+di3Mlxj2LfRYC
 sL2lOFI5CCKzGB0MNHSMJUWPqE4dtIOpz2JXIrS4+Xkvjw7ulJEnCWAELTi2BsI79T
 +YcmqfASppeT6+G8sHwqPvTdqA+0hk873k0laznUkKMLOPw4ZEEscH10+2t1L5fKp+
 8BfsQshsS4Im5IcgpwMXaxmFYPmHS4QO6tZE5Cu6VT+1C4lCHB7iNpJZvNEdHwtoNJ
 zTpbMfhiIoucAZFTRmPZuLhWqy/lBlhaelfx8iUJ+lK7d4LQiirbG9AaOIPIgpnmXG
 aNgH1u0nAoM1w==
Message-ID: <3927b6f5-c8d0-1421-407d-850ede02dd0f@kernel.org>
Date: Thu, 24 Feb 2022 22:33:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au, peterz@infradead.org,
 mingo@redhat.com, mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_203358_964254_7373D084 
X-CRM114-Status: GOOD (  13.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 2/16/22 07:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are no remaining callers of set_fs(), so CONFIG_SET_FS
> can be removed globally, along with the thread_info field and
> any references to it.
> 
> This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
> 
> With CONFIG_SET_FS gone, so drop all remaining references to
> set_fs()/get_fs(), mm_segment_t and uaccess_kernel().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/Kconfig                              |  3 -
>   arch/alpha/Kconfig                        |  1 -
>   arch/alpha/include/asm/processor.h        |  4 --
>   arch/alpha/include/asm/thread_info.h      |  2 -
>   arch/alpha/include/asm/uaccess.h          | 19 ------
>   arch/arc/Kconfig                          |  1 -
>   arch/arc/include/asm/segment.h            | 20 -------
>   arch/arc/include/asm/thread_info.h        |  3 -
>   arch/arc/include/asm/uaccess.h            |  1 -
>   arch/arm/lib/uaccess_with_memcpy.c        | 10 ----
>   arch/csky/Kconfig                         |  1 -
>   arch/csky/include/asm/processor.h         |  2 -
>   arch/csky/include/asm/segment.h           | 10 ----
>   arch/csky/include/asm/thread_info.h       |  2 -
>   arch/csky/include/asm/uaccess.h           |  3 -
>   arch/csky/kernel/asm-offsets.c            |  1 -
>   arch/h8300/Kconfig                        |  1 -
>   arch/h8300/include/asm/processor.h        |  1 -
>   arch/h8300/include/asm/segment.h          | 40 -------------
>   arch/h8300/include/asm/thread_info.h      |  3 -
>   arch/h8300/kernel/entry.S                 |  1 -
>   arch/h8300/kernel/head_ram.S              |  1 -
>   arch/h8300/mm/init.c                      |  6 --
>   arch/h8300/mm/memory.c                    |  1 -
>   arch/hexagon/Kconfig                      |  1 -
>   arch/hexagon/include/asm/thread_info.h    |  6 --
>   arch/hexagon/kernel/process.c             |  1 -
>   arch/microblaze/Kconfig                   |  1 -
>   arch/microblaze/include/asm/thread_info.h |  6 --
>   arch/microblaze/include/asm/uaccess.h     | 24 --------
>   arch/microblaze/kernel/asm-offsets.c      |  1 -
>   arch/microblaze/kernel/process.c          |  1 -
>   arch/nds32/Kconfig                        |  1 -
>   arch/nds32/include/asm/thread_info.h      |  4 --
>   arch/nds32/include/asm/uaccess.h          | 15 +----
>   arch/nds32/kernel/process.c               |  5 +-
>   arch/nds32/mm/alignment.c                 |  3 -
>   arch/nios2/Kconfig                        |  1 -
>   arch/nios2/include/asm/thread_info.h      |  9 ---
>   arch/nios2/include/asm/uaccess.h          | 12 ----

For NIOS2:

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
