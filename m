Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E4CD98E4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jun 2026 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czhYXqo4qwAMjMYzBwj9OHmG/hbMDEaOyQnJx48ZHBg=; b=redmqzOolSzQQB
	v5hqSlviYrpjiaEHb238K08CznSNZhGSVtq56+LNh6hHFUBxDIqdIZUGHGGF8Iqk1LBvzr2umswhI
	ycMfxt1x2IrJYtSh17qIrtnG8sJbRyi45iqNWpDXV7/5YBdZfFJOXbv7kl50Hr519WMeTz0O887Kq
	PWJZUDmJMRN4EP+3a6cnOmz7t6LcKZURQHDbIwu8IksicEQJGORU96yhn06QiL0OBH8Xj0tJ+g7qb
	T6093arzjDdE3fVCR3unOaTT1pbecFtmmHhohT4Cuu45iu48mWc4AnZSVIfJKlGKDZv9/M82FlWuq
	cNWf0mu8U5AfbyIqYraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpat-0000000HMGE-1fJz;
	Wed, 17 Jun 2026 12:42:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpar-0000000HMFV-0Ou9;
	Wed, 17 Jun 2026 12:42:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8175D40945;
	Wed, 17 Jun 2026 12:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643E41F000E9;
	Wed, 17 Jun 2026 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781700128;
	bh=shMcTxpz7Iae4CMErv9/x2nY1BGPOVWbdpSfFAc09vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Im0bG8AmD3bgsJUqZdYGdopEe5rvENwOqhRGA6LfcbikFOn2YUPQXBJWxsK3aAa3F
	 IKOG49MBRGBJ1Mar6LZ2Kju1FxOKtyMrE//+MnE4N9/Z71fGW3gauigkbzrv2V1kZP
	 1FNp162R2Z9QvBsI+njynVaaI0fNfgYS5ai3uG8OmNg5itH6o2+k7segaCwH+SbOb5
	 zOcIdHYuAFv7ORTp8+4nDfybUyv7DTPv3xm7a9kUQ+vj1V5p2XZfw7CYh7IqwWcWUs
	 ypezZIGEaKxUJ1MkpzhGlNdEe4jZuo9Q/Bc1arqIHR5rd7H/I68vBRL6fPgiqclkJT
	 0u72NIrlwde9g==
Date: Wed, 17 Jun 2026 14:41:54 +0200
From: Christian Brauner <brauner@kernel.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	linux-s390@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/19] init: discoverable root partitions, a.k.a. an
 omittable "root=" cmdline option
Message-ID: <20260617-irritation-rollen-wirst-7d636cbfec92@brauner>
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
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

On Mon, Jun 15, 2026 at 06:08:56PM +0200, Vincent Mailhol wrote:
> DPS [1] defines GPT partition type UUIDs for OS partitions and
> attributes that control whether such partitions should be
> automatically discovered. The specification states that:
> 
>   The OS can discover and mount the necessary file systems with a
>   non-existent or incomplete /etc/fstab file and without the root=
>   kernel command line option.
> 
> DPS is already implemented in systemd-gpt-auto-generator [2], which,
> when embedded in an initrd, indeed allows automatic detection of the
> root filesystem through its partition type UUID.
> 
> This series adds this discovery feature directly into the kernel so
> that people who are not using systemd or not using an initrd can still
> benefit from it. The implementation follows the same model as
> systemd-gpt-auto-generator:

I happen to co-maintain the DPS. It is userspace policy and complex
userspace policy at that and does not belong into the kernel.

This also implements a really tiny portion of the spec. It deals with a
lot more complex concepts such as automatic partitioning during
installation, verity, LUKS, containers. This is really not intended for
the kernel at all. I mean, it's great that this spec is being used but I
do not want this in the kernel just for the sake of auto-discovery.

The DPS is completely generic and can be implemented by tooling other
than systemd (util-linux implements it and so does refind iirc). I think
not wanting to use or build alternative userspace tooling for this is a
really weak argument for pushing this into the kernel.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
