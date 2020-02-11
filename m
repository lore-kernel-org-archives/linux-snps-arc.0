Return-Path: <SRS0=yyJz=37=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA63AC35242
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Feb 2020 20:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F5B20659
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Feb 2020 20:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lsQ9VgZ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSmKt7KH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F5B20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFK1PX1mxMCL1AxXFb7A1XEiDv03O+5nLCI7ACZ5rNM=; b=lsQ9VgZ1QPNJhp
	YUOi7dL3LC2KEqeI/OOQ6hH1WlhFB1tOZlbr5pe6vioHB+TpWuDLVJySOT1/NZ9roWIvADcLUsv26
	hTbFcJhN70lLwk9f9a4nR/a7ZRg2BXJ5LvVHXlggG54ea0DNzF4rkr2ertCLUGsMuF8vYFs/hJ3Uk
	1Q1UJTTmNbcQPCno4BrIlSNhL+j3nIo3IDxalniOa/ID+3Pgc54SLxP7EbfGv5nDAkcuyy7OWwa5y
	vfIAQFBka7uZk7d4sJlGNGHoLxI3VekoQx1CpIz/dGV8FkNINGkjnxBCLCs1YmThpvy1eC13pD2BS
	5vrlVVgUCJ0PR2RXjnFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1bjs-0004a9-Uf; Tue, 11 Feb 2020 20:02:32 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1bjq-0004Zk-Nq
 for linux-snps-arc@lists.infradead.org; Tue, 11 Feb 2020 20:02:32 +0000
Received: by mail-pj1-x1042.google.com with SMTP id dw13so1816655pjb.4
 for <linux-snps-arc@lists.infradead.org>; Tue, 11 Feb 2020 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2NcemxBHYhmjxr0r6hT1ID+muda4jKNv9ZlCh3v7FM=;
 b=FSmKt7KHs4Lu3j37buxUL6KpQegiEv9/BWelWs/CJscoiLQviD/a5aiULv8AKwzF4x
 mxKnJCLiHJshUI4+t1JWM1BfAmgorB98VfkbJoQBs/a8DElGwNC2PM3dFigxiDTzphbV
 uMu8N+dow0fPyQuxHSstHTht6kQzuhXkMkHs90yw1R2/RV1yDFHwBukP/OQ3iS2t1Iop
 iLWSt5HSaZuYBh8NQUXpgTII/Y1puo60TzWIbivY+W3dVtUjUsQ8qDKM8XkSxuf0KRbj
 mPfaXa3amUP3Prp2xBi6a+gnCNYDVuM3QETwi92DsIEFWUfIUVCiNB4cMq+LcWfbxLk0
 zFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g2NcemxBHYhmjxr0r6hT1ID+muda4jKNv9ZlCh3v7FM=;
 b=L4i1m45yhl1OyxXPg9f4MfpWMjTnhudEbZvgSegOD9Q81IuaC8cP68ZWJhEwQie1TB
 TIhGFZXcPGWUkvM3BFsb6t2G5M9MODo1nRmUffQQDc7vp+C/Pu3V4FT6BEJ9ERD0fDOt
 2Y6y8SzB1EaROWbuPCZkD2bJDaCtUhk3iXgmhRmiO+7T2X+H+Okga+87V+kRiO1SkcqW
 63EJ1DVYkYEwFqRTm5ISMWVzDaKxaunAUSGPCRo/6+msiKV1bEEJ6VxPQgesdU+8V2LC
 I8O7zudfMcuUA93J/SfcUqzYlPnZzEkIE3YfkPsrC0oDTxVAbG3y5JjTz6VyTXr0tPLL
 iUvg==
X-Gm-Message-State: APjAAAWbgo2YdgAZgCpO377qiCDBcCswTgZGiGA7gGyuqBf3P2GTU8M6
 8x9MxUsHhFbhU1/fsTlh14r9FvhgycU=
X-Google-Smtp-Source: APXvYqyZQEkLxXGhvlCAV9uLxJb+whZlPfCqN+oYH2VUzmqX32XUO2qXvObAFkPJtaUQai4pA6lgWg==
X-Received: by 2002:a17:902:6b4b:: with SMTP id
 g11mr19264406plt.26.1581451349286; 
 Tue, 11 Feb 2020 12:02:29 -0800 (PST)
Received: from ?IPv6:2601:641:c100:83a0:bc48:43a7:8508:65a?
 ([2601:641:c100:83a0:bc48:43a7:8508:65a])
 by smtp.gmail.com with ESMTPSA id s21sm5232695pgo.63.2020.02.11.12.02.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 12:02:28 -0800 (PST)
Subject: Re: [PATCH v2 4/6] linux: Use long time_t __getitimer/__setitimer
To: Alistair Francis <alistair.francis@wdc.com>, libc-alpha@sourceware.org
References: <20200210174325.6566-1-alistair.francis@wdc.com>
 <20200210174325.6566-5-alistair.francis@wdc.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <9b03cfdb-b8b2-a8f6-329f-5fbd38cd9ed8@gmail.com>
Date: Tue, 11 Feb 2020 12:02:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200210174325.6566-5-alistair.francis@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_120230_778757_3F7369EC 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: alistair23@gmail.com, arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alistair,

On 2/10/20 9:43 AM, Alistair Francis wrote:
> The Linux kernel expects itimerval to use a 32-bit time_t, even on archs
> with a 64-bit time_t (like RV32). To address this let's convert
> itimerval to/from 32-bit and 64-bit to ensure the kernel always gets
> a 32-bit time_t.
> 
> While we are converting these functions let's also convert them to be
> the y2038 safe versions. This means there is a *64 function that is
> called by a backwards compatible wrapper.
> ---

> +
> +int
> +__setitimer64 (__itimer_which_t which,
> +               const struct __itimerval64 *restrict new_value,
> +               struct __itimerval64 *restrict old_value)
> +{
> +  struct __itimerval32 new_value_32;
> +
> +  if (! in_time_t_range (new_value->it_interval.tv_sec))
> +  {
> +    __set_errno (EOVERFLOW);
> +    return -1;
> +  }
> +  new_value_32.it_interval
> +    = valid_timeval64_to_timeval32 (new_value->it_interval);
> +
> +  if (! in_time_t_range (new_value->it_value.tv_sec))
> +  {
> +    __set_errno (EOVERFLOW);
> +    return -1;
> +  }
> +  new_value_32.it_value
> +    = valid_timeval64_to_timeval32 (new_value->it_value);
> +
> +  if (old_value == NULL)
> +    return INLINE_SYSCALL_CALL (setitimer, which, &new_value_32, NULL);
> +
> +  struct __itimerval32 old_value_32;
> +  if (INLINE_SYSCALL_CALL (setitimer, which, &new_value_32, &old_value_32) == -1)
> +    return -1;
> +
> +  /* Write all fields of 'old_value' regardless of overflow.  */
> +  old_value->it_interval
> +     = valid_timeval32_to_timeval64 (old_value_32.it_interval);
> +  old_value->it_value
> +     = valid_timeval32_to_timeval64 (old_value_32.it_value);
> +  return 0;
> +}
> +
> +#if __TIMESIZE != 64
> +int
> +__setitimer (__itimer_which_t which,
> +             const struct itimerval *restrict new_value,
> +             struct itimerval *restrict old_value)
> +{
> +  int ret;
> +  struct __itimerval64 new64, old64;
> +
> +  new64.it_interval
> +    = valid_timeval_to_timeval64 (new_value->it_interval);
> +  new64.it_value
> +    = valid_timeval_to_timeval64 (new_value->it_value);
> +
> +  ret = __setitimer64 (which, &new64, &old64);
> +
> +  if (ret != 0)
> +    return ret;

I tested ARC port over your v1 next branch and it works fine in general. I still
had 32-bit time_t so you have some more test coverage ;-)

The glibc testsuite had some new failures, some of them are coming from the
unchecked @old_value dereference (which would not hit for 64-bit time_t).

Care to fix it please.

> +
> +  old_value->it_interval
> +    = valid_timeval64_to_timeval (old64.it_interval);
> +  old_value->it_value
> +    = valid_timeval64_to_timeval (old64.it_value);
> +
> +  return ret;
> +}
> +#endif
> +weak_alias (__setitimer, setitimer)
Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
