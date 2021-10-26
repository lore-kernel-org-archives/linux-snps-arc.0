Return-Path: <SRS0=e49i=PO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA453C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Oct 2021 12:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90EBD60EC0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Oct 2021 12:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90EBD60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3QiD6/noIcXdRF5UjkSgt7QRVbLFyNoIJvlgUcctq0=; b=YpIAj6JE1/GQRx
	w5YjlXmRi7iCUldYX2AppfEj7XhSRxKS6XUFNrs60ObM4wc7iwIfH516oClvIkWYtXELOx6hR/AMO
	cunbaDJC2Vn07OxlUcCor4occn2hMzLRQ4LUe/qj76pMOHiOT47P6URMw+4XrB9QmT5UiUWZIbr/k
	iZZcfNHb8882TGkpvFZI43BjSjIRZwewdERht4LYL31EqxjNRWS3Jwva7kWWglQsFfMevAuLN3PxM
	1bSYSBWwAyHxdVzq4px26XXtwrOd6Miy0kqJRZcoS+tkd9f1G4ldYg7URjC0AnlNN/WRjDmUBka3h
	hMVTKR23gyZHCfYTcpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfLbJ-001n90-2Q; Tue, 26 Oct 2021 12:30:45 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfLbG-001n8A-H3; Tue, 26 Oct 2021 12:30:43 +0000
Received: by mail-ed1-x535.google.com with SMTP id u13so13500437edy.10;
 Tue, 26 Oct 2021 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpU1v1dCuk7vKXavVtDbZayvAGEHB3SBMD5EXFZtZ6k=;
 b=fe46ol5lw3cD3afFUi2Umx428YjXhXauuaDDsblgAAw+0aRcBFpXqFGN8XMdJKeeuo
 KHF9cj6Pkok3CbwZzy/6edsBY5G++LMIOvs73daqx1UiQh/VmFsm1OPd0G/H5Kv0yyAd
 AxF+97+un7EqZWPCTtNfS0D0kzAGJCZhfx8iGyp2e3PT4xtlKSSe3zLjWghPNm1/O7Zh
 QlzuaVqJTGHF7A0Pn4aUiRsQNjFUNwQ/EzbMXEQLbzLDzL6Kqm0yhDtWgb7BGwOMU2PM
 pftDvA69DC+Q15tP5ZMlCilyigE8oGVblNNTzs3ZOk7IHqQMZE5GAx5RJsIIHOTnBQSM
 ZUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpU1v1dCuk7vKXavVtDbZayvAGEHB3SBMD5EXFZtZ6k=;
 b=BPjUVCKsCzssmeRmWdVXa3j/+LuNRqECVV9pFP9gAksRHy1M2izwzcvKiO3yvH8j/A
 41eaczCab6UUxdhcNqm4mpZJ9yJSTkzpVBikPkug9UKtZcYVYTRv9DPh2CiM1GgyRVIW
 zPRu1LiCA2Fbz5sbotpSBJgahh0ROLMqun5s+mmA5NculZV2DF6sGXAA4P6O1/p6phkD
 VXCOAZs8rgM6oSFGyVYVW0EdjMwZRbw53Z21Gvo1PAH7k2/c5/8mA/rWyEz/M8zmcOPM
 HUTBinaWVP2UyEKa805jUHJeCaf/leJEJuD43Y/ay0NQpN+j3mIIOtvxQJjET/SLmFKR
 XUBg==
X-Gm-Message-State: AOAM530zO96kxfPrDG9bK27EwD8jTVCA6QnqYAbzgCgzXf//AAHuYCnn
 +qIo0CG0n9yH9edeuByXlgneNXHbndR9OeicX4Q=
X-Google-Smtp-Source: ABdhPJw0HwSHJV1o+S4gqxwSQ2Ruk381U5XPFNCv7XzCLwUlUVolOdGkUhptgIdDY6mQTWN+g8ZKQaN/RBZ1IjUziGY=
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr4402850edd.294.1635251437780; 
 Tue, 26 Oct 2021 05:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211026100432.1730393-1-arnd@kernel.org>
 <20211026100432.1730393-2-arnd@kernel.org>
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 26 Oct 2021 05:30:26 -0700
Message-ID: <CAMo8BfLN0Q+_K2fP9KVBPyqAMahtCSZB1MwLBRtQYcK3R35N7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Chris Zankel <chris@zankel.net>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-snps-arc@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 linux-riscv@lists.infradead.org, linux-s390 <linux-s390@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, 
 linux-um@lists.infradead.org, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_053042_589599_41E7B1B1 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Oct 26, 2021 at 3:06 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/Kconfig              |  1 -
>  arch/arm/Kconfig              |  1 -
>  arch/arm64/Kconfig            |  1 -
>  arch/csky/Kconfig             |  1 -
>  arch/m68k/Kconfig             |  1 -
>  arch/riscv/Kconfig            |  1 -
>  arch/s390/Kconfig             |  1 -
>  arch/sh/Kconfig               |  1 -
>  arch/um/Kconfig               |  1 -
>  arch/um/kernel/skas/uaccess.c |  1 -
>  arch/xtensa/Kconfig           |  1 -
>  init/Kconfig                  |  8 --------
>  kernel/futex/core.c           | 35 -----------------------------------
>  kernel/futex/futex.h          |  6 ------
>  kernel/futex/syscalls.c       | 22 ----------------------
>  15 files changed, 82 deletions(-)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
