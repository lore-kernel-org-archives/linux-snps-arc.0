Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D51BEE49AB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Sep 2024 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZf7LbTn9XHUCTl1fs1BFWF33NERRvx3haT+JV7rLjc=; b=eqDzFv/ZMJA8/B
	T2ZcZBwXs/DTtBx+cQunEWAfub0SyFlWSQ0U80nMXCiHxR5ZKYnGP5UY7USBwi943YOWFvEkCAAlS
	ZOyDaKsXBi/x6hKPInBIfkrOAZzOSAyW8fkNPsaq1SQ1HXdgZl/GUE7coI9KJ47YTNEexmv8tRPK4
	xxET406LVOLIVBe4R5MYOC6Nu1Vr9CqwtiX4VZ+czWfAs5JEZ7NoqgdtcBRxfpYW3415ZoARjZHiL
	8wxqrUVEdGFWLiEU7qeWB9RcOeo47E/xBRnnrkREbPWOiAI4bAFlE+6AIPlOwzQQcz6DzY0PIJL4+
	Iz9gy2NWa1zsQv1lFLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNll-00000009mdy-0X2u;
	Wed, 11 Sep 2024 13:52:29 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNjW-00000009lsO-1yJx;
	Wed, 11 Sep 2024 13:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726062608;
	bh=lpBzbgWttHYkkQ41sscZ0OOoe2UyQs048+I1EnGEnbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b6rCWOCpsR6QTZU68icEH6ah28jcqnXyKEGoUH0ohvJRhp/Mm3QMMNf7cz1PRZVJk
	 qZnhrbEZQSdtE52b5m7L8yLtR87aHqZ9Y3U05UdXnLFYWT6W/Gva4cteQod4+pDscF
	 iq9WFey+WYHFyzKGuoKHndEZ0KUL/iVZ82dFsXKNk1jKIZA3FOkaV87mvcYAUlbhmC
	 QSm0f+2sovoKzmv6FOXBVgqAL9iWpzg6XychwCtrVghD79R/XByY5tXAMuIaTpHV5g
	 0oMsPLM4pI21UqirAlt8h43LH7OPXzxNCN5RDMbPbQlnnQRUFay141JPyB1XvhsCzO
	 l8YWjW9+O5+hg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3hlf1JyWz4x8D;
	Wed, 11 Sep 2024 23:50:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Charlie Jenkins <charlie@rivosinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, guoren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, shuah
 <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>, Michal Hocko
 <mhocko@suse.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Chris
 Torek <chris.torek@gmail.com>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
 <7be08ea9-f343-42da-805f-e5f0d61bde26@app.fastmail.com>
 <016c7857-9ea8-4333-96e6-3ae3870f375f@lucifer.local>
 <Zt+DGHZrHFxfq7xo@ghost>
 <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>
Date: Wed, 11 Sep 2024 23:50:05 +1000
Message-ID: <87zfoeqoz6.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_065010_826810_38281C08 
X-CRM114-Status: GOOD (  14.73  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Mon, Sep 9, 2024, at 23:22, Charlie Jenkins wrote:
>> On Fri, Sep 06, 2024 at 10:52:34AM +0100, Lorenzo Stoakes wrote:
>>> On Fri, Sep 06, 2024 at 09:14:08AM GMT, Arnd Bergmann wrote:
>>> The intent is to optionally be able to run a process that keeps higher bits
>>> free for tagging and to be sure no memory mapping in the process will
>>> clobber these (correct me if I'm wrong Charlie! :)
...
> Let's see what the other architectures do and then come up with
> a way that fixes the pointer tagging case first on those that are
> broken. We can see if there needs to be an extra flag after that.
> Here is what I found:
>
> - x86_64 uses DEFAULT_MAP_WINDOW of BIT(47), uses a 57 bit
>   address space when an addr hint is passed.
> - arm64 uses DEFAULT_MAP_WINDOW of BIT(47) or BIT(48), returns
>   higher 52-bit addresses when either a hint is passed or
>   CONFIG_EXPERT and CONFIG_ARM64_FORCE_52BIT is set (this
>   is a debugging option)
> - ppc64 uses a DEFAULT_MAP_WINDOW of BIT(47) or BIT(48),
>   returns 52 bit address when an addr hint is passed
   
It's 46 or 47 depending on PAGE_SIZE (4K or 64K):

  $ git grep "define DEFAULT_MAP_WINDOW_USER64" arch/powerpc/include/asm/task_size_64.h
  arch/powerpc/include/asm/task_size_64.h:#define DEFAULT_MAP_WINDOW_USER64        TASK_SIZE_128TB
  arch/powerpc/include/asm/task_size_64.h:#define DEFAULT_MAP_WINDOW_USER64        TASK_SIZE_64TB

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
