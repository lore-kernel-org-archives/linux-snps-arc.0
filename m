Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720A8C4321E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Feb 2022 04:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYMUZD1f2uFawh/aUm7OZZ18XYZtTjnTXBkZP4QZFRg=; b=kkh9wtutxukU5b
	UIb76baAOifWjMUDQ9g5uhCdUqJncZiiNrNxl98Q6lw4JPso9roR6ePe/kvplu90ce5IOQBBgLOXh
	iMt/o4bDwHHnMWrJxzBFPa115vRTjP8CEAER1bYmTLaCmCA2Mqc/y+bMqFzcDiNIPIbppzK39kzyW
	cnUT71RfSoLRhOSQ4zqsU7zFVcUPJ8au1Bqgu/kw81MCYZ1xOm4V3tOKmAg0OEQTnFGDrvB9Y6yiV
	i0Kgwo+ydstyPTlhog7E4D6txgXoaVCRyCkZo6UtbVeaYnjrO6PxwQVDOWQXmdNJbg5y7cxXFVJiC
	GawA8bmqLqOGgdNrsJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNSFh-003INc-KC; Fri, 25 Feb 2022 04:30:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNSFb-003IL1-Ud; Fri, 25 Feb 2022 04:30:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 364CE618C4;
 Fri, 25 Feb 2022 04:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCC6C340E7;
 Fri, 25 Feb 2022 04:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763438;
 bh=K1RaOpayOFOl9YrWjbFso6AxJRaB7d/hqz1cXZ69p68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JQKxpsomaZBRaWmc5cvV6ib4A8rCg4TPitG6KtMN/3RrAcjKVTJT4yK2eDFUJ+cMs
 GGe2lQ0KwF+iTYeA1pEDWDB2RtmKuBiOhrq1UD43RSIKmGPeCxSvHgFkEuaxQ4Olvr
 2eAzhesO8mAMjdIVrsZ1nZFTt4sdpEeKUGFwUAwfuxPbqH/Wkgj8BdxrL7OB3VWTTd
 G6bo95wROzxmQJyLOX4tRd/qfCxU6mfLup3kLD3UTh5ardnvCDEhsvub+4i3ykdyNs
 K3IteETxgQ/sIy9c1oYc4VbyW0VV1YzXNoLx5Km6wu9MsETEo+EXnMVoPFvUjaAbVy
 MOmcxBoXdOugg==
Message-ID: <824a2d98-e992-0406-518f-adcde2a1372a@kernel.org>
Date: Thu, 24 Feb 2022 22:30:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/18] uaccess: fix type mismatch warnings from
 access_ok()
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
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 kernel test robot <lkp@intel.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-13-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-13-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_203040_064455_45446F3A 
X-CRM114-Status: GOOD (  13.67  )
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
> On some architectures, access_ok() does not do any argument type
> checking, so replacing the definition with a generic one causes
> a few warnings for harmless issues that were never caught before.
> 
> Fix the ones that I found either through my own test builds or
> that were reported by the 0-day bot.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arc/kernel/process.c           |  2 +-
>   arch/arm/kernel/swp_emulate.c       |  2 +-
>   arch/arm/kernel/traps.c             |  2 +-
>   arch/csky/kernel/signal.c           |  2 +-
>   arch/mips/sibyte/common/sb_tbprof.c |  6 +++---
>   arch/nios2/kernel/signal.c          | 20 +++++++++++---------

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
