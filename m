Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D8BCD1280
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 05:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtJCbgeumwIUj/3qjfpcNw5yHX8oto4FcS1KUggyyo8=; b=voq5CeV5HjNHrA
	WhLjnfTmff5arNYebszU4Y18V2SNNzpcRr+HuFUtx2qvQvR9dMRbpnjeQ4qxGv6jefwyZObWZOYX+
	d1npGDR7z5nKpo1LsUDTgyPrWVWvGWTda1i0Epi637NyVVLhSRsFmvbXMjOm/3ZV7s5+dnsU4xwC2
	9vYK4uL6Jtkmku8Yj6NCWDCGIWQbXUjoSEzHwSYPFmox3k4+EuIX7KsqlZbIJlywUFdpGfGCTZIYm
	x+24YS+okscwfQQ8sN0aRgd1To+yDBuUWffYxo3KInS1IUdXh2jHABKA2y9p3hZoSrcDthap41azQ
	vz7yed9suzn5wIL+JU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiap-0000000CbYk-4A3W;
	Thu, 28 Mar 2024 05:46:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiam-0000000CbXy-1zDC
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 05:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B77060DCD;
	Thu, 28 Mar 2024 05:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD4AC433F1;
	Thu, 28 Mar 2024 05:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711604783;
	bh=gxiY5UZLlWOxibFFRP8rSgWNhezHAFR/cKLxo5sMnvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L+v8UuEh5O1tRgEFJMJ5Frrf4/ID+uUfia8uNCp3PWr94ErWQFVIA9RJ/1Ji34rSh
	 nITbYuxDiU6daI4zgCWdKOc/Ef6ztJgQhOpDoykrvacACxsKwLB6A+7O/RNq3fAIvr
	 DY+Cvakh6ZYloDPjzy/tbNoDXFTPzbl1VtMZG56pcFE7cJdg0GfJktJzfOfPoJSIiS
	 yYkVd0Utalj5sB9tvwnJ2uL7kvRyKNpE456II0VPUkSb7TXxUKHjTYJ2jO32An7OZZ
	 VH9lC6DjHAMJrk4e8f/vpS9N666M/AmMOV3SsNiQhPuZ/Luc2WFAUM4uibZ88msq0p
	 aLE4q8CXiL67w==
Message-ID: <d22054a8-76d3-4ae2-9e20-38a7a8ce902d@kernel.org>
Date: Wed, 27 Mar 2024 22:46:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next: arc: defconfig - gcc-9 - mmu-arcv2.h:82:2: error: implicit
 declaration of function 'write_aux_reg'
 [-Werror=implicit-function-declaration]
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 linux-mm <linux-mm@kvack.org>, linux-snps-arc@lists.infradead.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Morton <akpm@linux-foundation.org>, vgupta@kernel.org
References: <CA+G9fYu49=6_L6r8hdagZHUSGk+JfjioFaqh+kRaxhce84Q5Kw@mail.gmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <CA+G9fYu49=6_L6r8hdagZHUSGk+JfjioFaqh+kRaxhce84Q5Kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_224624_643862_E0DA55BC 
X-CRM114-Status: UNSURE (   9.01  )
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



On 3/25/24 23:39, Naresh Kamboju wrote:
> The following arc defconfig build warnings / errors noticed on today's
> Linux next-20240326 tag.
>
> Regressions:
>     * arc - defconfig - gcc-9 build failed.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log:
> ---------
> arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for
> 'syscall_trace_enter' [-Wmissing-prototypes]
>   342 | asmlinkage int syscall_trace_enter(struct pt_regs *regs)
>       |                ^~~~~~~~~~~~~~~~~~~
> arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for
> 'arc_kprobe_handler' [-Wmissing-prototypes]
>   193 | int __kprobes arc_kprobe_handler(unsigned long addr, struct
> pt_regs *regs)
>       |               ^~~~~~~~~~~~~~~~~~
> In file included from arch/arc/include/asm/mmu.h:21,
>                  from arch/arc/include/asm/pgtable.h:14,
>                  from include/linux/pgtable.h:6,
>                  from include/asm-generic/io.h:1047,
>                  from arch/arc/include/asm/io.h:232,
>                  from include/linux/io.h:13,
>                  from kernel/dma/coherent.c:6:
> arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
> arch/arc/include/asm/mmu-arcv2.h:82:2: error: implicit declaration of
> function 'write_aux_reg' [-Werror=implicit-function-declaration]
>    82 |  write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
>       |  ^~~~~~~~~~~~~
> cc1: some warnings being treated as errors

Thx for the report. Fix posted for first 2 warnings [1]

I can't reproduce the last warning about write_aux_reg() despite using
the config from 3rd link below.

-Vineet

[1]
http://lists.infradead.org/pipermail/linux-snps-arc/2024-March/007916.html


>
> Steps to reproduce:
> -------
> # tuxmake --runtime podman --target-arch arc --toolchain gcc-9
> --kconfig defconfig
>
>
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/log
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/history/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eA2VSZdDsL0DMBBhjoauN9IVoK/
>
> --
> Linaro LKFT
> https://lkft.linaro.org


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
