Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B213C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA7924656
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U6P+8obx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gVkyh4tP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA7924656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQKPvY0ACiekF7ZsHk+Lrv897pLwmenjOyfr/YEi3Rg=; b=U6P+8obxjElbEr
	1hgI0PUPS7I9h2KbqLdUwlYM26CiRkCr3Li0yKx5UG+6plDBhu+sjJJcxim8mKHViHA3aGX8JY5OL
	3FxBmPnzuytnDLNms4lPb24Tmy9vhQVV6wGGi9c7jSk3unRF2TfnL4qD4g6d0nZm4OxN0yUJuZYc0
	AMf9M2/PEfv5ma2PBuTtdDt1wz12eckwqSxOtql7K4nzw/LSo5ZC0scWvEWmWIhS3QXTJwGp2JSqA
	XXZJU6THIr+pvxKi1G6vPluKpjn6sRez0sPhVbhcJjdvCqEC3PV35s5luWkVNgd3GT4G2mmwq1Lm8
	fX7NaIq9IeMNkREYEiow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irToI-0007Bu-0C; Tue, 14 Jan 2020 21:33:14 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irToF-0007BX-Aw
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 21:33:12 +0000
Received: by mail-lf1-x143.google.com with SMTP id l18so11021267lfc.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 13:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f5uoKw2YKLElJKDx+jK5wl0K2xjBXMt47XAsAkyAM+o=;
 b=gVkyh4tPO8RK11oXNRTkFnFw5qS02VpB8fRn7yuyjXBrIM8r/+uUtu3n5AJSu/v+0r
 3KVUAw32daILdFTdwNmZ41g6fmO4U+5YEKf3aZPOaD0BxhRqx8Hhmkwlmzo36zFaxnqP
 lOdeXPMNVWW1hl8kB5QPM3J99EYMRT9fPNA7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5uoKw2YKLElJKDx+jK5wl0K2xjBXMt47XAsAkyAM+o=;
 b=qwcYVg9zXUG9kUSyoiGaSmO4gmba9Z+gR3+6iVhzI0y6VeOui+bOg7tHwKGcfZmeZ1
 2G3kbJIWZffYrl3RzwXZC4mWH9PI6yKwpAqjUZost+jsxfRIjgQkcB5hZjq0dN0NyTFt
 hQe8fDxjIlDN3EUxRqwyR9Unccze7HS36yuXdHTWs3eLpiU3i28p1V0BqNc49S7uVJFy
 htjScQ2nlV5GFMJ3L+QwWcZhyUEqUV1hyn7ujg/9/dVj6B6Dp7Ad5VD0mX9OqizLya/d
 epCAUVlzGMtA9nyzFNuolCKGBm50Mcxc9Fcwh8ccer7MHHbxzjpmm/59nSnoNZwQTMmA
 aRQQ==
X-Gm-Message-State: APjAAAV1XJh/D4eRPY7+2HWlMH8stIuYKLjVWTCgTCuKSTrYFWORZlgf
 bWRiklNrD3sqEuskt1/KWA8i5b+5IRo=
X-Google-Smtp-Source: APXvYqzCLQ4Sny31B9HSxOhQJ49lJDOx5/oCP6I9nPVs9jyU04QOT9TlPsRUxxBv1mO625bQQRLBaA==
X-Received: by 2002:a19:4bcf:: with SMTP id y198mr2913843lfa.204.1579037588200; 
 Tue, 14 Jan 2020 13:33:08 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id t29sm7805711lfg.84.2020.01.14.13.33.06
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:33:07 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id r19so16098569ljg.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 13:33:06 -0800 (PST)
X-Received: by 2002:a2e:9510:: with SMTP id f16mr15481129ljh.249.1579037586642; 
 Tue, 14 Jan 2020 13:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-2-vgupta@synopsys.com>
In-Reply-To: <20200114200846.29434-2-vgupta@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jan 2020 13:32:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjChjfOaDnGygOJpC36R6mtT7=Xf6wWTzD_wLJm=quu0Q@mail.gmail.com>
Message-ID: <CAHk-=wjChjfOaDnGygOJpC36R6mtT7=Xf6wWTzD_wLJm=quu0Q@mail.gmail.com>
Subject: Re: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_133311_396922_0D6DD7AE 
X-CRM114-Status: GOOD (  10.58  )
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
> There are 2 generic varaints of strncpy_from_user() / strnlen_user()
>  (1). inline version in asm-generic/uaccess.h

I think we should get rid of this entirely. It's just a buggy garbage
implementation that nobody should ever actually use.

It does just about everything wrong that you *can* do, wrong,
including doing the NUL-filling termination of standard strncpy() that
"strncpy_from_user()" doesn't actually do.

So:

 - the asm-generic/uaccess.h __strncpy_from_user() function is just
horribly wrong

 - the generic/uaccess.h version of strncpy_from_user() shouldn't be
an inline function either, since the only thing it can do inline is
the bogus one-byte access check that _barely_ makes security work (you
also need to have a guard page to _actually_ make it work, and I'm not
atr all convinced that people do).

the whole thing is just broken and should be removed from a header file.

>  (2). optimized word-at-a-time version in lib/*

That is - outside of the original x86 strncpy_from_user() - the only
copy of this function that historically gets all the corner cases
right. And even those we've gotten wrong occasionally.

I would suggest that anybody who uses asm-generic/uaccess.h needs to
simply use the generic library version.

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
