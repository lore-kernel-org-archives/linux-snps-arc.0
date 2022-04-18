Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87F7C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUUAo6He3NBcvH6CPI0thbetGLlnkhS8xJvZkzRWptU=; b=v3MwkxNc/SeSVA
	2DLflK0EUoaLpfESRkjHRbUshIialxt9A++Tcx06cHLfEyi9nnwjbuPMGwT9yuanRZ9wt2x7Pc9DT
	qADTCUxWyR3k4G11uTmLtstWxwh/oVLrIQfFQIFSXlNeZr8JIBrsoIKdrNgr14Lt5oqrJ69kxiDCf
	wbm1nlxsF0SnjdbpEFANo6dmuxdUrXD1sfC6Z2h2LuyC1ON9uTkVdHoKOKCbhGO9/pV6I+BN3HCqD
	6RTJlkMwG2P8ot3tB6isnWRdYt5qEDEeq+Ju4gfca/0+gNShRd6j2H2AgduM5kYx+AGjfffEkLB6o
	zG/ClE7yeMUp95IzS4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWly-000PJh-RK; Mon, 18 Apr 2022 19:10:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWlx-000PJF-3l
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:10:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76A23B81002;
 Mon, 18 Apr 2022 19:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC849C385A1;
 Mon, 18 Apr 2022 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309047;
 bh=dD7RDBbSMaDLISa/GKbTrF72PK8RV3DWBWq4rPE8His=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BbgZnHpuMbX+HDadBjj5PiaOQ/zPw/7EjorERPCW2O9XVILXUpGv2ZvxiNV7B4E7Z
 /MAFftEDxIxySgsWrfm7VIyc4oJ4X75lsyHxHbzk4vyGdaKBuB67SyeyvtJvanZ0m8
 bJ4p08Hngsact4mafEZoqz9KjDDaMiz915jymU79+5OP22GbgDGpVaGLOgxNfvadI1
 aehG9+uu64XuiKdNv31j9TFUXINYY+yw1iiKHqn0pEu6dG7BrT1JtaKO7umvxtbqlz
 5UfwVd/xjqxwEhfpNI4N96AQqjMuYXsa50uLbZ04lvw6rC/2JGXqMoff0HHFQSB5rg
 p/OeYRa2kzMuA==
Message-ID: <b4e56a87-632c-cd91-4c11-f41fd1e86408@kernel.org>
Date: Mon, 18 Apr 2022 12:10:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] ARC: add missing bits for better BPF support
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>
References: <20220414081724.3177956-1-geomatsi@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220414081724.3177956-1-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_121053_350700_0316E06C 
X-CRM114-Status: GOOD (  13.17  )
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



On 4/14/22 01:17, Sergey Matyukevich wrote:
> Hi Vineet and all,
>
> Here is the second revision of the patch series implementing
> the following two features for ARC:
> - HAVE_REGS_AND_STACK_ACCESS_API
> - HAVE_SYSCALL_TRACEPOINTS
>
> Adding these features enables more BPF programs for ARC kernels,
> including KPROBE, TRACEPOINT, PERF_EVENT program types.
>
> Regards,
> Sergey

Applied !

Thx,
-Vineet

>
> v1 -> v2:
>
> - drop path with uapi for BPF_PROG_TYPE_PERF_EVENT program type: send it via bpf mailing list
> - add patch with ARCv2 changes for kprobe disasm
>
> Sergey Matyukevich (4):
>    ARC: enable HAVE_REGS_AND_STACK_ACCESS_API feature
>    ARC: entry: fix syscall_trace_exit argument
>    ARC: implement syscall tracepoints
>    ARC: disasm: handle ARCv2 case in kprobe get/set functions
>
>   arch/arc/Kconfig                   |   2 +
>   arch/arc/include/asm/ptrace.h      |  27 ++++++
>   arch/arc/include/asm/syscall.h     |   2 +
>   arch/arc/include/asm/thread_info.h |   5 +-
>   arch/arc/kernel/disasm.c           |  64 ++++++++++++-
>   arch/arc/kernel/entry.S            |  13 +--
>   arch/arc/kernel/ptrace.c           | 140 ++++++++++++++++++++++++++++-
>   7 files changed, 241 insertions(+), 12 deletions(-)
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
