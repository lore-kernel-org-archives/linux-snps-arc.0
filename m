Return-Path: <SRS0=I7CJ=6U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF71C28CBC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 06:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84555206E6
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 06:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XbotjgPC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84555206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ubHmY3W/exK2oT+9PN7I7v4R1RSZLD1uKBkP76uptk=; b=XbotjgPCW/KUJk
	Om+YBvt64w2hyFdhC8GHV0VtJjLso2BLoZKTm4y7+qHEIg5VD8N3UI1cP+ylPVcxjgZJ6V5tST8+x
	qlDJ1aKq09WqQjeOjCkJ1tNqDMYxDHwuJozSFSaioaUTU4P/yeGB6J3ggoO9UFMazf8SyQw98MSew
	8hSjcedGhpkkqoLg11FGK92zSIFRdEUogev3rG4b4tAlaz3s/FC11WoSbTB35BFSBPwBAMs+rFDFF
	xhj1DYGTiShJgh1T5tf1tipl3K0tu8e4XwT+Zd8LW8hIgd/ZZdsqd3kEF/LeXrEeCFEr36//Evbsy
	g5W4OgEJ/oo7r8HpSMag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWDJf-0005oq-8v; Wed, 06 May 2020 06:13:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jWDJ8-0005JQ-4V; Wed, 06 May 2020 06:13:26 +0000
Date: Tue, 5 May 2020 23:13:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH V2 08/11] arch/kmap: Ensure kmap_prot visibility
Message-ID: <20200506061326.GD5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-9-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-9-ira.weiny@intel.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, May 03, 2020 at 06:09:09PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> We want to support kmap_atomic_prot() on all architectures and it makes
> sense to define kmap_atomic() to use the default kmap_prot.
> 
> So we ensure all arch's have a globally available kmap_prot either as a
> define or exported symbol.

FYI, I still think a

#ifndef kmap_prot
#define kmap_prot PAGE_KERNEL
#endif

in linux/highmem.h would be nicer.  Then only xtensa and sparc need
to override it and clearly stand out.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
