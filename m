Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA77DC43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzfI+M8X/JN+Ecj6KwEk4EA5IizEQqa+iGnVzLmGChg=; b=Kn3Y5qDEaZmnBr
	NnkCR+kwXgxAzi1oPDCY+gkORrInGD1IUsXblgkyR2Vg89IjJA4WS7ddfMG04kilEgbmMV+1baOK0
	UcSjYPCVZLBvjWbXEMzA4f+4PmoF3h+Rk09SU9WriJDIFIOUAxE/TbHL8h27yLobjLA3Zj2bOZR9Z
	KZ+mx5u67yDtql0DGKs5gl7X6t2kguEQdj9zpJ/2bSvztmt2tefqVDR8lbXY3ZzdOomEbsPHfjyNj
	2slWSsNhpesTzuurINxR9U1q42PaZKsnx70CGR9l1ZHV/lltEMWLWJ4VbZwNH9Wbgr+Z/xc/2eiP0
	Qs3/6+DmWX3EukO10fig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkKq-00000001TBp-24DA;
	Thu, 09 Jul 2026 08:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkKo-00000001T6v-0OWl
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 09 Jul 2026 08:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=; b=E244YXIZ8CvNwdZA2uEzrgd/ev
	MXhGqDHxFfburYUSiz1OmAErzcyG6Ua4ED9cmN5egGMJx9UG2UgSDFFFacJgeMC8yuZ86FKZp+Yzi
	erPmX+FGTTcaCCpvfA7ZXjoUmU3/W9zt7o+uNqsuJF/slwlW00C13qCa8DCoo2j1uVuRSM4c2eaR3
	AzTckJ0gX2W6sFuIaZVHofKfs1i+98haWy9MeoHxR87oG8q7XeIIbdMWzKCN4h1TAH+sY4rY6p/EO
	3ay1FzKQ1d7MfVlDraqIRz9YAL/3vBpvmiud70LyuxTMz1b1222yFHgZ7keeLrKrx4uW623+vNgMa
	zuaCHnMw==;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whkKi-00000008yIK-1GUF
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 08:42:14 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6cf48482ddeso559233137.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 01:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586530; x=1784191330;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=RXu8dLZKnuR5ZIwcQ7UpAb4rY89c/78KzO4zVemt7PY02nA30cUlp7Vmdb3Ee4oJFH
         zdpf0Z4rWObasFzgEmOsQog3E+qktHlcE3XVL7OH8Lw6YpLw7MZe9uG1pEjKz2o0wkzF
         VXlMXj+vYmtzor4MQI6dutU/ziyGlWg48qrAmQvxeBcYJM/2NSRF7uYbY7eq6LsRMDxY
         DTE9269/FQLRUAStjHYU0rplIK6EDmGdWpwQGencyVl8L5nneaMFJ4XVdZ/JlR7ZlBur
         mll54yCCofsvBNQxRtws33ALmUsSPuLA3P/Gbk6da21txjGke0hSCWuzCGq/yIyvvTlD
         srEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE93rmkPxsFHfRDLtMMPcKTLwIRK8I5lanMfgtVT+P3gPaLJSS1QPNRKY0NKj1BLUuXgHnr1DrQGlQbjyHOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyECFB2i5243EdVC33ohF/ncQ3+mkIqYpGEmbF7E4iTxRON0ms5
	tC2eO0ecskK/w/NpLtYGhaLmnQdLmAaYL8iGzrhxvXJxAs21Cr/PolPHajIZ9s+3WHg=
X-Gm-Gg: AfdE7ckY+VTF9DKTv848x8DYyGKkOQY4YQl5UoH1oVOwUSzwg/39u51dt4J50SfyoUM
	L2eQpjr1rDaQzF1HciCFgkoakbqhMwufhlHDFe/8CFU6/J1kKR3yPNXUBUk1ZQxrT9KZbaO8XKR
	l0vaCubj1iDPHUMrwoGPxOC9zIkO58AKlRv/atVugy/Je0mE4lchYezv9eOAotYMNGEQ8KXgXls
	91tb561H8NU9+Agw0dveDfROzaWqKA4Suo8mjtgEp/8ZB36j9pEELiLfRmdZ2tCYwmPWy2xeKSa
	vICD5/RbWEg/CBdrQg8+4L84fifMnnC2j/3TR8Io2+SQA1LaSEn7fPX/wRLK4laMAiVy6JWkQfC
	TshRJA112v/5CPVkERDJgYrAmClljq4mQhrOzsswKlAKjNHv0/CMkaOkAZzDiqjkg29YDNXUSqd
	JurI5hQZ2TlTIzNz3nHfSPFeerk3t/xZ9vTkLrT7T4XruBm27JEw==
X-Received: by 2002:a05:6102:5494:b0:739:478b:5bf2 with SMTP id ada2fe7eead31-744e031a69dmr3997065137.13.1783586530166;
        Thu, 09 Jul 2026 01:42:10 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb2a3sm3203956137.8.2026.07.09.01.42.08
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:42:09 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7389cff36bdso549437137.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZ3XUgzB9kNus6Uddhj/k+Xal4fo3ZegZKvbAPYIp+sEy/wP/74IqQ5BBpgwh7BWTaIAb2C9a1PCkTkPkxWw==@lists.infradead.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_094212_443599_8A406816 
X-CRM114-Status: GOOD (  19.05  )
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

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

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
