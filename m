Return-Path: <SRS0=3lBo=I5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512F2C433C1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 31 Mar 2021 09:29:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E66C861606
	for <linux-snps-arc@archiver.kernel.org>; Wed, 31 Mar 2021 09:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E66C861606
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=geZ8+ell6mbGGpQNcGCfV/BUW9JKPA2C3sJMYuczOZ0=; b=Q7LIbeBRdCyBTMCr7ypFZNx0e
	UUqsghlTVle2z954qQzmkFvbKvv+l5CCRwRXu1ZlgHQ30AFL6l/WworEvJAr4TLdPi9hllrGA5Z6G
	6FuVPtcO6oe75bXOj0vZwdest7EP/LOADBwHUFSvVJo9E2I+4ek/gFbAZ3TVp38XwAsuDZ2j6Cjeq
	iTR8z6wUHGrwcxajJ/DHUnDV1A9M0kgaTpR3+33+yet73ZWA6cj/nEuL5VOf+5zyoUhMPZ+T+vlhK
	xooqVG6CMgB6f2VnVqzBUVnOxxvTCarYfRPO5OwdmNMGtJb6WJLbzy8wFIIvfd7NB2gWN1Mmu6hMA
	r0M+pjANA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRXAj-0069Cp-5s; Wed, 31 Mar 2021 09:29:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRXA4-0068u4-4b; Wed, 31 Mar 2021 09:29:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3578661606;
 Wed, 31 Mar 2021 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617182952;
 bh=aMxacYx0WSuYSq+RvcHg7XLnuWTcQHWfWM2hCy7hYJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZilpE/CgLvY3Nm3hLeCdPrSzQ0bka0Q/xAMzoDxoKT2sksg/+xdgw70lbIQlKRH9q
 HQM7q1tR3SOaufoC3EF8clnG+n8fTsUXBRqFIqRReR3kDRE9b5+HETaEN2azemUCyN
 +dywdbjbEuNLM1pOQ9fKcI8/BlabXbx6EDZQjXTlXZiHlwJBGfmHuNxznBzTG2bJFd
 nNykz3YpDvfjp1B8PgDSj0QLp5Bc0UJEz3WtQfw8cmvL2FnE443FSPWgxCOoGmWTX7
 urjc5s1XzZrXM3ARPcSSDIS4mEkSxEnbcwd3SAssAB5TkbJXQ91S3vF7J6sARmo8bJ
 QvnQEWfFitvHA==
Date: Wed, 31 Mar 2021 12:28:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Huacai Chen <chenhuacai@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
Message-ID: <YGRA2SU28yciN9xU@kernel.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_102916_572608_81ECDBBE 
X-CRM114-Status: UNSURE (   7.83  )
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

On Wed, Mar 17, 2021 at 09:52:10AM +0800, Kefeng Wang wrote:
> mem_init_print_info() is called in mem_init() on each architecture,
> and pass NULL argument, so using void argument and move it into mm_init().
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> v2:
> - Cleanup 'str' line suggested by Christophe and ACK
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
