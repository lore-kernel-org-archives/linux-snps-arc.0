Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A8ECC6B38
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2026 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+su5OjfTwEN1XYerXI9NVz+K6jafONljd3yQ2126FPg=; b=Hw3nHDOLUxdKGN
	NX6Fl0GLkTtyuqeVI9KapeAt91XVJOiF686+++4qKMBOws21k2pUAt1Pe7qZTY85ssvFXngauWJU2
	JtDIYBVxh43M0t14IKuoipixfSt7QN7GOf2fnBgnf5E7fuypQckOaKNOxkAkg9ilh776bpa0EhzJU
	51U7P39rdHHBFy+tnIY9AgOqcJTHwA3uNeF+8Jm9R8fCVnRUDoQJs2lNrEsh1VsW4+xBF+ci0lYVW
	HKaGrVywV8Jyp+Z+Y97jyC3F2luTWoKZCN8bxIDeMb6VAfpDu6FqxPSP756Uzkft+MZSS50A+JW7u
	kbdhc2H6MDfg2m84kOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DsO-0000000HDUK-2SPB;
	Thu, 02 Apr 2026 08:58:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DsN-0000000HDU3-1B9K
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 02 Apr 2026 08:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=; b=jfd3rcbb1Layc7/jXfyEGQflnB
	ACQ1z3fjDNjjwW03THjpdEXzhkg52mN7QQqaZNUjgfduqnSNC/UrkacFqJOtwxez7Ab96IhEohYjf
	B0BKH22uXtngd1boXxUwFHH9h3DyV+PasPjdrVfHsc2suIkrGz2QMfPMF7OA/8AuZPZo5/NHfg2aw
	UPaZIxfnxmG2iN+MoM/nW/tocV1PKMc6VPY9+PMT08hP606hQVF2RmD7FmmRQCHMo/8oYrHS4ruv9
	UXSH9qvNwvR038huDLKh7cHPxfEz87UZqJ0U448T0gxVDUQ1Vxfg/oPGw+LAxr1U4K8udSnyZLeB+
	flUYF0zA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ds8-000000024V8-0qVg
	for linux-snps-arc@lists.infradead.org;
	Thu, 02 Apr 2026 08:58:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso5763335e9.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Apr 2026 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775120270; x=1775725070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=;
        b=nc+iquM/NgxY2f2+whZGx2BqnoFNpCCgF4Z9oqFCaxoRX7m4RuafI685+rou8v7EO/
         Eiv7BcmfIjmTGmEQEyrWJsaEK2PDq8eGnR+WV+wOiDc2q4GG6GzeSNYDmSZHJPG7j437
         /+jMZGAWkAFoxAMmLyiK26oATqRqisfBHmPcsSbyn9TU9DX4Iup3IHX/0eJneIhY88Mo
         5sOUGvgQFKbizHjqVa/AKPWHKHwXynKOKR7qunxbSoq04XTrTJQuZ5qqKJLUPphHcxxC
         vDihPiLa8kLX/cNrk7JLwQv1bZPCJzEs/Bicx3NXQaZq2YZv98/ian4PcJ9JKu9Qe2oh
         TYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120270; x=1775725070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=;
        b=p32o/k2tzba6eJwAO01t1E4pWb+CQnsQOnRnbVJZvbz9G5FD/oysWlGU9zuDdzwk9h
         bQL9Jxng57mYU9/nfP2/RhYYj1EspIhuFwQx7NhUWRKf5LKRGRFggsE8RBG1co1Cx643
         h0lQOSAQNnKAgig8+zEPdHm1SFs9C91YM26HZ1FTfi0d86c1i3nwcz5l4NDP/DyI/cZ8
         Qg/zvK7Vmta9k9YX75PiSO3Bf5vCXSbN9StC9WayaLTzJg8jR+pTmwo6y8GP0y7UBVBI
         VNujDSrVJ4Zqfe5r/VHsDOLmsL4/P8PCEtZTI/rxi+QMlaYSINC5vh0XjrAoh45OZNqc
         49RQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0iqqHM2LMvinXUNkRoYchJ0UmEmKsX1dCc1dIXKm9PApe6Gf8Qe6DjzvTVJF6mKY82fxt1YU7Ckqk1e1n2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX7gq0u/oIypVd+rHRFsgFVcXlv+vb6dnBJRxb2WY/NveLUgxz
	DhJn1vspHsQuzwqKVTvgs115yKX8h2yooViTLgO/AC9cP/SdsPXjvSoY
X-Gm-Gg: ATEYQzz1bVhjXBOlLr4DKttk+D1jvLsnPqrILywF6TTRL4Vvh/OYV1yTwtbXyRC2KPp
	8T0RUS4OrpD1V6DfXJ+klVZWtsNb96cuoZYyW+Kju1u9dTW8aXasCMSkUK9Yijs2cFfvQXsn0pt
	4rnsbx3/Paj9BsBEhUlMIDoKRt8dT4JKYsI59DVD9dXeeAWT1cH40GwEuWCD1WbsV0rPzQ8tnza
	qR9lRZZ9uc3vP8dQrrFl5GpaOQIVCuGsIl5xMwFAuIGvh6OVbRMpZXGD7siV5+7Pj1kzndc1yZG
	fPZPErti5Jdm9fLE8cp4QZFEC2DbRCdUQZt0HNfjfz9lx6WGkNs69Qw8LH8Q5NajzXMEV/GWa/7
	UKY55gG2NEtAFfmQIDZQiqo8582ASsmizCl5W22541kQKu2Odwf+HN80kcMP+AP6cfWTtGYn6bs
	wIfBxWJdKHVn1da7FcBpJjcPLefnLEts1sXttq9X19AldAKqYbXheeBq8yyQjH
X-Received: by 2002:a05:600c:630f:b0:487:288:1198 with SMTP id 5b1f17b1804b1-4888359da58mr102555095e9.22.1775120270131;
        Thu, 02 Apr 2026 01:57:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm217845265e9.0.2026.04.02.01.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:57:49 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:57:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <20260402095747.6efbd456@pumpkin>
In-Reply-To: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095758_819675_BEDCE7F0 
X-CRM114-Status: GOOD (  17.11  )
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

On Thu, 02 Apr 2026 14:56:01 +0800
Hangbin Liu <liuhangbin@gmail.com> wrote:

> The old value passed to cmpxchg() is semantically read-only: it is
> only loaded into a register as a comparand and is never written back.
> However, the macro currently assigns it implicitly to a local variable
> of type __typeof__(*(ptr)), which triggers -Werror=discarded-qualifiers
> when old is a const-qualified pointer and ptr points to a non-const type.
> 
> To avoid this, let's add an explicit cast to __typeof__(*(ptr)) for the
> old local variable in the cmpxchg macros. This explicit cast suppresses
> the -Wdiscarded-qualifiers diagnostic.
> 
> The new value is intentionally left without a cast: new will be stored
> into *ptr, so silently accepting a const-qualified new would allow
> callers to store a pointer-to-const into a non-const location without
> any compiler warning.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
...
> 
> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> index ae1b96479d0c..b4b8dac759c4 100644
> --- a/arch/alpha/include/asm/cmpxchg.h
> +++ b/arch/alpha/include/asm/cmpxchg.h
> @@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
>  
>  #define arch_cmpxchg_local(ptr, o, n)					\
>  ({									\
> -	__typeof__(*(ptr)) _o_ = (o);					\
> +	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
>  	__typeof__(*(ptr)) _n_ = (n);					\
>  	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
>  					  (unsigned long)_n_,		\

That looks like it loses the check that 'o' has the same type as '*ptr'.
Maybe this works?
	auto _o_ = 1 ? (o) : *(ptr);

  David


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
