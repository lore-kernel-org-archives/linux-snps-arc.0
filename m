Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC31C3DA42
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 04:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktKjHtTu2UoPL+cYFaSzoRZ5Ig/84/i4QH02H6KrJD8=; b=F05yyHOaitjuRI
	FfQWr6Hd5hLcTZ8NQFZXLXqJQ42FRXyDk0B7+h6hyBj/iFakuv59d3ljck9kkWAlWq6EYzmNfrS55
	q6jcnJNc6Os1UJKlYspjbn7Fq0C4JiV1z2PdKdBtvpvbfN1gRTOd8cE+d4q/zZnVAmiBni2kD8s4q
	DnwDJOeRs5VHEpzU3faQ49YQwE6BEQ2R2n397+zJgW5j7xlqX+MqGjB02C9Pk09RgQ2H+BItAiYsV
	8sTIufE5vsdDokAGZ2r+rmnTwmJ2rgJjrnCeFZpgHG61NUEbY4TWNcXH84XBVq+RO/jx9tuuNUcDe
	HAyg0bYtOZVmEHKmUMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTvs8-0000000CaKX-3qtB;
	Wed, 17 Jul 2024 04:02:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTvs4-0000000CaJb-3TO5
	for linux-snps-arc@lists.infradead.org;
	Wed, 17 Jul 2024 04:02:30 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-58d24201934so698582a12.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jul 2024 21:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721188946; x=1721793746; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uFdo7pC51nfSgG7miXqI4efeygQzIA690nn8x/a17Zw=;
        b=WROfIP8ywdPuWak4wNJ51xfSz7cj8BMbABJRjuuojarUjA0ZWMD039O9J4kh+dm8D0
         fkqStL4zrQ2lg6JNPrP1vbWIURuDHpyZUzYjaXBPC6A8QyBKDxzPL3YS+LIXrwEXFBNd
         HWlNHOo8Qeg1YzuNL6FJXeg3HdmZ70aw5eoi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721188946; x=1721793746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFdo7pC51nfSgG7miXqI4efeygQzIA690nn8x/a17Zw=;
        b=qQS9CPC6rtK1iPHjETXLIlhA54O2uvQk308TvX/s5n+/KASjpIjJtzcL4ZPPzoOPXa
         xS6Hl+SA4IJ0GR48Nz9VZrcQqCHJ8m35YBzqDcrUi7vFoWjx+DWYPNZ1icXNYr/xnLQ2
         EnSGSyW/1sF6fKcrrIjhja7ghm/XZJJew/vOPbPa2wpJ42++pZk4PlxwYykBPth8WzlB
         OIWZTkNFE0I2A5ZaZBzDnTmibV81ndZR1OTSKa93KbKBSpo8yt/O1xnQSbLie/z+m5pD
         4dqMEnSUdNE7qU69s4lGu9gpApiHG7vjFFle4af1BnuoZoruETw/ItNoIo1zp0R9p54A
         TJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCUpxJi4kRmOijujt66HTnYqG+G529wizlIiEvmKX224tThxr1u+BcL7Nkohu0aAlOaHHPiOv9jOUAAe5SEtc45yO6Wq/STUQ7KrF0Qqp1Re8TR6
X-Gm-Message-State: AOJu0Yxomd6nUQJzM5Ht1nEwlVu8N6XBjPe0i8aqNb5Hhkojco/emHEJ
	EmIvIxLjI5Qr5t8PkmPXEST4aQZXFqMLilYw8bk/Z9Wro0/MKNumwFsBYDzmiIdYb/aZIHuYVRH
	nO6YLVw==
X-Google-Smtp-Source: AGHT+IEtM0A2TG1jGHBXHXQD4VY52oGD3jec3yYx1LS6fRUnAGxSBKovbA6CJmWBBrgi9qxULrRwxg==
X-Received: by 2002:a50:cd02:0:b0:57d:1d9e:d1fe with SMTP id 4fb4d7f45d1cf-59f0b5fd9a6mr3664182a12.9.1721188946472;
        Tue, 16 Jul 2024 21:02:26 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59cfa5dd20esm4433002a12.40.2024.07.16.21.02.22
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 21:02:22 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so689871a12.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jul 2024 21:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIamyfn3NrIrm3/KWaYBKwz9R7RB8OYoC8OeNdR63DlDgb3MY0infgZfRW5FBcLo+cp8B2t2492T3AxdHeOZXcLDPGBmDsd/UzG9b38oPILUDS
X-Received: by 2002:a50:8ad2:0:b0:57d:4409:4f48 with SMTP id
 4fb4d7f45d1cf-59f0c41dfa9mr3193440a12.15.1721188942100; Tue, 16 Jul 2024
 21:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
In-Reply-To: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 21:02:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
Message-ID: <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_210228_902674_6EB664F7 
X-CRM114-Status: GOOD (  22.79  )
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

On Mon, 15 Jul 2024 at 14:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Most of this is part of my ongoing work to clean up the system call
> tables. In this bit, all of the newer architectures are converted to
> use the machine readable syscall.tbl format instead in place of complex
> macros in include/uapi/asm-generic/unistd.h.

I haven't bisected things, but I think this code is seriously and
utterly broken.

When I do a

    make allmodconfig
    make -j199 > ../makes

on my arm64 machine, it keeps rebuilding pretty much the whole thing
every time - whether I have made any changes or not.

The second time it should be basically a no-op. Sure, a fairly slow
no-op, because 'make' will go through the motions and check all the
dependencies etc, but it shouldn't *build* anything.

But that's not at all what I see. It rebuilds pretty much the whole
tree (not quite everything, but at an estimate it rebuilds the
majority of files).

And the first things I see in the build log is

  SYSHDR  arch/arm64/include/generated/uapi/asm/unistd_64.h
  SYSTBL  arch/arm64/include/generated/asm/syscall_table_32.h
  SYSTBL  arch/arm64/include/generated/asm/syscall_table_64.h
  SYSHDR  arch/arm64/include/generated/asm/unistd_32.h
  SYSHDR  arch/arm64/include/generated/asm/unistd_compat_32.h
  HDRINST usr/include/asm/unistd_64.h
  CC      arch/arm64/kernel/asm-offsets.s
  CALL    scripts/checksyscalls.sh
  ...

which is why I'm suspecting your changes without having actually
bisected the build time regression at all.

And yes, I checked - it does update the timestamps of those four
generated files: unistd_compat_32.h, unistd_32.h, syscall_table_64.h,
and syscall_table_32.h

Every time.

So I'm pretty sure it's on you, even if I didn't do the bisection.

This needs fixing, urgently. Because it turns a "small pull" into
always taking 5+ minutes for me. I didn't notice immediately, because
many of my core pulls I _expect_ to rebuild everything, but...

Btw, I don't see the same effect on x86-64, so this is purely an arm64
issue (well, and presumably any other architecture that uses
'syscall-y').

You might want to do a build like this:

    make allmodconfig
    make

twice, and then do

    find . -newer .config -name '*.h'

to find things where the build has generated header files with new
timestamps despite no changes.

There are other bad cases, but the syscall ones seem to be the ones
that cause problems.

I'm adding Masahiro to the participants, because of some of the other
files that *do* show up for me when I do the above thing:

On x86:
  arch/x86/boot/voffset.h
  arch/x86/boot/zoffset.h
  security/apparmor/net_names.h

On arm64 (ignoring the above and the syscall ones):
  include/generated/vdso-offsets.h

That 'find' also shows that the install headers thing does the same to
the ./usr/include/ directories, but the kernel build doesn't care
about those.

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
