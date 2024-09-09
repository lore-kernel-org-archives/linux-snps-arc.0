Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B882ECE587
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Sep 2024 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak7PfYDEs0qBRlSImYfvO1w73h4jn4f6eEc37UeAi4Y=; b=k+v7RAmDJ1tstJ
	DDGK722Onowd1YTWpkZfRXQlPiHlW5EaB7YZSr6E0iwHpDeIoliU7X/ZBcsJm5CRIJFrAAYzI/JmH
	l/gMa/+8i/UzXwlzPHkWp1KooUqxJYUmMhnY5qhb1KyYPUF7Wm2gHufkXCwNsr0WGACM4g7L3Nghg
	W5CyiFBNyVrSFZYN9S973PUo+wxqQIOTkcpcTfWwNnNGRq4cjE7hjZqO4hb6me9FZhAZqyCwh/V/m
	eIWflcUnMv3UC/tB/izzHIOU/LGimRz1sgvh4Ws2OBcXkgHVtCMFgparycOJr6eGKGoPN9fBpDRuu
	Ze7YmcIIKzWLm+vPvhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjkp-000000032ko-2WaT;
	Mon, 09 Sep 2024 19:08:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjjZ-000000032bM-3kpy
	for linux-snps-arc@lists.infradead.org;
	Mon, 09 Sep 2024 19:08:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-205722ba00cso39992775ad.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Sep 2024 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725908852; x=1726513652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KeQ2Et/fFCRS76/RDVc52ODWIM932uTGcPwA4XQOW3E=;
        b=2hzGvXEvRsw7H9868yrgar2BfMfk0efyrYbp64sr7Fd4Z9Rjso7jH08fnwBFKwF2mX
         H47LPRIEpKlPwqYAMYfqzwUlim5GDoseLzq4L1Se6Kdvp/h/cY7rTWFBXAE/MjQR5TH/
         JugxR4Wz18qr7ZAWQ8OJeTuFT5hNMXnutK2IL6nxIbwpff1w5aMCnY+Adn/EjT+uxRJo
         VTe6Tyaev0ff2TQyphGZp0eIq+GlMWAwear5Lhc7M82H0BjOALwG4SFx8a3kX/h5Lbou
         DISwaj3DQg3bEHVkXZD9INcsSSwLaV4dIGErAxtjMbYPeDiTYAJC0RJpA8ddApnHHI99
         vcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908852; x=1726513652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeQ2Et/fFCRS76/RDVc52ODWIM932uTGcPwA4XQOW3E=;
        b=fLjVlbAuZasH8yWhsE5pScXr3tBZO5OJjr3vS9dHYTVzwWCRhKiL1YCSwM02ZVqQ3z
         iRhiqn/BYT9nvtsn29viR4F3Dr+bjba7YOM21RhCAMVeHsjyT1fzgMrZrSw2COrnNSa/
         XuIQ+eX51NJ6o9nfiCziK9xJOPSidIUUm2ftKyKTu077LX+V5KPnX7TiGuEqnUyWU1PT
         fk3abx60gHatthxU8svuEaMgG+qluw4s/DDmJDuWdgRc9RTwV2tOCc1fPjLeezX6MgB+
         x6MswMLEwBaYqxnpS1+QscT11py+WFG52grXp2+ZdN0MjZKis50LcJnOtULUGY3qWbvo
         zhVw==
X-Forwarded-Encrypted: i=1; AJvYcCVkoVug910Qg9jVLUuSGyd5tzZj99BjTVwne0FAFq/ou4Wqn5u5GJnjgiC5xfbwgZuksJMQMjK9qjd61mI2mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywmzqQKA7OTTrpMlyfdpv2qi5hYK4BDApOy6wJIWwb9AL1U3gH
	ObTVw2QJbPqkg4A04nBmqFU1fd1ZRGDWgwu5PgNFuWO5H3TLGKK89tyVMBr/Ld4=
X-Google-Smtp-Source: AGHT+IFr8qMBk49qQaWgQwdEeSwPNLRpIJ6+/NqAAdbEE2n6wWPI3+1ojCwWs7k3VHGjnw2a54FzLg==
X-Received: by 2002:a17:903:22c9:b0:205:5fb6:2aba with SMTP id d9443c01a7336-206f0539d1amr123273675ad.30.1725908851946;
        Mon, 09 Sep 2024 12:07:31 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f31729sm37014315ad.261.2024.09.09.12.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 12:07:31 -0700 (PDT)
Date: Mon, 9 Sep 2024 12:07:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <Zt9HboH/PmPlRPmH@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zfol468z.fsf@mail.lhotse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_120734_165205_BF8BA445 
X-CRM114-Status: GOOD (  21.73  )
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

On Fri, Sep 06, 2024 at 04:59:40PM +1000, Michael Ellerman wrote:
> Charlie Jenkins <charlie@rivosinc.com> writes:
> > Create a personality flag ADDR_LIMIT_47BIT to support applications
> > that wish to transition from running in environments that support at
> > most 47-bit VAs to environments that support larger VAs. This
> > personality can be set to cause all allocations to be below the 47-bit
> > boundary. Using MAP_FIXED with mmap() will bypass this restriction.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  include/uapi/linux/personality.h | 1 +
> >  mm/mmap.c                        | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
> > index 49796b7756af..cd3b8c154d9b 100644
> > --- a/include/uapi/linux/personality.h
> > +++ b/include/uapi/linux/personality.h
> > @@ -22,6 +22,7 @@ enum {
> >  	WHOLE_SECONDS =		0x2000000,
> >  	STICKY_TIMEOUTS	=	0x4000000,
> >  	ADDR_LIMIT_3GB = 	0x8000000,
> > +	ADDR_LIMIT_47BIT = 	0x10000000,
> >  };
> 
> I wonder if ADDR_LIMIT_128T would be clearer?
> 

I don't follow, what does 128T represent?

> Have you looked at writing an update for the personality(2) man page? :)

I will write an update to the man page if this patch is approved!

> 
> cheers

- Charlie


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
