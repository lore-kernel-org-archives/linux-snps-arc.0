Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF97C48BCD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 10:53:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D578961059
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 10:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D578961059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFYvjTt1fvkmM6bKeZxKz+x9vVVmSR666j4ZZGHmKUA=; b=UzdFBe5JuVvQkU8+quurs4NIk+
	UTxADlmHOVCQQOOa4QI2omSbbK6F5AnTM5HwVEVsjknTZj7RHXBuRYQpe0Hr+IRYK5E7fmp0vnsMt
	q+ZQT/s+nM7dYmzhAiMUW1YBz5XzfdOKtPh9TSql1RTEAKAkLNL+CsXwBZGgQkML0zKjNIXZp5hp3
	iSvj2orCI2ocR9HNhyoqV2IYpB7TJZthRxb5iRmAR1rjMtNezs5QCsKt1Dw4LRZSE/rmG0e13m+jW
	i1z4rC+76fOWpLrNqF/TKe4hax1x+uqzzkPxsq4DjrVibY7/uNft5WnAiNgfV56HGnmCUWciCHKXH
	Q2F3NA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvqG-00D9kS-Ah; Wed, 09 Jun 2021 10:53:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvqE-00D9i7-6C
 for linux-snps-arc@lists.infradead.org; Wed, 09 Jun 2021 10:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
 b=H7mMWCuUMjVlL38GtuFmFzfGsCuMyYbIknO7K6nDPwO5YYwCQE6zRk7zkCncAgbRiYIndO
 IaT3jcTkghc26Hjzlen12wiztWI8UhCmUIBbAAAEcIo+mdlh/kSkuKZimEiih9kzDCeBdM
 MhOXm+4LL+z8ov7X9SOystoebP2I/MU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-dAUD4958MxKpmHP9Olhaqg-1; Wed, 09 Jun 2021 06:53:43 -0400
X-MC-Unique: dAUD4958MxKpmHP9Olhaqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so1795943wms.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 09 Jun 2021 03:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
 b=D0fFS54nstE6gFtll4FRhoK63TeXat/5gV3UqYqkdUXEAH3kT9ih8UbcU1LdoR0zcE
 3VmX1Lhe0/KT0irtHy2yeWuXnjpE2DutX1n53i9GJv9g7AHdX50fdx8mdOgrYtrr7MZk
 zSuqKp0aHp9kSmu42sAMG8fb0c5Id6Us8+JMM71YhR1jY9+/jcEtXSz0mdyR41CG/s0G
 X4JGEnywag7OZQFzJ3oqnKexNm/KStymnZ/eHquHKqLixZeJs9vOYBpPOPVskHGhw1Ip
 DpqoR5iyHXaQmNc2O42B8t6XQ1GhiGPFxufZXjuaMVUH5bY9/Yx59u1XbKvc3C/CEDio
 yjvg==
X-Gm-Message-State: AOAM531VwSvgv10G3t07Y+bAkzSzcx00HAatTD5UK6jJUJWZtjTGGBQh
 2JS8SZHOEOqcjUntfPWpQdKClRp9f8I69k8gBEuephVg6K86LFz/s1aJd7Uru2jFTe/s61qsYUA
 gua+mupTUEuJdq/s1PBVis1Ca4khFj1hl
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr26766721wmr.137.1623236022754; 
 Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytaUEoH1yZlmOCQRNfd+wo+CI/GKYwuDVo1xp/A/CuJsfRh3qeLKHuz3pPcIzWarSKIwDzSA==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr26766696wmr.137.1623236022628; 
 Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 v15sm1695174wrw.24.2021.06.09.03.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Subject: Re: [PATCH 3/9] arc: remove support for DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet
 <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-4-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e9ef94f5-02bc-920b-9e6a-2d234e5bbbc5@redhat.com>
Date: Wed, 9 Jun 2021 12:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-4-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035346_375202_4A72649C 
X-CRM114-Status: GOOD (  11.23  )
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

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
> 
> Remove the support for DISCONTIGMEM entirely.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
