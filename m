Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AF8CCA47A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFozYrbljlyd2pvhgaD8XPvx/UnObuk8Rxo/C0sNwIU=; b=RvEjwvjY01T8CG
	TW0SfWCowMExwRHhIW7r8ZmV1E0bzUSAy6gg/v77qnh5V5lCy21BUOhv+iXK2/cmrDhwKsGTKMbgh
	xwg1aVmmuu5DHZvM4oa3yf7h+O6tFn/Leglv5UNZk8+JdmcqYew5TQdBR6V53HzdG0gVC3UoHmjuh
	xul9e8HSazIJ6EHxscp/ZRg+ocpGW057g2OqXf+YZ5AS5//Qqq6zu3cIW3/t3mqmds2ClJ1K4LP/f
	Oxyc+cImUVlx8RvIux5TmLmeMZHu6YuU7uC41NWz/U3rlVPPMM02nFYs55uNllLG9bHNZLhVNR9tv
	IHJF6VTEZGvk8bNbxU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AKe-00AZie-6u; Tue, 14 Jun 2022 17:28:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AKb-00AZi3-Gq
	for linux-snps-arc@lists.infradead.org; Tue, 14 Jun 2022 17:27:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id gl15so18543782ejb.4
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jun 2022 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:organization:in-reply-to
         :content-transfer-encoding;
        bh=vSn4lIHKrS35nzkEATeJIYWFPusZMgfbeai9SuzVFB4=;
        b=cjXdiwEX+Tj1zlXLwmEntaBTCl5osVEwzhgSQwdr/FikPXUie8M2ybzH9/l0tuQr1m
         KrvdzPKCpgjxz3g7OG3VRucNWaDgTvY3F8zcp3GUuWo3/BzhnDQ0qDSlkoaGrLEvjDsj
         ekiU/ZMo9dZ37LCjl4nF2TOybjOBZ7DPLpxm/qj07caAoQ8ptzxTg70+fvzrDkILESTZ
         ofbjzroJr/WJmfWtYG+xCJqJ8QfyG5HztLwZjbdmxDcypIesWzOIEQBNfFeV1z+IMVEn
         chpxBs0PIBonEVzKTNJKxDPHo3y5Njodvj4syvVdW5GNcOjRKuPxshrWdLxh0EuvA9nT
         cppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:organization:in-reply-to
         :content-transfer-encoding;
        bh=vSn4lIHKrS35nzkEATeJIYWFPusZMgfbeai9SuzVFB4=;
        b=3AB+nuo4p3N7HDFIfb9FkwAYee/ezb2SZPMH14/WNJ+W8zno7XSSD60crCY7kqqMPc
         b5i7oZHGbCmvSPG9+R6nkL7+fHnWgBwkYiPaPTwf4WEmg0gDzeng/vtWfFHirGvVG5eO
         u0jPo+UIlIIuuQKU6eo6E5O9fwUAmvKjgGdHiAIe4P9XQZjNOG4D1j4PF/5wzebMfJ5S
         gTL0SYcXSutmaO3MiELYLrcc2mvTyJ3khYjYb1xpI6uokB33Epzl7qER+7DyaxZd4k3l
         ZUA2bgEDCSyIjAoQfZPHkQdPI4quLczmr4LAPm4iBWFSQ/ju94r4VTt3ysiIpP9Xd4Ud
         g+8g==
X-Gm-Message-State: AOAM5306VEn9O+JYOFxJ3jRROczW7IkbG3aimakoD4rgbB/s5LUyRPZB
	3NgE1IgDWuHvgXgGFVlb9eVQCA==
X-Google-Smtp-Source: ABdhPJxwEZpzplICF1lNJBOgcCJaOuyXZ5o4aYRAe12V4xHVE8dcs0pPsHgPZVj/G8sid+GS8MATVg==
X-Received: by 2002:a17:907:7d8e:b0:711:cf4b:9c5 with SMTP id oz14-20020a1709077d8e00b00711cf4b09c5mr5311226ejc.637.1655227674280;
        Tue, 14 Jun 2022 10:27:54 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
        by smtp.gmail.com with ESMTPSA id e3-20020a056402104300b0042b5cf75d6esm7339286edu.97.2022.06.14.10.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 10:27:53 -0700 (PDT)
Message-ID: <9aaab01d-1e99-14a0-bff2-237da08206ca@mind.be>
Date: Tue, 14 Jun 2022 19:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/1] package/bpftool: revert bpf_cookie patch to allow
 building
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
Organization: Essensium/Mind
In-Reply-To: <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_102757_594021_08D30F20 
X-CRM114-Status: UNSURE (   7.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Ck9uIDE0LzA2LzIwMjIgMTk6MTQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgKE5v
IG5lZWQgdG8gcmVzZW5kIGZvciB0aGlzIG9yIGFueSBvZiBteSBvdGhlciBjb21tZW50cywganVz
dCBGWUkgZm9yIGZ1dHVyZSAKPiBzdWJtaXNzaW9ucy4pIAoKIMKgQWN0dWFsbHksIHRoZSBwYXRj
aCBkaWRuJ3QgYXBwZWFyIG9uIHBhdGNod29yayBmb3Igc29tZSByZWFzb24uIEl0IGFuYWx5emVk
IGl0IAphcyBhIHJlcGx5IHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4gU28g
eW91IHdpbGwgaGF2ZSB0byByZXNlbmQgaXQgCmFmdGVyIGFsbC4KCgogwqBSZWdhcmRzLAogwqBB
cm5vdXQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
