Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A334CC433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/bQvCAEUSZLiAEA4cOUzWVXyQgrdGBrBq6Ziyl7/YE=; b=0FyjHizSlHiK0r
	VDL6PtqeLXIACuhMq+v1FdH3PgcbI7EesSQ5oOks0RPQV4RwU824P5zed5zcHqF6tmzI4k54IrBFY
	bJ20UCMM89pWvxa+suw93cwUKlZAFlTqrvWrR5at8n80seVig6ayLr66WYvEBWLjPIP25297ydW3F
	C9Zm6ugiLnJFtabGi2dCUicsgfV8mrW2US//C5fK5pg2BppdszaqLKbMi21F1afQ8FXrc0E25QAGw
	OQmADYYOWfHtctrZ4bcUhs6U17VhxJpr7b2/bBS3mmFvkIb3Xmr35M00WGOMJOP94tFPaBU6qtFAe
	j/rXZhJo7GYWOck+2guQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJejy-00GFqx-Oe; Mon, 14 Feb 2022 17:02:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJejt-00GFoH-Dz; Mon, 14 Feb 2022 17:02:13 +0000
Date: Mon, 14 Feb 2022 09:02:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dalias@libc.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 peterz@infradead.org, jcmvbkbc@gmail.com, guoren@kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, deller@gmx.de,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@redhat.com, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com, shorne@gmail.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, linux-mips@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
Message-ID: <YgqLFYqIqkIsNC92@infradead.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-5-arnd@kernel.org>
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

On Mon, Feb 14, 2022 at 05:34:42PM +0100, Arnd Bergmann wrote:
> +#define __range_not_ok(addr, size, limit)	(!__access_ok(addr, size))
> +#define __chk_range_not_ok(addr, size, limit)	(!__access_ok((void __user *)addr, size))

Can we just kill these off insted of letting themm obsfucate the code?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
