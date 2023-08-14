Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48336EB64DD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Aug 2023 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKmsMq8y67bwnz/JEVBX9YkJEkI3NgTyah7mbO/Yjus=; b=XHx2sJUiUxUT0A
	MTL5kS3Qeyi7oIXdrh9CdDrRxLYFwYV+06PvU0GlnzWmJJ/tbjJdVI8Ex5IB2X1hrssvrlF4pbHGC
	BvP4Wrjcv3bIiUwgLTm7ubxbxDI8mydbYkdj2HD+J655LDnz5hsunEGKMEVGiK/uT601I40Kg+TJm
	2LYM+a3A58mt46eulaK+BsZFvTdtsrS+Fh1CHOT99Op9WtkZgwxw7bLRYy2rC/jpOodggtQMXfWH5
	+dBh60rUgc3evcZj1fXG/9rODFYRyqSAvXkdZT2lAabrmeCY5IXAwQUael79X5anfdTVhUzpIa/0z
	t6+IE243xtGR0rbK6BYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVdVs-000F6S-0d;
	Mon, 14 Aug 2023 19:46:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVdVq-000F5l-0s
	for linux-snps-arc@lists.infradead.org;
	Mon, 14 Aug 2023 19:46:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D50896160B;
	Mon, 14 Aug 2023 19:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A53BC433C8;
	Mon, 14 Aug 2023 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692042360;
	bh=MwNJLmwjfJMC/aYX1uFNyJW8Fvw1ZTrlWvKkYJG+xTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sIGyXX3lYcNNrN+nYDNveoRiYen6H/As6h64B8znxGWzZJCu1R+SFSTpZZPmXcaf8
	 pyQjl+YERFXYRp6by2BRvfFjwHobS16yaKLLEUPwTnx2+WzwX6F+UTEERmyFAxbfP7
	 KgOjtooawddGAkMAAS7AtXrzcDAfVvkIpAJsCALUB9U7U7MjNbTwZRe+aJsbxra9qO
	 x8+hUX35RLc/J11LSyuEyLrTq1QLsA5bBHXN5I2H/aYcnTb+BOyq/OSFzStD1Q5UOe
	 M55QMaoafnQ2ZR4uyqet1MEOhB6rtfHOCdtn3q1x28o39HSi4iqJfxEnalS76VOgj0
	 J3y/3JamSSKPw==
Message-ID: <e7063cb9-ca5d-39db-099e-70a0889499c1@kernel.org>
Date: Mon, 14 Aug 2023 12:45:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ARC: mm: retire support for aliasing VIPT D$
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, rppt@kernel.org, willy@infradead.org
References: <20230813192543.474957-1-vgupta@kernel.org>
 <20230814123822.f117e89873c9bfc62ed0df33@linux-foundation.org>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20230814123822.f117e89873c9bfc62ed0df33@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_124602_375860_6D82715B 
X-CRM114-Status: GOOD (  12.56  )
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



On 8/14/23 12:38, Andrew Morton wrote:
> On Sun, 13 Aug 2023 12:25:43 -0700 Vineet Gupta <vgupta@kernel.org> wrote:
>
>> Legacy ARC700 processors (first generation of MMU enabled ARC cores) has
>> VIPT cached which could be configured such that they could alias.
>> I added the VIPT aliasing support, with all the cache flush overhead to
>> support all but 1 silicon. That is long bygone and we can remove the
>> complexity and maintenance burden of that unneeded code.
>>
>> This also helps streamline support for new features such as generic folio
>> work.
>>
> This of course messes up Matthew's "arc: implement the new page table
> range API".  Are you or Matthew up for redoing that patch?
>
> Alternatively, can you redo this patch on top of Matthew's patch (ie,
> against mm-unstable or linux-next)?

Yeah I'll let Matthew's code get merged and redo mine once that is 
upstream to avoid conflicts in transition.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
