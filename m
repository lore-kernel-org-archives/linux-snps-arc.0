Return-Path: <SRS0=wxyZ=GU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05493C433DB
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Jan 2021 20:44:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C1121D7A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Jan 2021 20:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C1121D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+pgXuVkLs5v/TtFrSeQiB2VHC0tuUmJN5CwPIFrABT8=; b=kDKA27cdLmdZWL7F2zzZnSCP5
	0RmjqKnXfqx0seVwMHRmim3TOI8RdAtQ7stJJZl9HAJdGc1CTdkXBZiTP65e2XTVkGE66LM0+jiqk
	4nGOJtIp4vmzDzUyZtHhISUNEP1yAN7dUDLcHAVFOUBzgw8sWrCc+37IqAlRJQA1IJdIn7KRJ4dho
	aCravzwj/8L3K8FWfgF1X1DX6Icr7OI2wlwjspSOumAFCpj0TapRAM5clbYTcAzW8bmmlC2OOo/JU
	qylKSdKhKd52MJxqejH17R3CxtwxybRnesZGHEiVft2FSiYqOgF9wVeq7T2xrt5YbWfIe3jDFL7LW
	SbFsFNSvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Eu2-0003g6-Fg; Sun, 17 Jan 2021 20:44:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Etz-0003fO-7q
 for linux-snps-arc@lists.infradead.org; Sun, 17 Jan 2021 20:44:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id r4so12132709wmh.5
 for <linux-snps-arc@lists.infradead.org>; Sun, 17 Jan 2021 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E/X7lg9bgvpQ028ryM47dCcslls7yvCj3gHeWlbVtOw=;
 b=UNV1huD5W9nQKz+mgcv1aQEez/rCBIiDn2kHqfpWnTKEt5aX+Sq8L4o0nDr2HsktS4
 htSH8LxVAQGxr4LL2MnwepdKUQqFMdWnbsEHo360rSR9ehqdmeOoKNI3JKsfQ7yALjT5
 qcNgjT+5VLl6TrfjYUz97iPRXi/xdLwN5eah85+tKZsC4KXHhaGYwYK8kmwLGhN8Rvuh
 d3wFKs2qNotfip3I0+MmpNgn8OGKXNj9R4oGG8dcatuOHAucuwNaII4tuZMs1N53J7K8
 bwr+DENPzvwJffPNKiDIdz/ixjmM4mePn+y9jOx+fqmknM7hWvZ3BH+2jtDh2wvE6fOo
 P7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E/X7lg9bgvpQ028ryM47dCcslls7yvCj3gHeWlbVtOw=;
 b=G496YsRzDqJ3Bv7MFmHw0ERmbH6cZ+IGGFQToBb4kNXcmAeuIQWVGpzWa7HnOm/DJ3
 BKeZpCh19padRLAV4mjbLlWv5jS7t1dSDz1GB7pgOrCN8ALsxcLMg/+pYI2QhCoiQHqg
 o3s0gESDjBsfbjmgzd5JdGEcIGuyzIDTaIJoKdFrBfI2usv8X6iJcjMq2mMrbJgg1aoA
 MsObRWq6r1x3hIpLOZH+T4pB2DMlqIlDPazo51QFE0lekM7LgneJzd4YVhYpujpj1FOu
 hb1qHSFtZZpEPxxMTYNpioPagVbEbnFm9XhepCKyDLiFyfkbeaUOKICI8iTZqycbvTj0
 nhrw==
X-Gm-Message-State: AOAM530nAx0Cg3pgfJRSD22GosSvDSp+5qUA2lfUt/hzy+CBcffU9kPD
 G0ko4zFjHnCc2KDIxetb3I0=
X-Google-Smtp-Source: ABdhPJzatrj3jstdkojeEph7YiYtD2iWo8+D8xTmhAqyEhjZNzjdPGUNasD0J/91Nyk3wGQt6IXfFw==
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr897626wmc.158.1610916234106; 
 Sun, 17 Jan 2021 12:43:54 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
 by smtp.gmail.com with UTF8SMTPSA id d7sm13994916wmb.47.2021.01.17.12.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 12:43:53 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
References: <20210116145632.7636-1-alx.manpages@gmail.com>
 <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
From: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <1c234bd5-306a-7496-fd3d-268f46450168@gmail.com>
Date: Sun, 17 Jan 2021 21:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_154359_294073_67B1C6BC 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: linux-man@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Martin Sebor <msebor@redhat.com>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Michael,

On 1/17/21 9:34 PM, Michael Kerrisk (man-pages) wrote:
> Hi Alex,
> 
> On 1/16/21 3:56 PM, Alejandro Colomar wrote:
>> Glibc uses 'void *' instead of 'char *'.
>> And the prototype is declared in <sys/cacheflush.h>.

D'oh!

>>
>> ......
>>
>> $ syscall='cacheflush';
>> $ ret='int';
>> $ find glibc/ -type f -name '*.h' \
>>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
>> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:

It is defined in <sys/cachectl.h>

Please fix that.

Thanks,

Alex

>> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
>> glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:
>> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
>> glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:
>> extern int cacheflush (void *__addr, int __nbytes, int __op) __THROW;
>> glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:
>> extern int cacheflush (void *__addr, const int __nbytes,
>> 		       const int __op) __THROW;
>>
>> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> 
> Thanks. Patch applied.
> 
> Cheers,
> 
> Michael
> 
>> ---
>>  man2/cacheflush.2 | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
>> index 2cf624f3a..0496879ca 100644
>> --- a/man2/cacheflush.2
>> +++ b/man2/cacheflush.2
>> @@ -27,9 +27,9 @@
>>  cacheflush \- flush contents of instruction and/or data cache
>>  .SH SYNOPSIS
>>  .nf
>> -.B #include <asm/cachectl.h>
>> +.B #inlcude <sys/cacheflush.h>

s/cacheflush.h/cachectl.h/

>>  .PP
>> -.BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
>> +.BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
>>  .fi
>>  .PP
>>  .IR Note :
>>
> 
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
