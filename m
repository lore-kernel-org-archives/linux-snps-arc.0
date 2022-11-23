Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4203DC433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Nov 2022 04:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqqQPxMRxf5eY38rXqBvD1FBBuwic1+y/zbetqdg+Ts=; b=Cp389kg5Lh6DJl
	m2tieED422wPcLIdwAhipOxM1Ngx9Ra52aYqDbZK3OFlnc3V2ipldgygZp7f/HYJk/84I8iqdQo3K
	2jHjtDBtg/mGqUK51MXir2/5Up+o+ekznLc9ZLLF2l7sEzjdPvZrXYj/2RofLOZTvnV9sl89s64BM
	gKyF1RIGfz5JykTARI6ad1izz8nW6+4S6G7sDxVzJEZNKSMSxjx1n47dIoP3y1MHF0zHDGx7iVSQC
	To8fJUo2oplFTwDVH/4efNygP59pSpQfFgsLCjCGhX+3T1SOOqGx+aFhKELwu5QtZXwcPoUzzcnao
	4AEPhGlVMyjV0dGPYS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxh94-00DnDa-KD; Wed, 23 Nov 2022 04:13:58 +0000
Received: from out2.migadu.com ([2001:41d0:2:aacc::])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxh90-00Dn9R-WC
	for linux-snps-arc@lists.infradead.org; Wed, 23 Nov 2022 04:13:57 +0000
Message-ID: <1eb9f4ab-6289-0e0d-a488-4e17994b13ba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1669176830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TT/bjS/BmwqYEkEdz5C+v36BF4wJBTivdfmY8jHIuuI=;
	b=L0VPLaybmyje/ZIx8a2k5CRRVVok2rkPqe8bL9b5Qx9k0O/Rg+sxa0OGQlval+FCkYRtTi
	5BQAsz2CcpOnkZHY1MlEaxlJCeiEkZvYIWV8Fod+G1ljo+XkHl0GtylOOwCIuf2t7MVROy
	DRqgaimi+UBso2gvXpsSaMzrlkSYWUo=
Date: Tue, 22 Nov 2022 20:13:46 -0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] ARC: update definitions in elf/elf.h
Content-Language: en-US
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>, libc-alpha@sourceware.org
Cc: Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <20221121130624.9628-1-shahab@synopsys.com>
 <facdfda0-cb2b-da24-1239-0b990a0328a9@linaro.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <facdfda0-cb2b-da24-1239-0b990a0328a9@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_201355_968145_A12712C8 
X-CRM114-Status: GOOD (  12.28  )
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


On 11/21/22 06:30, Adhemerval Zanella Netto wrote:
> On 21/11/22 10:06, Shahab Vahedi via Libc-alpha wrote:
>> While porting ARCv2 to elfutils [1], it was brought up that the
>> necessary changes to the project's libelf/elf.h must come from
>> glibc, because they sync it from glibc [2].  Therefore, this patch
>> is to update ARC entries in elf/elf.h.
>>
>> The majority of the update is about adding new definitions,
>> specially for the relocations.  However, there is one rename, one
>> deletion, and one change:
>>
>> - R_ARC_JUMP_SLOT renamed to R_ARC_JMP_SLOT to match binutils.
>> - R_ARC_B26 removed because it is unused and deprecated.
>> - R_ARC_TLS_DTPOFF_S9 changed from 0x4a to the correct value 0x49.
>>
>> [1]
>> https://sourceware.org/pipermail/elfutils-devel/2022q4/005530.html
>>
>> [2]
>> https://sourceware.org/pipermail/elfutils-devel/2022q4/005548.html
>>
>> Signed-off-by: Shahab Vahedi<shahab@synopsys.com>
> We discussed this briefly on glibc patchwork review meeting [1],
> and if does not trigger any regression it ok to arch maintainers
> to handle such changes.

Shahab as a process followup, can you run the full glibc testsuite w/ 
and w/o this change and post the results summary here. It should be easy 
to do this with hsdk dev board. It can also help find fill the the glibc 
testing log for arc for the upcoming release ;-) as 2.36 [1] seems untested.

-Vineet

[1] https://sourceware.org/glibc/wiki/Release/2.36

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
