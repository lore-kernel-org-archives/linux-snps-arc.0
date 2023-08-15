Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB9C001DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nl3Co01FN8TGm0X6ywlhc94kW85/qUITOug5tXWWZ0=; b=UUcvUu25Oiw5iZ
	9STnk7VmRshBH6LyHL+YNXOUdA6tuNo2IFZ84uJIEzrd+JOSEjxXFHIypVcQ044Oh+qxpVKxBEdmM
	VXlGz5sZHot/ppeDDgl9tNQ5ehpJrcHiuzdc4E9nTSJJBPozCLdcDL/58zUvpFQ0SjWpzXwg/ltT2
	edSQdQvoB4RI8OiPljJpqdiRXqd2m/gwnXdaCxwl3RnMQu9lxoQxzOGIbB63yXahgCBT2G1IoewaK
	h/LfuhYvxKBYg41eSt6kQwpHeLiTTlFNzzmaV21R/98uB1298eAR2ZVcYIxHqMwghbtqwTbFB6uHS
	N6eETVRjKV9Ht3z3lZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVi9R-000c9e-19;
	Tue, 15 Aug 2023 00:43:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVi9O-000c92-2H
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:43:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8EB2C6110F;
	Tue, 15 Aug 2023 00:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1138C433C8;
	Tue, 15 Aug 2023 00:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060187;
	bh=CAc6ccKaUu5JgeNO7cRAaq04afyml8lpGLAg7ZKwFNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCiwDLunB25fBtAq6vETjoBeU4EhoEm9Pu0agaDP71anN6hSFajZor/453kadkoOj
	 ItKLP0GTFzrd2zCQb+7EMqIpOLlgK6uUtQolINsZIbUt2bWWMZJyHxke2QKzhSgqOS
	 llwIclOzxW+GjS3UB2H8X4ET7y/iaUh5BnA9GHB1W00EeXxCM8n+1TcfaqAuEYYSCv
	 UkD6Zbc8e/kfy+Sgn7r+jAtqj2n3th7semC4GPNC7gHwvAxSfSUtcfAKpMDDzIQzay
	 v46Vb/pXmDJLFp5vmAL/hU70ynOXqEIEVRvhJDSYM1cyQmdLbmpx6HXneGu0aGi/di
	 Bru3DIMedoGsQ==
Message-ID: <affd02d0-f0e0-cf09-7825-94c2bcc1f896@kernel.org>
Date: Mon, 14 Aug 2023 17:43:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ARC: -Wmissing-prototype warning fixes
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20230813191655.474577-1-vgupta@kernel.org>
 <961b0945-f783-4a0e-a108-4549ec702d22@app.fastmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <961b0945-f783-4a0e-a108-4549ec702d22@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174310_810296_C2082278 
X-CRM114-Status: UNSURE (   9.91  )
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



On 8/13/23 12:18, Arnd Bergmann wrote:
> On Sun, Aug 13, 2023, at 21:16, Vineet Gupta wrote:
>> Anrd reported [1] new compiler warnings due to -Wmissing-protype.
>> These are for non static functions mostly used in asm code hence not
>> exported already. Fix this by adding the prototypes.
>>
>> [1] https://lore.kernel.org/lkml/20230810141947.1236730-1-arnd@kernel.org
>>
>> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> Looks good to me,
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thx, Arnd.

Added to for-curr.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
