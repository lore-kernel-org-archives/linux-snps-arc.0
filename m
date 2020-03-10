Return-Path: <SRS0=UT4s=43=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46CDC10F27
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 18:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B29C20637
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 18:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HoWVWnhE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZldC9h8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B29C20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LJf1MesqK2gwU3DDyAjrg8mjGG76zaBF2Wx2kRW5wQ=; b=HoWVWnhExtZZv6
	6iqIZdRpYWgxn4YCMvkVyEtnAkMQeEUy3P04Y3yBzPHsq8QxhxC511XQIrLM6/259T49qQG72NL1q
	W1fssiy9ImT13w+TAHnlIZzXeOZxjFuQPVV36NnfExijpTejKoUpHMrb/Auyn2WB8fEyQrxMZv20U
	5gqlkdUGu71EYshvxy3FuGjg7Qe9mdvZTZ/6kqQ3l5fAK+PIV7YxFut87gZ5pLephpBpYLZ+FSoxX
	Suq5OS6EoIJrY7AF6oV99SW7+OxuICHhJhYbg3peVCYr1duEXEQMD/30LXLgzYxM3jHtEy44Hsww1
	wYaYQ3FMjfVXEzCIhMTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjLE-0003k8-Hf; Tue, 10 Mar 2020 18:10:56 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjKc-0003HW-Vs
 for linux-snps-arc@lists.infradead.org; Tue, 10 Mar 2020 18:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583863817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LnpMX7A7XXo8WbN1RR4XzFsUTC8Py+GUtcjzdfu0C5I=;
 b=ZldC9h8Kan6lVxCUDMRRwJuU2ZvAQo/bGHPVNYel//loAEuiYVUfee/0D2JmCm7WUnfnkn
 eTJhjVDkDw8jYpE+ibVBaMnH5EvCj7H7qNFuSC97aH31WL970ITMRJzQvV6WNm3jvxvi4t
 PDHkfd4ySZQZ5a/Mk/kz6vzOCC266dc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-KJsOJp-gO324KJF4CY9IcA-1; Tue, 10 Mar 2020 14:10:15 -0400
X-MC-Unique: KJsOJp-gO324KJF4CY9IcA-1
Received: by mail-qt1-f200.google.com with SMTP id p12so9674115qtu.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 10 Mar 2020 11:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LnpMX7A7XXo8WbN1RR4XzFsUTC8Py+GUtcjzdfu0C5I=;
 b=VD3W89r0Kx7iG29Q/C5K5frGGw2oXrVTU3xgeMkUNwRlDRhdd8/Sz0VVrcWPlhJRqP
 KCPaAKgYCDYWpIUlTv6eppsFRzhmHgkoExYKGJhLfMs204AtkXaMuQpNkTtoyo8jF13a
 cZ7pe0qkT9owd9T7z+0U/uGYfO7RE39e8XVuJOUCvVKggPJiV1dOkxGcBjJepD2aCXjJ
 ntLzHgaGLqNiqIgGKCykUtZJQS5k+SkC9WSoqlKQWvHgBT9gx0k+hAGitWlat2IbbhAH
 Gb66Wnf4paK8zNftbMqZQikJdB7M70JY5Za/Qw6tYR+/SGkUTK6dgf9EKH94RIjAjXNs
 lQrg==
X-Gm-Message-State: ANhLgQ2mZGH5bbksdo47IrJIHI9sf3pDjWtuyAiTjgy5pgfhp82bqzhv
 UvgBDnVxpWvIITvaZ07cYxxJEhabM501rh28VHDLnUnELdvSv57EaqykmkUvI3I2PEnFnWSZZZF
 LSpbg/S03foDXxqCezQ0a2SvPxF4p/DJT
X-Received: by 2002:ac8:6753:: with SMTP id n19mr19869499qtp.193.1583863815200; 
 Tue, 10 Mar 2020 11:10:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt3m/SBWp/g6pqmjuGcbVuDF8yMtYK1p1/xjRCZWsJvctnA91yzirmgWuFPmF4mezGL0LYWSQ==
X-Received: by 2002:ac8:6753:: with SMTP id n19mr19869417qtp.193.1583863814081; 
 Tue, 10 Mar 2020 11:10:14 -0700 (PDT)
Received: from [192.168.1.4] (135-23-175-75.cpe.pppoe.ca. [135.23.175.75])
 by smtp.gmail.com with ESMTPSA id w132sm1990682qkb.96.2020.03.10.11.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 11:10:13 -0700 (PDT)
Subject: Re: sourceware account access
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Joseph Myers <joseph@codesourcery.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-2-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070012230.26274@digraph.polyomino.org.uk>
 <c44fbf35-1033-455b-55b4-774b9a680e72@synopsys.com>
 <6919df79-8fe0-5d4a-0904-f44c660b697d@synopsys.com>
 <81301ef0-7e97-3404-4b60-d9424566e787@redhat.com>
 <80389f7d-0b24-d735-693b-0afe0ccb116a@synopsys.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
Message-ID: <ac3b4c4c-c744-8b7c-9274-40d576e4c34d@redhat.com>
Date: Tue, 10 Mar 2020 14:10:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <80389f7d-0b24-d735-693b-0afe0ccb116a@synopsys.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_111019_153974_F56C9B9A 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/10/20 2:08 PM, Vineet Gupta wrote:
> On 3/10/20 10:57 AM, Carlos O'Donell via Libc-alpha wrote:
>> Please take a look at the following page:
>>
>> "Becoming a maintainer (developer)":
>> https://sourceware.org/glibc/wiki/MAINTAINERS#Becoming_a_maintainer_.28developer.29
>> ~~~
>> 5. Ask for commit access.
>>
>>     * Ask one of the project stewards to authorize your commit access.
>>
>>     * If the project steward authorizes you for commit access follow these 
>>       instructions to create a sourceware account with commit access to the
>>       glibc repository. 
>> ~~~
>>
>> Joseph and I are both stewards.
>> "Project stewards (GNU package maintainers)"
>> https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29
>>
>> I would be happy to authorize your commit access.
>>
>> I assume your intent is to be one of the machine maintainers for ARC?
> 
> Yeah, this email was my indirect way of asking for commit access :-)
> Indeed this is for ARC glibc machine maintainer.

Please submit the request then and include my email.

-- 
Cheers,
Carlos.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
