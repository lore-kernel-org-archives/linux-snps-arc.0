Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4408BC636D6
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Feb 2023 17:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TukocWGKGTLa3e0trslHJp/7TJt/XIpUAW2zh8sZUMA=; b=osnt/oqzVTFVZf
	ef2VCPnwn26cz39bIFpdeAhD6IOZN5cJUxpPUren2h2IseM8zBEOAozSbcn54tHwxElWV51JB9koB
	deDrlTMwVKlEKVEdeG7Ljuv+SjyxCsrOfeeke6ts+ql3x+2dv51yG9b4ePeY5XiSNOI43iJgj+gq6
	zrAZEgj/58vEio24KNplF7T58RCddnVec677pVV+S8TKW1bDavBk7Wwo28VdDmhmYMSUvRlF5f04N
	WxpjU9OGEqM2V528Ba754hDGrDX1AV6kLOwrNucuW59XQoGavzZFuEegbJKqpTBPXNq37q3DIgAtA
	QewbJ3jTwZ8Phj7tBj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtHx-00DJNS-3V; Wed, 22 Feb 2023 17:52:21 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtHt-00DJMS-Sn
	for linux-snps-arc@lists.infradead.org; Wed, 22 Feb 2023 17:52:19 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1722c48a773so7697379fac.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 22 Feb 2023 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677088335;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F/jG87kUoBvkNv8coXkRd9nRRp/+2UTFIKi3V6srr4M=;
        b=GeLrYLW9c7VSTbtIchdHSxhGRDNOEns7CSDQinXXwa7kpW5J5cQMyLh+iVU4ZCdrXm
         gHL/Fv4fNAXKn1nffqkYxDGYUqkZUA0IPVo2PYUYg/hPCDpS3tsR66UZGVXRUob+FFG5
         MohTzmJSc4DQn5vzVswJROZFPneHNJqsHg4yb5/bFvPY/ZP/HBnm3d9o7GA2RygQG6+R
         ArQvdTnuWyGC2q3Go/mT53/q/ydFKAH4A81xfe8wfcTOy88dVp4Ycn1x2Upr5E7VG90+
         9uIk0jaxyvGXSHICBx4HJsaqZPfXbv7OoBvrh3H+i9R+hQgOd1jaLs/1QrnBFAKcgsrR
         dhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677088335;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/jG87kUoBvkNv8coXkRd9nRRp/+2UTFIKi3V6srr4M=;
        b=rMTUs7afj6xtM7FkaGBamZ5wxyeDJDDUN+0QhcWKRSruLyaUI8AVzp7qPwHkTiuNYt
         /UcxfXIS/KBE4CYQemRngX+oZGmgj81ltqStdJ1jVRxkLsWvEBfY5BI4fvOXx/HO4mFY
         Cz9JmfQAjaAPlcFseWgLICynVE37P9X/l2HE7q4UH4qSFLVdXmNdHPoaoxt1n5ywLZFC
         cXGj4vXaw3HWUFgmHUS0m0FxFzUu9ZYqb9BGP+geEKGYz/0DUk7CqCvORyeZDNoXRlhc
         sf2XJeKb8L914Br3P+luBpg/hahpVyhXXI/CQcohexgPh7JQ13ZHgue6Ig1rVTa0cqFx
         4wmw==
X-Gm-Message-State: AO0yUKUl1LopOmW/y813CVNyVnC480vyla7xA4D0TLpc2iVnwll3sQ4l
	LmvNYG+kd6NVQSMHUeK7hV+Gso0aEummDRRzJq4=
X-Google-Smtp-Source: AK7set/rh9llKjL/rIAIhkhzk3/9SYme/ybnWgjmUeutBzqfh4fvwCu6A5oAriStD6oG9sPRXvT98w==
X-Received: by 2002:a05:6870:391e:b0:16e:862:6085 with SMTP id b30-20020a056870391e00b0016e08626085mr10684007oap.16.1677088334815;
        Wed, 22 Feb 2023 09:52:14 -0800 (PST)
Received: from [192.168.15.100] (201-43-82-10.dsl.telesp.net.br. [201.43.82.10])
        by smtp.gmail.com with ESMTPSA id zq47-20020a0568718eaf00b0016df97ab05bsm6281198oab.31.2023.02.22.09.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 09:52:14 -0800 (PST)
Message-ID: <9f959842-ced5-327b-5893-829019bfc205@linaro.org>
Date: Wed, 22 Feb 2023 14:52:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: Pavel new maintainer of ARC port
Content-Language: en-US
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
To: Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, Vineet Gupta <vineet.gupta@linux.dev>
References: <DM6PR12MB3146B975395D8A9BC4B13F3FBCA59@DM6PR12MB3146.namprd12.prod.outlook.com>
 <816b6a43-6b23-cfd7-266f-e65b8830b542@linaro.org>
Organization: Linaro
In-Reply-To: <816b6a43-6b23-cfd7-266f-e65b8830b542@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_095217_983313_522DDD9E 
X-CRM114-Status: GOOD (  13.13  )
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



On 21/02/23 15:59, Adhemerval Zanella Netto wrote:
> 
> 
> On 21/02/23 10:55, Pavel Kozlov via Libc-alpha wrote:
>> Hi all,
>>
>> I'm excited to introduce myself and become a part of the community. 
>>
>> I'm a software engineer in Synopsys and member of a team working to enhance 
>> support for ARC CPUs in the GNU Linux ecosystem.
>>
>> I would appreciate any guidance or advice on how I can get involved and 
>> contribute to the community. I'm always looking for opportunities to connect 
>> with other developers and learn from their experiences.
>>
>> As a final step of setup, I've updated wiki and added myself as ARC 
>> maintainer. Also, thanks Carlos, for help with my setup.
>>
>> Best regards,
>> Pavel Kozlov
> 
> Hi Pavel,
> 
> Carlos might already brought to your attention, but we have a weekly
> call [1] where we discuss the current patchwork status [2], any blocker
> someone might have, future work, or to discuss bug report or any other
> issue.  So fell free to hop in if you have anything to discuss.
> 
> [1] https://sourceware.org/glibc/wiki/PatchworkReviewMeetings
> [2] https://patchwork.sourceware.org/project/glibc/list/

Another thing you might want to check is to do some triage on the
ARC failures reported by on the 2.37 release page. Some might be
just due timeout issues (test taking to long), however some might
require some work (the test-float64-trunc for instance).

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
