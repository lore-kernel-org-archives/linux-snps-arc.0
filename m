Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4F7C43334
	for <linux-snps-arc@archiver.kernel.org>; Sat, 11 Jun 2022 00:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBjIl8KVTDaTpwhznKBsMiOTrVX+LCiYrluR5nER1rM=; b=NNn1W7nQfDCwX7
	3dTkYL1cfSR+4s3eHe8IRXJPBvoK/eUJIZM+31MHdo5rYeg73yN6Sehl48S9zFYuXxo/AmcQ7CDBC
	8EOxFJzZYqoQKFgLVRoyOkxcUk8ym3+a/a9vo03Qax/bQWGOR5AjOBf6ZF0sUnlt/oqMoU6gwgspu
	QXvSAH+fiIx7AMI4vvh5itSqBjt+IbEabmyQqZ43awildiiUeOhclFKZegZxXY/Kmg32vjcRPT9h4
	qddR4zEaf7YIRxL3PJ9MoGzslF4PL4qO3TczYPzn7rYNPeSXKhol/EEaXVnBij4E3wAQTMJNqHjU0
	iXaTAVg0CNxjpxTpSI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzooy-00AcYy-Gb; Sat, 11 Jun 2022 00:17:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzoov-00AcXB-M1
	for linux-snps-arc@lists.infradead.org; Sat, 11 Jun 2022 00:17:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF42661F39;
	Sat, 11 Jun 2022 00:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A90C34114;
	Sat, 11 Jun 2022 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654906658;
	bh=2ml5aH2i09s2I2s7D5cXnP2grpr7Pt+O8phN4fuXq8w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=hTXECurh8LAHyya8IJJ3T5kwvnnjrTbMFkizReyTJzzNR5kmRElPCSCvi+0+GMz6O
	 7d2wmWud9VDhdsqwLVqE/4Usg+e/BpUFWT4iSjS8VFSLstPdP5PV415VA8cwGFZgK0
	 3EX9GufFDdPrNde5pEXkEQleH7m6wnG/MfhCG/quIuWjn+EoMdTIUTO1xxb4ot7R2O
	 gF3DvAe7EYlT5UYEH8YOHO8dsf0iMT03goQlJpseMY4QFofAVaPynMLEBw/qf/+QDT
	 vUsE2QyFLFfI7UBva8fzG9rmRDKI7gSgfOy2YxBOhF4Dtyog1LFq1PBlxUQAoGGu69
	 XGtFHWyNV3QSg==
Message-ID: <d6582f17-7b0b-67eb-ac02-b88f5185e0b6@kernel.org>
Date: Fri, 10 Jun 2022 17:17:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] ARC: Fix comment typo
To: Jason Wang <wangborong@cdjrlc.com>, vgupta@kernel.org
Cc: peterz@infradead.org, will@kernel.org, Julia.Lawall@inria.fr,
 vschneid@redhat.com, deng.changcheng@zte.com.cn, libang.linuxer@gmail.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220508030224.124797-1-wangborong@cdjrlc.com>
Content-Language: en-US
In-Reply-To: <20220508030224.124797-1-wangborong@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_171741_783046_E7B876EB 
X-CRM114-Status: UNSURE (   6.12  )
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



On 5/7/22 20:02, Jason Wang wrote:
> Remove one of the repeated 'call' in comment line 396.
>
> Signed-off-by: Jason Wang<wangborong@cdjrlc.com>

Thx for the fix. Added to for-curr

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
