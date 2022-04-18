Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F62C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgvlYF2gEY1FJ/XWjq2Q6Hms/gP5uLXgY4lN/qmryC8=; b=1fXlIWCpCqlL8T
	4VNQXGTvGnVlhtBNskXnJfzSTpLue0ZUobUH4e7akcpZ7OBXke6d7eDs1FomTj0E2uYIeCv5msvh6
	bOYz1BSV2sdD+2h6EN31eQ+wEf5+68C9KueAucbm46nuvZze7pm3TAGeLvTrNLPYbr+Lyutl9+ZSs
	sQOTjC8NikmxXu1n5dPkSuhApY0anw7DQwY1mghPqemhnr3Xi0k9wMeA850mwZXmJJ9qfcqd0PZ6s
	32mLuL6W+I3/1GsXH7LJnYRQcmeAGrcJB0z4a7caZnaKwVauHrj2j9/YL5+JWyA7SDnxCSoVn7aHk
	LfaLQCkQuNvFLLEV2GGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngX16-000S4D-57; Mon, 18 Apr 2022 19:26:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngX13-000S3c-DF
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:26:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D2FE60BBF;
 Mon, 18 Apr 2022 19:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E90C385AD;
 Mon, 18 Apr 2022 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309986;
 bh=Bsugu0M7KDhmH7NhEUfKmLuEKYuYpyCvG1gKZo7aeP8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HD+HImJa9Ugs7uk9jVsGNqETUdtjeckUfIZvFwyhKj1sFpFsyJLgV6tLaZTSoVeAJ
 RJ0Fd9w1p7Sja9meFLhbvFUgPKDNBE0GFYbdI6XNvG85cGebZ9duaadGI2hE94PIbk
 BuunRavbiChWYwN/+LBf8LukwJWMNWTEPspAzW7y/8fTFn4Odx+f6vrOHoAFNM/9Y8
 fL2cQZRIJjbMFEuHJUL0e/73rjBHZ5LGk4CKGTLc/30JSSu+tgRjLmYzjbWic01rC8
 wMzLPc0pASLDkjev0UpmXzq4F+VWMSUPAxC6FT/04Y1IFSKTdXFO8DbrVSWnbGhMMt
 6iLTaWyYvhAdw==
Message-ID: <4e666d61-077f-4165-e793-f92cce796ffb@kernel.org>
Date: Mon, 18 Apr 2022 12:26:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ARC: atomic: cleanup atomic-llsc definitions
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
References: <20220222140525.4002518-1-geomatsi@gmail.com>
 <20220222140525.4002518-2-geomatsi@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220222140525.4002518-2-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_122629_531294_D7E003B0 
X-CRM114-Status: UNSURE (   7.51  )
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



On 2/22/22 06:05, Sergey Matyukevich wrote:
> From: Sergey Matyukevich<sergey.matyukevich@synopsys.com>
>
> Remove redundant c_op macro argument. Only asm_op is needed
> to define atomic operations using llock/scond.
>
> Signed-off-by: Sergey Matyukevich<sergey.matyukevich@synopsys.com>

Applied.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
