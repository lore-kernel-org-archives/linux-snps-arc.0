Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFF4C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Feb 2022 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLQIkgXln/JgKkiugrgRDD+yOfhK0YD0NBim/dN7JB4=; b=mmidkjxyz25iCQ
	8b+43DXJxGsOtfwNIhSMJc6W6mk4tl6EQ1A9E08azDgmNgIR6KzRVSxVmlBuNH+py9YRXcVv8wEP4
	c0/DVHOns7jbMqNlV2RPorjZD29/CBUwhGz6/c0fuRHtuMrtjF+9gwe4Fdd8bFJs6AvMB1GW65MuN
	WuAi6jiRnBsrMsxgbRYB+UZfhyHPAlVTb+a1Wna/lr4Vzkn/s9ygOsOmNdv8k82zob+efE2MzgNNA
	19O6G1Xnwyj9IxYihKbtTPm5QWFxPAuawEww9XoeKwYwyNoVtNqZbZG8fK/qToKL7XTkqxCg62v7C
	JBSVi6L4VhNxWkER6+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOVTd-00AVVx-T3; Mon, 28 Feb 2022 02:09:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOVTa-00AVVM-RO
 for linux-snps-arc@lists.infradead.org; Mon, 28 Feb 2022 02:09:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0337D6091F;
 Mon, 28 Feb 2022 02:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F542C340E9;
 Mon, 28 Feb 2022 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646014164;
 bh=nfKHHDRqPGAiFFc0UvTT/8Ia5oYeHL7zt1Ft5gqGxis=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=upsLd1MCLiuygjG+LIf3zAzB7tR591iLyMo7RCWXgFVfKTfbympfifjemID05fvHb
 CmTybODJhbDt9qQn56F+WOv+X3hr7qELtnUsTFhYvVFXFVH3L+PdC9eoGxL75t3ffz
 QkgXxEeYdisyMv5+4xB8xlk8VXtXdWWt5YrJCTR6lj0PCHWrQg4k1hTwF/wchny11p
 pBAfmJshUnieQJ6OJ3T/sY2yXcYSy2bWjIpzmN/u0P43kAvVDUZ7rHGwSkEyg67AOg
 uNqbuPkVy3qTX9XIEXIZJIto9lDvGgDdJZg8HOmTKArdnqCbkFFGEH0hYilM112UCm
 HjJu5ks7u4ehw==
Message-ID: <f043c242-ee1c-a671-dd6f-b8381691d2ce@kernel.org>
Date: Sun, 27 Feb 2022 18:09:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 00/13] ARC: handle the lack of ZOL support
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_180927_025035_BDD0E53F 
X-CRM114-Status: GOOD (  20.69  )
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

Thx for doing this. I think the series mixes a few things not related to 
ZOL removal - the changelog for removal of -Os specific code seems 
incorrect etc.
Let me repost with slight more cleanups.

-Vineet

On 2/22/22 06:14, Sergey Matyukevich wrote:
> From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
>
> Hi Vineet and all,
>
> This patch series continues to prepare arch/arc for the upcoming ARCv3
> support. ARCv3 does not support zero-overhead-loop (ZOL). So this patch
> series provides a set of changes that make ZOL support optional.
>
> The patch series is based on top of Linux 5.17-rc5. It has been tested
> with enabled CONFIG_ARC_LACKS_ZOL option on ARCv2 HSDK hardware as well
> as on nSIM simulator for ARCv2.
>
> I fixed typos, updated Vineet's email address, and slightly modified
> several commit messages. Otherwise this patch series is the first chunk
> of ARCv3 bring-up changes by Vineet, available at Synopsys github: see
> github.com/foss-for-synopsys-dwc-arc-processors/linux
>
> Regards,
> Sergey
>
> Vineet Gupta (13):
>    ARC: uaccess: elide unaliged handling if hardware supports
>    ARC: Kconfig: introduce option to disable ZOL
>    ARC: uaccess: drop CC_OPTIMIZE_FOR_SIZE
>    ARC: uaccess: elide ZOL, use double load/stores
>    ARCv2: memset: don't prefetch for len == 0 which happens a lot
>    ARCv2: memset: elide unaligned handling if hardware supports
>    ARCv2: memset: rewrite using double load/stores
>    ARC: string: use generic C code if no ZOL support
>    ARC: delay: elide ZOL
>    ARC: checksum: elide ZOL
>    ARC: head: elide ZOL
>    ARC: build: inhibit ZOL generation by compiler
>    ARC: pt_regs: handle the case when ZOL is not supported
>
>   arch/arc/Kconfig                           |  10 ++
>   arch/arc/Makefile                          |   3 +
>   arch/arc/include/asm/asm-macro-dbnz-emul.h |  12 ++
>   arch/arc/include/asm/asm-macro-dbnz.h      |   8 ++
>   arch/arc/include/asm/asm-macro-ll64-emul.h |  31 +++++
>   arch/arc/include/asm/asm-macro-ll64.h      |  20 +++
>   arch/arc/include/asm/assembler.h           |  41 ++++++
>   arch/arc/include/asm/checksum.h            |  58 +++++++-
>   arch/arc/include/asm/delay.h               |  16 +++
>   arch/arc/include/asm/entry-arcv2.h         |   4 +
>   arch/arc/include/asm/entry.h               |   2 +
>   arch/arc/include/asm/ptrace.h              |   4 +-
>   arch/arc/include/asm/string.h              |  15 ++-
>   arch/arc/include/asm/uaccess.h             |  29 ++--
>   arch/arc/kernel/arcksyms.c                 |   2 +
>   arch/arc/kernel/asm-offsets.c              |   2 +
>   arch/arc/kernel/disasm.c                   |   2 +
>   arch/arc/kernel/head.S                     |   8 +-
>   arch/arc/kernel/intc-arcv2.c               |   2 +
>   arch/arc/kernel/kgdb.c                     |   4 +
>   arch/arc/kernel/process.c                  |   2 +
>   arch/arc/kernel/ptrace.c                   |  12 ++
>   arch/arc/kernel/signal.c                   |   8 ++
>   arch/arc/kernel/troubleshoot.c             |   3 +
>   arch/arc/kernel/unaligned.c                |   2 +
>   arch/arc/kernel/vmlinux.lds.S              |   2 +-
>   arch/arc/lib/Makefile                      |   6 +
>   arch/arc/lib/memset-archs.S                | 147 +++++++++------------
>   arch/arc/lib/uaccess.S                     | 144 ++++++++++++++++++++
>   arch/arc/mm/extable.c                      |  11 --
>   30 files changed, 493 insertions(+), 117 deletions(-)
>   create mode 100644 arch/arc/include/asm/asm-macro-dbnz-emul.h
>   create mode 100644 arch/arc/include/asm/asm-macro-dbnz.h
>   create mode 100644 arch/arc/include/asm/asm-macro-ll64-emul.h
>   create mode 100644 arch/arc/include/asm/asm-macro-ll64.h
>   create mode 100644 arch/arc/include/asm/assembler.h
>   create mode 100644 arch/arc/lib/uaccess.S
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
