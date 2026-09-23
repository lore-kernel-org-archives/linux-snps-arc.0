Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B75C982FA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5s/XokwHTuGJWbGLIFDCvGt2lD9olzKx0rMlZjUQDY=; b=lWpg7ZFcmCnZhO
	QMhH31O/u0pqTDrdNr5lAsUBh+P68liI1dcuTYEUGnF1SaT+V2piTCuVYJXe+nSENOoQBnmaC7S/w
	tGX1opxg+JnLjXHvuSb/O2W/teO9aNqikqkkb5Us1WNi+4tbD5oV0NnIfNrQCOU0E8hkdQwnXHJdX
	crQCSrB+juHDeDZgKY/UyKymp2q3yLN0+H5O8UJ7ZacohxEP/160CFwS4dS+OevGeVnfI6mNihEwk
	JVsnsnoKmGUECj+LX7Q0DybwnrOpJXX73zgQ7fMYhAfgetkm7BusA7MGK7t5d/fQwWIuBX7sDUMW/
	wnhudxlCNHGrldtvwxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KRd-00000007vgk-3tXx;
	Wed, 23 Sep 2026 10:43:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KRc-00000007vgZ-2H1X
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 23 Sep 2026 10:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t1Z4i78iFUVYmXdwkSYq7EkiOAX8N+OcOOj8F5FsldA=; b=NFMeV3+Of5iZT67elSvYgMhEKW
	hZto1IeOa6RI1kcVScvDw4ygK6o52u+c6VeC//Zzw6aTDuN0AbWBnhZwRRJ5qxx4s565lv08v+ZgE
	GSBRLvLlLGOR4gceFN1a/iMOTcuG3wihhei1ltyfjMIMHA4lAb89/RLRP7islPbKi0nSkOdHESOOw
	YX1piipLSxKHcMtYBcv6BN9jtwg5lLLislEaIcWJpV/so5MCdyumbWXP+ucnYEfSzi1FgqGc0F1Bc
	2vsmVad67Fn0BgtsI2F5jGL50fA5pttAHpzD138ym7JhoD5eV3R9V8XAfTYbmsEeEKzGwwU4j3WJ0
	DvpY9/lA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9KRZ-0000000Eeme-0MEo
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 10:43:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6351832so486289f8f.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 23 Sep 2026 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160195; x=1790764995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1Z4i78iFUVYmXdwkSYq7EkiOAX8N+OcOOj8F5FsldA=;
        b=jDaZG2uFG5Im10FtT/2eQudzND6opj8w/CaAqwg1csvTNl8LE1CaSS54cglg3GBuhT
         Jv669/zgeIaQhScYj+NnU7NXrKYsNZ3Q7czRpDnreaO4v0KmisAHsOIi8oPCSdKNlIxL
         x3M0ckdV0jAcNy/xj3ytXNkuyTdp6ZP+WZ+PecpJohmfa8k9KPfzCCT2QT5X3XoHhkRZ
         J6V2vJVre4y+zvQaDSCBjaxKyzKIPOlRZyoZjJ0SUY5ryDm6inyBEwvJ/6QkatfCtbce
         ABEdtpkVDouk3MDLf0a4c3ISCM5vLgFK93fFEp4OODA4sdqgELtKXxRD1N2l6z17Ojcx
         hrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160195; x=1790764995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1Z4i78iFUVYmXdwkSYq7EkiOAX8N+OcOOj8F5FsldA=;
        b=hnu6VS7SHGunuHSSxN7sMJhj2wIBN1p9J0h/BfMezPumhs/DfKv5eUpoTq5m0oGhYF
         aQPgg0ciRBsQSqbMkxTgk3+SF5ry1jA89DEI5tJiKueIbFtR2TPlXyWIkqzJjuqIixwH
         Yi/aJLswiwASoLYkaZjUxJqQKQHselXaiIzcUAYA3amzh5jVtcXo0VXDsxlc34ETltiN
         DhqJ6FG8/7CQHQCmwwZ1dGncYWkzuwJxNev7yTmLfE85D6GMqi4ivV4ApSGI3cJmz/ob
         UI44zakqnAn3ymSXZ9jN3b2j1H6c+ioyDiWz9XML/cWk7vbWbCmhilspnao3Val6v7FF
         qm1A==
X-Forwarded-Encrypted: i=1; AKwUvBwt8gXqYjT6Ov95uQdFWEp0j2fynTykdAacUNBionnGD6RxPm2NIXa5eznt35cd35UKfCtUod4qQ/ZZUUQfpg==@lists.infradead.org
X-Gm-Message-State: AFuF++m2404CqL8sOmZ7t+iIIpNBf1P4dCQGgaRJt0U1x/POc7xgW7cj
	rUcnyGj1hY9UmY3YmbD0qKNYxY1jTzWbIxp4EN8iqU4xU8ybUK75VVO2
X-Gm-Gg: AYBFou129+PIOvLKCkANxZ/dNlG1VcvdUhKscLVkGTxsJ7pJQX8cVt3bqezmRlOfkJF
	rCUzmB4rL+vGEy4kYsJ+tD6ZCu0+2sUNXQHvc+HnzOnfFqQFEz2zSL9UQ+O30oyrxy6vI3LHhkK
	tncgkLxGzqGGkzYrMhI3VO/BybkvVZtt/69JlHDTB055ATBvZKZiDbcwAJOvl8EXPFoq+U1YXj6
	Z5BrJVWX9EbbAlYpAg83ug++USrHRK3b65qdtjivvmHu3usRuADhkyP0xPxsoO9Dr6H47X29ZUN
	9NQOfwnaXiFNIxKuMWeFxzmMopk0mP42otyL1Tid7PQDBPB4Dk3JspnQDj8Cph6Y7J3MxZTSnMh
	zwfOXn3d82CBkH0AF5MxNsEP4hQtytZQTlRVZotDaKGYjrSAwoj/ep6pLjBBHcQdm8RHa1Jsj38
	niLjOq+coVqrv5qyi9Rulva9cbjOqwRfpkcxQdFEUh8zw0SWM4Bnh1DXLQjIMSYTpxO+D6W0aEu
	B21a7nN8UcHMMcqt6D61wmOLxpFI0rb+DiiTuqYoI+32A==
X-Received: by 2002:a5d:64cc:0:b0:487:81c:6de with SMTP id ffacd0b85a97d-48867093ce7mr3896298f8f.34.1790160194918;
        Wed, 23 Sep 2026 03:43:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488687791cdsm5534038f8f.22.2026.09.23.03.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:43:14 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:43:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, linux-arch@vger.kernel.org, "Vineet Gupta"
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, "Russell King"
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "Guo Ren"
 <guoren@kernel.org>, linux-csky@vger.kernel.org, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260923114313.75494970@pumpkin>
In-Reply-To: <20260911192540.20983-2-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_114317_404342_7B75C495 
X-CRM114-Status: GOOD (  19.47  )
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

On Fri, 11 Sep 2026 19:25:34 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> cmpxchg() for the architectures lacking native one-byte atomics.
> The same architectures also lack native two-byte cmpxchg(), where
> such an operation is not supported and either fails to compile via
> BUILD_BUG() or fails to link, because the bad pointer sentinels
> these architectures declare are never defined.
> 
> Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> word with READ_ONCE(), splices the two target bytes through a union
> and loops on cmpxchg() of the full word until the compare succeeds.
> Like cmpxchg_emu_u8() it is fully ordered.
> 
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/Kconfig                |  2 +-
>  arch/arc/Kconfig            |  2 +-
>  arch/arm/Kconfig            |  2 +-
>  arch/csky/Kconfig           |  2 +-
>  arch/sh/Kconfig             |  2 +-
>  arch/xtensa/Kconfig         |  2 +-
>  include/linux/cmpxchg-emu.h |  1 +
>  lib/Makefile                |  2 +-
>  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
>  9 files changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 3bb2e568f5b1..d56064797e09 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1817,7 +1817,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>  	# strict alignment always, even with -falign-functions.
>  	def_bool CC_HAS_MIN_FUNCTION_ALIGNMENT || CC_IS_CLANG
>  
> -config ARCH_NEED_CMPXCHG_1_EMU
> +config ARCH_NEED_CMPXCHG_1_2_EMU

Is it actually worth the churn of changing the name?
Maybe just a comment that say it adds both 1 and 2 byte emulation?

David

>  	bool
>  
...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
