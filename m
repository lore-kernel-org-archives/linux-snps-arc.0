Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149B0C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUA9IYb+UgDI6T/4qxSsqmUE2tV9nwDuKqENNpDcf/U=; b=FuM+yrYvBNn887
	2Jwmq0T/kw36epZEprZfm2N43rh4tkjxg+nDsVoyFi9aPgJP+TCHtiHeUcMMMum+LD5/oSR4cF+ik
	gyUTN7kBDMSh4B44E6J6zyRc9LK9jm3ZytmuvwRmsNvFwxgkx4LKmG5sEYovnJ5AdJcmD4KmTOSgq
	TKhWe3CcQ6awuzjogvXb8Zi0Zh/nM/y8He8sXxtfT0M72NCcS+RJsBqM3yDj3XeUqv5xNWcDdbSWa
	UzQ/KFemVWewqHPH3IlJOi9khr2ihO0jz6mFODQkNM7DjnR/jTGOCIc39qVTXqjLyjcSJqx2pCsJt
	zbGDqKpIt52SMxSrU65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWvk-000RCi-FW; Mon, 18 Apr 2022 19:21:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWvg-000RBz-Fr
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:20:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A156B81088;
 Mon, 18 Apr 2022 19:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BFFC385A1;
 Mon, 18 Apr 2022 19:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309654;
 bh=JkPoMATZPqYrWmJR/tP2X4yunIQyekw0+0bnzubxdDA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LkfWzKv35GijH0w5RkbjBNWBxy8ZNK8xSrpr1Cw3WJcg/JFwWeU41ZKdZH5yejwb9
 jLdNeQkJgZ7XY70lrYwCa1z2gMsGEMOL+feqSTIUz9iBBCDbKe4IIY3g4TF1fjTcxb
 38+HeXJLNNFJDKhnDtNzBAeWX1WXVB5PZFJmbQe1x1LwA8zXeIL7syKdQsxiwcx6Iv
 +dlpcfVeD1+2g3vwfb+ER4Wvqa1t1RFmI/a3zFwTgh9/4yANW85ahMT3V2zhoG2Bmz
 sDBXqOcx0F+skjSv4Fq7LvjV5Of0/P2KfLahKsvAQA8cAxLQzIxXyFYzFq+A2OBI1D
 3huqqHSPMhWFA==
Message-ID: <480a930d-8294-ddbe-6460-1a4aae319501@kernel.org>
Date: Mon, 18 Apr 2022 12:20:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARC: fix typos in comments
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>, Vineet Gupta <vgupta@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220318103729.157574-20-Julia.Lawall@inria.fr>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220318103729.157574-20-Julia.Lawall@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_122056_718680_BD6FD5A2 
X-CRM114-Status: UNSURE (   7.50  )
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


On 3/18/22 03:37, Julia Lawall wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall<Julia.Lawall@inria.fr>

Applied.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
