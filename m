Return-Path: <SRS0=UT4s=43=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF43C10F27
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 17:59:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC5621927
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Mar 2020 17:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gNGlTya5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gxZFHSsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC5621927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qH/3FlSgXa3PAEsKGU6RHw2M+g23I3G/Mqi+XHc99hQ=; b=gNGlTya5b6VjPn
	d2jc6YlxJEA61R2Kju3mdS+Efxq6pppGkdGRgxVCTBt6aoyDNQiTPm0HlWxqYhoQ2fGoiNLNwvUmR
	5CXbjANQyrLh0oAz1Z20WC3Sw0lgP0iNHL0w+/pKpIYMAhrax5GCQPcYWYOEBL6QuAK2Z28y5DeQR
	b5gy13KUHd1Fr4K8/wvOK9u+91pp5W4OMLnKNsXcvEC/w6zyKqxTSVGraeLQdT7BkeGbn+Ke0PtpO
	xyUFuysFmjRUGI6H6+453mvQgUN4dPjBnIntkDp9Jzq2s5dGX/KtHjXZDjoXrTQmc1PR7zhKY8Oq7
	cOQxsTp7AJMNVlg05HAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjAM-00053u-6U; Tue, 10 Mar 2020 17:59:42 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjAJ-00053T-CX
 for linux-snps-arc@lists.infradead.org; Tue, 10 Mar 2020 17:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583863177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeAVsQQER1DjrgzdxsI9VAAnpLOyGD0P/QTD/SNhFa0=;
 b=gxZFHSsaFvmj8MzVvIS9zbi+SUk7WbZEuI65AtKnZrixLqNsnNl9oYYfWuvMFsF2cNPkV8
 fWqOvhdmyiRue0vicNfTDEIc8QJaJVFapx2N8jFnSUTfyf6A8CnotvW3yzq8kMAor2RKHS
 OP3eHN1B57fjJMZXlw2rZKZlD3hyztE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-XnI6GsEjNUuMGjZD7giU-Q-1; Tue, 10 Mar 2020 13:57:36 -0400
X-MC-Unique: XnI6GsEjNUuMGjZD7giU-Q-1
Received: by mail-qk1-f198.google.com with SMTP id t186so10289699qkf.9
 for <linux-snps-arc@lists.infradead.org>; Tue, 10 Mar 2020 10:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eeAVsQQER1DjrgzdxsI9VAAnpLOyGD0P/QTD/SNhFa0=;
 b=Xto+5iZRqdjyoekV2ZR5quBrL+LzfBAMpzn1UA1QpvaEYC6BpvwKqo9Bncju+imGsK
 GF9lfFRUXOqvYaX+nLY1/kMRpAsNef4sSHIJnm/Ze/dFPH2znAV4W7x19JfXE9eDQM1O
 AG0RDnLa1JrQn+1nu1nKXsMWf7wEHJYRq4Q7RfBmHeIZljuHEtoaMEqB7gankzEJPbWr
 UCio4YW5oq8APwxGA8cNyjx+HwFOerPir76lkqyLgG/OHISkjsNlI1FMzXsPPPWFcRsK
 YrtIRmIPyWnMi19PinVYXQIT63BlA2gEw8QCXQc74LU5WoeY0ng+1P9lUKMGa/Bz9OQO
 xl3g==
X-Gm-Message-State: ANhLgQ1PyyUS0eecjo9fdwHuk0OIms8gkczPOkvTA/gXT9H4//gKr3t7
 dwuJep/nV7pnbzvNaRys5W0egPpiSg575WD1aPaeUlvElvYzRWGqM9XEkjXt9+K6GP96pwa0Pqi
 hlyVXMbQvFgvdThxfk+mXBsbvT1dVoGCc
X-Received: by 2002:a0c:edc5:: with SMTP id i5mr19965632qvr.16.1583863055281; 
 Tue, 10 Mar 2020 10:57:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtleYbA83/9r3yWXFVpLV7dFcsANsrbDlr0GUqJU6VxQUTOGCudfDMws9PL4p75GfTZN7Eilg==
X-Received: by 2002:a0c:edc5:: with SMTP id i5mr19965615qvr.16.1583863055030; 
 Tue, 10 Mar 2020 10:57:35 -0700 (PDT)
Received: from [192.168.1.4] (135-23-175-75.cpe.pppoe.ca. [135.23.175.75])
 by smtp.gmail.com with ESMTPSA id k66sm11720032qke.10.2020.03.10.10.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 10:57:34 -0700 (PDT)
Subject: Re: sourceware account access (was Re: [PATCH v3 01/17] gcc PR 88409:
 miscompilation due to missing cc clobber in longlong.h macros)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Joseph Myers <joseph@codesourcery.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-2-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070012230.26274@digraph.polyomino.org.uk>
 <c44fbf35-1033-455b-55b4-774b9a680e72@synopsys.com>
 <6919df79-8fe0-5d4a-0904-f44c660b697d@synopsys.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
Message-ID: <81301ef0-7e97-3404-4b60-d9424566e787@redhat.com>
Date: Tue, 10 Mar 2020 13:57:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6919df79-8fe0-5d4a-0904-f44c660b697d@synopsys.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_105939_503300_5418673F 
X-CRM114-Status: GOOD (  11.83  )
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

On 3/10/20 1:23 PM, Vineet Gupta wrote:
> On 3/6/20 4:21 PM, Vineet Gupta wrote:
>>
>> BTW, I don't think I asked for commit access before. I just rechecked MAINTAINERS
>> wiki page and seems like someone needs to grant me that.
> 
> Hi Joseph, Carlos
> 
> I'm trying to setup my sourceware account etc and the form below [1] needs "email
> address of person who approved request". Whats the typical procedure for getting
> that ?

Please take a look at the following page:

"Becoming a maintainer (developer)":
https://sourceware.org/glibc/wiki/MAINTAINERS#Becoming_a_maintainer_.28developer.29
~~~
5. Ask for commit access.

    * Ask one of the project stewards to authorize your commit access.

    * If the project steward authorizes you for commit access follow these 
      instructions to create a sourceware account with commit access to the
      glibc repository. 
~~~

Joseph and I are both stewards.
"Project stewards (GNU package maintainers)"
https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29

I would be happy to authorize your commit access.

I assume your intent is to be one of the machine maintainers for ARC?

> Thx,
> -Vineet
> 
> [1] https://sourceware.org/cgi-bin/pdw/ps_form.cgi
> 

-- 
Cheers,
Carlos.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
