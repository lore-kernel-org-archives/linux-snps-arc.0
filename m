Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27757C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 01:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCwQlT9Kgm1ZXkSwwKrUnjBZyJeIAb+/AV/xcVEJwyk=; b=xG+mWkDWqAeqrv
	Wtzrmp9GHbenVdTO3QHmR5Mxxspa0lO3u/FhMeWxQemiPbqY9hWZjy0bI7s7gUG3EQP38cPqcb9jD
	ZT0yMRGihNJ7XYydqrZ9ASFbxvLn9sX8SY7Fet9DEPjXpOrQ6FTy8Y/n8Fc56qILCjh/9rDcLI2bM
	kJLG8L6sog5uyUo/nhrONXh3UGQs5hRHAWRN1rg7iQ0jmDngsHSYUu+MXtLut01KT8CnYWTtGIB+0
	q7R9i+zTgADJd+dAofEZlRWORrLCLDEgyc/Io3Cg+DVH3qwMngJsBzlPAIywPl12daG+87/9ndEW9
	vYWGS1j4nPUD7bb5JFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YaF-00HNls-5D; Fri, 24 Jun 2022 01:58:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4YaC-00HNl3-KZ
	for linux-snps-arc@lists.infradead.org; Fri, 24 Jun 2022 01:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7EBB2CE2710;
	Fri, 24 Jun 2022 01:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61277C3411D;
	Fri, 24 Jun 2022 01:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656035879;
	bh=AvM2r2Dwmkrp7nXgI3/YdLz+CcrC6G/+zDSepL9bQeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VavyeTXAbJB3UgTA1y4cRfrRCmV+QcK4jsZFnyj5E43eWud7//971HnGOkg4iNODz
	 xZRQuZzehWXihDNmBMgvhYWz7qqbICA0rRvtPEVRCFqzaH1MX8ZRqRVd2ZNNfxlyGc
	 NAiO8Idoc5EXVJUY9bjtq6YfRnq7BTpFCRAdNjHC+wlCjhOqxgGE3c+JLAxMk004ld
	 7LckmdFgTkSXFIK+JQvxY9rV9vvkGCY0iCw5fF7GyqmF2mE5aLV9gmUEDEg0iroxGx
	 0KiQ/lv3hJjwFmfw5CqBH1SIEnMkKRIwSSholq9EtSS3PFG5D9+xFzxCLxuEHknlU3
	 qfEiKQLMVqQHA==
Message-ID: <ac0b07c8-0cd4-6ab4-2939-ead4c813ef78@kernel.org>
Date: Thu, 23 Jun 2022 18:57:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: Julia.Lawall@inria.fr, rdunlap@infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
 <d104124c-5196-bc80-b3e3-0ab55f0cc35e@kernel.org>
 <89bc29c5-ad82-4f20-2855-44e57b043c49@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <89bc29c5-ad82-4f20-2855-44e57b043c49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_185804_901104_E14DAE62 
X-CRM114-Status: GOOD (  16.12  )
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

On 6/23/22 00:56, Bagas Sanjaya wrote:
>> In an ideal world yes. But sometimes maintainer complain to break whitespacxe fixes and such into independent fix. Also as someone said later in the thread, for somebody just getting into kernel and figuring out patch submission etc this could be a perfect dry run and helps improve the code anyways.
>>
> Seems like you missed the point that it's OK to have typofixes while
> doing other real changes (like refactoring) in the same patch.

No I did not.

> Quoting from [1]:
>
>> My opinion is that trivial patches like this are fine as a starting
>> point for new contributors, which is why I acked the previous patch from
>> you guys. However, if we start getting two of these every week it just
>> adds more maintenance burden than it's worth.
> I tend to agree with the last sentence of above quote. Let's pretend that
> I'm the tree maintainer. Besides reviewing real change patches, I get
> flooded by these similar minor cleanup patches that I need to review.
> Some (but not all) these patches have issues (say subject or description
> error) that are repeated.

"Repeated" is the key - First time I'd politely tell them to DTRT but 
will just ignore if things continue.

> Lazily speaking, I'd like to privately notice the
> submitter about the situation, and I withhold these for now.

Funny that you say this: ever since this got posted I now see 3 patches 
for typo fixes :-)
But it is something in maintainers purview and for now i'm ok.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
