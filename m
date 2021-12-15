Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E34C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Dec 2021 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaKp8SD5pHFCx+7MMvC6E/qCm5vWe+sbVlefjTurd1I=; b=ha6SmN34T5csIJ
	7i78q1zsyodagjlbXOH2vYkJCIdU2+698ZgP5Ydi+sBxBWuvS05vaeiSJBbKXCCo7JPUjiIU5F1yh
	HCUqrTnoFK71oXBH01ejIdjdV2uN/SNi2vsgk+I07bcaSvdhfThYCLpKgNiYPTxUAkEy2ps//ds1B
	BYgQ/DT8KahSdVI+fVV9wamnvo1akK/bVEPOaV25Fb9Om2wsZ2VCz5Xlfmh4jZPSIdDuI0Ugu8VSX
	/SqnsfVtxApJsi+Lfz9XHl6FYfVQ5dBEonZEuWxwSYXhxjs85ueWFT4VFhtRJM9WaOlaBPotfXh0g
	IYmJMJXv80mz0wjWakgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxV4Y-0015X3-Vc; Wed, 15 Dec 2021 14:15:59 +0000
Received: from 188-39-32-17.static.enta.net ([188.39.32.17]
 helo=mail.airspan.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxV3x-0015E7-JC
 for linux-snps-arc@lists.infradead.org; Wed, 15 Dec 2021 14:15:22 +0000
Received: from FS50.airspan.com (10.2.10.50) by FS60.airspan.com (10.2.10.60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.12; Wed, 15 Dec
 2021 14:15:17 +0000
Received: from FS50.airspan.com ([fe80::5103:1cfd:775b:73dc]) by
 FS50.airspan.com ([fe80::5103:1cfd:775b:73dc%5]) with mapi id 15.01.2375.017; 
 Wed, 15 Dec 2021 14:15:17 +0000
From: Barbaros Tokaoglu <btokaoglu@airspan.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>, Vineet Gupta
 <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: Miika Keskinen <mkeskinen@airspan.com>
Subject: Re: [PATCH v2] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Topic: [PATCH v2] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX8OSpc3XIvkPo7kSrkdg2fRQfkKwx7cGQgAGs1IA=
Date: Wed, 15 Dec 2021 14:15:17 +0000
Message-ID: <ac2fb502-bed4-251e-aad0-0ca5ae00c133@airspan.com>
References: <588d5473-0344-3284-2a8b-b2a105eece8d@airspan.com>
 <BY5PR12MB4131707D6F78A850F370202CDF759@BY5PR12MB4131.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4131707D6F78A850F370202CDF759@BY5PR12MB4131.namprd12.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.35.200.190]
x-c2processedorg: 9bdab810-6dbc-44eb-a994-a231bebe8d9f
Content-ID: <2DFD2312FF7C37488D473AC47648068E@airspan.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_061521_672365_97123401 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/14/21 3:42 PM, Vladimir Isaev wrote:
> On Dec 14, 2021 3:18 PM, Barbaros Tokaoglu <btokaoglu@airspan.com> wrote:
>> For 16 kB data cache with 4 ways and 32 byte cache lines we have tag LSB
>> [(128 locations for each way: 7 bits) + byte offset (32 bytes: 5 bits)]
>> lower than page offset (13 bits for 8 kB pages).
>> So it is possible for PTAG to change even for single page loop. Hence
>> update ARC_REG_*C_PTAG register on each cacheline iteration.
>>
>> Signed-off-by: Barbaros Tokaoglu <btokaoglu@airspan.com>
>> ---
>>    arch/arc/mm/cache.c | 13 ++-----------
>>    1 file changed, 2 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
>> index 8aa1231..d0875a8 100644
>> --- a/arch/arc/mm/cache.c
>> +++ b/arch/arc/mm/cache.c
>> @@ -251,13 +251,6 @@ void __cache_line_loop_v3(phys_addr_t paddr,
>> unsigned long vaddr,
>>    	num_lines = DIV_ROUND_UP(sz, L1_CACHE_BYTES);
>>
>>    	/*
>> -	 * MMUv3, cache ops require paddr in PTAG reg
>> -	 * if V-P const for loop, PTAG can be written once outside loop
>> -	 */
>> -	if (full_page)
>> -		write_aux_reg(aux_tag, paddr);
>> -
>> -	/*
>>    	 * This is technically for MMU v4, using the MMU v3 programming
>> model
>>    	 * Special work for HS38 aliasing I-cache configuration with PAE40
>>    	 *   - upper 8 bits of paddr need to be written into PTAG_HI
>> @@ -268,10 +261,8 @@ void __cache_line_loop_v3(phys_addr_t paddr,
>> unsigned long vaddr,
>>    		write_aux_reg(ARC_REG_IC_PTAG_HI, (u64)paddr >> 32);
>>
>>    	while (num_lines-- > 0) {
>> -		if (!full_page) {
>> -			write_aux_reg(aux_tag, paddr);
>> -			paddr += L1_CACHE_BYTES;
>> -		}
>> +		write_aux_reg(aux_tag, paddr);
>> +		paddr += L1_CACHE_BYTES;
>>
>>    		write_aux_reg(aux_cmd, vaddr);
>>    		vaddr += L1_CACHE_BYTES;
>> --
>> 2.7.4
> 
> Acked-by: Vladimir Isaev <isaev@synopsys.com>
> 
> Thank you,
> Vladimir Isaev
> 
Please consider v3, there was an issue with patch of v2. Sorry for this.

Best Regards,
Barbaros
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
