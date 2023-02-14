Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832E9C05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nteEpxMt/miwRGGK4XTDdpve3axhu7UsGlOaPCCeTeA=; b=fyCLo+BDjrQMif
	673LUgfapqPqblg9K/67tOQpztI35henPxrG1MeNf4kYc4XrOfgqgcSRsGMeVBeP4p9ww9urKpmvg
	mQG2sVWhKTQFnwTUoJOmZsHIMam831pjI9b9Mua+BGZrf+2pqRNrvHiyrs0q96G44pwGCvJFArwyn
	4pGkagtdOdOIpuN2BXnIO9hX/EDFLrqRlknZ8/aNmFH99eawK6qmxk5Ys/Y94X37+hP+QE7KQaW2a
	kE6+CE/s0WAU6VCsRVkh0VVcVggTCFuM7g2Je4kB0NWaSz39MkrnvZaA8nBrdOHiA0HNaZBPueVkk
	/YwWmIk2xsG/ATYevpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRus9-001e9j-LZ; Tue, 14 Feb 2023 12:57:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuru-001e80-Qs; Tue, 14 Feb 2023 12:57:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so15370424pjw.2;
        Tue, 14 Feb 2023 04:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=WJdnIzCNdsEVhQsGHsWOO7yTWXr+pWI+PtbYUorKW2BchHqmwSwOGYAdoPufsKo0lJ
         bXDPWjxdhH0QnGSePHf16V7IoRXQeuhXlPcWmkxu8rZSjSr3Sh7jD3eqfhHEY8D454AL
         h9BqNX+KCkb4XJj5QiYoEyv/SXP+BeQ/BY4l0AmplspY3uh+sSGXDRYM23x/cN3z17v4
         7mVXCjohMU5LW8N+7VSWMBw+LVgUYmGtE+fRcUV+X7h/ZuXCVclocMVqOgQVU0PU1ZT/
         Iaxkx1YKf72wvTPUawYrrDuiNA9tC+Rro4eK9+FeLt6f2iRUNM5NC3UOCLKbbbVT0kzB
         CWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=8PuUGROfM7c/e6CWfaS5FRSduM9lpC5mbOcRDHZt6m5TV2oyX50BZEfF1YO9QAMlzV
         zF+ef8CdgmTofauEg+lku0I5FsAYM+Rst5RzXEQBIaiQAxFL/V9dOfNj1Hr08uHlO4ju
         VYdO2tSZavrWUnKUwpMYoxxLnjPFluVmM4ZiZvGGe7WtnTR7NuCeYcwUf47nBqIV6MXu
         icSFNzxYlaaJ2Gfofdkj6c5ufI6vVwhykipC4cDq5+Z+M6yFfuZ51hHNM7m1MbwXjvJq
         68HCKHStJcuRAVjon9jwAHIL1Ch7dvL7FRYyPnyaV38p/f1HgsUsJVjNHgAunC9DDIpb
         uWAg==
X-Gm-Message-State: AO0yUKWQ43xLduoWSqhX04unCwaeweODyBAYMWoVN0BRG58LPHtlNUEf
	XyPcG3Lgu3fkyVRSCDe/B1snO4yJdu33JF++gMs=
X-Google-Smtp-Source: AK7set8VxH7lwiKYZQHjj1alCNiwWZsomKyHPncWio7rYDiPFQWyD3jSnBu7216hvtJHxDxHzVWwlnilO9YoLshnmQM=
X-Received: by 2002:a17:90a:d486:b0:233:c720:e6d5 with SMTP id
 s6-20020a17090ad48600b00233c720e6d5mr2292500pju.94.1676379427739; Tue, 14 Feb
 2023 04:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-12-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-12-alexghiti@rivosinc.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 04:56:56 -0800
Message-ID: <CAMo8BfJ_RF2C7EkZJusFuVPh0-7zpgNaj1pDf079CSKzRBrQjg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] xtensa: Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_045710_879963_51B05021 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, Feb 14, 2023 at 12:01 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/asm/setup.h      | 17 +++++++++++++++++
>  arch/xtensa/include/uapi/asm/setup.h |  2 --
>  2 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 arch/xtensa/include/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
