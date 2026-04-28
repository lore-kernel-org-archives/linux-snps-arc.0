Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB929FF885D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Apr 2026 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdu16VommGPESVkSYlqE5mJC6JqwZO0q2PeVxJ6rCzQ=; b=nzCy4rJmfwN/sr
	5Nsy2kGy/nNZ7p7M3njpn1MCXBpI6IwCSuX+QKzJ/ZZIg55cNLh9c92tOBWoGNS0dGCLcviY5Z5AR
	iRJjjUL62IWPUuWRQuGetxrXgGoR1yFv6uw+fL1qHqdOMr1GhJowe2dAB9XiXMPBP2fEGMIyZA3A5
	jqkdLQEQ9fE9fJvSsp15e7eWS2ol9DpHCdR0ziLQo0eDpJQOte39ydSJKN0tw91MvSHAcMd4xIQqs
	u1SzMuOGv7lZF33/DD4zKHiyx1simSxSuZUzgd/E4B9r73W5tjiass5jblnYzHHtn05+pzvPcojqq
	s73SPeT3LBSKeYUAZ0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHepB-000000016Bd-2hri;
	Tue, 28 Apr 2026 09:33:49 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHep8-000000016Ai-3Cfh
	for linux-snps-arc@lists.infradead.org;
	Tue, 28 Apr 2026 09:33:47 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso15353778a12.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 28 Apr 2026 02:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368825; x=1777973625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=fB9v5sXHlmlFiY6XOPr3r8WPJsYdiH/l5iyzQcYPuT9M0PsOXag+ZmyFfjkT+zyDph
         M0IRie9cO0aJRiT6Siu9Y4VyVsOQCk3JHthPYLhhR2/Bg1TuIKfvIbPrMgfnaYLdHR9l
         hfPSnsH6tgDl9V/3M8fGQ3pSYF3eg6Cy8eykntjFSA+nIp0ZqQ2YKi8iL4Br912I+LkB
         ukjV3O+0rMAmX2kYe+mgBVSkTDizXV5NkZHoYGJW4z0kiaFNofEoUb7b82plDC1fXIR8
         6pRoTPg51wt2IXcpN6wd284+HpWFpGJxTNI+mKise6YT/CKrKkPE4PKfdSJpTG413TZS
         GSDA==
X-Forwarded-Encrypted: i=1; AFNElJ+cmwnh43oXqpmuWD1K2GvXDVECee71x2EdMuIxiKUinCGze/kT5ROHcqmTIQ0Eh+6gDN4U2Wk+aQLylgktqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGi7VSkohEPMl5amyVDa9L3GZKSuB4uisVW4WdRin+jbIpl5X
	YN7TO1y4UFijoJgLqF1tb9OSES9ZT1gdlCvq5zKeAsSnnIcSObDt2a+9AfdcJ0vE0AA=
X-Gm-Gg: AeBDiesXJJ7aZcdfgM8egUE9MFHuFH4HIusTjYghBrTu/5Ys6AULZk3Jk0sbS5xjMqf
	JUaH3VaSUVW6OGTpNnWwKMNgVB10sRIfi5S/4H+oMX4DwWGnDhgUJXLzgol8xfmGOfUdUeIJSte
	tfv4RPWIEhV9cEr+TMZYFROHqDmHt7/B9GOwlb4fpm8WmFJMA9P/VSCXZwDNcztfoPnwZ2VSB6P
	ia7b20P595jzgLETBe6uorW36ExWc5Icwsl/tyF6/E9pP8+p6fQEFEMyVQZ9XfSYfYr9dq/pU5F
	ZdSMWu+OxebNQSFqegQc2DwAekM65LL/tIouNp6vKTm4CzPzmu/6ih0oEjQPE1fop99GA1mq3O5
	A3xzHTvR+yvWriOR30fV3d9uQ9wdgWH2uKU49TEGjAikr91bRoaZ0ggekyyrvXa/BLoM23hUo/T
	GRxd0QpMD6viokHUFoS4pfKf1CqAZf2DIPRUVw+EKTewxNAoObtM6ZDkaVOmjGBqzyl33rYSU=
X-Received: by 2002:a17:907:971c:b0:b9d:33b5:6ba1 with SMTP id a640c23a62f3a-bb8026bcc46mr162637366b.15.1777368824682;
        Tue, 28 Apr 2026 02:33:44 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808632f40sm74702066b.7.2026.04.28.02.33.44
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:33:44 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso15353757a12.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 28 Apr 2026 02:33:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CUXt8n2EYnQB7XUbf8BN3m53klBUJ3fF2hM4xE5jtMlOmO2hMcch09mLceMrPiEYgAhQfzue/n58dQv+R7g==@lists.infradead.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_023346_809735_3782457F 
X-CRM114-Status: GOOD (  24.41  )
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

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

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
