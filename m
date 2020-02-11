Return-Path: <SRS0=yyJz=37=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2D4C35242
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Feb 2020 21:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 461BF206D6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Feb 2020 21:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIP6i9rM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3JWv6oQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 461BF206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aEjPy3P+Eb7pCSITB9oxhrenYZkOxgr+RSFoLA+cnY=; b=LIP6i9rMXx9RyK
	GJZeEVpYN3YhenQGdjO+akR6BwQUAOZzrTsL/HD9Dj834EfpYJfIrQ4Mtgq6rp4+WL+JQ9RSclNW2
	scVECC8VJp5IUAK6luSzcgFSfzBGtVTnZ/0S2C2JuY9bDlagCxqJVBw/4nomk93V8m7qZn14X0O2o
	H/ugfcF6sg0M2xBte/RlvfG/sk/RnxnsawA+gc/OdFcjlnLEB4SrZHZqNNwRHu7OKtKlJpHNAspVG
	9Npb7/SMAOrcqfs6xpz2CmQ42mp8yFzc8c+Uy7rExm75yQWEayZtxKgaRe6Xwz2RmJN0I0pcCSoCw
	Y2tCW84nscDL+RvcJyNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1dEB-0006QQ-W7; Tue, 11 Feb 2020 21:37:55 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1dE9-0006Q2-8Y
 for linux-snps-arc@lists.infradead.org; Tue, 11 Feb 2020 21:37:54 +0000
Received: by mail-lf1-x141.google.com with SMTP id r14so8120930lfm.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 11 Feb 2020 13:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhirSqpc7fjy6rk6aRlSXmKPgpA3tJGcFi7UzMPCu40=;
 b=l3JWv6oQPgIw59P6ldGwK3eZKuWIrg6Rdt/I6OqZNUYO/7MUtpMUzF1vZwbcH1l0RG
 GoUdwXTXFFWqQplTYiI6mRJToVjlON5ELVZAf+QvRjzUKIm0iY8RRNACFKQPOyatbcab
 CsrHOvvZgyleqpEGRT7KoqYu+VjV64dYvT6NjW5oPCxzqQqyKcSs/k831OX/b0bl1Qu4
 R93HCnXgO9vD5Y8Va5iSfBBoRbPyTGcySE+CzE+NBCERLNvKpY185UnH6e/Om+zagQkq
 bjG3Uq3/9RLlg0jta3XWpRMVSypg7W4EYL9R4CCHqzChw4vtswlbBefyvg1pxbJYPQly
 4QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhirSqpc7fjy6rk6aRlSXmKPgpA3tJGcFi7UzMPCu40=;
 b=H/+LJzvjJckvlCmDgcN3dh1YFTCGAdaKeczvnkWSSyE8NRchDtfVBOsqYIIrZm8pb1
 /8ZLKB66p8Fd8UAxcyKMj9ZvHFTfa8STDifK9m/xF29Dgxm7np140Ko8t5mquHr8vxFM
 VnaeVq4oIpEi5NhrPVC9+SHNbsP2E9IhIheKi0b4fT3dMWaF9/rkOxvUImwbUvOIDzVE
 rwPSmGX3B8E5GGLj+B8/zwtLwxkZ9m/KqVhfhcV6xCh71ph5f5SIJDD3CRLJ2jJaaQc+
 Jv6XrpdOwf2r8nb64R6bKiBT4wH4j7uzOkoQoeVKVACwiJ7t+Y7H+yCsjqPOKbtZr7jV
 I4RQ==
X-Gm-Message-State: APjAAAUBcvyGyMmUIVRbQaZwqnYPnvwXk8ccENlFMfxjKkCv3iWljg++
 uuU+z44bVA2RvD2YqK8M5JtuwI+4E5m4ddWiKn4SzVp5
X-Google-Smtp-Source: APXvYqziLj5OE4vNXnRYPxAv2qlJq+DFWnI+y8/tV2xSiDzYriekG4TC0gvN+rHROCMd7C5vALLgjLABKZuGW+LtidA=
X-Received: by 2002:a19:5057:: with SMTP id z23mr4781678lfj.132.1581457066927; 
 Tue, 11 Feb 2020 13:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20200210174325.6566-1-alistair.francis@wdc.com>
 <20200210174325.6566-5-alistair.francis@wdc.com>
 <9b03cfdb-b8b2-a8f6-329f-5fbd38cd9ed8@gmail.com>
In-Reply-To: <9b03cfdb-b8b2-a8f6-329f-5fbd38cd9ed8@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Feb 2020 13:30:32 -0800
Message-ID: <CAKmqyKP3KFwN7Yprxh4ya7PP=nu9-dJU9iOjGOAb27L9Cnuhbw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] linux: Use long time_t __getitimer/__setitimer
To: Vineet Gupta <vineetg76@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_133753_302784_F8963F5F 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2020 at 12:02 PM Vineet Gupta <vineetg76@gmail.com> wrote:
>
> Hi Alistair,
>
> On 2/10/20 9:43 AM, Alistair Francis wrote:
> > The Linux kernel expects itimerval to use a 32-bit time_t, even on archs
> > with a 64-bit time_t (like RV32). To address this let's convert
> > itimerval to/from 32-bit and 64-bit to ensure the kernel always gets
> > a 32-bit time_t.
> >
> > While we are converting these functions let's also convert them to be
> > the y2038 safe versions. This means there is a *64 function that is
> > called by a backwards compatible wrapper.
> > ---
>
> > +
> > +int
> > +__setitimer64 (__itimer_which_t which,
> > +               const struct __itimerval64 *restrict new_value,
> > +               struct __itimerval64 *restrict old_value)
> > +{
> > +  struct __itimerval32 new_value_32;
> > +
> > +  if (! in_time_t_range (new_value->it_interval.tv_sec))
> > +  {
> > +    __set_errno (EOVERFLOW);
> > +    return -1;
> > +  }
> > +  new_value_32.it_interval
> > +    = valid_timeval64_to_timeval32 (new_value->it_interval);
> > +
> > +  if (! in_time_t_range (new_value->it_value.tv_sec))
> > +  {
> > +    __set_errno (EOVERFLOW);
> > +    return -1;
> > +  }
> > +  new_value_32.it_value
> > +    = valid_timeval64_to_timeval32 (new_value->it_value);
> > +
> > +  if (old_value == NULL)
> > +    return INLINE_SYSCALL_CALL (setitimer, which, &new_value_32, NULL);
> > +
> > +  struct __itimerval32 old_value_32;
> > +  if (INLINE_SYSCALL_CALL (setitimer, which, &new_value_32, &old_value_32) == -1)
> > +    return -1;
> > +
> > +  /* Write all fields of 'old_value' regardless of overflow.  */
> > +  old_value->it_interval
> > +     = valid_timeval32_to_timeval64 (old_value_32.it_interval);
> > +  old_value->it_value
> > +     = valid_timeval32_to_timeval64 (old_value_32.it_value);
> > +  return 0;
> > +}
> > +
> > +#if __TIMESIZE != 64
> > +int
> > +__setitimer (__itimer_which_t which,
> > +             const struct itimerval *restrict new_value,
> > +             struct itimerval *restrict old_value)
> > +{
> > +  int ret;
> > +  struct __itimerval64 new64, old64;
> > +
> > +  new64.it_interval
> > +    = valid_timeval_to_timeval64 (new_value->it_interval);
> > +  new64.it_value
> > +    = valid_timeval_to_timeval64 (new_value->it_value);
> > +
> > +  ret = __setitimer64 (which, &new64, &old64);
> > +
> > +  if (ret != 0)
> > +    return ret;
>
> I tested ARC port over your v1 next branch and it works fine in general. I still
> had 32-bit time_t so you have some more test coverage ;-)
>
> The glibc testsuite had some new failures, some of them are coming from the
> unchecked @old_value dereference (which would not hit for 64-bit time_t).
>
> Care to fix it please.

Fixed! Thanks for testing!

Alistair

>
> > +
> > +  old_value->it_interval
> > +    = valid_timeval64_to_timeval (old64.it_interval);
> > +  old_value->it_value
> > +    = valid_timeval64_to_timeval (old64.it_value);
> > +
> > +  return ret;
> > +}
> > +#endif
> > +weak_alias (__setitimer, setitimer)
> Thx,
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
