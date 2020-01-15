Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4264C33CB1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 14:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849702075B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 14:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcyDLt1N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="A5NAGbRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849702075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOHEI0CtsdP0nFQ5i/W4K+gpq9CDsoXYqp+XMK9gcQY=; b=RcyDLt1NnbW3lw
	fUYthhUYcS64BFqwWcj5NWAM+WDjwW5ujVkC3S0rCisMLucGva+zSA2eMJ90E2agGjG3iByqgJgqW
	VEZx3sSPeI6xuB2bHhB6cwm2muIh00u7YyFdHNMFl4ay9V96Gwy8ML8GqSzCjTLNsryOoeeGRVWDR
	H7cGN4YrN3sxxT4CoAB+q1rJ9UFADPjb1Xj5Xa2Q3Ct3XzdRtcPSpDG415e44uDfsh4pVaiYkyk2H
	N0w2S1pA9xDHnfxi+I3NXOigJxU9Q3f2UhZnGA80Vhq9Mw6ipUvTKLd9KzT77zikJoau67/+D77dm
	XaY6UDh1lj9hb84V9Ceg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irjss-0006u1-GX; Wed, 15 Jan 2020 14:43:02 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irjsn-0006t7-3h
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 14:43:01 +0000
Received: by mail-pf1-x444.google.com with SMTP id z16so8636927pfk.0
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWbbXGmAF+amAOmxjMEZpC/GvEtoq+2TVa50VkH2QrU=;
 b=A5NAGbRSDK6oVEgbi1g/UJY8xToamkWa1ChpqZgcfz+HPNkDBbbeMOVUU1RWhr/+F1
 jR2kx4AmqjniptQBZtyg0fBMFCwAMJwFwE00luFrhg+HJOF7XhmmgDNZQZVRDSlSmD/K
 ABve+pggCuxi0PmX4dYyfeFnOiSrEXN8MIc3tpcpsv8QmHh36SQZORqYZisn+0F14xR3
 nV2vUgSosV/JYOGVT6ZZlrOI7UOHfH1k6DqW/2LPUnlaTigSDMiNErH10EI7lYSL+3tP
 TE8jGtao4rCXUrLkAnAFZIRSO4xO8toa1xCa/SktIV9lZlDEZyLu0mcZTh+YyB9qybcQ
 /kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWbbXGmAF+amAOmxjMEZpC/GvEtoq+2TVa50VkH2QrU=;
 b=AgBAO6covnKqFUTLe/XfX+pbqo/TNf5Fb0dz3J1xOxgN2eauaO4B2PBpu81jmdmq5A
 LSwgptMcypREFSBCcPtOVzKDR8ZB0ddJBrmnaP57FUhzsmXl/kHsDmZW1wgjjNczlD4q
 GEt++EM+BX69LZr3neKuW2w6tnc13yDi2j4kAx54vmzmi1ztxr4BAvx+75/rRxWJtEAf
 ROZhpOaWNKhNgjbC7y59+wCt70pWz14do9/N/6cAl/k5YbzgM6TMxI+fDUjeu82YdztT
 jXUxDXWGwqwNm/UK+tjVVjpVzfUitk7olcICQrlPc1x6bTbQPKlqxHqZ+xfDWkuNU0Zy
 wQWA==
X-Gm-Message-State: APjAAAVyMlJgulYHlcJXB6G0HiojLJDJcUEyP31aYNJgw6moCzAnENPt
 cthudHmpgkV9z9YDgWdNx1rZ1G97ZSHIRhIAvUCT5w==
X-Google-Smtp-Source: APXvYqxGQlpmxO4Ekyvm76PCInopdWvxlN358Q/A3Iz0w2R2tG3lkmuA+nTaQx/Yffz4j396nOM73CJCA4jiDfyZvFo=
X-Received: by 2002:a63:d906:: with SMTP id r6mr33688825pgg.440.1579099373430; 
 Wed, 15 Jan 2020 06:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-3-vgupta@synopsys.com>
In-Reply-To: <20200114200846.29434-3-vgupta@synopsys.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 15 Jan 2020 15:42:42 +0100
Message-ID: <CAAeHK+zxVw6jOu-NzjR14U_i5cpDynE=OC3D5WswTvqT8o5NhQ@mail.gmail.com>
Subject: Re: [RFC 2/4] lib/strncpy_from_user: Remove redundant user space
 pointer range check
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_064257_150452_E8631F7F 
X-CRM114-Status: GOOD (  23.78  )
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
 LKML <linux-kernel@vger.kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 linux-snps-arc@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 9:08 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> This came up when switching ARC to word-at-a-time interface and using
> generic/optimized strncpy_from_user
>
> It seems the existing code checks for user buffer/string range multiple
> times and one of tem cn be avoided.
>
> There's an open-coded range check which computes @max off of user_addr_max()
> and thus typically way larger than the kernel buffer @count and subsequently
> discarded in do_strncpy_from_user()
>
>         if (max > count)
>                 max = count;
>
> The canonical user_access_begin() => access_ok() follow anyways and even
> with @count it should suffice for an intial range check as is true for
> any copy_{to,from}_user()
>
> And in case actual user space buffer is smaller than kernel dest pointer
> (i.e. @max < @count) the usual string copy, null byte detection would
> abort the process early anyways
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  lib/strncpy_from_user.c | 36 +++++++++++-------------------------
>  lib/strnlen_user.c      | 28 +++++++---------------------
>  2 files changed, 18 insertions(+), 46 deletions(-)
>
> diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
> index dccb95af6003..a1622d71f037 100644
> --- a/lib/strncpy_from_user.c
> +++ b/lib/strncpy_from_user.c
> @@ -21,22 +21,15 @@
>  /*
>   * Do a strncpy, return length of string without final '\0'.
>   * 'count' is the user-supplied count (return 'count' if we
> - * hit it), 'max' is the address space maximum (and we return
> - * -EFAULT if we hit it).
> + * hit it). If access fails, return -EFAULT.
>   */
>  static inline long do_strncpy_from_user(char *dst, const char __user *src,
> -                                       unsigned long count, unsigned long max)
> +                                       unsigned long count)
>  {
>         const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
> +       unsigned long max = count;
>         unsigned long res = 0;
>
> -       /*
> -        * Truncate 'max' to the user-specified limit, so that
> -        * we only have one limit we need to check in the loop
> -        */
> -       if (max > count)
> -               max = count;
> -
>         if (IS_UNALIGNED(src, dst))
>                 goto byte_at_a_time;
>
> @@ -72,7 +65,7 @@ static inline long do_strncpy_from_user(char *dst, const char __user *src,
>          * Uhhuh. We hit 'max'. But was that the user-specified maximum
>          * too? If so, that's ok - we got as much as the user asked for.
>          */
> -       if (res >= count)
> +       if (res == count)
>                 return res;
>
>         /*
> @@ -103,25 +96,18 @@ static inline long do_strncpy_from_user(char *dst, const char __user *src,
>   */
>  long strncpy_from_user(char *dst, const char __user *src, long count)
>  {
> -       unsigned long max_addr, src_addr;
> -
>         if (unlikely(count <= 0))
>                 return 0;
>
> -       max_addr = user_addr_max();
> -       src_addr = (unsigned long)untagged_addr(src);

If you end up changing this code, you need to keep the untagged_addr()
logic, otherwise this breaks arm64 tagged address ABI [1].

[1] https://www.kernel.org/doc/html/latest/arm64/tagged-address-abi.html

> -       if (likely(src_addr < max_addr)) {
> -               unsigned long max = max_addr - src_addr;
> +       kasan_check_write(dst, count);
> +       check_object_size(dst, count, false);
> +       if (user_access_begin(src, count)) {
>                 long retval;
> -
> -               kasan_check_write(dst, count);
> -               check_object_size(dst, count, false);
> -               if (user_access_begin(src, max)) {
> -                       retval = do_strncpy_from_user(dst, src, count, max);
> -                       user_access_end();
> -                       return retval;
> -               }
> +               retval = do_strncpy_from_user(dst, src, count);
> +               user_access_end();
> +               return retval;
>         }
> +
>         return -EFAULT;
>  }
>  EXPORT_SYMBOL(strncpy_from_user);
> diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
> index 6c0005d5dd5c..5ce61f303d6e 100644
> --- a/lib/strnlen_user.c
> +++ b/lib/strnlen_user.c
> @@ -20,19 +20,13 @@
>   * if it fits in a aligned 'long'. The caller needs to check
>   * the return value against "> max".
>   */
> -static inline long do_strnlen_user(const char __user *src, unsigned long count, unsigned long max)
> +static inline long do_strnlen_user(const char __user *src, unsigned long count)
>  {
>         const struct word_at_a_time constants = WORD_AT_A_TIME_CONSTANTS;
>         unsigned long align, res = 0;
> +       unsigned long max = count;
>         unsigned long c;
>
> -       /*
> -        * Truncate 'max' to the user-specified limit, so that
> -        * we only have one limit we need to check in the loop
> -        */
> -       if (max > count)
> -               max = count;
> -
>         /*
>          * Do everything aligned. But that means that we
>          * need to also expand the maximum..
> @@ -64,7 +58,7 @@ static inline long do_strnlen_user(const char __user *src, unsigned long count,
>          * Uhhuh. We hit 'max'. But was that the user-specified maximum
>          * too? If so, return the marker for "too long".
>          */
> -       if (res >= count)
> +       if (res == count)
>                 return count+1;
>
>         /*
> @@ -98,22 +92,14 @@ static inline long do_strnlen_user(const char __user *src, unsigned long count,
>   */
>  long strnlen_user(const char __user *str, long count)
>  {
> -       unsigned long max_addr, src_addr;
> -
>         if (unlikely(count <= 0))
>                 return 0;
>
> -       max_addr = user_addr_max();
> -       src_addr = (unsigned long)untagged_addr(str);
> -       if (likely(src_addr < max_addr)) {
> -               unsigned long max = max_addr - src_addr;
> +       if (user_access_begin(str, count)) {
>                 long retval;
> -
> -               if (user_access_begin(str, max)) {
> -                       retval = do_strnlen_user(str, count, max);
> -                       user_access_end();
> -                       return retval;
> -               }
> +               retval = do_strnlen_user(str, count);
> +               user_access_end();
> +               return retval;
>         }
>         return 0;
>  }
> --
> 2.20.1
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
