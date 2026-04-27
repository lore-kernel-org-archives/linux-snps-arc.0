Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10252FF8864
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2026 21:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGe8pXJNlSHItVW/3cxDEofn/A7jaIqYp7MJrCSFEPk=; b=TU3pibDcRX2qY8
	kHFhxXqCf9hh/hhB9hbBDQznAeUujGO9UpLvJfEi1P2uEvHVzNhAgwnmtkQx7zKVOTIoxudzFURVb
	arYXvAll7wPbUTK7jv8qzvWMM7jHECtUNAFM5YQndBcKW4YIsszAfbyf3NZfsPfkV2fq4ACaPr//+
	CaUOItOU33rvDuGiivIbPI6Fjq95lUkPDuCRkmNQi5xbW75neaGCNEytSeF+tEtyK1Q6x08JV/mXn
	qCgE+KAhfOg1itNfvRdmliaXFY72CSByLPitmxbAt3kwXT21U6r+J497zFdyBE68qeRT7LjTTDqgL
	DlnVRFqUKs8BOif0uUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTzE-00000000Es9-3KEe;
	Mon, 27 Apr 2026 21:59:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTzB-00000000Er7-3oVI
	for linux-snps-arc@lists.infradead.org;
	Mon, 27 Apr 2026 21:59:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso1582033466b.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 27 Apr 2026 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777327164; x=1777931964; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=CCbN7kZ31NCdM5fY3tD5Vwwxyi1I5ugwGmrDJXpkrZViR1r5t94G7XB4Ik7r03FDnT
         ebXu06w8qJoj2LBsn7I2jGS3LIZ8aDGN6Oq3YAFsyeA7XGleHqllb3HaRnVQlBlTmcaW
         tDDGV6fUl34dirmMY3AjcYGTd+AjhUbSpHZU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327164; x=1777931964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=IqxhD81fjtO21rK7JTg+eCsBMAAP0l/UpqoaqEHPMYTATQqjnH2zUa9tW0AitBH63S
         e67LSEp3uckYoOiLbc2I1cawRDeJMAexmQiWYnZgITWC63Fdq4GfWuxtpNyjDUHX7OJV
         S8ZKhK2GyuvvLHvwMkuir/JIrgH9BkHh0fXhSBkp6c7a3E1QGlHMLgiWFiko4mt+qNIK
         AQjrYVPqrzpd4H63pDgtmxootHwCnNOweCpSBheiN7Aafpb1BOEOWIEfkEGeGmNPR8rW
         5DTfdUUDdKFUnJFq2JNH4aIfstD+PqoNqC9BMmWfKrA8RNh5EnksOJoB6di6F5mmQJOJ
         /KDw==
X-Forwarded-Encrypted: i=1; AFNElJ/zYPhUKoaFLZnUVUANbGfM+IBYa61j7ZnW5187ldlYOFcsTxfXgYrcm9axvJVsiJNd4qA7LCGmUyy9VlJi2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqYY33XHpyMMIVKVa8kArsaSaM9vFJV/ft0SkQPI66jgBk/yi0
	josHzSBXmxtkdBxNVwOMShTv5wwMjlkfyoWJpdE08BVtePwBTb0ll8km4c99+C1zDAnkcmxnN7n
	od1xMq1Fxng==
X-Gm-Gg: AeBDietKTYKICfAvfjMD/iYU2zaYlNX1/9E4ZPERexhv7XSfswGjOm/ALstiRIRUnXe
	aKp8l0/crxj1PkuUVWCLi6acfifPEb7Tv5bEuLu7T/zqyro+PBG+hGUDIcbyxkNvsUYoFTj4Z9h
	uKugRU/82L7GImSPlCce1erZJyWHePzydP2rx4dPtBM8pQlKaKV5IFCcxR/7AuBfAe8d6yizV4y
	6eXJ0hwlo8vZy9m4zTv83ChhxeNt0ESU1TBGrDhC27ygoASyQa2N1+UZXs1pv9tiZQzJM3VrpYN
	lpTOtgrVChmHITu0kSR5BwSzzBSTksM74FVu6C9rB9eZx323PhKheL+KKtfkHxUMcSlGtEmeyoP
	oXMr9vLmXSZisjtr0rpb9U67ugupIMTNy2mAVuJxwSrdrlgoMhFqaBgMeSiiQFbOJEseOT5/SE1
	sgnkjUL/LwJHVlzEv45yPD8thMYdyr+SZxJJXVitT+Xk6dwotYoKMuHMhI+v5qhcd7pVgzQ+ys3
	7DQQnj8HvMFcaB6E4n2cQ==
X-Received: by 2002:a17:906:7306:b0:b98:2462:959d with SMTP id a640c23a62f3a-bb803778b89mr27537566b.31.1777327163930;
        Mon, 27 Apr 2026 14:59:23 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80853e9e0sm11743766b.4.2026.04.27.14.59.23
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:59:23 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10760810a12.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 27 Apr 2026 14:59:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fIIJ+bgslz532TyRq/+k2fIPjTARltJpgf/JFSzPJPyxvVk7NWe+Zk9kl7K3KEHPE13PKVn6Nr7Bkaffm0w==@lists.infradead.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
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
X-CRM114-CacheID: sfid-20260427_145925_960178_8FA9ED06 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
