Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2015C00140
	for <linux-snps-arc@archiver.kernel.org>; Sun, 21 Aug 2022 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpLKE/hrQQv6kQN6G8CE/vJ7INHLyYSZEna196Dyt9U=; b=Tuw9DXaIbn4TYv
	IYxvr439hempTIfkC4czRJXGnNqsJucWV7bAQEjqNfr9e4scqf1v1UAYO8ilqdLfmHat7wZHIo4hz
	A/yKR/2eVEkvICkQiScMgLoWQUjhchWFZjU31MCz2vgHnIj4v+le+W9lPRWWYTc9lLmpnE2yIypru
	rKIF+ehmcOkb9AMoHZM3T/scJATSCFmzJBMia8GctKEYdB4+eLaS+CogSwWvfaICc3AISWBeVHclD
	jBlVjTHNT/NJASOwVTpxnJktt8BpURqMXjDwRkkEOtqmUAyXNWQdkrGCcQMXpUS68ccuy8+zkyhI4
	QeMEPpU7w2mUqAEjJkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPmPG-00Baqc-27; Sun, 21 Aug 2022 14:58:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPmP5-00BalD-Os; Sun, 21 Aug 2022 14:58:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 208B660EEB;
	Sun, 21 Aug 2022 14:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CD5C4314D;
	Sun, 21 Aug 2022 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661093897;
	bh=GzHlPdU+t+7DtU8s+ZQkqJLPYJa2D5QllpBgFvrmGaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/InbUJweAfp1LwZGHesZqt6a4G8zsWb4eQ8hwBY+fB8ZNzuv2+o+WZHLNeTfA4WO
	 tP4Obzfca17jnLVlGgFOFqxNd6GFR4jnIKswxHiVPRByKR0FyyfEjvUWSnMKafFXQ4
	 QOr40w20RSDAD9EvrDPFMMrXNqdtlQCXpnGEoCR3w5CIY8AdxOD/JFzlCAcvspGNEm
	 DVW630OZ50JWDkTiPs1UE7dtpdaCNgkS+cAO/JlCROhsav5Fnx6kPk1iKt/dCeUOfS
	 RZB0YxyQZs+ZabqVHYJ21sh7i3kcM3kQyE6cLB3Q80qen46LSIsGqGB9qTe2iH9WI3
	 DNgxHvxgpF3Bw==
Received: by mail-qv1-f45.google.com with SMTP id b2so6520704qvp.1;
        Sun, 21 Aug 2022 07:58:17 -0700 (PDT)
X-Gm-Message-State: ACgBeo0y/KbDm0YFYLR4086YoDoWvOTkm+3Mo0jiMzAHiuGQAptdslJd
	UsdXtRZjoH7oT4ZtTIfgaNsrDOVQwgsuIO7G6Mg=
X-Google-Smtp-Source: AA6agR5Jfm9mVjshWjpFq8OKc54hNg+6T+J3SLoca3TFw2LF4khEc2uAuPslbwwXSbPSAHiGS5rHKpQKorBBpPqiG2g=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr6025080vsu.43.1661093886384; Sun, 21
 Aug 2022 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com> <YwIc7qbCWpIVKR2j@arm.com>
In-Reply-To: <YwIc7qbCWpIVKR2j@arm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 21 Aug 2022 22:57:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qffsU0Tmb7_b0iQh7x3Bks2vVrmmvL+0Z0CVaVggsYg@mail.gmail.com>
Message-ID: <CAAhV-H4qffsU0Tmb7_b0iQh7x3Bks2vVrmmvL+0Z0CVaVggsYg@mail.gmail.com>
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, WANG Xuerui <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	"David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, 
	linux-um <linux-um@lists.infradead.org>, linux-xtensa@linux-xtensa.org, 
	Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_075819_889723_68D79CE7 
X-CRM114-Status: GOOD (  12.07  )
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

For LoongArch parts:

Acked-by: Huacai Chen <chenhuacai@kernel.org>

On Sun, Aug 21, 2022 at 7:54 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, Aug 19, 2022 at 09:44:06AM +0800, Kefeng Wang wrote:
> > Only x86 has own release_thread(), introduce a new weak
> > release_thread() function to clean empty definitions in
> > other ARCHs.
> >
> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> [...]
> >  arch/arm64/include/asm/processor.h      | 3 ---
> >  arch/arm64/kernel/process.c             | 4 ----
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
