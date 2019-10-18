Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352B4CA9EA9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 18:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE9421897
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 18:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAM4v4v8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG5lMhJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE9421897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsTAzkd9/QA/DfLL1FSQ3dToky8iAJdnSWahUN955Vk=; b=BAM4v4v8fWX+9F
	MteyUQVL5DOHwDtDC/TnUjTBZKd1yOhaHgNQh/+OrIt/jIJ8lRoW5a9UBTUnwBzsEZVxQQrvbSU1Y
	LulWlqiacb60Yb4PJu8swx37DfbbIZCiW+3sa8XoE7RY/N1vTb+is0UNMVOGcOcaU1WkCeDHvq9Mn
	ctkOvjPupd9Q7Qed0qUWL8k8vq7aYpwKI19KxO36JhhzcRVqHmfp18+Tr3gjGVmRLdHChlLnAbivr
	n7o2rmphMdKClddBPGe/1/6JJhPKos8hADuHHEynsTZ62RcReAaUmiVRnJ5Db7W9nBeByVzGdKLdT
	3nSK4Sds59kECtCLmOFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLXIb-0007zm-0u; Fri, 18 Oct 2019 18:48:29 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLXIU-0007rJ-KW
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 18:48:24 +0000
Received: by mail-pg1-x544.google.com with SMTP id f14so3824035pgi.9
 for <linux-snps-arc@lists.infradead.org>; Fri, 18 Oct 2019 11:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xwzGc+WHtxxNubpXEGplLXbyrD4IAw1gaKqHGbFJijc=;
 b=AG5lMhJ3vrGI7ffKJYvTSkGkVoK+6ZOwe/uvgBpFm2TfKdm/23PutDlc7DJrk+tjGs
 45WEviF8bodCMZgcbplADqOR+pt+6X5NRhI4qK04CHLnWA7nikhTTIc8GgiDBW38eIaN
 nF8DW2ruV53C2c++ogJsX+9EaULAEPo4h3J1ommgEDzk8Q8kLSAmSu9uPwuce9XRTNmf
 HNTUO3B6FKgHSO+kJe5Y8TKZgEk/9cAOVwHiT/1k8lKmKElSe3Dzf6xUbC8J8rwBYbvv
 mqCdLs1fRJXT8esBkfzkIzr5MnOfgT2q9gUjdozXTNePWgpXvjMkIMvOizqlP8WoXQeN
 w70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xwzGc+WHtxxNubpXEGplLXbyrD4IAw1gaKqHGbFJijc=;
 b=uDHQ7r7mpGYOZUqL5kgpBMENLmkvWoymO7fyJQ4jIyefzzKpsVz7binJPBwF6AEObP
 0pWBu69sfrXof21O3JQTRVTzPg5nMzRo5Wc1kAgkqF9dvtLSkiozF+9pQuu3Ky/J2ah2
 e8sU/epus+N8hdtlHdYCPM88VUfZPgFfTIZn8rKgY/rbxDt2X3/E8NPml3ziL9M5IoYD
 Ujvst+NZcDSssuXBZfvFd3AiSXxExIslAY4mFg2g+VWN5v25/0nPGFv1ohM0AKxf8r0F
 fztJcQWtwS+dSo0cJM+DbN6nUO3VB85RVJ7acjNJ3CIUjOPTYRkNlEKsJCcioTmKVKH4
 gQ0w==
X-Gm-Message-State: APjAAAWO6b+bBsz7Mu8jchN2evXa7iIWaZbU4Twkrwsbq24T8N+KW1W2
 CIQKO4IAoTAVj0p0T35dMHnR7ehu41o=
X-Google-Smtp-Source: APXvYqwtHRceRwMUaIW7Vuef/hyqGnE0x05ItPwgppjD30l4/mB8SXIhscWYg00vY9apfwgfA3RkPA==
X-Received: by 2002:a17:90a:d991:: with SMTP id
 d17mr13306038pjv.73.1571424501337; 
 Fri, 18 Oct 2019 11:48:21 -0700 (PDT)
Received: from [192.168.110.119] ([198.182.47.47])
 by smtp.gmail.com with ESMTPSA id f188sm8730265pfa.170.2019.10.18.11.48.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 11:48:20 -0700 (PDT)
Subject: Re: [RFC 0/6] ARC: merge HAPS-HS with nSIM-HS configs
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>
References: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <8fd4f94b-c0e5-ed2c-ede3-5c4e77a5a0e4@gmail.com>
Date: Fri, 18 Oct 2019 11:48:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_114822_688644_D8A2B1BA 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/18/19 5:15 AM, Eugeniy Paltsev wrote:
> Starting from nSIM 2019.06 is possible to use DW UART
> instead of ARC UART. That allows us to merge
> "nsim_hs" with "haps_hs" and "nsim_hs_smp" with "haps_hs_smp"
> mith some minor changes.
> 
> We eliminate nsim_hs_defconfig and nsim_hs_smp_defconfig
> and leave haps_hs_defconfig and haps_hs_smp_defconfig
> which can be used on HAPS / nSIM / ZEBU / QEMU platforms
> without additionall changes in Linux kernel.

Thx for doing this, I was planning to do this myself.

But remember that doing this will disturb existing nsim setups
- Our internal linux/gnu regression jobs one of which tracks my for-curr and will
  fail immediately
- uClibc-ng maintainer who also seems to use nsim AFAIK for regression runs

So we need to notify parties involves (and it would be best that we align this to
a kernel release which anyways will be next one.

Also go thru the github wiki pages and wherever applicable please add the config
info for nsim (keep the old settings there for reference as well)

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
