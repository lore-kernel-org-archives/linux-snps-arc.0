Return-Path: <SRS0=IRdM=JJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D53C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 07:44:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61570600CD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Apr 2021 07:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61570600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C0aNTv52TwUdl703gncQ6md8LDhp8iqMAziJI6q0gIM=; b=eO4GZKnm1nSJJcVg9+3jm8W7x
	IhYz+nXNeet+Mx8mXcFOtH8W4dNYmVIQbDLgRwBYS8G3yGaOSl119vCll8H/0WLV9zapvbdbu1v9h
	pO7MhxevGgInUfd5pGJD/Qj1EjpI+LZfiscixpxz9L8nVVVm3jSpaFr8VJDfTzqFSvh5sMAlRWv4o
	9UzdCLTaveE16QKF9HT/FmvNJtD+RtrLTHmC7Gx5u1ZrqfwqnMeYdwIHN3sq1XIBfMGYHp54S+ruh
	agvoNcPTWgEZ0N2hem8aOBkUF+7K2H848vgI5cruUIImwBme753JkPEr+EHI5GXqgf3ulwBnAqCyq
	uwndV3A/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrFX-0060ne-Kg; Mon, 12 Apr 2021 07:44:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrFW-0060nX-55
 for linux-snps-arc@desiato.infradead.org; Mon, 12 Apr 2021 07:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JXZ2evZ1HlMgd5dQiMnzV28T68ypmIxoPU4uM5YLJDY=; b=AP3kUKWOI2Nshxph2zql4GjTTy
 rqa/LrhmezzQY0WEXEsQL1zwR8IJdvd810lBwlQmZCS9o5/e9CyuF00R3RCuf0QshzY2oRijKzE81
 ldj6NvFzMZjuixZz0NKrD1rZUF/LmuxZUAnryebI5vo1jIJMGTDkC3DcON6iZzotjOANwD03WMfPs
 ytrZDS+CuoU2d0rDJOsXeBFhJOqfq9Bx1a6YepiBGqXs7slSmEEfgCakgZHP2aQ6JEkPTgI/aNZCm
 u397mBI/+guVjewkuRR07Qx8naS9dGSU0dW8q9LKzqTOxEnz/NFxwF7wKFkDJBv5hesNxt3tWqyOC
 xS2eDbYw==;
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrFT-005w8n-44
 for linux-snps-arc@lists.infradead.org; Mon, 12 Apr 2021 07:44:44 +0000
Received: by mail-ua1-f48.google.com with SMTP id a12so169786uak.6
 for <linux-snps-arc@lists.infradead.org>; Mon, 12 Apr 2021 00:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JXZ2evZ1HlMgd5dQiMnzV28T68ypmIxoPU4uM5YLJDY=;
 b=eAXrnvozXIaC18/NIw5WAGEm6UXGjUu4EcQ/bvXkOa5a5j9QRl6YDMXEKdsy3LRsde
 Krh5Z0/NdZGJrPm3kXY8bJ0I0mUA06jH4wwt7uh/6PUc91k7I5KshpIUY7QXOj3cqZ+8
 GUOl4XIKfEyrvxyuLXDnDO1Yefo6WugFkil6iuMSZDZ1souoaHq3y00wC+VxhST2PhED
 2bWgSlvaG3pxoi3qJkzqaOyaSYxB5LD1zP5c0JflVMVGhqlxd0QZWqIIELeOShFhbuFc
 Xa9uCPXKC4qDMb0EMh5s1zXfEMIqEs8jDYuknKYAdNfphCsNENj9LXIKf2kd6DIGmuwk
 6JtQ==
X-Gm-Message-State: AOAM530UcOggNLT90mEUD+/F76UWNumJak6XkKMAhlwYkGy+kKYlvRtc
 j9/LZOnsUAHEjCuJgz+Zzn2obmTrMkXcn2mmsvI=
X-Google-Smtp-Source: ABdhPJx+WwlU+f/sxyzlKoozSp4V5pjbJlg2tOYyn632dPGmXpWO0oMiT+z+uxKe9nNXFSbUevs6IBKhAohcjgM8HOo=
X-Received: by 2002:a9f:262c:: with SMTP id 41mr8642842uag.4.1618213481107;
 Mon, 12 Apr 2021 00:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210411135532.219797-1-masahiroy@kernel.org>
In-Reply-To: <20210411135532.219797-1-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Apr 2021 09:44:29 +0200
Message-ID: <CAMuHMdUtqSv6PUfLtuGoBSgqqM4CkwSkT3nKstXRKN1tuXrQ_g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use ?= to assign CROSS_COMPILE by arch-Makefile
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Helge Deller <deller@gmx.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Rich Felker <dalias@libc.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_004443_179474_8E2C0B21 
X-CRM114-Status: GOOD (  21.73  )
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

Hi Yamada-san,

On Sun, Apr 11, 2021 at 3:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
> when CROSS_COMPILE is undefined.
>
> This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
> conditional.
>
> This slightly changes the behavior; the arch-Makefile previously
> overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
> via an environment variable as in 'export CROSS_COMPILE='.
>
> With this commit, arch-Makefle will respect the user's environment
> set-up, which seems to be a more correct behavior.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for your patch!

> ---
>
>  arch/arc/Makefile    | 4 +---
>  arch/h8300/Makefile  | 4 +---
>  arch/m68k/Makefile   | 4 +---
>  arch/mips/Makefile   | 4 +---
>  arch/parisc/Makefile | 6 ++----
>  arch/sh/Makefile     | 4 +---

What about arch/xtensa/Makefile?

> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -17,10 +17,8 @@
>  KBUILD_DEFCONFIG := multi_defconfig
>
>  ifneq ($(SUBARCH),$(ARCH))
> -       ifeq ($(CROSS_COMPILE),)
> -               CROSS_COMPILE := $(call cc-cross-prefix, \
> +       CROSS_COMPILE ?= $(call cc-cross-prefix, \
>                         m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
> -       endif
>  endif

This does not seem to work as expected: my standard build scripts
(using "make ARCH=m68k") no longer pick up the cross-compiler,
but fall back to the native compiler, thus breaking the build.

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
