Return-Path: <SRS0=wWAH=LS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523ACC49EA7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Jun 2021 13:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2F7613C3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Jun 2021 13:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2F7613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12FoEuw2fy/mk8VMvUsNtCPwNwEWd73WdEpoMlOHdjQ=; b=zeK0DbCDZIyBN6Prxabuv17NgL
	aGXxzMd9mhIJ6gY55/LQMK+zSAaYa8RuQ50mPGDolVW3uefKNlawuhoMxsfbrUAg6Br9g560Ot5ML
	vLE1hC9wHuYsBZP0k7DGEpWoxGjtt6JoN3zJHBEzHPb+vFscj2+4K1kk8srByMh1I5c8NtY1TqNq8
	73BInvLFfgYAHzu3sGxzLmAD+OBg9t4ISWPXN7LfR8MDOtnC8HBqPSxnXhjdVA/rjXIXasv1JIsXr
	ru8/p8qOf4wxrx2Zpo83/Lcqzj6UTmIhoCBK3c/DiRqM+Tp7lKLYx9/9x9rM8RrNzEO+1BW/FKbei
	mX2XGsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwP0l-00EjOp-IN; Thu, 24 Jun 2021 13:03:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwP0i-00EjMu-QP
 for linux-snps-arc@lists.infradead.org; Thu, 24 Jun 2021 13:03:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id h1so2931589plt.1
 for <linux-snps-arc@lists.infradead.org>; Thu, 24 Jun 2021 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E3eH9j6x/2bPR+R4Avd9Zya3U/JJfgeOubfcePdRb30=;
 b=TM507lOrxyUf7DwSIdZ7SwnXqo3TOVOBtptLkJUtdPw6FUmGiD5mxOBaHx62zls0Bb
 TuIqQC/7Itk4IJ8J79dXkgWHrjh72TtEfoI1LmnUQI/zcKb/P9uRPzRyA5BT24wRLv/R
 Ip4zGeZ1zd8Px2QZM/+PSCFZJN6D44+7AEnUiBv3jEx9wQkRK9icAfNLGBe0ozsVm/0T
 9XjJpBLGMC7P/68LRtijJlIPmMgyUlpDoZDGSUITbjWaAAsPhDrZTsl+vp79xS6nQt79
 /g0Sn01KE1QUWzkLPTPy4yZvKct4KYxAAXFfakZ8z7Pfl8RVYmYbU/SGP/79FpzlWjKK
 ktzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3eH9j6x/2bPR+R4Avd9Zya3U/JJfgeOubfcePdRb30=;
 b=FOIFUoNqa5jZDDk33al4cJhcLEl7SIdSJq/VosTfanQWsem4pfQdkz+NXzvhJ20K2o
 dHtNrZ+oR5xSWMDR2hY9BA3AQl/Ol7hL2ccxlFx9ZgJ75wG7muy7X84oD0QOUJDdTf9h
 +A4YgvRZyWi8pWAkR9DrRomiCF/G4h9ijj8K63h+U2Z91VEOjdRgTlEwAv5gA4BHnled
 DVjLCaTauqrAwlUbaoYkfMKETozIHjgPK11ISzy4EV05DKhchuG0gFW+Stbt+p56RS/q
 WvC0bB6Top4n8zqBX8056WIuFkwgBXVml8by7tP5EviUanLWlmLMAPG3VJHFt34re8qe
 exvA==
X-Gm-Message-State: AOAM533aWF2GCSg4vFixOxJiJdosC6HFk6gKbji3VECV8L+X3AbsZqcU
 vpwU/wv7mQH463vbCFXIhBE=
X-Google-Smtp-Source: ABdhPJw/7HIeSLNQgrQDsvyahW7D55+qe5uZfS2tJQUQjAUWRCQM5f+XuC8Wy2S1cmK9CngRgiHofA==
X-Received: by 2002:a17:902:da8c:b029:127:a075:cb with SMTP id
 j12-20020a170902da8cb0290127a07500cbmr1224288plx.26.1624539787903; 
 Thu, 24 Jun 2021 06:03:07 -0700 (PDT)
Received: from [192.168.0.118] ([103.242.196.10])
 by smtp.gmail.com with ESMTPSA id z24sm1939330pfr.79.2021.06.24.06.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 06:03:07 -0700 (PDT)
Subject: Re: [question] De-registration does not remove port
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vgupta@synopsys.com, Jiri Slaby <jirislaby@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
 Pavel Andrianov <andrianov@ispras.ru>
References: <3e131267-e1b3-1b83-f8be-0577da479223@gmail.com>
 <YNLfcKFL1LkJgXAR@kroah.com>
From: Saubhik Mukherjee <saubhik.mukherjee@gmail.com>
Message-ID: <7af6c0a5-c990-5a40-104e-13f44b1cb4c5@gmail.com>
Date: Thu, 24 Jun 2021 18:33:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNLfcKFL1LkJgXAR@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_060312_907363_E01424C3 
X-CRM114-Status: GOOD (  13.64  )
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

On 6/23/21 12:44 PM, Greg KH wrote:
> On Wed, Jun 23, 2021 at 11:42:36AM +0530, Saubhik Mukherjee wrote:
>> In drivers/tty/serial/arc_uart.c, arc_serial_remove always returns 0,
>> instead of calling uart_remove_one_port to remove uart port from serial
>> core. The comment says "This will be never be called". In my understanding,
>> a port added using uart_add_one_port should be removed during
>> de-registration.
>>
>> Is there a reason for this behavior?
> 
> Did you test the code to see if that function will ever be called?

I would like to reformulate the question: Suppose arc_serial_remove is 
never called. Then I would like to know how the driver de-registration 
is organized since the UART port is never removed?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
