Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750F6C7EE32
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Feb 2023 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzpV6BDSJO11IOnqZRTiJ5LvytnT7FsHqsJh9paIuQ4=; b=SVmMnno8I+2X+u
	yTBPpq4lnIHs7zQIE3uJh5Vt7rAuNeY296WfwYsYRT4GKM7Bw3GXeM0Yhx4wMF8UmCmGAyCgiW+bb
	aLiZkxiGEDs5j+iZyE3TNc7M3AmTRVA4TaIQO79m6VLeSaT/Mi3mH7vPpnRahuuF9ah4M2EK0ZwiD
	hK80UK9mgayjncIV94bag0IeMH9CL92PSlo7pY7iieSlfZ1AiDf7O3j4RNjdud3VmBSIJwTyKS0Bk
	Zdtdh8+Zc4FP1bo5Fe0Kjkr9tJr/jKGjtYZxyDLzZhAr+J6nGnco0gBzBaboG4PG4pmB9PNJqgPrW
	RvBwUBE6hhNiiKfbPb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2LH-00DhOk-G2; Tue, 28 Feb 2023 15:56:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2LE-00DhMn-VF
	for linux-snps-arc@lists.infradead.org; Tue, 28 Feb 2023 15:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677599796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
	b=ZSChi6PCbVgB4ID1cv6gHwSECIe4OuDgIMTq9REYSJaYl9Bf5lSORAPqF9nF4FY6kYjdHP
	0rpMHiVugl0FfrSZ7kusLx2puVZVVd3rGCqTue3pS+eYTtT5A9Z1AGPyVPXzEsiDDvsgSV
	zDbR8uz7qH6HtSCPQlQ1dlM1cz+5/+s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-bglpTEzdMNumjPSPZjXWYA-1; Tue, 28 Feb 2023 10:56:34 -0500
X-MC-Unique: bglpTEzdMNumjPSPZjXWYA-1
Received: by mail-wm1-f71.google.com with SMTP id z6-20020a7bc7c6000000b003e0107732f4so3778056wmk.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 28 Feb 2023 07:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
        b=ZGEW2Eofva4mi6Pt39wRBNANlaQFVIyzfXehzptfFaNaSeM0YLueRnGHoPfUNnwIVu
         ruFB3XpKPT08Uyr9UzjMIvPuABqXDTvC9LnoEvXBCiyieD8czQik0NVREsyd1yPZ4/Lr
         qX+yhq0kRMKuvBgu1hyC15rBKsliBVwzzelfeVm14b8Jy9b9KO/IQaaORz1ZrEo4ChYa
         YbeBPDHSyRK7fwhxaxqHtd+Xd9k7zDMk1DcBFNn/sacF2kYoXjbBHZ3zFBMyUj10Eskr
         g79XxQqyGOC+XA2rQ/9s/pjMj3TBkLO78urE+39tTiQhV/EA2yvcTQAv1qAmC4yspvIL
         pqnA==
X-Gm-Message-State: AO0yUKU44GQflpYvapmuLuaqXnNEomHVEtwLxdEUMf/U1XotS3Jxpp61
	wT5EJlHxP8PoJNlWcaBww59JQE5/AsEl5aNKydlDCIbME8zAsknzH8Qfclbv2RJOD5/BeSg4ola
	HtCVZy3y6reffbPPDfCZq55nKEvygbX1z
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985258wmb.12.1677599793387;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2v9f8GltbBAhuiD5VLcyopD+EwumVs1dLk0qMzdF/fI8DkaFn74NX3LW8zhnIM6FtbCCQg==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985221wmb.12.1677599793078;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id hn6-20020a05600ca38600b003e21f01c426sm13465165wmb.9.2023.02.28.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:56:32 -0800 (PST)
Message-ID: <bd656b2c-9a20-dea9-dcef-9cc965bccc9e@redhat.com>
Date: Tue, 28 Feb 2023 16:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 19/26] riscv/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 hughd@google.com, jhubbard@nvidia.com, jgg@nvidia.com, rppt@linux.ibm.com,
 shy828301@gmail.com, vbabka@suse.cz, namit@vmware.com, aarcange@redhat.com,
 peterx@redhat.com, linux-mm@kvack.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
References: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_075637_118154_014A932C 
X-CRM114-Status: UNSURE (   7.65  )
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

On 28.02.23 16:50, Palmer Dabbelt wrote:
> On Fri, 13 Jan 2023 09:10:19 PST (-0800), david@redhat.com wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the offset. This reduces the maximum swap space per file: on 32bit
>> to 16 GiB (was 32 GiB).
> 
> Seems fine to me, I doubt anyone wants a huge pile of swap on rv32.

Patch is already upstream, so we can't add tags unfortunately. Thanks 
for the review!

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
