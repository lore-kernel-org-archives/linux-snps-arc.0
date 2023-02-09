Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5515C636D3
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Feb 2023 20:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY10ZoYGlobXfLlsyAgNHxYPWSSAbxfGGvrLobuCsxw=; b=tJWTj8mcIlZJH8
	cC4sCAedJRhOWVCr93ia7Xgl2NbYf5IkPoX28FILKRywNgP8wqVrYqbTRBMetnvxzLeFrUtpu2vtZ
	T5WiQSE/ngBiDmv0UD6dfn80UlwP56PfLswmAfqf36FKzvtnIXE2eisUm9z7TvD51FWLeupwuIhvX
	n0y60vWflDJAoJGhSf1irdbAUV03xkk9vikwUjPbPBlHKE+6SNDZmvNeZ8wkp27uux+xXt675zb3P
	gDUkz5+T9HglCzXrfuTPNyvURJ0pNb+aVNjFy2Q8reOkxQ+wX4URMJL6yvAsHEED/oMp0DWQsigl1
	c/CPNV3XMMQk06m3WRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDVs-003Ame-DM; Thu, 09 Feb 2023 20:27:24 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDVp-003Alx-C3
	for linux-snps-arc@lists.infradead.org; Thu, 09 Feb 2023 20:27:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id sa10so10008153ejc.9
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Feb 2023 12:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEALyU5EV7ylzVMhoUpQlEL/wKddDK6XCXjgoHqa0GQ=;
        b=ied3T99VQUAeM07nAKuUTDRK1pC3x1ciw+ml7lbI4KTLs4ZJiCsmQr29h8eyUrl0on
         KOG4IRg4rqykYzA3HVBqFZWCluWzQRNmj08OL6UjyKUj8ohCVLHEqOa+URneD7xt2Lo7
         AEwLIE6j8Z9Gxu7PwGhm07D4LTp77j7aRGe3dIHQAsLKrxsYBep3U7aioFCywpgdE5Zy
         QLUsT9IpP5YGOl8yNJotp55kmHqQOCnEUJx7m4yDSVn0EyEou0D9y3QO9NH4Vk1A76+P
         BRz+NqSrqBT6lBdG18/lky/RdxAQv71WNOUmJKUHkEci8w8axNt+4p6HqV2k6V2FP+rG
         z7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEALyU5EV7ylzVMhoUpQlEL/wKddDK6XCXjgoHqa0GQ=;
        b=yJdSUnjxRS6W2QRyDo3hRu5UC7IsC3JJt9oMD4HjcDlX2RE8Y/PBTCGmZIIaj55yLE
         cjTHfoqhoP2rdNYWzn48VUOfLXKeonedhlI0ruK/C47mNyhVwrjnvqDXht5nrXXiSc5j
         rqWt018MytuyuTiG6nigMPQSE8t0pMIQKhBvwDGRwQSvvFrZXZOyDcar6IunBIIUcFEh
         EamW0+w/RQ12erSgUDRvhI35RuzSb12eXWYOXFnw+JUgXQf4SoIpHXIuPQqjXsup3Asn
         EtCTcOWL2y/nGyqLbJd4y0nUmK6B4W9R4d4BYYYXFjY2GdG11H+L6I/gyaFbkyyrprGt
         4Nfw==
X-Gm-Message-State: AO0yUKWZc4zAnFmf/rf2CI2QRyegg3QSy5EDGCPYR8Ffh72znz/BWd6R
	vVrHA9wHbAqRTDXoDhk3zvq/mWyYDQYAiKSg
X-Google-Smtp-Source: AK7set8gPSV4WH7n2FCjZr2MvGml9wtJwglPw9Ivt/MmC1HbLpPIKWh/8ldjL8QXQyDpVhZjPk1mbg==
X-Received: by 2002:a17:907:6e1f:b0:8aa:502c:44d3 with SMTP id sd31-20020a1709076e1f00b008aa502c44d3mr15054781ejc.41.1675974435834;
        Thu, 09 Feb 2023 12:27:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385? (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be. [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
        by smtp.gmail.com with ESMTPSA id kt5-20020a170906aac500b007c1633cea13sm1339028ejb.12.2023.02.09.12.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 12:27:13 -0800 (PST)
Message-ID: <1750a14f-36a1-fe51-1452-3a72b84979c5@mind.be>
Date: Thu, 9 Feb 2023 21:27:11 +0100
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
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_122721_730652_98039475 
X-CRM114-Status: GOOD (  21.05  )
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



On 09/02/2023 13:23, Shahab Vahedi wrote:
> Hi Arnout,
> 
> On 2/8/23 17:36, Arnout Vandecappelle wrote:
>>
>> It's not clear to me why you did a revert of the cookie feature rather than
>> using those patches. I think the first two or three should be sufficient to
>> fix your issue?
> 
> Ideally, the correct way would be applying that pending series. But since
> there were comments that some of the patches might need reworking [1], I did

  I don't see anything in that thread about rework being needed, only some 
complaints about some mail gateway encrypting messages so they can't be read by 
some recipients...

> not feel confident to add them. Therefore, I tried to keep my solution minimal
> and solve it by eliminating the problem. I know, it is not appealing.

  The problem with your patch is that it is very difficult to decide if it 
should be kept or not when bumping the version. Plus, some people (or other 
packages) may rely on the feature that you remove.

  Regards,
  Arnout

> 
>> For the time being, I marked this as Changes Requested. If the upstream
>> patches are not sufficient, please send a mail upstream (as a reply to that
>> series) explaining the problem (again), and re-send this patch to
>> Buildroot. If it does fix things, please send a mail upstream to ask to
>> move the series forward (explaining the issue you have), and send a patch
>> to Buildroot that adds the needed patches.
> 
> They (re)confirmed the issue to me in the past [2] and are aware that its
> solution is missing from all the releases onward (see the first point of
> "Known bugs" in the release page [3]).
> 
> [1]
> https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#rb9ce86e9f25b2d097b88d87af8ffdfa401d63c68
> 
> [2]
> https://lore.kernel.org/bpf/b1a604e1-be09-ac0b-ff22-b194ae9ce886@isovalent.com/
> 
> [3]
> https://github.com/libbpf/bpftool/releases
> 
> --
> Shahab
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
