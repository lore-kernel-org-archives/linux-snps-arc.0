Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDFED68BDA
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Nov 2024 00:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9bshJx/bhKAw+jrJx2WTS8mK43DmE/z0bD6jUiLPCs=; b=cZH/H8n2Xf24p1
	UiV7ZCalFYEhD++xKzSQZcQSs5hfeeUDYeaNicAJ0e44ciz1Sq4CpawZDrIKFTMdqggqoKPyZ9q32
	QJ3EcZGAOxSYCH4GZohfBvUlg6fzLhb9SjZM1ND4gL70BBXZFMBJAUw6jPqESn4D7E2qdsJRxG7hZ
	6nJDyhaoTnopG9VbgNS22C5TF48nQfJ3LtzNdWdoJqedJnPo4bVGsrMp6uTgyCbsZH9zWtLUSqoO4
	urHlHfcNpUBib1PBWEoOXGsEPW9MTFUyaXHZptd9yjCsPz+BP0TUmnc6xGSZ644ME7g9UA1Si/L4N
	McUfZgRRCu7cfRVLI0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC6kU-00000004eUg-0Y6u;
	Sat, 16 Nov 2024 00:33:14 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC6kR-00000004eTu-1A5b
	for linux-snps-arc@lists.infradead.org;
	Sat, 16 Nov 2024 00:33:13 +0000
Message-ID: <fb9476ac-74da-4a58-b997-14b25d3ec2a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731717186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6fU7KlLSzUs1gveo2BCh7OFm372YDhjsxyCVNn+gQw=;
	b=eqv7VY2hqwalOemrPrMnqrHOsLRx0dzdCNIWgJGlTfxdGhEbUIFRU6taalMso/HIkZsKaz
	JflZEFhlDgBvvNXxsd9DkJXRYCutgMfxGt8XtWvG+D9JCmraW74oi8BkSdzS6TAoOPwbCu
	5Pc6mO51yuHeWL2Qd6DTdYVrLTEVAwU=
Date: Fri, 15 Nov 2024 16:32:59 -0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] ARC: bpf: Correct conditional check in 'check_jmp_32'
To: Shahab Vahedi <list+bpf@vahedi.org>
Cc: vadim.fedorenko@linux.dev, tarang.raval@siliconsignals.io,
 Vineet Gupta <vgupta@kernel.org>, bpf@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
References: <20241113134142.14970-1-hardevsinh.palaniya@siliconsignals.io>
 <920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org>
 <f5f49eee8979985439408e7bd6fbd1534e91a115@vahedi.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <f5f49eee8979985439408e7bd6fbd1534e91a115@vahedi.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_163311_741690_897FB892 
X-CRM114-Status: UNSURE (   4.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/15/24 07:55, Shahab Vahedi wrote:
> Hi Vineet,
>
> Could you pick up this patch [1] in your "next"?
>
> Thanks,
> Shahab
>
> [1]
> https://lore.kernel.org/bpf/920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org/T/#t

Done. Given We are in the last week this all will land in 6.13 cycle.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
