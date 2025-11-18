Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFBCCED62B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Nov 2025 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs4xA9bvdNjWXfuQu3zHg4Jkqe0MP48n0+dLgnSlmtg=; b=ZKHgO1V8pARzEb
	BiRp4aFqMFlvyLe5gEthxGJH0WAQ6a/2S1b3MZ7z08umgdIRyUWGzMzE0FOzvdCaoqIAuZCTR4ku4
	eX+oFbLa2+EQV2K1piu+lHQzbeSTLtyPyhxt3LRz4vXNVp2x/C4h78tNAOsw034/+x8zBk/+Q2JWJ
	Nf81kViXINITqbnHPG9qJix8AxQUWRT1KMJ5ma6MNp7B5LXOajdjvkyZPD3h5LpsaOh56bJIz4uhG
	Eawv58paX6Vd76su0/hUuz4kZ1PhtZSvRhFXGVdBe4M7n4lz3DBBpzw0mDLOtgprbE0JNKtAImisO
	pP1qKg/hq85MRCtzEdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKIq-00000000Mxc-0piE;
	Tue, 18 Nov 2025 11:55:20 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKIo-00000000Mwp-0CD4
	for linux-snps-arc@lists.infradead.org;
	Tue, 18 Nov 2025 11:55:19 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2955623e6faso49926855ad.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 18 Nov 2025 03:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763466917; x=1764071717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=OcMXbNPU7SwW16btakHamAVWHFjnT0RYKRhmNHjvfTA5iTgyj3/88lWZULEH55c4mV
         +l8AfTozGEi1oVy4aKr7z/v7Tb+uoIFiC9KkiB/d3KMkyfhq5T77Cvb6dMh8mSOIqLjH
         nBm2QrZ4anaCfj6257XRs5zAXnaxu8Md4BafRyors8Th+PMQ4KQTE8VwBKDQZCpz81BT
         inv1isUJSJ7nK1cBgEtyqI32i2qWX4GMNUZyn/QZLRU78yYstuq7Jd4PdQwqS0itExOY
         D2VpNqrWZ6XkrxQoZyyTG4meGZpivRF5/3ubdnzQRZ4fVN12uObCnqIKVHhdlNk6zRq7
         E7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466917; x=1764071717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v8UiKRyyvD16t4ENb8APUiQmIzVsGi/FebBj0lOkJ4=;
        b=guSYVojQALhZSI+LHxvFk9+CaOYNchv/JmsuIgSr3gjEaXdd7E6J2FnAqam9koBc39
         +8cjLEPDJNUNyaYqASx8XlpNyRwE0nBBqHbnAEZlZpypCL+FtaxonljOjJuezxwB2gvc
         jv5EBFk6dbK/CREeXao7Boxy+Ghg7gxcE7Cb5myOY5NpeXdp7KEai1JOj26MMK6A0Mx1
         futmNvP4jfuMXFq4D4dV6hO6ZKSKyS48pdBv3p7WplZR3MuisU/m+cC3jrHjdRICkVxn
         az37CzE0GnH94k1WFD3UkACxo+tNfxaXegQrC31QudtY8AF5Y08CQ+iXftJIFMGnmb+f
         tq3w==
X-Forwarded-Encrypted: i=1; AJvYcCWcQCEJM223lQH3y2nLNnFJ5wnn0DcL7rGMZiHomGBMIpKgO8lP0OwD9mGxdkYGTEjt+Etf6SbZaG6unzpuzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2tS+gpF+PuSocRP2vWuJhcUt09IlaPbMwDtBYJVcJY/OMKj1z
	vBR7D8eNVZt8N7QHDx6cVAB9NgzU4EvAruKMKzSdGAZUYzT9b78uzcc1
X-Gm-Gg: ASbGnctCgyE5OtekkmvxgZalRRpyCSkQKr2F8xo6lGKob+fF+o7n10q4WimhYZg3Ev1
	GyZkmpCrgrjQN0nJPqC6I2EWuW80ALN+DE2hDGf9XCyJux7BXLgobNZx41Yz/BadUgUuALMW9SQ
	8lWDUcxyjqNE8qKipH6+mka/T03nj/TL+pGw8oB0rpR3sJNoztkK9moBV+Qp2K5cm6htoDNEHdo
	x15rgClwCoJZSiBGIDIIgHkrgREtg3ary9m2xkRTLOtt3kkbCbHIBhjCgPxOEQe4NPzO4+6BZjm
	51MizT6T9jm2/dr777rT/2W7ADrNPAMaiNWXBHY3NhS211hZwIEchGcgVNwbLgsf4NDCYEYMjnx
	v5WsN58qAiXhds3B5/AS5bZBgACvNqYm5tHca9y4lv+V5hrEkaka6G6RJHZmNBjEWGF6X+BJOzE
	vtQ3QJW8Bo/lSQxCjJP3uQd9K//2SB4UTV2Dh8qOsShlrSeQ==
X-Google-Smtp-Source: AGHT+IGaNSdLxRla9oY02zDdWZQ+dAcjdxohCbg81uqIYBMI/Z6QJtGDDVm6vwOhGnWyaCl6P1ztwQ==
X-Received: by 2002:a17:903:1b2f:b0:295:3f35:a312 with SMTP id d9443c01a7336-2986a6cfeefmr183341175ad.20.1763466916628;
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Received: from [10.255.206.79] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d17sm172235585ad.72.2025.11.18.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:55:16 -0800 (PST)
Message-ID: <f7f0ca8d-bca2-4a3e-8c45-85cba1b0ff18@gmail.com>
Date: Tue, 18 Nov 2025 19:53:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
From: Qi Zheng <arch0.zheng@gmail.com>
In-Reply-To: <83e88171-54cb-4112-a344-f6a7d7f13784@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_035518_318902_711A0D55 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 11/18/25 12:53 AM, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 12:11, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Hi all,
>>
>> This series aims to enable PT_RECLAIM on all 64-bit architectures.
>>
>> On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of 
>> empty PTE
>> page table pages (such as 100GB+). To resolve this problem, we need to 
>> enable
>> PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.
>>
> 
> Makes sense!
> 
>> Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 
>> 64-bit
>> architectures, and finally makes PT_RECLAIM depend on 
>> MMU_GATHER_RCU_TABLE_FREE
>> && 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
>> architectures.
> 
> Could we then even go ahead and stop making PT_RECLAIM user-selectable?

OK, will change to:

config PT_RECLAIM
	def_bool y
	depends on MMU_GATHER_RCU_TABLE_FREE && MMU && SMP && 64BIT

> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
