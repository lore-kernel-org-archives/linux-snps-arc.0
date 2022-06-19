Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45B7C43334
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jun 2022 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFCQjvcGBITfPCGfof1aLSxdLTNsWo9ppWKFdt6jPU0=; b=iZ/DMVIUxe4SyX
	UrppP/HhvDZpudL1v6ApLho4O4xVu6EPkZVu6VzuW4gY4X25FhXVerrh0h5SOHjcyPApJJcD1sdo5
	MqFrq92UDviq19cutZ4aYeNSjelINOPixbVEhiekdsvp8LTlLa44qIKlJqhLtqDp3vJUWGjKLeSJM
	vCINkYmvQcQTM+5UfN7csd2re4sDWo4kUBAoQ1EnuKNKa4eHGJgOmO7o8BMU9CfnNEvZb5hpfEwYK
	Bcg8obT2wH5Heg8NUlyzdUfVepcpxUQJ7Pg88O/ZRm/unJb7sTL9z5NsgMgSh7MLM3CWYMiUAv0kw
	8sxQa2Txhe7f9qjyn6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2wj5-00EX0B-78; Sun, 19 Jun 2022 15:20:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2wiw-00EWsP-Rg
	for linux-snps-arc@lists.infradead.org; Sun, 19 Jun 2022 15:20:29 +0000
Received: by mail-ed1-x529.google.com with SMTP id e2so999094edv.3
        for <linux-snps-arc@lists.infradead.org>; Sun, 19 Jun 2022 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ZoUTVmKn87SbxTBnNCyremQb3JSCikfE3BE0UGUljKs=;
        b=MSM9Z4u8PTmaBgL3oppYz5Ijm0dRPyhNRd4Rt8t9+Kgc45fyYkJHLiTS6XIM9K1WsO
         SIfqJNq0IrLsuhxxniYAuBauBEF2LPuvuSj3i4W8z6JVMuiTO+9LG8kd+QovNdt7JPMe
         RCz77FjWfR2/CN3wpe5Oqdoj4tNcL4zb+w+HvPB9/EFqsm0ef5MdFgxt6zEFBoqvQqIn
         DcCx9Axy4qP+6K8kNW4TLOTa+215nNRo8KvxyLkeL0I8uRDN6fM/jWl3VYlj7KKviuOD
         iFwhmbcEFsCLsCUCMCSJJyApLL/0vY3ECNO9qpjbxhDcSG2mibXTbggS3adj8C9f6YTm
         h09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ZoUTVmKn87SbxTBnNCyremQb3JSCikfE3BE0UGUljKs=;
        b=Mw7qOk+jUL/cHUOL4K6RmcjHocFmWlvZpDfBXq1vJtDdXLmXf0nge9dNfWkpYcqvY4
         SK1VPZ6rTgSktVG6lDGJ4/WIpg5bxL4lc1td7yCXoeQ+0RH7dQx/5Rw32S01l8mOMnt0
         fh/pG0+9UkBA7ziecl+hDRQXrsUMnnQ/1ISZtlK1P5EI4v9xmkCI79SRU/JM+lzRMk+s
         Teg+dxHU7hAyudUVU9a97d2g2WdkVjZ52BVYvgegnmZugFzdIuG+XGaDag7Wsu4nAMs8
         eP8EyuqhCWnL0/VsYOU/8uBfRumCzo+FPvUdw5J4J8u4Y6zeJiwN7eGA8QrQX0/r88J5
         gy2A==
X-Gm-Message-State: AJIora/tixbubfdD+wnkUp+FAliIS1A9Px/XTKXU9aMSt1fgXVkYnQvI
	S6j5VouDZ3RTFrIo4dsVBOSABw==
X-Google-Smtp-Source: AGRyM1vHwqHbVYiH0TwwztiN1MxRJRaVE43jJH3BGMhCjb4FZZrXQnIYyaMYNn9m/2Nky4pXySgB9A==
X-Received: by 2002:a05:6402:2753:b0:431:9c8b:5635 with SMTP id z19-20020a056402275300b004319c8b5635mr24164596edd.152.1655652023380;
        Sun, 19 Jun 2022 08:20:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385? (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be. [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b006fee98045cdsm4742429eju.10.2022.06.19.08.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 08:20:22 -0700 (PDT)
Message-ID: <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
Date: Sun, 19 Jun 2022 17:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_082027_239742_DFA0B568 
X-CRM114-Status: GOOD (  17.16  )
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



On 16/06/2022 10:11, Shahab Vahedi wrote:
> On 6/16/22 01:27, James Hilliard wrote:
>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
>> <buildroot@buildroot.org> wrote:
>>>
>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
>>>>
>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
>>>>
>>>>   How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>>>
>>> No, I don't do any sort of trickery to build bpftool on my end. The
>>> bootstrapping, if becomes available for your configuration, uses clang
>>> and only clang. I tried to explain this in v4 of the patch [1], the
>>> second paragraph of the commit message.
>>
>> I think clang/llvm support isn't going to work correctly yet since we only have
>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
>>
>> Minimum clang/llvm version for libbpf co-re is version 10:
>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> 
> You're right about the clang version, but it doesn't have anything to do
> with Buildroot's clang. The build process uses the clang that is installed
> on the host. For Debian bullseye, that is clang 11.
 >
> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.


  Hm, that smells like we actually want to build host-clang (after updating it 
to 11.1.0 of course) so that we are sure a known version of clang is used. 
Possibly with a check-host-clang check to avoid building it if the installed 
clang is good enough.

  And we probably want a user-visible option to enable co-re then, because it's 
going to be expensive to build.

  Regards,
  Arnout


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
