Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903E7C43334
	for <linux-snps-arc@archiver.kernel.org>; Sat, 11 Jun 2022 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqtrDo0qMwTWwcCH0FMOiJdmB0IE/PXjujF1tUjYBLo=; b=Mg4IQ3q4eUOVVG
	0J72Bt5VMnb3kiemvqPiGPJx1uDctlnvGpsZrN7dIrr6BMHhcuiH+kNqKZ/HpagFmabteoApzkukP
	L2jmsQe8g0YUOkYNe8+tn3jK19TP7EuhmcmwORicmRwqzDxAUHR7pCp7G/If/q3RxisHuBsYjbzHS
	I9dHCz/A7MkWiOa0EGyLz/V+s1FCkFOj+5BUPUEnv8CD7rT53qm5VbjFQuU7jAB9hpoq9PdgDQSeW
	X0Uxptns5JODc/dY6Qbhf+Hn31adGbTLqAqXK6JaAUhjyblyQT6IoGmRnPuVhXVuESIMFFvUNhb5M
	2wlDpDaJTq1qUX+X0UWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzoos-00AcX2-9V; Sat, 11 Jun 2022 00:17:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzooq-00AcVO-8g
	for linux-snps-arc@lists.infradead.org; Sat, 11 Jun 2022 00:17:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 35923CE390A;
	Sat, 11 Jun 2022 00:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26924C34114;
	Sat, 11 Jun 2022 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654906648;
	bh=x+7FaFW/vNwK+pUHUyn6tvqv2InhgiiGULVDA42+Wz8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=uO9pdv0rh8LOxhK1rYxPigrLzCjhDVgcb3GNcFeHiyM6Z+xKMIc2Hr69PZcR0VElz
	 I0rMgj+rfnmxvdU4Ht8yuuASWM+URBqrC9/sMbXwClfWTdHi7bcvnj06Qp2VpUSGzg
	 2mn5GXRhuciEvmCowekNL6qCY4sbo5/5nCiTcnx0rXPUVLtZNUqsblJE+27NJnwqm5
	 fGgBXRnxeNEJfGYrBndoW7DjlOlFjX8chxh+UC2iYeKXti58HULiFZcGK6qZNk/rtQ
	 xGkHevdSE39hPyz/FI74vtel0iX9yRGEZ/TV5+zR4Tk9VXG98TkEoP8txmCydtieVB
	 dVHa4fjvM6/tg==
Message-ID: <79570915-c8fe-e3d4-ba61-0647c3d72dd0@kernel.org>
Date: Fri, 10 Jun 2022 17:17:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] ARC: Fix syntax errors in comments
To: Xiang wangx <wangxiang@cdjrlc.com>, vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220603130141.6516-1-wangxiang@cdjrlc.com>
Content-Language: en-US
In-Reply-To: <20220603130141.6516-1-wangxiang@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_171736_533196_7753B0C7 
X-CRM114-Status: UNSURE (   6.31  )
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



On 6/3/22 06:01, Xiang wangx wrote:
> Delete the redundant word 'to'.
> Delete the redundant word 'since'.
>
> Signed-off-by: Xiang wangx<wangxiang@cdjrlc.com>


Thx for the fix. Added to for-curr

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
