Return-Path: <SRS0=9Koe=AH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794F4C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2020 12:02:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F23B2078D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Jun 2020 12:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0raqLHu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDoOD71A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F23B2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=94MfU84MxsCkuNs0AbP7+GQyWBG4AJQjgagk3sFR78o=; b=B0raqLHukC3nsbwmTAvm/bWrI
	WFVe483BBcoOgy5w3a/BrfGNtaLuXoR98z5QmS3W9O+R2H+ZgxToVhb5N5rXqjY3L3gNYdIp6k0UW
	fKJ9gZYelJeR6bsF7gEGFF3PlYiIFWh0zQNdQnjl+O+WlTELmvCQlJH9LtB64ClohHoyfchHygiPf
	GTbL/huBigm8wpHBfTFAG5NCmrGQRGP+VXxpasgTCNzlbY1j6D9KMZnNo7J/O46pEiWbeFdFjdzPF
	ZWA/WvEkbuA7X8j2lgs7eJBTMDU8pcNM79fyoJY0JSoWfEPkSFksVNwVZHOrGTwrF6OVmAOMp1Eox
	5n4KSlu1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jon44-0002Xl-Du; Fri, 26 Jun 2020 12:02:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomUb-0002J1-Ho; Fri, 26 Jun 2020 11:26:05 +0000
Received: by mail-pf1-x444.google.com with SMTP id p11so4510713pff.11;
 Fri, 26 Jun 2020 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CYdo0/N2hPQ38RsTOzG1HX78I9n3NR49FO824e6zLtQ=;
 b=FDoOD71AUBcdqMd1QpOGzqSOfHIfeqUX9WRT2uVYBig3mcL8Etxvpb8vKA19DXCEHk
 hGGyn1qQff5t9NyGd0lso3F1GiQRnyM9Thb1X3Q9nK5u7AM24Qpc5yMKBaX3ULrGDdmI
 aW3HUYFlAs8muNXQr2XbluBC6XcTXX0ykUXQ1EzqTydZoE90RxOfVwphYK6gTw5MJDP9
 mgw88O7NpAvmCyIxt25IifP2Bt29eyhNzOX/15SZvv0sU/nuxlLY/V8fYEtI3N0b3pKT
 gp2NuMwvUxbTosGypDo6A5687Z6EsY8/j4IN6ojCLjAHh/Y+rVlTIkural2QcqlX4Tvf
 Rmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CYdo0/N2hPQ38RsTOzG1HX78I9n3NR49FO824e6zLtQ=;
 b=M7yk1/Izla3yPAqF89GV8Sw7Xcut8ggquY4m+ORy5EQl5zwiQvPzIcCBH94U0zTDWN
 xhceq3esBHx7TcWl9yqoSGBvn+fXT50Tw+Md1O2UyGYte+8xwV2Lz4+vVZsEQ9PAdB2p
 BHoEBrfI3UVFbCMhpIH/CIcVuGyzdJ5/q+Jgc0u8Br/QEOcB2N6yd4lPc6cKAKz3+y6s
 Ke0JkT5CTdH+jUw7fkNWXzKqiwCa6DQT1FoErvRj9HxkeYlP54wV/6ViwUMKMdWx6/09
 UtZ5LqMLeIkW/2Sduyt06CT5E3tH05KzE2PcejE7IzQp1MvTOh/TstPZ/gVrJIDgSfEI
 UzIA==
X-Gm-Message-State: AOAM531HjRXbJmdX6TukIc9H27PpM2HtmDFHmABhhBZWtidwSY0nO2jO
 4Y1PIx0cXcJK87ycCN98R26i570Pajs=
X-Google-Smtp-Source: ABdhPJzJyZJ3I3aIXnZZyRAyJOt5+B79P9o0RtXQJRVeujxKDOJjiVciYAKydYrmNHnRZVpci1OEig==
X-Received: by 2002:a62:8c12:: with SMTP id m18mr36470728pfd.111.1593119872858; 
 Thu, 25 Jun 2020 14:17:52 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id l2sm9885953pjl.34.2020.06.25.14.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 14:17:52 -0700 (PDT)
Date: Fri, 26 Jun 2020 06:17:49 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 17/17] arch: rename copy_thread_tls() back to copy_thread()
Message-ID: <20200625211749.GH1401039@lianli.shorne-pla.net>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, linux-csky@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jun 23, 2020 at 01:43:26AM +0200, Christian Brauner wrote:

> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> index d7010e72450c..19045a3efb8a 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -116,7 +116,7 @@ void release_thread(struct task_struct *dead_task)
>  extern asmlinkage void ret_from_fork(void);
>  
>  /*
> - * copy_thread_tls
> + * copy_thread
>   * @clone_flags: flags
>   * @usp: user stack pointer or fn for kernel thread
>   * @arg: arg to fn for kernel thread; always NULL for userspace thread
> @@ -147,7 +147,7 @@ extern asmlinkage void ret_from_fork(void);
>   */
>  
>  int
> -copy_thread_tls(unsigned long clone_flags, unsigned long usp,
> +copy_thread(unsigned long clone_flags, unsigned long usp,
>  		unsigned long arg, struct task_struct *p, unsigned long tls)
>  {

For the OpenRISC bit.

Acked-by: Stafford Horne <shorne@gmail.com>

Also, I would agree with what Kees mentioned about aligning the parameters.
Sure that would be more work but it would be appreciated.

-Stafford

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
