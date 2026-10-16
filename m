Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FEBCCA462
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2026 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PX1RUmQUc4yQPsocfm01yI+pMovg/4b+Aqtfm1HdnIE=; b=E0SpEX8jLC5jk4
	VlMO/rDrde201Y+yGbFaLBrAxd/FZC553742BEbLKqWhnfe0L5E3AhkBTLsfDoqQ9NSMsfVm/7Au3
	fLfH/a917axLPSBTqYtwXKAW+hZOR9Sqoxf71uHvpv/gDbU8u4DrxzeZb0piAzRG4cMDjc3htt/oV
	J4qj7MiuKzSVLW4hbzRO+7N7KkZ7BJE2TPoRPtP/CTczZqF7SeT4nJWFjZhZrkvc1zzpL6rS7XfcV
	hhXx4TvlHRk8Pr+kwDULTsgUCYQjLNR9DV7JZrsIhxMnYfmk5PrY2o4TU2cZP3uYK05B+OEkMDwPY
	620BaJFCXbYTY63hRZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe5V-00000002SWi-0PKV;
	Fri, 16 Oct 2026 09:18:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe5T-00000002SWa-1tYK
	for linux-snps-arc@lists.infradead.org;
	Fri, 16 Oct 2026 09:18:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABB9260018;
	Fri, 16 Oct 2026 09:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A981F000C4;
	Fri, 16 Oct 2026 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142330;
	bh=NbWDxILIwfiHLalvlI7KJfx446gCQIB/Sm6F+YT4cfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hugg/Ish40Lnnw/N9fkNWC988BB4oOQTGY24+sFzpc820WNIb/vVn4IGYunPiwC6F
	 J+MynlRIV+0ITU2Xq1RNMA/prXJz7DCucnneAzJ9n2/XFSXnaVM8gCl80fFNxXP1/W
	 XJYWwjFfNCpHIReZEhd8tqgPBtySlEoyBVDss5Ms5m7RCaG9YWyhddftCzzzHAB9Yu
	 QazlSc5iyoos1/YE/s2WyxdQYI3eXCBoVDkn0EYb4iE5qwwh9hrZi/t/zGK+dPrxh5
	 8ZS5nDU0sABQaaBm+J5Ih0Ih7f7oT17tnzH1sCDxOcunBSyz4Nt3kBpbezRmqlT+tG
	 2E3Toy7qWOzHA==
Message-ID: <3683fce4-8700-4e6b-9a1d-86826348a5dc@kernel.org>
Date: Fri, 16 Oct 2026 10:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: Strip libgcc debug information when generating BTF
To: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015154044.4058618-1-sashal@kernel.org>
Content-Language: en-GB
From: Alan Maguire <almagui@kernel.org>
In-Reply-To: <20261015154044.4058618-1-sashal@kernel.org>
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

On 10/15/26 4:40 PM, Sasha Levin wrote:
> ARC links against the compiler's libgcc archive. The ARC GNU 2023.03
> toolchain ships this library with debug information, including complex
> floating-point types in integer arithmetic helpers such as __udivdi3.
> These types reach vmlinux even though the kernel does not use complex
> floating-point arithmetic.
> 
> When floating-point BTF encoding is enabled, pahole rejects those types:
> 
>   Complex, interval and imaginary float types are not supported
>   Error while encoding BTF.
>   FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory
> 
> KernelCI's upgrade to pahole 1.31 exposed this long-standing problem as
> failed ARC builds. As of 1.32, pahole still rejects these types, and
> older versions will stay in use, so the kernel build has to keep them
> out of vmlinux. Commit f122668ddcce ("ARC: Add eBPF JIT support")
> documented the same failure along with a workaround of disabling
> floating-point BTF encoding, but that also discards supported
> floating-point types from kernel BTF.
> 
> For CONFIG_DEBUG_INFO_BTF, generate a debug-stripped copy of the selected
> libgcc archive in the output tree and link that copy. Preserve the archive
> structure so that only needed helpers are linked, and use the normal
> Kbuild objcopy rule to track input and command changes. The trade-off is
> that vmlinux in BTF-enabled builds no longer carries DWARF for the libgcc
> helpers. Debug information for kernel code, the installed toolchain and
> non-BTF builds stay unchanged.
> 
> Reproduced and tested with ARC GCC 12.2.1 and pahole 1.31 and 1.32 using
> an ARCv2 tinyconfig with BPF_SYSCALL and DWARF4/BTF enabled. Before and
> after vmlinux.o files are identical after stripping debug information.
> 
> Fixes: db16c1fe92d7 ("bpf: Generate BTF_KIND_FLOAT when linking vmlinux")
> Link: https://github.com/kernelci/kernelci-core/commit/e71b8c9f42253180596e734c18965a5aad80c8c5
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Alan Maguire (Oracle) <almagui@kernel.org>

Thanks for the fix Sasha! More complete floating point representations for BTF
should definitely be on the to-do list..


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
