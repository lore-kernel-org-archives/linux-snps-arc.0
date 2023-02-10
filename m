Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D0CC05027
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Feb 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Id9ITtlDZVcOxbVqoli1z8atC1y0jdpLuiikWqM6cPQ=; b=igYvlfw+6qC8Ih
	UucGEBL1u+NOpqL1SCWQo/sRGlwKGPhNKfkR9eY0qt7PQiVQ1RA7hD2BGy2eo8VVQRwnMvPXWK7qx
	EHw1jrfJAlF6BA0kdQEowgGWTTWQ+gbeTAF0FyG7i935Yes1i7HsMKoRUNuY0Du4X4g6vM4Igb5tk
	SC085Mp3yMPqX+x/DYZ24Tt9IwCSpvFUvXw2Bv89wV1BU9cZS3EQPY4lX5tjM1aOdOzhaZ+b+RKwR
	E7FOlldeWiSpf3rYuu4b/rx4qTWuKhuZaL3S/iHG6/4tu4y8mz3WCJxIitCd5QmBjtt8PPdZR7Kru
	bB6QO+u4fUPuEBBk5GTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQTCd-005mvy-Vl; Fri, 10 Feb 2023 13:12:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQTCY-005muw-I7
	for linux-snps-arc@lists.infradead.org; Fri, 10 Feb 2023 13:12:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so4014350wmb.5
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Feb 2023 05:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39V+G+KNQS9FdXJkfeH4lM3TKpEM5glYr9e/0QEkjYY=;
        b=USkDu/KrUW4aquCfgJzJEXoLagqPOg8Y2ZRqhK6CJ97itdwOo2JASZ+kL9KfkXJU8R
         B5bafILnXaormADmyR3IAMMs7wppUymGXuNsB9SzqIlcq8SfCWPl7WdYd8oBMgW8Tt2s
         uW1khQazdWKK2O7twjKHnjVfGJZhrKJwURCZ0kRpcK2avG3CJMjyvOZ4ho0U8gMw1G5N
         4o+LSFYhGK0sVuUMzvitSYlzNNbAXZjCIavcYiAtjdw3sBk+eVlsS41Y9NRZayXhq0D6
         vBRIwzIAVriDP8Z5jbAwZqZ0mB/MTqGjK1V2z1TsZ9ObvuHnFXVzY5TmEMT4hZGrlWeI
         TgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39V+G+KNQS9FdXJkfeH4lM3TKpEM5glYr9e/0QEkjYY=;
        b=2I6ghelm4C2fjXkZnRfRSMmaU1UUis2sB2tbn9odjxEpDXm1OyDAMJ+1e0eUgPWBvF
         QQuApouM2MlcX0WDfPjT1bsd6UFtXNNHFvVagoUww0PLV+aRUvwyqiWxLSRkyxPwho0n
         aog6241nxvB7sPHd+Pvt0yUKu0SbcbvxuY3aS35jb7590v7MoSB829C47AM3JgIa1eRO
         bNTwNm38ZGA5QI//Ipc7Ox2t0RziQsWUV71KpHr20d+C34aLO4JsWmv/L0SE0s1iIzef
         zTCmSTbqT0Toi/z51NEaCp6WEx+P8HA/RcfSjM/q1GM1cL6lfll6EVIZUhARi/vUYrE/
         iAQw==
X-Gm-Message-State: AO0yUKV/tD1mvmrW0Q7Lbzh1ld5/vonmsW0rLgZJgNIrUVYP5WHDQIim
	nKBPmGd0tpzW+3vnVJSNxXElSw==
X-Google-Smtp-Source: AK7set+dXrEmOIlyhkbDhTsso2vacR0m0p4V1yKz9Eph3mhsUTGZjn8GyMreOnjzmnqMtzGe2bjFgQ==
X-Received: by 2002:a05:600c:81b:b0:3c6:e63e:23e9 with SMTP id k27-20020a05600c081b00b003c6e63e23e9mr16254083wmp.24.1676034748990;
        Fri, 10 Feb 2023 05:12:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385? (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be. [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003dc433355aasm5935075wmo.18.2023.02.10.05.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 05:12:28 -0800 (PST)
Message-ID: <ec7ec881-a6f6-12cc-4f3f-b9c1ff2d077c@mind.be>
Date: Fri, 10 Feb 2023 14:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
 <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
 <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
 <1750a14f-36a1-fe51-1452-3a72b84979c5@mind.be>
 <9a8b4ac5-6ffb-e8d8-3587-2768e004780e@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <9a8b4ac5-6ffb-e8d8-3587-2768e004780e@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_051230_637827_8145FB36 
X-CRM114-Status: GOOD (  24.83  )
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



On 10/02/2023 10:17, Shahab Vahedi wrote:
> On 2/9/23 21:27, Arnout Vandecappelle wrote:
>>
>> On 09/02/2023 13:23, Shahab Vahedi wrote:
>>>
>>> On 2/8/23 17:36, Arnout Vandecappelle wrote:
>>>>
>>>> It's not clear to me why you did a revert of the cookie feature rather than
>>>> using those patches. I think the first two or three should be sufficient to
>>>> fix your issue?
>>>
>>> Ideally, the correct way would be applying that pending series. But since
>>> there were comments that some of the patches might need reworking [1], I did
>>
>>   I don't see anything in that thread about rework being needed, only some
>>   complaints about some mail gateway encrypting messages so they can't be
>>   read by some recipients...
> See this [1] and the response here [2]. Having read it again, apparently it is

  Ah, but I guessed that that patch was not relevant for the issue you are 
facing. I had the impression only the first two or three patches of the series 
are relevant.

> not such a big deal. Alexander, the author, mentioned that he will redo that
> part in v3 of the patch the way David suggested. So either, I can make that
> change when submitting to Buildroot, or take it as it is. Your call.
> 
> [1]
> https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#m42db58567febf12040f6ba0478e1a6148c284c55
> 
> [2]
> https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#m293896646128262621c83e8c15c4d977f92ad0d2
> 
>>> not feel confident to add them. Therefore, I tried to keep my solution minimal
>>> and solve it by eliminating the problem. I know, it is not appealing.
>>
>>   The problem with your patch is that it is very difficult to decide if it
>>   should be kept or not when bumping the version. Plus, some people (or other
>>   packages) may rely on the feature that you remove.
> 
> I can try to apply that patch series on top of bpftool-v7.1.0-br1.tar.gz in
> buildroot. If it can be done fairly easily, I will submit it on a different
> thread.

  Thanks!

  Regards,
  Arnout


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
