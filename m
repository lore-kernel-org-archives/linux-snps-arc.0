Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC1DC00140
	for <linux-snps-arc@archiver.kernel.org>; Sun, 21 Aug 2022 17:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gNV2Dqa4uMoxe9xaCJ2HI5TJ9yTS1E1fgjqJc3AObs=; b=H8CNBhkDePhDyX
	RuurWwBlzG9Ggaa7WVrqDshHY9pvguGjC09WH79oCqMCCLaczh6REdRYMnMUgmkS/f+/MCH+N/wzR
	vcBsdKE87knV+pZ8yfkpii8UAJHShtDeDQAxu9VnR8vAQj+Q+PiYtTpdf/3O/KpU6V+WNAj9DuEcJ
	29OMsUBQ63lOtKRK8bwQOiiVPQJdoYW8Lln9cJCDgKuTmOjSl5ASNi+hzzXaSzQNzJXNuZWAuqShA
	iBaTDDylZOhyN6Y+eunAyM5ow5N5I8bJJ/EwjnUMeKLH/lisPvMGkC25dhos67UL6C929Cfw4O/mj
	rhCRHYn1S3CAFD0VvKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPoyQ-00CxV9-IO; Sun, 21 Aug 2022 17:42:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPoyM-00CxP3-M5; Sun, 21 Aug 2022 17:42:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h5so9866696wru.7;
        Sun, 21 Aug 2022 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=7Nrg8mvlqxFEJfzKh/tw2+dBWE8D/s98GD2ZnmZvMl4=;
        b=F0ptjTbxLv2NJaVf2gvBlBshDMfCokLJPPMsIV35UHBlxVECPPma43FPvPitouEYuo
         8dgtnhsmPRFBvIO948wmtVOueVdGaHu/6efegZ+eBz+dquE2oOi9XMsurik6HL7oB6MX
         jV8pUVxH3f1RrwF0NH6pncq2tH6AwoMHlp65ZDTNCyiT6v1mar/Hou3sFmBJRov6RKag
         O1el0UDp9u/+GhEvUUZhnnL+z+SJXn9IfDfG4Dlp/Iuz3gqoHz6wEPHD+abHkg+f2q3v
         w/lO0XWXR94cHio73ZqXyXjLv1uGE7J2Xgag56CksB4nH92y765Uk+pyJbn+nJIZ5N3k
         uDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=7Nrg8mvlqxFEJfzKh/tw2+dBWE8D/s98GD2ZnmZvMl4=;
        b=jZQq5eXJV/nTbgAkY0N59CvRSvWbevxRo8rlMhTWzeol5zmsY8iO0jTlidNvdFd+c5
         HZNNwHPCp8RZudsHGBM0ZcnjDYtrF61Ct/v1vOd9lJehIFV2zuzIOipXQNgK/cUHm7J/
         hw5CaDOPfAXQ0LqGEiZkC6oEYhdId8rT6K73/abx19L9uvTwIymMHYyR0Q8UCtw2ir5W
         d6OgLxMOUfXpm8PJ2fKCsO/RrGzs5HQpatIZaC3cv4MiL1XVpzNvYhuRWUwXa99I4TtD
         K5vJMNBIEaCcTZKMG1kB0c4BCI2+ulzBKITMXidloUjjN3hsDi52a+3w2NSNNyD+gICJ
         XCnw==
X-Gm-Message-State: ACgBeo1BgYbNQvrtny6nH3ivle9EiuZSb/AQ4XvZacuXcCngnAHA/xyM
	ucKNuJqxCWyeG62rot2B0fo=
X-Google-Smtp-Source: AA6agR6ii5ETBOVbnXGvrEQ2XHp9wCOCZjRgmUsSrgmsT/hEBxdRm1IL0twc5nHL0nICTG/92OzUKA==
X-Received: by 2002:a05:6000:993:b0:222:d509:4b5b with SMTP id by19-20020a056000099300b00222d5094b5bmr9262211wrb.52.1661103772368;
        Sun, 21 Aug 2022 10:42:52 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003a643ac2b08sm6876286wmi.8.2022.08.21.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:42:51 -0700 (PDT)
Date: Sun, 21 Aug 2022 17:42:51 +0000
From: Stafford Horne <shorne@gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
Message-ID: <YwJum2c1I8JhY0B8@oscomms1>
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_104255_281513_F18E1A2A 
X-CRM114-Status: GOOD (  13.23  )
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

On Fri, Aug 19, 2022 at 09:44:06AM +0800, Kefeng Wang wrote:
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

>  arch/openrisc/include/asm/processor.h   | 1 -
>  arch/openrisc/kernel/process.c          | 4 ----

> diff --git a/arch/openrisc/include/asm/processor.h b/arch/openrisc/include/asm/processor.h
> index aa1699c18add..ed9efb430afa 100644
> --- a/arch/openrisc/include/asm/processor.h
> +++ b/arch/openrisc/include/asm/processor.h
> @@ -72,7 +72,6 @@ struct thread_struct {
>  
>  
>  void start_thread(struct pt_regs *regs, unsigned long nip, unsigned long sp);
> -void release_thread(struct task_struct *);
>  unsigned long __get_wchan(struct task_struct *p);
>  
>  #define cpu_relax()     barrier()
> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> index 52dc983ddeba..f94b5ec06786 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -125,10 +125,6 @@ void show_regs(struct pt_regs *regs)
>  	show_registers(regs);
>  }
>  
> -void release_thread(struct task_struct *dead_task)
> -{
> -}
> -
>  /*
>   * Copy the thread-specific (arch specific) info from the current
>   * process to the new one p

For OpenRISC bits.

Acked-by: Stafford Horne <shorne@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
