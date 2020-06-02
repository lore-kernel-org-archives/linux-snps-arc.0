Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBD9C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 18:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5222072F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 18:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1gEUZgm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhwwWLwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5222072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9YOynljEjkHaTyZNF2cSw+SROVbINZLlbReOkB0abg=; b=r1gEUZgmhcHryq
	j/8U3Do3jUW3ZVIBlgPZ80/Kb8xMZHWI4fdqcrbymC1Ve2V+JbFB09msvRPh7KM9jGvjkH29AVQy3
	kbZptcbw6rAk/v6myvO29/dr06OwDDaj59gIo2k2PzXKll1GVquys8hYoj4Jke8HjhCoEXNZJd1p+
	mfue/P2G3MxUCRSwZW8J7SUy7Ad3dI+H0ylPz+AzgqpMFasoEbyLBxjIcUtHa+jR3DcZuonjNjGJc
	IA6BOXpbbquq4dvlwZaahNfw+iLoemkYG8BFee0AnH79Yf+QcmN7Uyh7iNx9NTmYiU1CZBgZTOOK5
	yExCazVBOA5V+0eMQbeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgBlN-0006vV-B7; Tue, 02 Jun 2020 18:35:49 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgBlH-0006v6-Tz
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 18:35:48 +0000
Received: by mail-qk1-x741.google.com with SMTP id w1so13550788qkw.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Jun 2020 11:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iXYpvogKbvT6aEaCLd2jUS4hzIXZtKj6irTxf+GWpQA=;
 b=hhwwWLwe3iCZdnDBL6ygXcZH7yVgyBJCYZt/8u2toqVpna5Wd6WkREf8WH5InOL8QF
 OefAxDBWiPSRah7PCwVjW3HntPJ7JgBg1eEuyAtKRgbCggrHA+DMtqmdu3fgZvRqfPv0
 3YjjxvFTuX+OXa5WgC8GMy5iDyOX0jOuUfxKbXe4aB+dVowgMBqqnAc0Xml5ZTRfX8lS
 eHfdL4hKRs2IO8vplG3+WuF1yNUmbBA5jW7UWns8n8o99Hvn1Eg7HyDCk/hktqsauTCa
 /O8nAnNQ2fQ/51xdY2ZATNe1f2kIWVSzGGh9bFDRrxddkrA8CukcAgYlQ9fatXgelNmx
 L5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iXYpvogKbvT6aEaCLd2jUS4hzIXZtKj6irTxf+GWpQA=;
 b=AGV+5H7zx/xC153/fMBWXTa5WGqluyuB7Q0aaQzo27QSWWzkYtQ88l/vV06G3KlIKr
 KK/TTnAVqbHHdmSoiXTxIuI+7/AiRu2dnKgmHveV7gz+tT/U0P4kwXuiP4aS3hSD+7Xi
 QeTIAgNqSP4iLISlba3tZSZ1XHld1oGA5sPsHTMb++YJ7Y0DDGhf5LrycBEbOwl52iKL
 b5ItEalzzoS2ffovK4iv8VCW0tSh6ntv5RXn6ZkUi5rsmbo4dYOImU5DHw2rXrSiQJfq
 IRCdRdT9UkmlMERuvReDFNQxijzWNx7Nq5Sdm2vUsDdApztuNc4cgfXJux0XvM/WiCCB
 EwVg==
X-Gm-Message-State: AOAM533iJlhGGmpysTbIwp1PB3zMv+HXsCjx9el+xft+pUK6ymEl16/l
 AnMbvRWZNNcRvYBMztDbYAeSOAsxQHI=
X-Google-Smtp-Source: ABdhPJzMsbbaoqJ4ApCdascZ4MmodNJNXT5MdE7xYG53A3tVFYGlq07cO3BCQFTZPb2gZ1pSfNPy8A==
X-Received: by 2002:a37:f505:: with SMTP id l5mr25580236qkk.118.1591122942003; 
 Tue, 02 Jun 2020 11:35:42 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id r57sm3561822qtr.41.2020.06.02.11.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 11:35:41 -0700 (PDT)
Subject: Re: static inline math functions (was Re: [PATCH v6 06/13] ARC:
 hardware floating point support)
To: Joseph Myers <joseph@codesourcery.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
 <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
 <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
 <5b06914d-acb3-4404-4ff2-93bb7a04f8f5@synopsys.com>
 <07887c48-7e07-9f89-035d-3f336a16f2da@synopsys.com>
 <alpine.DEB.2.21.2006021812590.3673@digraph.polyomino.org.uk>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0a485f16-b420-4d9d-36cc-cd769bff284a@linaro.org>
Date: Tue, 2 Jun 2020 15:35:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006021812590.3673@digraph.polyomino.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_113544_423125_B256C5CC 
X-CRM114-Status: UNSURE (   9.31  )
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



On 02/06/2020 15:13, Joseph Myers wrote:
> On Tue, 2 Jun 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Thi s approach seems to trip math/check-installed-headers.out
>>
>>
>> :::: -std=c89
>> In file included from ../include/fpu_control.h:2,
>> from /tmp/cih_test_Nknxdp.c:8:
>> ../sysdeps/arc/fpu_control.h:82:14: error: expected ';' before 'unsigned'
>> 82 | static inline unsigned int arc_fpu_getcw(void)
>>
>>
>> Any tips ?
> 
> Installed headers have to use __inline instead of inline to work in C90 
> mode.
> 

Do we need to export _FPU_{GET,SET}CW macros? Otherwise we remove it and
move the fp hardware control register to an internal definition?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
