Return-Path: <SRS0=GR/N=JX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E6FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 11:29:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7806061001
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 11:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7806061001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VmcxUmjXv7Z0OVY0BjGXWBtfxtPQdbbNSecJBah129M=; b=B9usTnMcShdX8aNdHsTsP8uh3
	VygM4q77uZYA4QMsszkmceBOj4o2HLgF5GigEvM6zMCs0690m27x7I1lTx0aX2n2iKq5O+F/iI/2J
	I7rAhfZAvsX1EM6TgFbAyvtXIZcjbdjuvLfoILsSesZumSxpHNCli17EfFFnlisBmlDmYDf1B2Z8f
	lNzqKJbYvovs1fIqowKp4vHM+HtJqA+zkrE+78Xjw9KCKW3FE7CGhkdl2AMieltcF2VcPZFbUSoBH
	r0hmGXUsNFZEKM9s1JNmx4ogU6tqU/HZBoaPL1FSWcZLAM39Iv0V+LlR4vnBwD8AfFCwgPSYKaCv3
	8tcyWXTXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lazQc-007V8Z-SG; Mon, 26 Apr 2021 11:29:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lazQa-007V8C-N9
 for linux-snps-arc@desiato.infradead.org; Mon, 26 Apr 2021 11:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/qHO8gYWVWiijTjYukocta+N/QRWzwXBMwKqV8e4rSs=; b=2IbePwFeSDpd8eRxpgerOazW30
 44j2pVy+rT5UJjD87kQI8RA8NUIvD17r+iUxKM/nZdNUXde58wkooJJYHk/0Gp70fhG3jNjUwEI2o
 snuLBHa9QyfrklHaxlVw3iMABVBtAOuQt8tmKrdXRBTAFB7x9JvHlTqlEMOn3DWOz14TziktsyPHg
 ArPlPiT3hAs6XDWEEfMntzBCgrf+eSBjpKi8But4f6TGQsYj/TyAJBU9ZcHQQf0wT0bqHEhWbEYg6
 M2A8kkEyyu8Xag2h2hyJVPFx5KFMHrKgdK3GUhzzORMiw/27/4Mgo35VMCz6KtGys3/g8AKIA9NjJ
 Bye1QTwQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lazQX-00FvUW-NQ
 for linux-snps-arc@lists.infradead.org; Mon, 26 Apr 2021 11:29:23 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QBPA6t132771; Mon, 26 Apr 2021 07:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=/qHO8gYWVWiijTjYukocta+N/QRWzwXBMwKqV8e4rSs=;
 b=RypTNGqTF2vB7dWQRxNArlcT5XzLc1tOO94tpVwUKp10pLjHkLuROcvIuQEgpbVmTJom
 WgUVjEREb3Lko9pBpUYF7ZZWHZedfM9m0T/NrCkMSXJ+eSV64smrGNZPNch9vWsJQok0
 FRLPgY13X7pqEPhfMIaYCXNB81+sWdgdioqSuQxeccbVo3hprmJuISdNKEDkbX/79O/J
 qjunH7ATqAjOk3Wx5jO5s20Z287Br/jUqvasCSph2FKmmXcogpfXIjAKyV5r/ntBieNW
 GbSPbG1HJl8fGa3pBF1dOZPS7XY06TM/Gd/3b9sGaW/FUQOVgX2QUV43snMGOIUHxfRm vA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 385stkw5e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 07:29:18 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QBRN1U014586;
 Mon, 26 Apr 2021 11:29:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 384akh8e3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 11:29:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QBTCRM30867860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 11:29:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D43754204B;
 Mon, 26 Apr 2021 11:29:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A50D42049;
 Mon, 26 Apr 2021 11:29:12 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.129])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 11:29:12 +0000 (GMT)
Date: Mon, 26 Apr 2021 14:29:09 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARC: Use max_high_pfn as a HIGHMEM zone border
Message-ID: <YIakBTNpLsPJaj7i@linux.ibm.com>
References: <20210426101004.42695-1-isaev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426101004.42695-1-isaev@synopsys.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VjGorx5mtmwpxzP8K8upRwr2Xg7V1Bu0
X-Proofpoint-GUID: VjGorx5mtmwpxzP8K8upRwr2Xg7V1Bu0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_03:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_042921_900386_3ED337EA 
X-CRM114-Status: GOOD (  22.47  )
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

Hi,

On Mon, Apr 26, 2021 at 01:10:04PM +0300, Vladimir Isaev wrote:
> Commit 4af22ded0ecf ("arc: fix memory initialization for systems with two
> memory banks") fixed highmem, but not for PAE case when highmem is
> actually bigger than lowmem.
> 
> Signed-off-by: Vladimir Isaev <isaev@synopsys.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arc/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index ce07e697916c..59bad6f94105 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -157,7 +157,7 @@ void __init setup_arch_memory(void)
>  	min_high_pfn = PFN_DOWN(high_mem_start);
>  	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
>  
> -	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
> +	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;

This is correct with PAE40, but it will break !PAE40 when "highmem" has
lower addresses than lowmem.

It rather should be something like:

        if (IS_ENABLED(CONFIG_ARC_HAS_PAE40))
                max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
        else
            	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;


>  
>  	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
>  
> -- 
> 2.16.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
