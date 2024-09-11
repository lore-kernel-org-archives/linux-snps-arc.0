Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2601CEE49A5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Sep 2024 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tred40ZeAlriz7yBolgnMcaV4YD9zZ1iT98TY+YISow=; b=HSvjkqGGbnxFqd
	fJGNDFmvFhuNdV6QG2Z8coiqn38UH5c3o/tdi0u8GkvvYzeb2Yr7VF0G8wePn2cRs45YuYYazOtln
	/UsSNyvwAd5KBXnYSddkxhaUxP7oTyInMoPa8LRhBiZ7sZ+lwA9/cdmNnLqfwzcLi05xbKZZLJHnK
	AmCXZ3ch+TvO/JUrfif1NRv1rwqqOU/hI+qmU98DjERMbBx2GZBdb129668EPO0yWhVyIUlTnPw/T
	s6FHQG75YQiC4TtpNDpyLCUqIqqm1pLdbxqHZMFyhG62aADJSlySD3xzIX7/Bj3enZUgBIJrfNmOG
	EuoBowOQNkMaIKPhu0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNXe-00000009ig5-2Xun;
	Wed, 11 Sep 2024 13:37:54 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soNXQ-00000009iW6-1EQL;
	Wed, 11 Sep 2024 13:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726061855;
	bh=iHez4L8Cbe72UrMJsctmlwmq48vcHfkVNwTNsQ5hhgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HBrVKYtgCqSvgPc3vnbrgbEUo0l4dH1N0eC105qjzTX619OJeNT11Dc0jZHAl37hC
	 BICHP8unDq69QHT4UwjJlesLoxIX0QmzKF15OLLEX+h7azG1vA4IFihHMnkZiXh/Wa
	 UNTMfJvjkngNuCIYHlhMfpu1ZxYuSeMV8Eql1DRUG32SRqRJ1d/2LPHO6RKFXVFPfv
	 nwCVTvmjBxaTrYvGqqfebIZ/jL42pOSdb+M82AglxNtelBY5PPC/Yt+NHSIzzOMdpU
	 UGuV2R5DhsWkRSMy/pLNMkWUwVobppFI6ZS156a6u7oV/2NIKjL9HvEjcmee29f58k
	 CnQv82qbfd2Mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3hT03ssXz4x8Q;
	Wed, 11 Sep 2024 23:37:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek
 <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <Zt9HboH/PmPlRPmH@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost>
Date: Wed, 11 Sep 2024 23:37:23 +1000
Message-ID: <875xr2s44s.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_063740_757954_FE9EC1FD 
X-CRM114-Status: GOOD (  22.23  )
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

Charlie Jenkins <charlie@rivosinc.com> writes:
> On Fri, Sep 06, 2024 at 04:59:40PM +1000, Michael Ellerman wrote:
>> Charlie Jenkins <charlie@rivosinc.com> writes:
>> > Create a personality flag ADDR_LIMIT_47BIT to support applications
>> > that wish to transition from running in environments that support at
>> > most 47-bit VAs to environments that support larger VAs. This
>> > personality can be set to cause all allocations to be below the 47-bit
>> > boundary. Using MAP_FIXED with mmap() will bypass this restriction.
>> >
>> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> > ---
>> >  include/uapi/linux/personality.h | 1 +
>> >  mm/mmap.c                        | 3 +++
>> >  2 files changed, 4 insertions(+)
>> >
>> > diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
>> > index 49796b7756af..cd3b8c154d9b 100644
>> > --- a/include/uapi/linux/personality.h
>> > +++ b/include/uapi/linux/personality.h
>> > @@ -22,6 +22,7 @@ enum {
>> >  	WHOLE_SECONDS =		0x2000000,
>> >  	STICKY_TIMEOUTS	=	0x4000000,
>> >  	ADDR_LIMIT_3GB = 	0x8000000,
>> > +	ADDR_LIMIT_47BIT = 	0x10000000,
>> >  };
>> 
>> I wonder if ADDR_LIMIT_128T would be clearer?
>> 
>
> I don't follow, what does 128T represent?

Sorry, as Christophe explained it's 128 Terabytes, which is the actual
value of the address limit.

I think expressing it as the address value is probably more widely
understood, and would also match ADDR_LIMIT_3GB.

>> Have you looked at writing an update for the personality(2) man page? :)
>
> I will write an update to the man page if this patch is approved!

Yeah fair enough.

My (poorly expressed) point was that trying to describe the flag for the
man page might highlight that using the 47BIT name requires more
explanation.

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
