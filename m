Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0C2C3F6B0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Aug 2022 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSgG8f/AK0TBWXoKWFkHHxDgFFtAXtAvEr3XAWeJQds=; b=g2OQPqnjGuvQfp
	RiIKDZd7KP00MKJweS6VzmJUJR/w5DwdRif360EHU8r5/7ArmnwgTp5xMtUIEOpvlxP/+GoJD+I/P
	AVGJ4JL4rbcuvw0zXNpucg1nO/8au9NaCMZFlT5BiEY4v3HyGoZY2ri68JbX9A2jia1eFtQhldM2+
	9y2hd5bqKGq00rbqB2YfjNFw7q5esPEPHBUC2F+5mmNrhQAJ4vqBnnVE3M4pzRio7blVhIcIWUmza
	h05ZkmSUuqmXjX7jmepp2yC76HyFymzsfeXvJBSJsKU9OX2CvlAxWQGwwbW1MzflRXE2wOyRzjdVz
	enMV+h1O5pbaLBkjQxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyUZ-0056a5-Qf; Fri, 19 Aug 2022 09:40:39 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyUW-0056Y9-SQ; Fri, 19 Aug 2022 09:40:38 +0000
Received: by mail-oi1-f176.google.com with SMTP id w197so4229907oie.5;
        Fri, 19 Aug 2022 02:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bRymBzdXlfqAZ/An0FhEAiaTJ5r51uvoXyU3bQ2b9Zs=;
        b=dmhm7PkPP4XybjOnjt1LK7mR2owOCdAYAB1LhHcbI2fG5SqUikCyTZf+lKQ1qzG9BI
         m0BB0De3uWZWWS+Pgzvtz0iAT20E/fySH/HcpqSMfyYQm0Pm7BFST7Iq65zq1pVNhnRy
         LkFjS/YARK1yPu/Xc+cZhTsOnZm54Hbz+n4ayyidLTslemfW95MINz7InXk1DC7x6Bjb
         Xud8MYoYFnjTrkVtVFrifnG66aA0o0MoFBv0JFCVMqb9kCy7TfXU+Cr+nRApNA9vb3cq
         zFZt5JacUovihzUIKd/0xfvIBWHrZliyd7TA0j3X1COHGQSmPWYGqo3HiQpWvsDBuvP9
         Z52A==
X-Gm-Message-State: ACgBeo1W35HSomSHbAuAZEEUVfWblDi7wBSf8CDZ6cvCOn5k/K/TY5Kq
	31D2MZjT5P4ELy2xXHi9qxuhsPDD42Eg3xjJ
X-Google-Smtp-Source: AA6agR5K9gqjuVMdcO0ElADvZAG0zfpvDYn+FaO336ykpcurN7VR8BI07+bx1skyyV9LSdPslQkcVw==
X-Received: by 2002:a05:6808:170b:b0:333:53cf:8022 with SMTP id bc11-20020a056808170b00b0033353cf8022mr5468110oib.28.1660902035601;
        Fri, 19 Aug 2022 02:40:35 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id v12-20020a056870708c00b0010e20d0b2e3sm1142190oae.44.2022.08.19.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:40:35 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso2754482otv.3;
        Fri, 19 Aug 2022 02:40:35 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr6898469ybl.89.1660902025045; Fri, 19
 Aug 2022 02:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 11:40:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd5Ww-mtpymykuahHWD+S62Z8qiBMVx8y4okouuzTCAg@mail.gmail.com>
Message-ID: <CAMuHMdUd5Ww-mtpymykuahHWD+S62Z8qiBMVx8y4okouuzTCAg@mail.gmail.com>
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Michal Simek <monstr@monstr.eu>, 
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
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	alpha <linux-alpha@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>, 
	Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_024036_949059_EAB48E25 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Kefeng,

On Fri, Aug 19, 2022 at 3:39 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/include/asm/processor.h       | 5 -----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -183,6 +183,10 @@ void put_task_struct_rcu_user(struct task_struct *task)
>                 call_rcu(&task->rcu, delayed_put_task_struct);
>  }
>
> +void __weak release_thread(struct task_struct *dead_task)
> +{
> +}

As the default implementation is empty, it might be better to keep
this as a static inline function, protected by #ifndef release_thread,
and let x86 #define release_thread.

> +
>  void release_task(struct task_struct *p)
>  {
>         struct task_struct *leader;

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
