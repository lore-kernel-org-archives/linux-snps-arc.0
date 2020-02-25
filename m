Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD36C35DEE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 03:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F69206E6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 03:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WyDKYZUz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC/GrEcL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F69206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXluOkwTwFkx9OSiIQ8AyiPewQFbt42wsy0E5OsQin4=; b=WyDKYZUzZ3BtuK
	8YM398bnLTrwNjd1hC8zAz1TlIVc7J+c31tu511unoEK46ZJSGd6FMiL9+gichp9WQzxEARIl3+Hv
	s2b70MClvxPZeP1zrTxU9CfVWWjjoJJWw+K4Z+o7A55qK6bH6TxjOpNC8jB/z/kWFbkGi3SRAfj4Q
	qzOhtk2DGX4Wu1WlFx+JnskXXSvRtsxy8IYfsV5djQU9WrOZq2M1UNbBzQd3kliBZMteJ0PvLM+6b
	sWGV5fmJIO8YZ9RAJ/iZsbiY9F3X9hRYK79haUTfkG1Gugt7nN90NZEHejBLs3qgwETSUyChMmPAa
	ErlerDDTBVBZnneC7D6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6QfW-000574-2X; Tue, 25 Feb 2020 03:13:58 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6QfT-00056V-QU
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 03:13:57 +0000
Received: by mail-pg1-x541.google.com with SMTP id 7so4080708pgr.2
 for <linux-snps-arc@lists.infradead.org>; Mon, 24 Feb 2020 19:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZuDtma6mRABM9k7M0XW/xbB/YSNBCZxUG1HfKRra60=;
 b=DC/GrEcLuXZv0T+qdvrdNp8tvjrSTWHcuqRoI+ohgLvYdTaByVYgo5mBpFjgptkv2/
 765rgTJBM4JT5wTWa0AtkfKG0MLQYUSU1LlthS9tB+jKc3RXDj9REYuCNtITUU3WPgmG
 10iEFgwJ7dUAaFa04Ehlnwc+AJrNqXnmlLCjFoETVW+hgv84xAqOxp1mDJKcZAqbXhS6
 tPzexQGCyiyKBSpoMS+/GXJ3mzXpdRFFLVwdt+ymwSUx5Jz4+Kg+bVVVwfXR7cbSBSwk
 yZn2vUvJJZff30RPB8aM3vAEHL93K6HOK9o1K1E3effLTP9MuZnXOF/CO949S41KlQE4
 D1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JZuDtma6mRABM9k7M0XW/xbB/YSNBCZxUG1HfKRra60=;
 b=SnsrH2uH7mhZlRx2OcdzleFoT/NEltGn3wDKxqdhyH8qBLXlH8T+EORUpexFPYe5sH
 qt1bXdtN3H6F3bC12QJ58hIQ43W5blrEt01mRxcX/I5j+LhmZkuOcqu7XJ8e/Jh4MeAv
 /V/Kl8ktVLy4SQHe2zyRIqIvaKdacfrGi1lkVnvS+lcOJEueZv1aq5eXAcevwNvZ8dEv
 HYLnONzqaUwleXwP9n7izT5tdrMxLvanoBIWo4I6XlJFdHc9iLWy0fXEskkXR7pJybVC
 M9vMCtAtyzuimtWvF/qgksh0sILnW5s3SS0eMlcJsJxDIUzbrENvs2/EjL2qKI/ix3UO
 5Fzw==
X-Gm-Message-State: APjAAAU/lTF469sLyZtPa9IeNK8EkibjBFBO6g0Qbqhd29JY8JcLvcSL
 DCD/w2n+4KVDbZGfE4EE1w4=
X-Google-Smtp-Source: APXvYqx4jJgYhUyDAOQm75EdIk9wezCMapeuI6JYL/0cxScyr+wnOkaV+dfFTRz0cPgHiM8kUNag2g==
X-Received: by 2002:a63:7419:: with SMTP id p25mr55102608pgc.430.1582600434587; 
 Mon, 24 Feb 2020 19:13:54 -0800 (PST)
Received: from ?IPv6:2601:641:c100:83a0:bc48:43a7:8508:65a?
 ([2601:641:c100:83a0:bc48:43a7:8508:65a])
 by smtp.gmail.com with ESMTPSA id h22sm5018945pgn.57.2020.02.24.19.13.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 19:13:53 -0800 (PST)
Subject: Re: [PATCH v3] asm-generic ABI: Allow statx syscall despite
 fstatat64, fstat64
To: libc-alpha@sourceware.org
References: <alpine.DEB.2.21.2002250008160.23654@digraph.polyomino.org.uk>
 <20200225002941.20951-1-vgupta@synopsys.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <df3e9d71-7d5b-a03b-7b6f-4aa034684307@gmail.com>
Date: Mon, 24 Feb 2020 19:13:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200225002941.20951-1-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_191355_887154_71CA51BE 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: alistair23@gmail.com, linux-snps-arc@lists.infradead.org,
 alistair.francis@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/24/20 4:29 PM, Vineet Gupta wrote:
> An old version of asm-generic syscall ABI (e.g. ARC 2013) provided
> fstat[at]64 syscalls for implementing the stat family.
> 
> These sycalls are passthru (no interworking/itemized-copy needed
> between kernel and user structs since they are binary comaptible).
> However with switch to 64-bit time_t the compatibily goes away so we
> need explicit interworking. Luckily such code already exists albeit it
> uses the statx syscall.
> 
> So this patch reworks the asm-generic based stat functions to use the
> statx code-path if the arch so desires. It essentially reworks the commit
> 6bbfc5c09fc5b5e3 ("Add statx conditionals for wordsize-32 *xstat.c")
> 
> This will be used by ARC port for 64-bit time_t. But it has no real
> bearing on 64-bit and can just be independently opted-in by an arch port
> provided the ABI supports it.

Oh wait. Can we avoid this churn by simply undef __NR_fstat64 and __NR_fstatat64
from ARC sysdep.h ? And it will then automatically fallback to statx code !

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
