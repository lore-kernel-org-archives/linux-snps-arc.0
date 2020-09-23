Return-Path: <SRS0=efrZ=DA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A09C4727E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 20:49:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE312376F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 20:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OGriXucQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE312376F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FNVpLmzkz+roKSYF9pzSCAsVag0D7DOhwmvd54bqJYI=; b=OGriXucQLl4gMTVNEVnVIOwcw
	SbQeJFqGhcJqqynaI4vHkCTNzuQaGxjBXaoqNJ/2Usqqh+hUyyDFuGpe8D0uQUZuAvgehZxuaiASn
	ZZVVFXoJzDdoes77xRWIwYy6n8TDvKGxRWU3smzIn+lUIvmvOszQl2nzof1ZnfafeZbzzqRqyH52I
	5yhXtRhKYlz6RjwDDeGtv1DlZTmNHfJCCx97ud/pJVU8tBW4mQsXhS0XGFJ9Y8sHATJaRSYdRUW9W
	y3d186HPrDbHcAyZB26p/FgU85ttkNo0DKiAYbdT338fR9TduLOi9zRwsu/CpCwAqQGmh9MK5AFRs
	RWO7ZOydg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLBhz-00006y-HT; Wed, 23 Sep 2020 20:49:47 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBhy-00006V-2N
 for linux-snps-arc@lists.infradead.org; Wed, 23 Sep 2020 20:49:46 +0000
Received: by mail-io1-f67.google.com with SMTP id r25so1032182ioj.0
 for <linux-snps-arc@lists.infradead.org>; Wed, 23 Sep 2020 13:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SEZoIRilOUkQgdmz6is7KBsKDMCVx0GX2RscOowq3a4=;
 b=Z51QJtJTS4aitE7rA1YNYRLnGpkRJLh/Dx/EB3sRZb3chN5X2WIjoUDbcFQ9jAT1uf
 ykBwrwmxB9Jua1/PyUJxxeXC0hhHp27xYEomObexb4z+q8KU29mI9HlkHbio+Y2IMg8N
 OEgCUd3WN3R+JlC6gHXcBcfqSFyk2P3hL2h9qWMFqeh9S9Od+vW2ii/SXkk5OcN7kvTw
 ULoeUslZNvypvKycRfoK4tKxYnR8ej+AxWhOkXmry1jMUagTUEkmezWyuc/wytsmAV02
 pYW8WrU0QADDgAV2wxmtlr3ZyTp670GJUMRFErDIeqdgbk7+63kWqnxcFg7m30Z/5tXS
 hhHA==
X-Gm-Message-State: AOAM531YXGcGr8CoPumvuTIluh++ypIs++fhSZndMWIVD9KWNwghr0mV
 RQlsHrtpzZT3L25OX+C4nA==
X-Google-Smtp-Source: ABdhPJx8Y5M8zaHuUXlqoSBgCpTNAFoHkyBHg9VKVE13hTyvmUpG7GOkivebkuvon99ClivInL0BPQ==
X-Received: by 2002:a6b:f413:: with SMTP id i19mr1059413iog.125.1600894184858; 
 Wed, 23 Sep 2020 13:49:44 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id p8sm418586ilj.36.2020.09.23.13.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:49:44 -0700 (PDT)
Received: (nullmailer pid 1282310 invoked by uid 1000);
 Wed, 23 Sep 2020 20:49:42 -0000
Date: Wed, 23 Sep 2020 14:49:42 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v5 4/6] dt-bindings: dw-apb-ictl: support hierarchy irq
 domain
Message-ID: <20200923204942.GA1282222@bogus>
References: <20200918112202.3418-1-thunder.leizhen@huawei.com>
 <20200918112202.3418-5-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918112202.3418-5-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_164946_111822_44AA2769 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jason Cooper <jason@lakedaemon.net>,
 Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Libin <huawei.libin@huawei.com>, Marc Zyngier <maz@kernel.org>,
 Haoyu Lv <lvhaoyu@huawei.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 18 Sep 2020 19:22:00 +0800, Zhen Lei wrote:
> Add support to use dw-apb-ictl as primary interrupt controller.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  .../bindings/interrupt-controller/snps,dw-apb-ictl.txt     | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
