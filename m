Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC5CC433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 19:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0847F235DD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 19:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0847F235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZtrVTQUrizU5GHh/vp2EL5ELGSHrp77WyVQTz7iQF5U=; b=3I0JAsmP6me1CyjImb13YEIST
	iYn8NRfq3KyN/g6rt9CNcwx1/R4FX+frRoJldXUs7GFQpKP8sO74Fl5z1xWo2YmwCc3BGZarwEDmb
	TbxUyfAmoFZHlhpI5kQaABuOslJF56q90m0nVGptw/iZhmHR/uAWAmVEGCYcxygGIIluYTfAuusRu
	6WpSBKUlHYEEMup7LFIC67dutPqQNmcOVgLePM1bDQrmFnDUxcbhq8VeJLXZBco/uNlcBR0+gVo5+
	C3trXNUoGJlLxTDDNS/n5Q2Pg7gy1dTgtGG1jWSgo9W+1Yg2b5oA3xdZPWC0tYboSq1j+YoGdQ9yH
	og1UJ5nVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0V9j-00024b-VU; Fri, 15 Jan 2021 19:53:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0V9g-00023C-T5
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 19:53:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id x18so5242351pln.6
 for <linux-snps-arc@lists.infradead.org>; Fri, 15 Jan 2021 11:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3bs5xcrZ9LyHBLAtwcKrXhrWvfu/7/Kyd6NvS1oE+iE=;
 b=qgN3wSMSn5p4DgmOLyRqquDHTtOzzEhoAb7ws9gSo/1g69+D4qPAazwFKn4v9YO2Ku
 /ZAlw/uTM1u3gp17bqB9aLlWGoAD6QM30sDesTsx+erOuXLgq4Vjr6hpWijS69NmTTD/
 Sf0uHjr9xzIbxAC80QN0kNZJYXOcwEsO3LGdRG2q5YM6GDHhAVbVapqjkPq8IIY3ywl6
 7sXW1b0JInPvDtS0TgnB1Yi3Dp7JrZ94S8bx3Xk+4IQZy87+3aaKINLtSKotq/SRP4Wb
 y0/54ipwLTOTx3DUz6Eajgf/1TBeG7bNKpuPc0gaEJACzV7x+SnrJfR0XjSj58lAxXrI
 VvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3bs5xcrZ9LyHBLAtwcKrXhrWvfu/7/Kyd6NvS1oE+iE=;
 b=onQrqEuddET5cj17PlIaebuwQsIbEUksnJCzDfDTR7clXlf0DApjg5B3E8bGvw0GOz
 RhyhTv0Or0yTghXUSvxFtNpU9b1U6R2be+/1ZNz73YDE+rGz/u/Acz8/gZku7+Uh3B7U
 fU8nAa+ApaAs6ylj7ZEx1w1bfy8BFkxQ7JYfSh5Q8Keat666yvvCe41mg/bHwaCtBwcQ
 CMyo+dB3lqihxeqamjM+5b5N6ceMwPzWlfuMuWoyO054++18tyogP5Pn0k9tWoID9NhV
 20tYoniCDFyAoONTD6+NACV0JiheztORrQ3UgWZqpfw9nOM19Wq0tmL2MKU2+ngcAGra
 UoZA==
X-Gm-Message-State: AOAM531bet8tQiA11yzFR0S+5fG9M+zNl/xBrQMgD1qXZ++hF5QwQyf1
 pOjAsJIvxYfmYbaofvCOYGAGwA==
X-Google-Smtp-Source: ABdhPJxaYVdwHV3fth/mIA4Z2a9SQ9LoiRAUl+gBmFsHHaJUGVJWnZ+qMDZC0fb8G9JF0sPBsZ5rag==
X-Received: by 2002:a17:902:8c85:b029:dc:31af:90a6 with SMTP id
 t5-20020a1709028c85b02900dc31af90a6mr14202094plo.37.1610740383417; 
 Fri, 15 Jan 2021 11:53:03 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x15sm8539795pfi.184.2021.01.15.11.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 11:53:02 -0800 (PST)
Subject: Re: [PATCH 03/15] arc: Opcode definitions table
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-4-cupertinomiranda@gmail.com>
 <7336e0b3-13e8-a3d7-46fb-a4ea942c5c16@linaro.org>
 <214ddc83-cf6e-20e7-0a86-92af851809e4@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82625937-3d2a-857d-4791-77f60a892e68@linaro.org>
Date: Fri, 15 Jan 2021 09:52:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <214ddc83-cf6e-20e7-0a86-92af851809e4@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_145309_230488_C24B03D2 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/15/21 7:11 AM, Cupertino Miranda wrote:
> As you know, we reused the code from binutils to implement the decoder.
> In that sense, we kindly request to allow us to do it through binutils 
> development flow later on. We will change the tables in binutils
> and those changes will also be mirrored to QEMU.
> Is this Ok ?

Yes, certainly.


r~


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
