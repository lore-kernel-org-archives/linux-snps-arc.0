Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CEAC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s003p0JzNVuads6CW18NFFSFeS1avHNjkCzSTDOdXM4=; b=QojEMzE/IXqLZE
	seLH/wN81PrCB7XSmAENPALFbLCibkepEJpLBzq6qQKGwQSTiBqcXKRkGNXZO0+nRo3hAEsQeBoGM
	+fOcH/Uz5QTMGYoB547lr3X8ySGWcRLENOONRY2K7fflAYEG4JEMnM9L+c1qOMQx2Dy4GhN0mpnw1
	Hgz+FcmcEv8efopLFYLA7eNyCMYJqdB3JUBGO8siyBHQcyRzJ3wIr5siA1fHA1ldwsEpCr47QDgCz
	605cHJI9VNdoat+0fIens3Ju0e7MG/1v/BeUSklbf9q0oguYAEB6vjgCym9Ju8h3Il0v3uc4mKmH3
	umAeOQj6K/X3NESxITBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRv4x-001gTC-Q4; Tue, 14 Feb 2023 13:10:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRv4u-001gS3-QF; Tue, 14 Feb 2023 13:10:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id z14-20020a17090abd8e00b00233bb9d6bdcso10205602pjr.4;
        Tue, 14 Feb 2023 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/UCnR+z6gmAvcqmKIJeLEMH14WiUbQ57wKTFDt5pcJ8=;
        b=AroULSWko9Zr7eGEPpWTPA6D2mG8vKfAIsqG1/UHiZHP3HX3PbVp0qrMJ+FuAJsbWS
         v05+kTojvExJxZ8W+9yB21D5w8vexFjRyphDjBsOddEZTMVdttkVBNXjxWFQ3Iqwojqw
         +DKSZuOkQRuVKSaqQXL+bh2B50zxlDW7/k12RIgkMnOVm0uYI6LnfzeI25mloiCklp33
         VHHtIf4Dpr/qSsDgSQMEDKRS4lg6TE80G2m56Li8ak7Mi6jrTmPyCPMKDQkClT1hFcFO
         HozC1z+zsQ4VmKCtjiLNbcQm7z7g/V4D6C2WAOwQT8Y+WTTuWkSjrC9wQJ19rS06uj77
         A7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UCnR+z6gmAvcqmKIJeLEMH14WiUbQ57wKTFDt5pcJ8=;
        b=UwAKQIjV8rYbS+NGmP7x8w4KasNH6BCX1ej9c5kR4xcOhwjfp2/HDmIBCs+VjVz5TI
         B9rnDj4oScQY8nHSB0be9BTo0k3+8ivvBwVzQwZKJoivFHdpCfPbyo3b0OrBW0za2vhc
         vkuhSOcojTdS0kOf0V0164mqi0LK5aUkND7Ik8Lsy4LdL5h18/qsMtLcXUlSyjUNvlWY
         /NWNMdpv3zBc2fAAlls82cjxFouZ9qy/0cU1VQdnf9luACO39eTSMOr838//VGj9VlV7
         Uk789vAxHOkrocnaa1Y+a7t+F9qNTy0h+C06K6aH0cIoGJms0s2AjMaMrzQqgjys57kr
         NpSw==
X-Gm-Message-State: AO0yUKWtlE4V28xXK34DBRi9ZleBT7ejEngLGV06MJlqMUuaKDqgsLge
	bIeTngmJM+YUcE8/Bt4ESl9B+jovZOAGPFCTCFA=
X-Google-Smtp-Source: AK7set8wnbcla18BA65mD0tF+YGFQZaLOi1vF6MNFPYgJ+xCNbkwNuOA5gg0rl8sjl7Hw+xmx/asisuFdRpgxW5I32w=
X-Received: by 2002:a17:90a:d486:b0:233:c720:e6d5 with SMTP id
 s6-20020a17090ad48600b00233c720e6d5mr2301551pju.94.1676380235318; Tue, 14 Feb
 2023 05:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-22-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-22-alexghiti@rivosinc.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 05:10:24 -0800
Message-ID: <CAMo8BfLCDbYWBWfF7ZJtG_U7E846RmJLF5OFdWpaFOv8ydo0Eg@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] xtensa: Remove empty <uapi/asm/setup.h>
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
X-CRM114-CacheID: sfid-20230214_051036_892168_853AC4DA 
X-CRM114-Status: UNSURE (   9.39  )
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

On Tue, Feb 14, 2023 at 12:11 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
