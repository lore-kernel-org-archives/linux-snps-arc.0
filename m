Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED058CEACEF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Nov 2025 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5rfjQWRz8DMMDstDRRfIhTQPqUkdNe93V34qiNrwho=; b=3nXwfcmrxGnZZ/
	8F06cX9qrUUceEyp6/IpQHujRCHtECbZGp9JQTx0Uvc4dR+92nD35m79OT9KwZ6NEB2b1FYIlElEt
	SwUvDxllB8MOF+lS5jJ3ojHdhkOXF/cSyuRpKTCZDEtDZcpYyEW27OLX1vXSooyHf2Hl43hIkltH5
	lOpjlYGi83ZKQeBkMBsm86iik26uwXDgdFbOXo2dunkTA22AURuKTB6TVwqwrz0i/7SDyK5p2/V0b
	7tp14aGGswiWeZs2gCajxWi2M4VbFjWkVPdmSFeh/Avw7p7gyLumgwhEZJKqTLszPJyPh85Y6UrwZ
	yZA544Tjx3fgIfnYiLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKswe-0000000FWzJ-2x6l;
	Mon, 17 Nov 2025 06:42:36 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKswb-0000000FWy1-2IHE
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Nov 2025 06:42:34 +0000
Message-ID: <8fbeb3e8-7c30-46f6-a0a4-289efbf45ac0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763361727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F61/44VrimXOAEuXiMeNmI+aj0JYokmyCnACi/yOoLA=;
	b=LXkvl6fWXks2EBeWBZhRCeAyF3ikTcHZiBnXiOf/E69BeQQS14g5s1Z7/bB8YxlQXeJX97
	ZSrM63UX77TU+weQcxR68BHoTI37uR0exm53LyIVRGyINLRhjXjK25ABUedOBpfn59DJNX
	OX6fbBjMivdCT5ijsyT8t8ax4mXTWFY=
Date: Mon, 17 Nov 2025 14:41:10 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Huacai Chen <chenhuacai@kernel.org>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, WANG Xuerui <kernel@xen0n.name>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <146b5a0207052b38d04caac6b20756a61c2189b3.1763117269.git.zhengqi.arch@bytedance.com>
 <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_224233_753579_BA678D2F 
X-CRM114-Status: UNSURE (   4.99  )
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

Hi Huacai,

On 11/14/25 10:17 PM, Huacai Chen wrote:
> Hi, Qi Zheng,

[...]

>>
>> -#define __pmd_free_tlb(tlb, x, addr)   pmd_free((tlb)->mm, x)
>> +#define __pmd_free_tlb(tlb, x, addr)   \
>> +       tlb_remove_ptdesc((tlb), virt_to_ptdesc(x))
> I think we can define it in one line.

Do we need to change __pte_free_tlb() to a single-line format
as well?

Thanks,
Qi


>>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
