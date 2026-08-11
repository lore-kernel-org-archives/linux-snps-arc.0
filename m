Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42029C5B570
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Aug 2026 06:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TG+GE7p5waUuw0iI5AUnp4GvJfHjIrVC7cRLaZrjYVY=; b=O68lzjYtPbdcoP
	TNZSUskl/Eul1tX2T8HaA9ohGRY0ZauUxxDmcG1FAysi+kcDD5b+x9XPz+Xv7MXzrv/Vt5euDgz51
	aCwh44CCvfSaGj76eEESBNFYnyX2dMGlHSgKoL0Fk1Zn6BdITNp1sks2rRAvRR1+D90XXqM684qk4
	zrn8EqhIAOcLa+uwMmo2dtd5KRYNfW9QNJ87Wzu5wRPdgrbUqSBD7h3o7tI5FuiKCYJtvXQZwTrUN
	ekibGAp5LKb2AXUhl4wA8NSCadOcU0VG2x5LUtD8G4ph/50NfReL05DN4MwrOoBZ2Ni35EQrM3+F/
	/8zfUOc2lM7HqWSxU2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgQc-0000000DTAO-3tGG;
	Tue, 11 Aug 2026 06:57:38 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgQa-0000000DT9t-2edl
	for linux-snps-arc@lists.infradead.org;
	Tue, 11 Aug 2026 06:57:37 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so39468165ad.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 10 Aug 2026 23:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431456; x=1787036256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=YfBCf4ErpuXuQKaF8tU2oMyokQFW7mXn7OEZNisyU7BrLVtcE1t1jr7TOc9fulHMgH
         WBdhVJ5Fvwee7LWpVapwtvqY0xWZI5j61Awy1MTelR9efdZvZUabHexf2MBxoDSMXQ4v
         7nnnn+a2SQv8KszEnAQZ9FQmjjcw5hr+wRofkcj9wTJWr4d/ipeacTftkl9A/3SOBcaw
         e6if0TYhdYuDRWjADTeD9gljwbulj7h9vKkGMpyZxWXbREOMDr+b4HsvxXXv+NDNymBn
         ESwqQa34zruDRA6yCQ8FYc0UH1wqfTdGXQmr/0Pt8Pgb4Mw6eQxXHsg036CWRqpKLtwB
         Fp4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJRK8SFuwPTIOO3RA00bQs7penND0DPtOSl/vAnwfxk/79E5z/mYaKADw/eTnPWgMQtPTcQl3QkGqQt7AZDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEPtTWbk3RRnSJGgY/lkcsEpLDd6+VpNDPrdRSorCVIl6irIow
	Dn4P++etHllh2v8SG+p6nRwrGPekJoPDmqtgHPNFd5jn1kAjMxRTNZxsAWJ0u4cp
X-Gm-Gg: AR+sD115dOnzB49/pmLQx0r0rXtPJhXac/1fLJI4/Mgccuc6eDBhS4BGucWKTmcMqwM
	sJ5pbvebI+sBHzwkuWCMy17miUh7m3bwn+MlqmYJg9d2p9ME0yUtjxpihDrrSb63GnH7f1hdRzn
	sce89UTWI+WIwMAtzvDtPhiYfDSqq7m36q4zLGE2emO9GZ/Xja3/PX3XcTTXZC3lxdzVxi4995T
	dI1THWSpgIrr/P8MkOwAIgV+QUojFQQzkf5OuaroFdu5WNCPEnRoVwZjjPOQFMC3jpYINHf9vuo
	YhcvH5/fTSLkr1tBbC/q8giDo8TNu3HRvFz4QNu0guXtC/TjOtKCCZxMGb91cEt+DoQcuKZBRsb
	CkTZoqzMoPv0hNkn1ZGGg5tTiK+VPAPPVmp0GFzzGfBQ0LmH9lq398bkXhxlc+/J0DVwv8mN3qS
	DzfoLrNuSBBYAN4XapbXmC+TYN/FUymnb9LhUrHOgVMwKOMJZoo0zAXGQSJemJxwG6P0FbjDdgm
	1uMt+cDkUsD27CKNCA/LSRbWw==
X-Received: by 2002:a17:902:d484:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2d317996a05mr13215855ad.22.1786431455621;
        Mon, 10 Aug 2026 23:57:35 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160ce588sm2708255ad.46.2026.08.10.23.57.35
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:57:35 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3483080a91.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 10 Aug 2026 23:57:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqlCF9H3+JZm5eMbcpXP0qqQL71I+zGNsZjU17a3wi/GrlYcbXKyQCwMJ6ocZ4xZS8xGdt03IQdTybEqZn5Vw==@lists.infradead.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_235736_670366_1ECA15DF 
X-CRM114-Status: GOOD (  19.96  )
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

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
