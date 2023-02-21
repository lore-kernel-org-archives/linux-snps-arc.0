Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CE1C61DA3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Feb 2023 18:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/LRV+RUgk5MbFHG64/oftT9vLBhfxlYD3uxOpnR+Ew=; b=qAbZup52qOVIQJ
	YmOKPBKL1eN8veoukJJuP9/vKa0+cxXrm8PJ75hEu/Iv6EgqWBVPj/CFhP1LMG062+OZyIZCcjNXU
	HRKp++pz3AmqNlasQ3Bw6xJ230K4jOuqRcVUfm94biwNTzsTBf/RQdpdsr6VGcPlFHnMuIVy5p+Pg
	UkxMb3lwTKjZbW6DQhXv5lFzj0cb8i5MznLuzNs1HsLlIY/62s3yjLfnXPvh033mxRksk92nqSaXs
	dwapJm9zbtaUxwD2LuDJuDuElN/5z5O933KWE44b6c3Ks5EGd3PiOA5Jfe53ggb3aNIa8HevkHMMH
	2Wd31bUjsEj9fIKDPXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXrZ-009Svp-BX; Tue, 21 Feb 2023 18:59:41 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXrN-009Ss7-Tz
	for linux-snps-arc@lists.infradead.org; Tue, 21 Feb 2023 18:59:31 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 26-20020a4ae1ba000000b005200f75cb0cso603585ooy.6
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Feb 2023 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677005967;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KE/02dPKqgZjMT700xTUU/M9dprKRYf+i1HpGQh+2Rw=;
        b=yKTd663L2P8YQHtmpV7oj2k/fBmoBVSUPlDzqppMkzyhT1bmv+9vomXygrZ3jWyBj7
         cnAaOvhP1aA2wOBP9L5X5TwjAxPQ1tndZ7rwan9+gpp7CM+Tn5/gRszF2SKqdW0Fhc57
         BoweTkRbAk8s3kDAu98zZbSZ71OBWyYKUHYgQRIz5k161MiUfZZhey3G+H7Pjsv5X2YJ
         8Fq9lo6YMAtHevgrL38ELFLTWhs3JsWl7Y0URBBuxKh4VCNrBQpxggetLZgx7W10lZ4R
         P6/oyLoZFan7KzHCcEsLmzYCrNmd0tUKCd4r8hyEN4SnKPT7Ve3Gi9jDWAKnJXBuHCx3
         33bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677005967;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KE/02dPKqgZjMT700xTUU/M9dprKRYf+i1HpGQh+2Rw=;
        b=4e4uuEwhZLN6uzAtzLDCLcdyWpaXwZm7x1Xn0sKxai9+8l8ajvjylR6k9fPBAbP8Ki
         /unmHVmq7php3hhO551g5joIV5uadelktwXwNRAPsb5JnRUhRpaB7BOKT++TMewBYcoy
         IGk9fNKQvIPp0ajxJIERxKmqby+zFoGQjUeTMW1FA3T7Jein3B0ncMXdCss2uWRnlFST
         hVhyGaKPZTQBEItga5yWC7EdSsVPnILV7p7O9hSfAC+R+xaACIB+b/FWKYtVjAouPnRG
         zApnTPt2e/nbgbmH3daG2dKd4qmSNrdBP5fBqCC12ZM3n+RjxAYTfuS3xHkN763hw4bf
         VTZQ==
X-Gm-Message-State: AO0yUKXWV7hUN9mFFTF/QmJ6R88T92vg6LwMDiehWa+23l3cniItxvkh
	BW7aZfOpyQ7qkIstJMia4rO08Dz9J9akntyP4Fc=
X-Google-Smtp-Source: AK7set899RbR3gBI6XvZ9+UNCMaAJP6jw98KLS10Di9PaMFdxf2bwqrlDAgauT6z66pC+aHZyFvKKA==
X-Received: by 2002:a4a:33c8:0:b0:51a:ac9:775 with SMTP id q191-20020a4a33c8000000b0051a0ac90775mr2900697ooq.6.1677005967091;
        Tue, 21 Feb 2023 10:59:27 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c3:3a5:a0:9596:f951:7d30? ([2804:1b3:a7c3:3a5:a0:9596:f951:7d30])
        by smtp.gmail.com with ESMTPSA id k23-20020a056820017700b005250c840e64sm272016ood.3.2023.02.21.10.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 10:59:26 -0800 (PST)
Message-ID: <816b6a43-6b23-cfd7-266f-e65b8830b542@linaro.org>
Date: Tue, 21 Feb 2023 15:59:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: Pavel new maintainer of ARC port
Content-Language: en-US
To: Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, Vineet Gupta <vineet.gupta@linux.dev>
References: <DM6PR12MB3146B975395D8A9BC4B13F3FBCA59@DM6PR12MB3146.namprd12.prod.outlook.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <DM6PR12MB3146B975395D8A9BC4B13F3FBCA59@DM6PR12MB3146.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105929_997455_B1D83B79 
X-CRM114-Status: GOOD (  12.41  )
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



On 21/02/23 10:55, Pavel Kozlov via Libc-alpha wrote:
> Hi all,
> 
> I'm excited to introduce myself and become a part of the community. 
> 
> I'm a software engineer in Synopsys and member of a team working to enhance 
> support for ARC CPUs in the GNU Linux ecosystem.
> 
> I would appreciate any guidance or advice on how I can get involved and 
> contribute to the community. I'm always looking for opportunities to connect 
> with other developers and learn from their experiences.
> 
> As a final step of setup, I've updated wiki and added myself as ARC 
> maintainer. Also, thanks Carlos, for help with my setup.
> 
> Best regards,
> Pavel Kozlov

Hi Pavel,

Carlos might already brought to your attention, but we have a weekly
call [1] where we discuss the current patchwork status [2], any blocker
someone might have, future work, or to discuss bug report or any other
issue.  So fell free to hop in if you have anything to discuss.

[1] https://sourceware.org/glibc/wiki/PatchworkReviewMeetings
[2] https://patchwork.sourceware.org/project/glibc/list/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
