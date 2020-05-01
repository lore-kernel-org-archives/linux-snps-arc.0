Return-Path: <SRS0=ERPa=6P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF469C4724C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 May 2020 08:36:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EEC2206D9
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 May 2020 08:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oO/j5jW9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EEC2206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLF7xN253C9q7L9rKR8e0nueE7b4iap7WfuGbl8FjXE=; b=oO/j5jW9iO86Uw
	ibBtsX27Uj3fkI9BxyFVzmz1Wf9iT/x81merPfT3ntpZ8txl+Hlfiycjh/FM8/9FCgWEQoAeOJ5cz
	jA2KaXZ8mBWK3UjLao68wKTjutvKnxG/lc/h8GdegqreLZakTmiQZp+4DfkWQU2vsXwB0+2vvll8E
	hG3QxAVQJZhS8arb8Eu9Krdz1mmt7CVtaoWZySITZzQAbhHR1q0iNKru4+puJro3NMA9ioilAVHkU
	ZlsTxzEMdOwxg/e6LyzgsHMX2YZqhbWSIBigx5jIdi6Wx0xqt4lxkyRSVHkojqRwGCac1zIZEO5sV
	tt4NYuI6WZgWqUoe/3mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jURAC-0003tf-PJ; Fri, 01 May 2020 08:36:52 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jURAB-0003tJ-II; Fri, 01 May 2020 08:36:51 +0000
Date: Fri, 1 May 2020 01:36:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH V1 02/10] arch/xtensa: Move kmap build bug out of the way
Message-ID: <20200501083651.GB27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-3-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-3-ira.weiny@intel.com>
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
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 01:38:37PM -0700, ira.weiny@intel.com wrote:
> @@ -88,6 +88,11 @@ void __init kmap_init(void)
>  {
>  	unsigned long kmap_vstart;
>  
> +	/* Check if this memory layout is broken because PKMAP overlaps
> +	 * page table.
> +	 */
> +	BUILD_BUG_ON(PKMAP_BASE <
> +		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);

This can fit on a single line.  Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
