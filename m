Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7283C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpcP6T47ZO1kFr23JS7qGoPYNvflsu5HILEd/WYCaSg=; b=cagIxNt2lUwAUH
	UXH7qqKODvYQff8fY3FPJfPTs8TG6px8NmPVxXHKABTCQiegqsikoZBgvrjL7mAOWIanSPkQDMf4Y
	TZ6Coj94qr4mU3HN57zRhFbF3zxUGDkVC1eORrR68NT2h/XvWdFL63qSgcrjWtQLjzeU7gteTpTMD
	CChiO9PhMnf41uQIzXY1BzlJaxvgBlr8vyZDW9dUbCJkdedkkEnoZSXSL6X/5TtemyUaMIM6y94Jr
	uzUayUGXI4ch8+P70WstJYk1RgWXCoDz2kKAiK2I8L+pxT7hnPFFj7DWDuhVcIqKuRIhYbKA8nWGS
	y0EfPllMyPNhdtGf2qVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtYI-00000003E4U-1aJ6;
	Thu, 09 Jul 2026 18:32:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtYG-00000003E37-0GHs
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 18:32:49 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-381ed661712so265057a91.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621967; x=1784226767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/JWBZ9pJgvX+aNnWpGPI681HI0WIvMMNN0M2xj5UX4=;
        b=J0KAxhJDv2kNfjx3GdO2hkLWImCvJe7/0MKAx1JEMoKwzT1Fj9DPP5LH5AEioYSu1r
         Anpyb/cY5+9Hih8yaAS/kr1D/XvuAXzSCdFV4v1pv/VXFJSN3JTN5WQYu3dGHPXgqvlp
         Rb5vqp3fx//SZaCq3/mWQdfgFboZYf6dnt46D50Oija3dLPRVX+h7OF4b2hRtbjnnpaF
         FZU/PdxJSOqJ+bLigblIlKfol0Z2eZB7t9p7ENfJN1jnBzVkyeWgeeJ3EvBHc1EXAYDd
         7JlzjWGZy+rLA77pikm2m1SNm3cy6HMHhhETbfQSCIytwTpn+wQEb3ndY/J24QVblXWM
         hKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621967; x=1784226767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/JWBZ9pJgvX+aNnWpGPI681HI0WIvMMNN0M2xj5UX4=;
        b=ccAQC6r93ZK8Qi7AZOn57XjHSFpfqhSORvvQtk59qXXYjWFyb5D9SsmQIFl4Js7l8n
         Wa4v8LKL9r/Tj9Vb0QIeEqa0/1kKJuHgEVX3NetmdtMhb4jF5wHSXierm1Nq3CTo0Wwf
         tn/2zm6Jdgisl1/O9Wrmh1OsSOARUto9j3wf3FwjemJUQiz+kI68VzZpyWs1G0EfXRpx
         pdGRn331znR8KQeOWLgag9mlpYHkVZKvNNtSsuW6nXaeBf0xfCSvN/Lq72OiH24d/4Zd
         oFoVSkZYgr7J6VkrupSDT9Z0jBJmLnki40N4FQu9+DvZ9yfZ2E6Yg9cFylSWvxV4M0XC
         iG4A==
X-Forwarded-Encrypted: i=1; AHgh+RphaTCMrmmFEsTQ075V/AupZRc4xooyw+rSIY4pIso1ornIlQircbVcbVLZAd7s2tm85QrQbWK+PLxsqSGkhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHqnPZ55X43Kq2wKUB4QvbE4Kk4L5Hz4WePv1YHgjPwMqWzjuG
	6DoCYeakVMmF0Ytc9dXK8FpCk9fldR0XsjlSek0S5lhy8A0cISeHjF1p
X-Gm-Gg: AfdE7ckOcJL5MvigonoAZuAXXUqrUC7PFx7KSTYcM7YViM6RSLsKLi8HzIRSiB3X19/
	s79hQrF6RtazVx1qB5SqTDd+wWAQa/+LmqyG1lhLzHvh8IbmrmW0JxArmuSqaV35XRo5L5NpaDb
	Zjz1OVkZGJBiabaC9PYkx6EyuLBLmi3T/NmRaVX5yUupswRoR4T/iv7D/4zKYs1/2gZwEq5qVsn
	1Awj3ZqkHCNDEoz42/T8U1vmgdeyTCB/hMIpofSpaHp9kw+xzzMyervwovfuDHEi6zShLHVbMBq
	KrvwSsrwV/CySNhHAOoolFdkXChWLbH5nt84YhXS7EXIVoB2sTBZVzCp5ud92mq/VGbkNZwtVLi
	PSQPuaxpLEBGP1sGluKSkztDyz1XSfFZ7OKagmQ2cKPb3YzjEkWGLF0GIGiHwo042iM+zESH3Df
	VzR1kruHP8txuosno5NHRv+4u6amLW5ypvP1ehh5TlYdsX8PRxe3Iw/Wy5BFYbn2+XiC5RibI=
X-Received: by 2002:a05:6a21:3295:b0:3c0:9c18:d5a7 with SMTP id adf61e73a8af0-3c0bd1c4948mr10580989637.68.1783621966489;
        Thu, 09 Jul 2026 11:32:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm55669365c88.14.2026.07.09.11.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:32:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:02:27 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
Message-ID: <ak_pE64J_xnLQBMd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.718191130@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190253.718191130@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_113248_106392_7B590EAF 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, Jul 07, 2026 at 09:05:58PM +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() is invoked before syscall_enter_from_user_mode()
> establishes state. That's wrong because add_random_kstack_offset() calls
> into instrumentable code.
> 
> Move it after syscall_enter_from_user_mode() to ensure that state is
> correctly established.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org

Thanks for fixing this.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

[...]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
