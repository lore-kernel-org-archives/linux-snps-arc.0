Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D4C3DA66
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Aug 2023 01:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uHFjS3vLrjJBAND0dSiVYjIaFcVcoXrHce5GNzUNVs=; b=KXPrgZsPn4I4QP
	VrbH+BpD01ucfjTSiKVQeen0YPJVN4wLUHgkUgkH1CRnMDo1qAb1JmONmtDtxRiUwwWuC2uL9Qct4
	kgvsK3GSjcKjK4AfBPZu+qXe0WCDf/A096Hz9E/wyXFi6/9rF78IxB1IFhwfVWG1JwcENDo4w4OzE
	uvNxeAPKmAq+dm2ntt7zjaylO7SOHAZ5LyQMNKMx142L4GILfAksrCluVtAPCnq2BsoV3VQupHILd
	1vNvm2FnR1G5QFRAbGBCUSo0QONl68WnbW2+RjyV9HjSHeYVoqHjqZ2qjks8vexswnOPqRRki4rDA
	hdJCpArGQuygBO7jMajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYymL-001r1f-2o;
	Thu, 24 Aug 2023 01:04:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYymI-001r1G-33
	for linux-snps-arc@lists.infradead.org;
	Thu, 24 Aug 2023 01:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93CD763B9C;
	Thu, 24 Aug 2023 01:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88F3C433C8;
	Thu, 24 Aug 2023 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692839089;
	bh=7irFKvrUWbJgoOVMhkGNrs8wK7fU9Q7/eAW1MtLZD04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L/lXJxXVeDNTcbKQBh4sv4dkc3q1Z24uD5UlD/Q5z7FtGdyuIfP0/BVrP0kWAaspT
	 bJoi+y+eO8HzqWepPd1aEyORf82sOEBnLqz3TVwIOILb0+wT1SphTiwzCTI3E+TJwo
	 7Z8bokSCtQTkCtNt1+/JlVAIjSHJOtT/gG6gMGPu0+WwQGe0SUuFp7CV6gzHpkFw4z
	 Xi+GdTjYNBJ4ny0jc95SHUdMiyaKUofgn4NoSpcdhLM4+xmaLES1koXDT1zJ7Hfj2w
	 k7pFxEChrsYUvv9hAvqKNC7OYHXIm6+J5n4rG81xHGMxjKDpYNTyelWfNCt+HF4nty
	 CsAoDizZDem2w==
Message-ID: <e304f322-bda7-a28a-1c4d-86480fcc606a@kernel.org>
Date: Wed, 23 Aug 2023 18:04:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arc: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@kernel.org>
Cc: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230714173949.4038981-1-robh@kernel.org>
 <20230823170025.GA2470216-robh@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20230823170025.GA2470216-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_180451_044997_A31F24F1 
X-CRM114-Status: GOOD (  11.63  )
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



On 8/23/23 10:00, Rob Herring wrote:
> On Fri, Jul 14, 2023 at 11:39:49AM -0600, Rob Herring wrote:
>> The DT of_device.h and of_platform.h date back to the separate
>> of_platform_bus_type before it as merged into the regular platform bus.
>> As part of that merge prepping Arm DT support 13 years ago, they
>> "temporarily" include each other. They also include platform_device.h
>> and of.h. As a result, there's a pretty much random mix of those include
>> files used throughout the tree. In order to detangle these headers and
>> replace the implicit includes with struct declarations, users need to
>> explicitly include the correct includes.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>   arch/arc/plat-axs10x/axs10x.c | 1 -
>>   1 file changed, 1 deletion(-)
> Ping!

Sorry this fell through cracks, added to for-curr now !

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
