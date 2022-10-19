Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DEAC433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Oct 2022 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKexg8t+FWAHrZIybEiARQ7goaVSQYSzCX//BObxBYk=; b=sAA/AqT1g/kKcjyNq0eNB/PK1z
	m9DcYxaPvVm9fOX49gpVtbueJo32UodMN+8jVwyhdlQ5qvWzdkQ7Jvmn6HpQSIWPF9RLtjA6Cv2Ea
	bXnoEuR4Zv9lZdeyuaLeO97DxzKryDHePm36Qrjl5GcezDyUThUvuS97AdnF7JWoUe5dhgCq5hIFQ
	R0P1Ke/V6mvW9koWgoNMVK06GyHoI5u0nk8FH5VXF3TOm0uaY7THfV4uuzZWuS94/Ov0qzRtcbTdi
	D2BQfCG4Cbyq+4FrDIQoPiQrC7/ITLRCymV9US2pMV+2pZNCSYEBVjUqCaf4gG2JyupNCPDVuPKB9
	5iy6qt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okwrq-00C9YQ-Nr; Wed, 19 Oct 2022 00:23:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okwrn-00C8uO-Nq
	for linux-snps-arc@lists.infradead.org; Wed, 19 Oct 2022 00:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2C515B82104;
	Wed, 19 Oct 2022 00:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDBFC433C1;
	Wed, 19 Oct 2022 00:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666139001;
	bh=oASso4BIYNm9JMmqjfxz8f0HQ79E5O2lTIOHLXPL0F0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PDHGHS97RFLJsZTpkxwvWWCTrsmWHx4z61HucmdeKqSlwVMSnwZOdd25TOvQ6SbGh
	 Bwd0Uy/rt+3/Juw8gVXfku90/lBsoxdZjrkLEVZ9LgoIJT/IM7wNYPexqa0nIDMRqx
	 QcC6n4jxWysUwYy5bdNhisjSS3ehTtue50p4PWn4j9gfRyljFYP+8xdmgKQ9E9/Wo/
	 up2bno5VVqfQBZ9SEXTLfbxgn6msorPshxoTpWFH5wWbtdhIYsKp8n0Rdaj+OUZOzR
	 JMUFi8Uo7/LEMEKvQGYyZ3TusYgzDQelkg/kKyP5+i1q5bgs+QjQm6Lmgvq1Y5kGNq
	 wSTybumv5qSUw==
Message-ID: <7443664d-6be2-6b3c-e211-d23636d66dfc@kernel.org>
Date: Tue, 18 Oct 2022 17:23:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] arc: update config files
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
References: <20220929101421.31590-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220929101421.31590-1-lukas.bulwahn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_172328_117091_9875FC7F 
X-CRM114-Status: GOOD (  10.40  )
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



On 9/29/22 03:14, Lukas Bulwahn wrote:
> Clean up config files by:
>    - removing configs that were deleted in the past
>    - removing configs not in tree and without recently pending patches
>    - adding new configs that are replacements for old configs in the file
>
> For some detailed information, see Link.
>
> Link:https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
>
> Signed-off-by: Lukas Bulwahn<lukas.bulwahn@gmail.com>

Thx for the fix. Added to for-curr.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
