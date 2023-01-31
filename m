Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7917FC636CC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Jan 2023 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hT3stOgHu9hVCYOqK3kMKKDhauni4EYnkRdpL5lDl84=; b=xfqIOpveI5UOZx
	NSGHuPpMGRDxV4UE2/ltMSUTEkWUUQk72vaz88JG+MI5rzi4eUiRZM2f5iUeYSWWMq6KxtTW9beBA
	JeZL7Z8D9bSTgoetbNh9k4PARBCp+dz6wJH4oYq3KuKhesbQSoeoxbUHs7H8+5DEbJi6KGbaztMg/
	1/lQDRDoCZtsZq865CdGbhs5u65f8MJCg+SHKllhroteCoLkQgKxmHSHfw7wXtiqu2VKuwd99URjg
	pQQYhRBlt69UAJn/x2K4qbwhutP84DSpkA8tAEWDl0YaSrPMnxmWOSrTGYcaQI0ERuHbYLsjZ5NJx
	Hrttdr8poHAfZgjx7Lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxMW-009HM0-H9; Tue, 31 Jan 2023 20:36:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxMR-009HKT-Ds
	for linux-snps-arc@lists.infradead.org; Tue, 31 Jan 2023 20:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675197361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0egES6Vtt2UKZLFhP7nIhfy1qDBfleZGyXZ89UbXyvg=;
	b=QdY95hG0t5hlUK7qvwZi/kUYJ4fBJcP8LK0ZEuVEO6sH3xeC57jZzHlzfXjrQYGRhgF2O2
	xjXitwqg2tZoqohOiUGdzzomn9wPY2MhVQ0X2F/101njfkSg+3lN5MbiYouzX5YT0nSTqv
	ZNKAMIFDS7I3Eb+ABnFKRP80ojv/b14=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-IzV_rTRAMiC9KpMjmjCgMw-1; Tue, 31 Jan 2023 15:34:02 -0500
X-MC-Unique: IzV_rTRAMiC9KpMjmjCgMw-1
Received: by mail-il1-f198.google.com with SMTP id n18-20020a056e02101200b0030f2b79c2ffso10186737ilj.20
        for <linux-snps-arc@lists.infradead.org>; Tue, 31 Jan 2023 12:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0egES6Vtt2UKZLFhP7nIhfy1qDBfleZGyXZ89UbXyvg=;
        b=cw1rOPqMS0Dwh7XlhxoA4CQixMu5pyx3QcZbqhVkhAJYYVKMMbkdxCYiVneRE6tx1y
         xhVVKOPrFVMLyVnYIWOP6FKMiQ65Kt42PEz4LGzHbg3R2Ju+6OCDdkqG5UT6r2mC3AWq
         37B7uLHfxuHZ/wB4WDjb9vvAmWZ+wtM4/ukVoUCZuCZ6dm23pw0G/bnOqVKZ7tSwatrI
         Dm0CDOe9jbzDMO2h9rLdcWvm5XnnNFbO4tecglva1q2i2aXClvk3oHfYH35DfkVB1YH4
         ERXPwCEj8ZBsLYuks05N6mfFi4jCix8V2xvmIF6AuLsH49AREl8BiaoYJYRXfnhqRgj4
         PU3A==
X-Gm-Message-State: AO0yUKUiqQ+ZDkH5zrD5Dj6d6OGZJ9DOeE3oAN1kJMKTXHW3TUVcmd7l
	ZIHEY3HvNR0vI2oIm7F87Xel4ZO24w6ljvCc98eBWJK7152MhXJJs6toFeYydbegQMRYz2LiMjf
	iuAwE+72CPVtDrsZ4vgTheYAcYZciEZnb
X-Received: by 2002:a05:6e02:1b0e:b0:310:ba29:cd25 with SMTP id i14-20020a056e021b0e00b00310ba29cd25mr13183462ilv.0.1675197241271;
        Tue, 31 Jan 2023 12:34:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8UDyXYlzII1DNBcVUDVr3joEqGGqdjz/lyLiqdAKWYiCElVMp4iKkRjvCzzrm8DitmBDTBGw==
X-Received: by 2002:a05:6e02:1b0e:b0:310:ba29:cd25 with SMTP id i14-20020a056e021b0e00b00310ba29cd25mr13183458ilv.0.1675197241091;
        Tue, 31 Jan 2023 12:34:01 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id u6-20020a02cb86000000b003a963535db2sm1522048jap.147.2023.01.31.12.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 12:34:00 -0800 (PST)
Message-ID: <8c92778c-edd6-12d7-848a-61dd586bd73d@redhat.com>
Date: Tue, 31 Jan 2023 15:33:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Pavel steping up for ARC glibc maintenance
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 GNU C Library <libc-alpha@sourceware.org>
References: <323b6822-6442-0aca-15dd-3e58ed2c6953@linux.dev>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <323b6822-6442-0aca-15dd-3e58ed2c6953@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_123611_586799_2565EF82 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

On 1/30/23 22:07, Vineet Gupta wrote:
> Hi Carlos,
> 
> I'd like to introduce Pavel who intends to step up to maintain ARC glibc port and do periodic wiki updates and such.
> I've pointed him to links [1] and [2].

Sounds great! Welcome Pavel!
 
> To begin with can he be granted wiki edit access and subsequently also approve his write access to glibc sourceware repo.

We can absolutely help with the next steps.

Please follow [2] and if you get stuck anywhere just reach out on IRC or by email.

> Thx,
> -Vineet
> 
> 
> [1] https://sourceware.org/glibc/wiki/MAINTAINERS#Becoming_a_maintainer_.28developer.29
> [2] https://sourceware.org/glibc/wiki/MAINTAINERS#AccountsOnSourceware
> 

-- 
Cheers,
Carlos.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
