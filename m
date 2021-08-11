Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146DAC4320E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 19:01:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA4E610A2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 19:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDA4E610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/709hiwsfrmxjb581bxjq/RuyF07rVssqg81+9f2KOo=; b=GzAZVxFzhxbsfXysoKJWp9ltjN
	lurn7mKwcDKqxcRQHlHG4kADY92qVO2/f1zKWtRlVb+d85DGNFvMNg2AUoPWNZ7Wkd47+Kp12P+bp
	NW0rsKk6tZk0mXGUqEnJvehjOy5ma5BI3kMIxp8+Zacf/grSCkPAJGGC1kEB6MHsWLNci+hACqWaN
	Blir+yU8VptPxVPPt0t5y4o9MlW9cwFN7tcX6OjOlmwqZTDXrMulCVzqiM9EkSmo9qeVp7vo0l8ST
	Z6MTwFyMpkGC3SV+Iqoh5tdvW2XRP9I9N0JDZ/7JVr/bw2oUaMA+jEnZXwN1lJngQECLfZ/O+EkTG
	DVSL+wOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDtTm-007xKO-Sa; Wed, 11 Aug 2021 19:01:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDtTk-007xIe-5F
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 19:01:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7292E6105A;
 Wed, 11 Aug 2021 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628708487;
 bh=m9TeT/3Nd18chDNafC9ANZmnNV4sJc+ahNObhasQTPk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QBaZL2cZuYfjROADUeXkULhwxf64s73vOFLrYymG/psmdKrMoXjYDHDEmePv590bF
 IVvrRH6Htrh+OmRTd1Iv0sBWHCrvFYrExdJibMFkaC6wImWqZHc9RLBRdLSGz686il
 5x6iqjckarrUAJCOn6JblgdRpHlBlwVDFyra4nQvgpj0TQmm5Ai0S+oY/bvv86GTV+
 Ky/EBnrSo7k6hKlOMM/JMZZi1KkcY+9BvfKl2yZD4IbkGvzBXzf2AqTh01jGfMVVAI
 Qp96pVknD/jTeXDhdBpj0SmVxxQY5V+Ie28Vy/PkfS4a0AWqD+UXz9RYXUfnUZT1mT
 xayhdmktl1S3g==
Subject: Re: [PATCH 06/18] ARC: mm: Enable STRICT_MM_TYPECHECKS
To: Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-7-vgupta@kernel.org> <YRO8xUlAtMeJnDbe@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <ecbba2ab-6d05-cbbf-9545-01a62c722e5c@kernel.org>
Date: Wed, 11 Aug 2021 12:01:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRO8xUlAtMeJnDbe@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_120128_274399_67D3BF32 
X-CRM114-Status: GOOD (  12.08  )
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

On 8/11/21 5:04 AM, Mike Rapoport wrote:
> On Tue, Aug 10, 2021 at 05:42:46PM -0700, Vineet Gupta wrote:
>> In the past I've refrained from doing this (atleast 2 times) due to the
>                                              ^ at least
>
>> slight code bloat due to ABI implications of pte_t etc becoming sttuct
>                                                                   ^ struct
>> Per ARC ABI, functions return struct via memory and not through register
>> r0, even if the struct would fits in register(s)
>                                ^ fit

Fixed.

>>   - caller allocates space on stack and passes the address as first arg
>>     (r0), shifting rest of args by one
>>
>>   - callee creates return struct in memory (referenced via r0)
>>
>> This time around the code actually shrunk slightly (due to subtle
>> inlining heuristic effects), but still slightly inefficient due to
>> return values passed through memory. That however seems like a small
> Out of curiosity, is this actually measurable on real world applications?

Not really, but they look hideous to an objdump hunkie like me (who 
treats waste of electrons like wasting food) and wondering what piece of 
art your compiler is spitting out ;-) only to realize that is source 
code induced.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
