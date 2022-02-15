Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6110C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 06:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVpRGDVVL8yJUXeTimkWZlqMZljJMheC/y8iccIGE4g=; b=0nTJhuYCEn5HUs
	ld7niywoWgs+cwTYV0PExuxaKINZ6nVxuuDF1+pIgVCE8Rukwhw47hYMfHfVsTFVDBU8vpnqNrj5u
	gzK2mTXfvebJCrFmmQUwdg+gH6VuCiB8+de0QayqD+2wjzPny3FnAS6G4X1EQ/RGjFFiQZ6NSGjoO
	TCo7boc/DDiCXHDN01ScSVgfLXerMQF6mqhwFZDIxDr+GmlR3065pQZNYQVGBJg0hcl4wogwWvibl
	HqMnRVCrV/FoXn1vwHHmlOPPnw57H6GdwNSHEny3HVJysQ8RRMbu5ZBkaCXWVlfrsWqzPuORUM0xL
	mNhN0Y8hcY8w58awi42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrLX-000eW0-G8; Tue, 15 Feb 2022 06:29:55 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrLS-000eQy-Ni; Tue, 15 Feb 2022 06:29:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 11DDB68AA6; Tue, 15 Feb 2022 07:29:43 +0100 (CET)
Date: Tue, 15 Feb 2022 07:29:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 will@kernel.org, guoren@kernel.org, bcain@codeaurora.org,
 geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
 nickhu@andestech.com, green.hu@gmail.com, dinguyen@kernel.org,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net,
 richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 09/14] m68k: drop custom __access_ok()
Message-ID: <20220215062942.GA12551@lst.de>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_222950_950792_AE191FE3 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue, Feb 15, 2022 at 12:37:41AM +0000, Al Viro wrote:
> Perhaps simply wrap that sucker into #ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
> (and trim the comment down to "coldfire and 68000 will pick generic
> variant")?

I wonder if we should invert CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
select the separate address space config for s390, sparc64, non-coldfire
m68k and mips with EVA and then just have one single access_ok for
overlapping address space (as added by Arnd) and non-overlapping ones
(always return true).

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
