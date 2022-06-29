Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD6CC43334
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jun 2022 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gyz0B4Wczv41tH+CGiGLbE3MDqth/UnjG9UBjgbE6nE=; b=tcw0vB7csF0PDP
	oy+4yrRf2lLIghc+WmuOlxmZQMSHDF2oWxH9Fy7vTKSWiRp/URtzrkRVlyCkrKIQA06eY3SU2EhHs
	J2rkn/cYM3vtxy9DNZeONdLexVv4fwgqpDuIxN3U2DLSumJJMHSoxq/R+MPrZI67ohoDQqIqV3mDK
	xVZaB/ZUt7795VrDaLGlQnzwqO7yXT23TnrqQnU/WJVoLi3sTaQDFF64k1ya7epIPKJ4pVQm90r2g
	znorBOXoUmR1+oBqnsHml2V1Jxo0+fbmt+pUdnGy4Q+NYVgPWPEW5b3h2jGdRZRiMfR3zt8r3/ylS
	I/yRLS6oXnuRJqTCqnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VZ9-00BHIP-5B; Wed, 29 Jun 2022 11:09:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VFN-00B8vD-6D
	for linux-snps-arc@lists.infradead.org; Wed, 29 Jun 2022 10:48:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ej4so21606531edb.7
        for <linux-snps-arc@lists.infradead.org>; Wed, 29 Jun 2022 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6LFOwjQrAynhPJz9w2u2YY2RBLCZh4UAS01+RkIiElc=;
        b=dneHmp6YA1cG3nYmf9UuYKaCuH1hXRFEWx3WTF2ty6a9myUn2eqF9gjXMlXa3La8Gg
         VC10gpLljqL1ooesc7h7mKvbpvw4hc0lzOguyePMZbTAyJTeHzCIAYaTqUgGd1r8dhWT
         Kndakzd/rpUwN2ODtK1/UwYdfjYTxOAn92w7+RI4Jxk5julwlXtzRS2sN7B4ZSqOO3pW
         Ad01BneYF9sAorQLTi1e/j4zfnLe5AfFh1bTHXZmNZ03jidbaYrl0VVPJ58gUFWJSZmh
         EVlxxoxeco5L7nxDkaUNIzOcKfke+Px3y6xgv/EbCA8o+qxDRs6mco8veT05duUJs/VP
         Ld6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LFOwjQrAynhPJz9w2u2YY2RBLCZh4UAS01+RkIiElc=;
        b=X3NABrWrDs2paOie3liMSZ3bCd0wmgA9sAfPKuH0Rl708a9yRQDFRIhS6VOMTzLEQc
         fAzu/wE+FX26mUx0kFu15zLJ5tRXdWAsq3gT6r/kS/97d3a/nftDKUZL575qC2FjxaPP
         /zN2V5u0P4LNP3RJQnCuk0NjK6QfITyEvetJN2WoiNunGK7ifFsOl2pZzm2My16CvNW0
         LBKSB/wsDRmKHjAvTsf704tMZLEmU/x9auzvWOMgxMioGWpGqptF0upehJz+soGUhom4
         LCsI/ySoxRrJNN0leXqJJA3q5iCI91CYnKQ4ZfSQPyIXoAT+RbifSwg4AxVaRaCqKZRv
         KPPw==
X-Gm-Message-State: AJIora92xdenKievC9zz9pdw+RzlXgYCs5JoDo1iSYR/P0ROS7yS5moW
	YRuBSqeiKEFtb3PGobXnWUc=
X-Google-Smtp-Source: AGRyM1vFiCAQXNLCOYQ/qrf/5NU8lfqplEuPbV4uIYv41Kuoos1HAZTnu7lkf/zQzOzHzELE8gkdpQ==
X-Received: by 2002:a05:6402:3682:b0:435:b12e:57cd with SMTP id ej2-20020a056402368200b00435b12e57cdmr3396614edb.381.1656499714338;
        Wed, 29 Jun 2022 03:48:34 -0700 (PDT)
Received: from sakura.myxoz.lan (195-198-44-182-no2390.tbcn.telia.com. [195.198.44.182])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906078200b006fe89cafc42sm7676800ejc.172.2022.06.29.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 03:48:33 -0700 (PDT)
From: Miko Larsson <mikoxyzzz@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: arnd@arndb.de, bigeasy@linutronix.de, chris@chrisdown.name, dmitry.torokhov@gmail.com, gustavoars@kernel.org, john.ogness@linutronix.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, ndesaulniers@google.com, oleksandr@redhat.com, quic_eberman@quicinc.com, seanjc@google.com, tglx@linutronix.de, vbabka@suse.cz, x86@kernel.org, linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] kbuild: drop support for CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
Date: Wed, 29 Jun 2022 12:48:45 +0200
Message-ID: <2842572.mvXUDI8C0e@sakura.myxoz.lan>
In-Reply-To: <20220628210407.3343118-1-ndesaulniers@google.com>
References: <CA+55aFz2sNBbZyg-_i8_Ldr2e8o9dfvdSfHHuRzVtP2VMAUWPg@mail.gmail.com> <20220628210407.3343118-1-ndesaulniers@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_034837_295628_B74C91FD 
X-CRM114-Status: GOOD (  16.94  )
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

On Tuesday, 28 June 2022 23:04:07 CEST Nick Desaulniers wrote:
> The difference in most compilers between `-O3` and `-O2` is mostly down
> to whether loops with statically determinable trip counts are fully
> unrolled vs unrolled to a multiple of SIMD width.
> 
> This patch is effectively a revert of
> commit 15f5db60a137 ("kbuild,arc: add
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC") without re-adding
> ARCH_CFLAGS
> 
> Ever since
> commit cfdbc2e16e65 ("ARC: Build system: Makefiles, Kconfig, Linker
> script")
> ARC has been built with -O3, though the reason for doing so was not
> specified in inline comments or the commit message. This commit does not
> re-add -O3 to arch/arc/Makefile.
> 
> Folks looking to experiment with `-O3` (or any compiler flag for that
> matter) may pass them along to the command line invocation of make:
> 
> $ make KCFLAGS=-O3
> 
> Code that looks to re-add an explicit Kconfig option for `-O3` should
> provide:
> 1. A rigorous and reproducible performance profile of a reasonable
>    userspace workload that demonstrates a hot loop in the kernel that
>    would benefit from `-O3` over `-O2`.
> 2. Disassembly of said loop body before and after.
> 3. Provides stats on terms of increase in file size.
> 

Might be worth cleaning up the rest of the kernel of instances of -O3,
too. -O3 used to build lz4 and mips vdso, for instance. Might be a bit
of a digression, though

--
~miko



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
