Return-Path: <SRS0=wxyZ=GU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E982EC433E0
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Jan 2021 20:55:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5313222203
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Jan 2021 20:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5313222203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a4I3758IcXwb5lN/tiSA3nMHSHFybBv5E1S+HoS8Suk=; b=ouuFRCbq8V9KhVw/p5NqSZCw6
	gPrrh8IStHQcbCN3KMVpMSKL++XVjDPHkCA0bkVstsXYNR5GK1C/2qlxV+qsFlr+HiZk5x+qgam9W
	TcRqu5uvsem89T0duKA8vra5il6Fl8gEn/7QjmHf/22pvsawOK8oRLmkt1kbpWcYF0FXpAVoHBVSu
	bbm6UzzvaLkRLxpfR59a24MlWtDrvXRMmRGsGCJZD8GMfVWimZKSppusF1HY13pXfloEeDDHrWMEF
	FGO/ihB5GgdEtGtK/1HTCqhXTaP2h31rescWufBESPnQNkx3J3Cs72Ny7iKVSV8LQG6Gb6yds9FeT
	4yikOx2/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1F5U-000455-9M; Sun, 17 Jan 2021 20:55:52 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1F5R-00044k-PH
 for linux-snps-arc@lists.infradead.org; Sun, 17 Jan 2021 20:55:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id g3so1505061ejb.6
 for <linux-snps-arc@lists.infradead.org>; Sun, 17 Jan 2021 12:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eOpg505sGV6Iam+auFou/fr5r84itsG3xw4cCWDVM2I=;
 b=a2FUxnsOmwTab72PFq6/BRYnz+3txE2i64jBkr/YzobB7Uw3ssOBy/vjaGgwT7yptm
 vhL+11x3snY48uUC1Dv6E1IMK85V6oUNOixYIhwp1Qhe5QaYQTR6TWVZRgMamzIGuyDY
 TPGpBDixfqqqDW+7B4ZFIf2Z9g8bilmNV5An8V7WWteBG5Hv0TsR3fvwcjRzHF4aH/rz
 s3+edfF0mAxRVQjVZXMG8NL87KjFwKsE2urguGsGG8RiBxRYAdFrymlTXthbW2ZCOVSW
 4iVWXXgCkXqTWXbYPPp/3qDaNpUw7iLMgRZrQhSRuZsq10jkie1dZnmHqI34wnU8/k+A
 dK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eOpg505sGV6Iam+auFou/fr5r84itsG3xw4cCWDVM2I=;
 b=mkzYYKBXtC4sGqRaM+TF83JeJcL+iVSOxCkgzRwcpJD+Xwzcn0N1GsTRuD6ceoUohO
 c+uw3apRbROj1yENjJg0tkfKls2YPnh3WiGxM8UC6yselMQEI8JVGsFm8bAP3yLOV3Rf
 kRnu4pfS38iD66CCgXkdiXyrs7Qs8X5FbG5hhG1D1vEDOmlMis/3FSL/pSSvSZoZ8uCY
 0JJ6uPLkiBq969n9mLy02Q46Ej39f94JcnqwLr2pl3Y2YOFAezvUTJirE4ErSGTraV5I
 XjCIOu8SnC+wCbmWlieZ0WnbfUEvXCfzIzWNbdalx349JDhyVaCF3G4VC7tlnj9sbaua
 yofw==
X-Gm-Message-State: AOAM531WYFWaAeiva9R4Rl33uqRLVeNv1PSHcdtxa44/oh0tot4po3lI
 m6tI4cYpfQFN7xYSv/RD1VM=
X-Google-Smtp-Source: ABdhPJwX0w8VtZ7Gq0hFAO/GpJO83P1wx8qQmehoE+C3LjGVZyYo96r/52l98VwWmR4d+bYE+PESqg==
X-Received: by 2002:a17:906:f8d5:: with SMTP id
 lh21mr15821902ejb.167.1610916948505; 
 Sun, 17 Jan 2021 12:55:48 -0800 (PST)
Received: from ?IPv6:2001:a61:244d:fe01:9fb1:d962:461a:45e8?
 ([2001:a61:244d:fe01:9fb1:d962:461a:45e8])
 by smtp.gmail.com with ESMTPSA id g3sm6612531eds.69.2021.01.17.12.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 12:55:47 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
To: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
References: <20210116145632.7636-1-alx.manpages@gmail.com>
 <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
 <1c234bd5-306a-7496-fd3d-268f46450168@gmail.com>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <05679e0d-c716-419d-d3e3-c4ae46446dcb@gmail.com>
Date: Sun, 17 Jan 2021 21:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1c234bd5-306a-7496-fd3d-268f46450168@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_155549_854296_CCF5B49B 
X-CRM114-Status: GOOD (  11.89  )
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
 Guo Ren <guoren@kernel.org>, mtk.manpages@gmail.com,
 Vineet Gupta <vgupta@synopsys.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/17/21 9:43 PM, Alejandro Colomar (man-pages) wrote:
> Hi Michael,
> 
> On 1/17/21 9:34 PM, Michael Kerrisk (man-pages) wrote:
>> Hi Alex,
>>
>> On 1/16/21 3:56 PM, Alejandro Colomar wrote:
>>> Glibc uses 'void *' instead of 'char *'.
>>> And the prototype is declared in <sys/cacheflush.h>.
> 
> D'oh!
> 
>>>
>>> ......
>>>
>>> $ syscall='cacheflush';
>>> $ ret='int';
>>> $ find glibc/ -type f -name '*.h' \
>>>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
>>> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:
> 
> It is defined in <sys/cachectl.h>
> 
> Please fix that.

Fixed! (Everything pushed now.)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
