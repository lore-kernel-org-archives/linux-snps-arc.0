Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5F8D2D0E6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jan 2026 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPUMi5eHpfsJwMOpOp12atOXoyzZMsQYiQjYuYc8ycI=; b=LYkMzjSJdEpjDp
	/oih5RrNdhN69kJPD2qtO41qa39DTv9Mdfz5NyoblPBFgGI9Ex3XECYYRd6A9tsuuXTa+Zf8ABSXz
	oe5byf7zOeU1Z9zqyuK6akngsTGz2nFveyxs4dV1pL8cfg4v7JlUzCON0lWpzQcJeqvvoieHBn9hw
	ttZUyDrbKQsoU4fsKvpc2RI5q3pk3iUi9DGNXNuXfOZQ1GTEo0pBb4NTVXEFegaNRvoyNOj+510KF
	c0b+69u5loKV9jMgWURqiSAiW9kRekAoANMaT02rj0LtNs61wfp6U1/T9BvG0FAUQq7R0f/MNsINE
	L7G7ndUJYxiaQGBRUgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdaW-0000000755W-1YrW;
	Tue, 13 Jan 2026 12:33:32 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdaT-0000000753q-1NsD
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Jan 2026 12:33:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso2896276a12.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 13 Jan 2026 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307607; x=1768912407; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=JrB/OsD3UcJaQwF+E/jvirHSJHGhEjGawtu9Sz3J6QPvyQDozOlMOvMJyGNF7M+Esm
         WEMKHZnFPb13aH9lSgtV3nnhje+syAO5735tmcTRBQ2XELXK9FBIZjzcHgiHYKM0XCPr
         yfLqf/aPA5oEAylAU6btlkiWRAxv2+lNvyzvbm9tim7nutg4CJiL9FVXXHiSIA6n0arP
         cB3RzDtaNZQbB22XqbeztnjqikHclilYULeP8ty5n1tV8jzQy18kTl6WF7kXKGEP85SY
         VQsFq3u9Oaj7j6mVC7SBsoxUwWyxwffs5gZw4KHmZnuPw6VCseK82OuObcHKQ8JlUpOP
         G5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=mHxqtXRmxI1tIzAyy+uJDNjxG0wAFMjWLXN2513oMadm/Ijx8y9Ujib7F4MBsZMxDx
         pc/vGi0Udmzbcn4mqgT1+eTYJS//Keoy0KT9dI9ayH1SFTdEAWgqgbkAkKAw/gjDapB1
         b0aZK7uhV5qh4+E18bNlmUaqXjuJ06xXy+o9EMCuweWF4Hw8k5Fz5iYv/pPvskARWbw0
         mLNEsNOTVPLyVsSOHSTHQb4CFCDe7HDZi9nbpWb68r0WX/GZPiPhJCMoQOFZ8gKFdlH6
         BNRjpDgZolKJio6KxCCoSz+qDWwOH9E/vpQ28RepPquFQBhbQFVgoUIOLSBqwlWSAbay
         lzlw==
X-Forwarded-Encrypted: i=1; AJvYcCUWII4c33biuE5jOaxz/SVPKuhcgN0rruPQ32swvJg+Ix/mynucsGEuqR/WOY3ijowu4I+jxxzrGAzcSKxybA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7KRrSDxMl9cB+zli1Od/W4j/cKkJ6OPLf9+Mn5sWzXOJg3LtO
	0NhJwx6AMwenCtKirPPCxxEDyvePuWOVF0rTCAzqMeKkWFaTmTPGR5Gf
X-Gm-Gg: AY/fxX47OyLKRLq9hVa1A9dLaxO41MjKsxCryFRe/3KmsWehNq08xvrBlYIj7YNl1xO
	hO8BABBPEFMyX2yuwqDrFsX0abr6iuUAQShn154Gshqfkf/qlfQh6/16V75mZfYieoVY2BdvT6j
	QLP9hW7tPltuDy2AX/JyZ9BjLMs2KYVhujuvjHbxAcbtm/+H2cT3WC6PswLlHj6bJ6Zaqqe8LT4
	LdhCTnOfAQS3AlmhdmyMZXDRl7juw8b2Et94UOVzyWOupGh0UGYmKX79ZaRvvmeoHI1xn9Wwvyc
	9SaoGMNQxl8p3MkKSOKoNHr/VFnicfzXV42w4oqZX/DBIxCfej3hCmt7BdH9WFHX7GZf5tscN4M
	qvDCQEv0gdAMcjcvqdfTzeVN2pvk022+2eEs1sCG+274YN3dmntw4CPDgddheMA+yf/T9j7KelU
	v+EYvI
X-Google-Smtp-Source: AGHT+IFw8NQUhXWsNFLNcy9VnhtaeqSccMp4bageDierszWlx1Kxyih6osyfD1+uAcqTN4o2oK4SYQ==
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr18570023a91.35.1768307607428;
        Tue, 13 Jan 2026 04:33:27 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fd6e343bsm1428958a91.1.2026.01.13.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 15/29] powerpc: introduce arch_zone_limits_init()
In-Reply-To: <20260111082105.290734-16-rppt@kernel.org>
Date: Tue, 13 Jan 2026 17:59:49 +0530
Message-ID: <87zf6hu24i.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-16-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_043329_408492_43689A22 
X-CRM114-Status: GOOD (  10.76  )
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

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

This v2 looks good to me. 
I have also done a basic bootup testing using Linux PPC CI.

Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
