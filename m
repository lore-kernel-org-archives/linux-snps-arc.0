Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D24C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JxP8/eTJN0ESrNQ2m0CIVPCtfjyjVNpLr56U2aZNoc=; b=vjuUEQxpJhecoU
	gYZPHOLURFasCZfhB8asfzMgIbJ2DasApVDqAQdG9uVBTNOIua/xVM4gIPu1XVUnVfnmsE/9LgjkE
	cc/KILJV2rswKkX2ZUbm/mle+vly9BUxeetjtFiGMG5nNvAltyr4xevB/2/k02dx72cZ82LkZR2Ht
	jn1iteIr3no2xL4lAM9FZawnfBQDpUqACesPyQcARCg+zm/w6Prp3Xa5CYEoeZ9M9xHADKRfxXjpF
	m0IOWVqwrHQcZ8vGUrdnMmHZry/+HtFlTrSW44jnFryJuaAYprYBLSmuDVcwUbZD29NTaPJpfrNQP
	I2z2VKXc/0mhRu9Sd/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Zrs-0000or-8l; Fri, 24 Jun 2022 03:20:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Zo4-00HZdr-Hm
	for linux-snps-arc@lists.infradead.org; Fri, 24 Jun 2022 03:16:29 +0000
Received: by mail-pf1-x432.google.com with SMTP id bo5so1409819pfb.4
        for <linux-snps-arc@lists.infradead.org>; Thu, 23 Jun 2022 20:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+vDFwyU6gU2J6FMTxOqBa2GFVZE6B6F1CPfaNmdAisY=;
        b=oPf9v26asLtQByW8ysQTVAHXOd/SeOsXCALSM6mLz2VuTD8b8wWp/R1goEFpZxS7+Z
         PBi6RqjS4yd9y97kDMJ+2ycPGd3QtZtJxprb3Ihi6V+JG+z92w4dg9AVto9AEY+z5eXJ
         7T+jZ7X6ZjKbs4fvRbKbtP+PnSwIEP/NWyUNdhGIHOEiVgf6fN2vbMQPQhl6pwE1w48S
         j7r0fCsfWfYu1l+SzwK6PR1SU+x8v5twORX6lUxsLBoSDRR335bu9ZJwaHGK0xMk15/R
         MXv0vBiJxp8BmhTGnVa8WqOFkTAAwe8REypeDhyicem1HjFYzJC2JEUNh0FPpE496N6x
         L6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+vDFwyU6gU2J6FMTxOqBa2GFVZE6B6F1CPfaNmdAisY=;
        b=fRbAPFyAKgXJyl4NwYSdjfrJ78nQhm38N8aWVejzD4H4hQMQdg182cD+T8UyXXeRKz
         SQSyBSIT1b29gzqvQuz9lflwOaiRRs21QPxKBE2ai7PVVeNdkrL+2OQIJTY0WVjdj5UO
         AFIiDxwWLmqSo2S/9+5WrDd06wQ6ewD2RdIodLgxIpcbOcvZxrImL2W78gR3nZiL0CEh
         7TfRz58a/X94/atMhT8Im/annFu8/foPwR0xECgebptJPdh/6/0jll+OrZOLaZJ6EF7J
         qVn/3h7AkU8YrEkJwHdSxjYTIaOt6kdQwA68I4Sgs86Cs6t0Lii4MNDN7PpGomxBaeAc
         zL1Q==
X-Gm-Message-State: AJIora/xAyxBH/FkYwgzbk5kcyS6zZ5tAEUMEffUFCjRVvkoUFZKZC+9
	H67sgx2IGF+1DG/fvXeZZPyAiRIGHs0=
X-Google-Smtp-Source: AGRyM1um0CKTli+3oCXxDwQfDi9hCwlWfT9FC81sDHGDu3MpiJcQ4WnbvDd6nXDfo6qz6XyYw2ZWrQ==
X-Received: by 2002:a63:f506:0:b0:3fc:962b:6e02 with SMTP id w6-20020a63f506000000b003fc962b6e02mr10007713pgh.266.1656040584859;
        Thu, 23 Jun 2022 20:16:24 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-14.three.co.id. [116.206.28.14])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d34c00b0015e8d4eb2afsm521684plk.249.2022.06.23.20.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 20:16:24 -0700 (PDT)
Message-ID: <bc46dfd5-474f-386c-c646-c15d82f5ffed@gmail.com>
Date: Fri, 24 Jun 2022 10:16:20 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Content-Language: en-US
To: Vineet Gupta <vgupta@kernel.org>, Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: Julia.Lawall@inria.fr, rdunlap@infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
 <d104124c-5196-bc80-b3e3-0ab55f0cc35e@kernel.org>
 <89bc29c5-ad82-4f20-2855-44e57b043c49@gmail.com>
 <ac0b07c8-0cd4-6ab4-2939-ead4c813ef78@kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ac0b07c8-0cd4-6ab4-2939-ead4c813ef78@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_201628_673127_8363BDE6 
X-CRM114-Status: UNSURE (   9.03  )
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

On 6/24/22 08:57, Vineet Gupta wrote:
> "Repeated" is the key - First time I'd politely tell them to DTRT but will just ignore if things continue.
> 
>> Lazily speaking, I'd like to privately notice the
>> submitter about the situation, and I withhold these for now.
> 
> Funny that you say this: ever since this got posted I now see 3 patches for typo fixes :-)
> But it is something in maintainers purview and for now i'm ok.
> 

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
