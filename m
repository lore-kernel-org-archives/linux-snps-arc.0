Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86252C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jun 2022 02:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4D6l/36EFkdo17LAaw0NDqdQRHFrJ4g5kb8TnkOy7U=; b=4EGPts4pEaHGyjOCwAF86kbcjF
	/Ey3ONYity+7YzwYP8ks1KnbJtMoKtu6DWkmU3XN7v9bokrV/kkDb3oFZyaUlRdoGGVlmOvtN2qI0
	YUMCwIkviVRtQFPsYDlSnwhsATpEoSiQKoMqYIeO4Ve9lg8/lAzkFYvQ0DAe5LptoMXlQTi6Te15P
	YoROzfsBQh94t1QFwa+mSIaSlF34k/XreAiFieaseZcopQZrZhDCA7HkwIQu0afbj0A83B+Gf72g7
	f1MGn573J2F5c6jj5NRYi6D0P+5bqRx9xXe0ma8/QcWsazjExTCZxiItrHxZVLLWOgUTOY//+wz14
	c+Mf0owA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Cwg-00D6L4-Ef; Thu, 23 Jun 2022 02:51:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Cwe-00D6Kf-6B
	for linux-snps-arc@lists.infradead.org; Thu, 23 Jun 2022 02:51:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id q18so5547769pld.13
        for <linux-snps-arc@lists.infradead.org>; Wed, 22 Jun 2022 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=lIFW9cAuPlwQZ+C7VMU14IUSbtewdAOYVyCoJAKjzlQ=;
        b=Puw8ineJwyWfy8K7QUYI04Wr8Nb2t3lWIHkFlB1hQQLzT5swZYV1wxZgu3zdmjVfn/
         L0HlSvtZI7htiCUE58+bs7E4/4+tXAl4qPsIqzEL5CBx2z2FY3FCEiyOZy4dNWbEFGfJ
         ublFUOJMhKzwCTubtZVlrCy4E/Nj68znJFRH22pBgRivO+6M2+5YmEof4fmthJB7pQ8J
         kUm32nyX6wMxLFRWHwDB2kb0DFF1JqhQvwdym6WuLQDI+QPltciJAr3kqmKG3RZ4UMoA
         yDoPULmJp2SmYl4/CECuVR+sWJJTkK1B1xyYqgojOt/3YvgnoPXmBGlVAYVPTb/tfVNC
         E1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lIFW9cAuPlwQZ+C7VMU14IUSbtewdAOYVyCoJAKjzlQ=;
        b=cwzbs8e13LVe3+r5YSDeCBGyx594eSEdl0hldQFWNusamREqMDmuLZm1pYfinI1xV3
         sJge0fE96unvSAhrpUTpMZFBXTNL/SifqIC/mVCfltSivTuQSaTX6gEuhi3XmApKN8ky
         p5s0kN2nbrgODnzb0AWpwQX2t2E+g5fZ013Q2WApuQ5CBdN2ktfPlkWewYqs/GxHIT1f
         P3GKhVBNImp7nilcXCsMReGW0xxpOnx2wLuGXvtFzk0VOaXve4YGWMX3zIOC+4YjJd71
         4dsGLqfir4pDbG5AUl0aG+77Ua+fCXxqFSjWLOolN9d1kGRbMu+qH/N6DBa2Vy/o2dDk
         KYhg==
X-Gm-Message-State: AJIora+cFDD6mz1g6IGmDDXwYf8zymBuzEbrXbYF61qPDTNxnedQ48BO
	GQ+9gO9x/udM4KRpVRSgkF8=
X-Google-Smtp-Source: AGRyM1tGh13XWNJDm/Ne6cIvj9Kvnz3BzixxtTYVsFdR6x6xDxp58nyO22rT2LXODqdOE+tQ9eT2JA==
X-Received: by 2002:a17:90a:8d02:b0:1ec:a006:ea13 with SMTP id c2-20020a17090a8d0200b001eca006ea13mr1595429pjo.229.1655952706208;
        Wed, 22 Jun 2022 19:51:46 -0700 (PDT)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b00166423df3cdsm13510665pls.209.2022.06.22.19.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 19:51:45 -0700 (PDT)
Message-ID: <09ae5fd3-2276-5d76-a0bf-46dbffeeeade@gmail.com>
Date: Wed, 22 Jun 2022 19:51:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ARC:kernel:Fix typos in comments
Content-Language: en-US
To: Jilin Yuan <yuanjilin@cdjrlc.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, vgupta@kernel.org, Julia.Lawall@inria.fr,
 deng.changcheng@zte.com.cn, libang.linuxer@gmail.com
References: <20220622075204.35329-1-yuanjilin@cdjrlc.com>
From: Vineet Gupta <vineetg76@gmail.com>
In-Reply-To: <20220622075204.35329-1-yuanjilin@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_195148_275352_D3C0EECF 
X-CRM114-Status: GOOD (  14.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 6/22/22 00:52, Jilin Yuan wrote:
> Delete the redundant word 'call'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   arch/arc/kernel/smp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index d947473f1e6d..6c22a53711e9 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -393,7 +393,7 @@ irqreturn_t do_IPI(int irq, void *dev_id)
>    * API called by platform code to hookup arch-common ISR to their IPI IRQ
>    *
>    * Note: If IPI is provided by platform (vs. say ARC MCIP), their intc setup/map
> - * function needs to call call irq_set_percpu_devid() for IPI IRQ, otherwise
> + * function needs to call irq_set_percpu_devid() for IPI IRQ, otherwise
>    * request_percpu_irq() below will fail
>    */
>   static DEFINE_PER_CPU(int, ipi_dev);

I'd prefer to have this is the other fix in a single change. No point 
increasing commits for trivial things.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
