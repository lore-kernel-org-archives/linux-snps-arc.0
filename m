Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48629C43458
	for <linux-snps-arc@archiver.kernel.org>; Sat, 11 Jul 2026 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pr1K/qtPh0S20S2JUTbk8T98F8Uzx2/yvnYsMGEOhB8=; b=MJVhOaIL3Wj6w6
	yzogM4H13rpQaIcMOu1QrMT7M6wC2MdHW0+srAV9RWjmDE6Ibwhc8pW9NisbAbAMC75HBLUbC+zWZ
	SZF4b9aCLguHOq5JmdmYQsAWf9MV+LTXX42TsVhyile0Tg9fv4BUiatpNc2GOuWY+GfkB1R5khM87
	UILXkJuou9DRIe2ec+K9xXQYPDIGPT9cO6SWQsIuT5D2tnRuOHPIkHRbFLx+yuGTxLDOpd6VCEEs5
	GPherHQM+/eHUOZP7eZ6ng/JTyoG4Gorn8E1ylwmwPQt5BZv8xxgYIEPMWmAf+BC4h9tGqHP3cQaK
	eGb5NKmPX141rOQ40pLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWpk-00000006XCR-3yry;
	Sat, 11 Jul 2026 12:29:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWpi-00000006XBC-2M9F
	for linux-snps-arc@lists.infradead.org;
	Sat, 11 Jul 2026 12:29:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso1793267a12.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 11 Jul 2026 05:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772964; cv=none;
        d=google.com; s=arc-20260327;
        b=b+3s+Fw7QSXsPRi7/GzAfUIo0p4rqMlbbYGG+e9sgBzCcpU3QRgjiREfWBKdRAfakd
         Zga+VR+HHSiflpfjpWtRf2as07by+HTqtrTRqqPm1lBoA5TgnvDMbJflM893YpHU0eNF
         VdnlUYuGaVZGfybAp7LylTJIZVsXMWqQZZG3c9QBH4tqorjxOGl2sqkoiDjDXsnGPOzZ
         RvTUUVSbIViU3fnV6oJTgvRr3+e2ovAb5Bypa06RGU5GGKIU7kEeEBMtZv/tXa7iPvqV
         PnoGERf+sO6T0AybhlrsYqp39AZERnimKVibQ4opyxpthCcrR+A0EP7/nVF+cQOwfslu
         6/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        fh=OqzK/RbPRQ4boEvf/gZ4BEVuATZ7zaPd8gRJTuCX6JI=;
        b=pI5LrIV24tdg8cE6Nk19XVlh4eRzUcji5G2oe/AN0uDE6ZYCXi0wNAqbEasL/Lnbna
         GfubQoWVHL/4WL31rbKTOEnezq4LNV2/y8+fC3sVHOV1IdisdN29D+rMWgTdTPJy8vEh
         Uw4I5mZLJov1XOl+q9m0/kCvuDq4UqINlivJ61DQN7SLm/hTeVzaKIYCy5NIkRrnPHOR
         RHRjRoFDzIII6wnDEJpezEhiaszlCN9f4/5gFfba3G/X37HvR37J3rByAj9TJQuDZ9Bu
         2h3DxPWEmqtdjcNwXASoqHsaYd3woB8YmehuoFhz6cjvscnO2np7ehkzpxINF5ThgySs
         mhnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772964; x=1784377764; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=AEPV4U7oDhfoNmqPDLaJ5QJXi/cv5i1t9ID+/SIMQcOTMF855h0YJxeIClVcO8nsxU
         /QHXNkyvYDFV9l9RfKYAv27CiZkFIhxggU4ZZ7em2xpr/rQMXmPbiGmKE0RiRswiq2en
         r1geol2s09atm+oDNqTF6Q867dOKKrsIfc1uNwZkJ2KXqTUVPbIKR/0YYRauvd/x50qj
         du+9HvPAU8TAwFLofxhJsiR5yT2kUBK/M6Zw3ksqFF3R2KB6SEgskVOEdZbT752LCQmX
         k1iHJ5ok59FaSc3Ka0tBupMMcM1rSw+2KcNHmwiaPfY4B8N+SQF6lFVqIbbpZrAqoNZM
         f0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772964; x=1784377764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=gBCKKdsD5M0+kPwbcckz1cVKZn2PFQwiWdnXUcVOI4JhUDSD4QkovYFxoY9eg7u7/K
         uI6uLtf25Qe4cQ/Csm1WLbvsMRUWHBSeENsoXzNJNQnMZaxNCO6uutqOo12cyd3LtkBB
         m7IP7aX/5c+HcIzzftcvs4ro6cXybVCvhLaSRe6mu0/ADPhV7GGZDpR83L9HVArEmH1k
         QpF9nAR4uJzHm5l9AROi3qBc2Sh/bHZDuj3sN5oOVUCOOHK7HIHv68UudQJ7cWsvYmne
         Q7mowN6tTmiCUQqPWF/ZT4SUpy+N6CsOQQae7TGRkIMGkcCc+DZIxNsMNlJcBF8JhnLD
         0inw==
X-Forwarded-Encrypted: i=1; AHgh+RpilzJmk/hwua1xExeKZUXa+VMO3xYU+c2YTSNhFTanGGayDjNJkvNuYMMY4qhl6zD+8iyWdFZOzsGqiN/+Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP2e6NexWL3fZ7cWHfPxni2/G7yxN6wEnhIKAYLjPl3L07S89E
	kMispWtOsqynTHwmQN6cfOXu36fGLGZob+y2g2/PqpdLIjQRkb3ormrjb4FdnhOdmNS02JbJAf4
	GXPgTa9BUr3DOLQmOgAm1+mS9KeHszil30gOf08s=
X-Gm-Gg: AfdE7clMZFx83gQDoiPyXrI+VgRmPp0A711hA76CrnlGBcMpa05y65pKjAkJ+xi4KD/
	Ve+5Tskw0ZpJ5/HwZL1N37Zdaxsbp5i1p5frLJwEc5XeYErjGA67BuUDpqfWsk2sedWfmXVh8CP
	9Ai4EtSZcWPQBgKqTu4kpZFbtrUqilmLe/sJRB8zdMWlYI6drcXXb6eIw6fcTPbI1bjU7Nia39a
	Bhw+yW3/IDpti8NenbzArIWOSrMfOX+mT56dLP1H9WrQsZG7INiHNst0uF+NeS96w3KLv+pZxAg
	a2zf33Wr21aegOe7BIZLZkkisV5XxK0k7U94cjwFJSraurv/DLxaDmUYLEgXVnw=
X-Received: by 2002:a05:6402:3512:b0:699:728e:48b9 with SMTP id
 4fb4d7f45d1cf-69c5edb9cb3mr1210325a12.0.1783772963919; Sat, 11 Jul 2026
 05:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 11 Jul 2026 14:29:12 +0200
X-Gm-Features: AUfX_mzOlRB8ana7x7qPQc4frMU9J060tNH0Z2GPCNvL1LYqDKQBjM-XzHbrvno
Message-ID: <CA+=Fv5RpgQ-UeGAT+VcLufte2gAp0H=J5GqZEFR_SuQsmnzy=A@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_052926_621374_DCF29444 
X-CRM114-Status: GOOD (  18.41  )
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

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>


Hi Thomas,

Thanks for the series.

I have an Alpha GENERIC_ENTRY series posted and planned for the next
merge window:

https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/T/#t

Only its final patch intersects with this work.

That patch removes Alpha's architecture-specific syscall_trace_enter()
and syscall_trace_leave() implementations, so the Alpha changes in
patches 11 and 12 will disappear once the GENERIC_ENTRY conversion is
applied.

It also currently uses syscall_enter_from_user_mode(), so I will need to
rebase it onto the new entry interface introduced by this series. I
expect the integration to be confined to the final GENERIC_ENTRY patch.

The Alpha-specific changes in patches 11 and 12 look correct to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
