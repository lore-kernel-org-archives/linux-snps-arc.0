Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA45CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYDk2aG9eEIDcaWkAAhdwFYQ2DV1cxzV92mJvHAsvh4=; b=DOS4CLHHXtzQIpn/QPIQ7Q+p2/
	VIXs3U5YE5xtq5Eq8eDlvC1TFXOm5Mfg42REhMxkAD0VXHjZxZqXDZ1Lc4kJOGoDig7sS/Ga7I7ch
	bB0dEp1JJgl0s9AwYtsUVhL3tj1iYjBGthj3QEO6fWlT2a/2rDBpWTH6snbjw1YL1SrOrYNfq1H+l
	ngaEsWKHkWaJXsH7qpf2AWrTnRU6DcdwUSw/oNrUE8axcAKIadzs5IgOU7MKLYaQ8sD5gdLgkohza
	e2TAWEmYaVoymzqSFqmm4FcVW4IKwWakwy2fvJDWBQYxoOM7d4ckzcDWVuLyXSZFDSr/gv8GiPnaA
	WWe8Rpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWxg-000RdR-VN; Mon, 18 Apr 2022 19:23:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWxd-000Rcv-VI
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:22:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 723EDB81087;
 Mon, 18 Apr 2022 19:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ADFC385A7;
 Mon, 18 Apr 2022 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309775;
 bh=uzk/s8emvG9nDrcA+e8Yg2zneacs8ZthnnmYD/0bdtM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Zz1KqBGM+a9/gGati0Ftr0g47FW9dilYz4HODzX8x+64dPkWRzFu6S7h4rlwPfy9g
 q3fCul8R8BXZcOCS+26vF1pfROek4Vg3qZnQI4ik/4yrBkkrWeh12eBv8Xf94MzB6l
 sG8bXmfk19IJPgArxzI8B7fxj8xDlMg2tde5kIRAelBKWUFzPt5dc5NXuTu5cTHKPQ
 Jsqhcs5IGu4YX/TEC/iPgYip+HiYW8NNyZBtvYtmiYNlpJ+JJ0Je/ZdGf5tc9wmaTG
 VUJuXVlkyCIVzre//04aE3ph/WcMjMxtv7d2thmqfNuA+b78LGm88Rbq7IIy3JubZI
 GR/mQ9P/l1SVw==
Message-ID: <e0478a30-fe24-d141-4b6b-313d184df320@kernel.org>
Date: Mon, 18 Apr 2022 12:22:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARC: dts: align SPI NOR node name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, devicetree@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220407143322.295696-1-krzysztof.kozlowski@linaro.org>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220407143322.295696-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_122258_632296_B97A78DF 
X-CRM114-Status: UNSURE (   7.43  )
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



On 4/7/22 07:33, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
>
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

Applied.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
