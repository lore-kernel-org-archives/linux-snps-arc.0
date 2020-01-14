Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA82C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5921624656
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nvu88LPj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZuB9kWPA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5921624656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qz9H25UygQXkwyoFqrS3LqqyV5jXHkQC8am3XmDm2/0=; b=nvu88LPj9QnReX
	hT9yygOYCXElz/A93S8ZSRGvWkLI1m+I60FDmSgnMU/7lU+73q/clRADgOdbdywmlxWDEoAVFVSGi
	V87WPmg7zfh0xrWxU15ViIHH/n9MiwntBDu7la/kEFGoMhaa0yLRqlv2dhQV1ztoV62iyesxe7cs5
	4eUvg1jCxzfv+z4iwjaUTKL6af2wlaRjVfaEO+BE+doVm9F9139yp2wZdHXSzymF2msvzVv0c18OM
	Vqtivl5oxNt9aRYaPsrMRSvItRq337tdFij33VxzULpj7LaSFGDrwhFb9+GkNIrSoQFai8aziwupd
	4X4ReYhRUwoYh4Nv7EHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irTdx-0004CK-UI; Tue, 14 Jan 2020 21:22:33 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irTds-0003wE-JT
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 21:22:32 +0000
Received: by mail-lf1-x143.google.com with SMTP id 15so11010958lfr.2
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 13:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sA09QfXfHalAafAysRZFEbl/WyLTN07MU6TFhyXENpY=;
 b=ZuB9kWPAPxoZGiuuomw2iudECT1rt4Q/HncS4ElvHzHC6yUT2oQ0HUnEnUGkTmGfs5
 jSF+DX0BEvuJ4HATwr4M5/u+JM7dyP0AtYM8/eZRZWfxVC069BAzSr0Gdwlw9jjgh6al
 CCB0j1K9REL8bGh8CtUBoa4q17ax6w7GJvMoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sA09QfXfHalAafAysRZFEbl/WyLTN07MU6TFhyXENpY=;
 b=no0zGkt0EnYk2Vw+qxmQOyvnxsby7eC5kFOD7ASfvqQkU99+9tgOLVtDUFloww5Con
 szbkhgP4LxY+cB4Tt9rvbdxk48dB/+lB177L9/oj2FuKg7lglgUjjOygVdSFwMYhmX8l
 yz5xsM+dBbEPmMjW3AJSz3EsNTJPC/efu7vE/4n5arqmXJR7KFvjqWQV7XQaUJte1Vlj
 O775oB0xu3eJz9/QO9NF29/pwoCYf2G42vKeFT6fgVROV/pK/lVyvdOyC9gKE3XcGYWP
 QPjh73zsckI8J9/39pwBGkbCXCYSuXnbW5reAW2Q8G4ndpa6AYq3IkoGSRdPzmgyLyR8
 N+Tw==
X-Gm-Message-State: APjAAAWsIuqq+yQksSzlB4IEy5cxTlX8Q3cgZty/zpwgRUzFeb1JzPmQ
 beV8OR4IuKKqXQDNfc6CyIC3vFq6KsQ=
X-Google-Smtp-Source: APXvYqwIXY/aast4545FXTqi0CiE0VkkiNxz6cXw3fbkLvxROT0bBYMtbCJUGl1H7vkGv/kd0b1qJA==
X-Received: by 2002:a19:ec14:: with SMTP id b20mr2908763lfa.63.1579036945780; 
 Tue, 14 Jan 2020 13:22:25 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id h24sm8126372ljl.80.2020.01.14.13.22.24
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:22:24 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id y4so16046894ljj.9
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 13:22:24 -0800 (PST)
X-Received: by 2002:a2e:800b:: with SMTP id j11mr15632652ljg.126.1579036943823; 
 Tue, 14 Jan 2020 13:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-3-vgupta@synopsys.com>
In-Reply-To: <20200114200846.29434-3-vgupta@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jan 2020 13:22:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgoc5DaF6=WxsAcft_Lp4XUYTiRhhCJGcmM5PwEDXY6Gw@mail.gmail.com>
Message-ID: <CAHk-=wgoc5DaF6=WxsAcft_Lp4XUYTiRhhCJGcmM5PwEDXY6Gw@mail.gmail.com>
Subject: Re: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space
 pointer range check
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_132228_662792_16712563 
X-CRM114-Status: GOOD (  14.37  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 linux-snps-arc@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 12:09 PM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
>
> This came up when switching ARC to word-at-a-time interface and using
> generic/optimized strncpy_from_user
>
> It seems the existing code checks for user buffer/string range multiple
> times and one of tem cn be avoided.

NO!

DO NOT DO THIS.

This is seriously buggy.

>  long strncpy_from_user(char *dst, const char __user *src, long count)
>  {
> -       unsigned long max_addr, src_addr;
> -
>         if (unlikely(count <= 0))
>                 return 0;
>
> -       max_addr = user_addr_max();
> -       src_addr = (unsigned long)untagged_addr(src);
> -       if (likely(src_addr < max_addr)) {
> -               unsigned long max = max_addr - src_addr;
> +       kasan_check_write(dst, count);
> +       check_object_size(dst, count, false);
> +       if (user_access_begin(src, count)) {

You can't do that "user_access_begin(src, count)", because "count" is
the maximum _possible_ length, but it is *NOT* necessarily the actual
length of the string we really get from user space!

Think of this situation:

 - user has a 5-byte string at the end of the address space

 - kernel does a

     n = strncpy_from_user(uaddr, page, PAGE_SIZE)

now your "user_access_begin(src, count)" will _fail_, because "uaddr"
is close to the end of the user address space, and there's not room
for PAGE_SIZE bytes any more.

But "count" isn't actually how many bytes we will access from user
space, it's only the maximum limit on the *target*. IOW, it's about a
kernel buffer size, not about the user access size.

Because we'll only access that 5-byte string, which fits just fine in
the user space, and doing that "user_access_begin(src, count)" gives
the wrong answer.

The fact is, copying a string from user space is *very* different from
copying a fixed number of bytes, and that whole dance with

        max_addr = user_addr_max();

is absolutely required and necessary.

You completely broke string copying.

It is very possible that string copying was horribly broken on ARC
before too - almost nobody ever gets this right, but the generic
routine does.

So the generic routine is not only faster, it is *correct*, and your
change broke it.

Don't touch generic code. If you want to use the generic code, please
do so. But DO NOT TOUCH IT. It is correct, your patch is wrong.

The exact same issue is true in strnlen_user(). Don't break it.

              Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
