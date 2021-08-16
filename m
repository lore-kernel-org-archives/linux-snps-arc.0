Return-Path: <SRS0=rFYR=NH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6782AC432BE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Aug 2021 19:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3418861073
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Aug 2021 19:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3418861073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+SYrJ1vdFLNKjPTcHgHFkGpnh3B68l1DY14ran+q7s=; b=Lhow7Hb2TQQkjPXSAsbTKTKehb
	3H9FRw1iT6tmP+amMvPprKFzULbYrfzQ7nJuDFfWdbQH/k9lDMSIiO7a+PdRNEV6HXmY5FcwN05s/
	9fDvbksfBY0YjL+8SM2YRl5TjmnJivbMBtE2323MrxACksf8lxHbhBWinVcn0YIN2h1skSGPKR3GX
	eoUjS+jUoI3qFMnlIAjveiZZi9e4hWCjzkUyr/jMUbfbf/blr420S8dOERBqZWAHUJx1QUO5DRHzx
	x0lKBCb4NsPOllvDN+muYOLmJoOGwFkXjUkzfGx79K4bqyjJBhIOHOOugjRS4R31aEHcTR0m4yM4j
	6bhjZYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiXj-000DDB-OW; Mon, 16 Aug 2021 19:45:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiXh-000DCY-Kq
 for linux-snps-arc@lists.infradead.org; Mon, 16 Aug 2021 19:45:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54AF560EE5;
 Mon, 16 Aug 2021 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629143104;
 bh=3vUrvHO/jx7yMiBOS4Ce94K+3n61pUF9j/jGzg2zV9I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VGOxvHxh1BCCnbf10ZKR6ppPnPP765JjvB4BCCBoKklLLLuZa3JvHqCkjV5C0mfbz
 0TLHlEK9WW+FCeV/V9otKetcGSk4DbaunraYixObvbL92zaNQalSVjHsUSup7acKwc
 3+z43KH44NP+WMgic/J3eF6BUPxXW2HQGh9gE83xkkdtXAaHhjD5suq5r0M6HKvL+f
 Y6sH5LLpPBNZJw130ooco3Ma3yVmGKegEtbOc5i3LinMUZyQ4bUfjt7EIyikrTkxWg
 qVNT/y/p7/0rmID/2u5nO10Nn42FPaZwtHsVEVtPvtmuJWxhXb7eBx7slrLwcDd1+y
 4sgwUgRK+UyJA==
Subject: Re: [PATCH v2 01/19] ARC: mm: use SCRATCH_DATA0 register for caching
 pgdir in ARCv2 only
To: Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210812233753.104217-1-vgupta@kernel.org>
 <20210812233753.104217-2-vgupta@kernel.org> <YRjd5N012YInbZqX@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <e524546f-92e3-38b9-c72f-ac8ac0c013c9@kernel.org>
Date: Mon, 16 Aug 2021 12:45:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRjd5N012YInbZqX@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_124505_780679_09A072A9 
X-CRM114-Status: UNSURE (   8.51  )
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

On 8/15/21 2:27 AM, Mike Rapoport wrote:
> On Thu, Aug 12, 2021 at 04:37:35PM -0700, Vineet Gupta wrote:
>> MMU SCRATCH_DATA0 register is intended to cache task pgd. However in
>> ARC700 SMP port, it has to be repurposed for reentrant interrupt
>> handling, while UP port doesn't. We  currently ahandle boe usecases
> 					       ^ handle both
>
> maybe ':set spell' for changelog editing? ;-)

Seriously, about time I stopped fat-fingering

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
