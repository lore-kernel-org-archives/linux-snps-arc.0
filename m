Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C54E7718B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Dec 2024 22:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyFd9Ijx3keBx0+u7EtiOqje1i/w2mE0q6rVwidVLXw=; b=pMR5xkkKHYYech
	cUj+qmLCMOdZvVhhKmXCDzRVTFeAF/OVTU0dZVJL5yIQhgGVvC30m3x5KddhkDpBSxX8bWyLfkjgl
	pDoShghhcJx5uzk4yJsTMTlpDzLmgH0dv8mdTGTLNxp7yj3MX4ygfNAHjx+s7M7eylfZwMe2Fwwo8
	mtWAdpz1odKBu7ffgwFhQx0hBBPkAndQ2wn01b1gd0+yL99THL8GcXqeLI3fSDoTUHHZW88fZiGWm
	lBahy39da00ypZRlnOr5r0KnGHj6Oy0GQoQHsGPNDGXvX6Las30lTlqfJFMxmEMQvz2GJOI+kqzyd
	7yp8/FJ3zuzcvNZvUQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPqZE-0000000Aoen-0dGw;
	Mon, 23 Dec 2024 22:06:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPqZB-0000000AoeJ-2PAJ
	for linux-snps-arc@lists.infradead.org;
	Mon, 23 Dec 2024 22:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28E64A41323
	for <linux-snps-arc@lists.infradead.org>; Mon, 23 Dec 2024 22:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D39AC4CED3;
	Mon, 23 Dec 2024 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734991577;
	bh=Gw/PhiP9UAdU/f/nBD9ANPL61bnIV6cPbFZmVeKxehU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VNKrZOwmoM0UJ/vwjkg7Re10ZrglR2HqsK0qQQALqJEhgajeXnFJVURPxig/TeXmT
	 HT8Hn3z3OEFk0eLS0NsLWGHCX8Ovtkw/lGr3W/zO+D7g1421QHp5ORmr+zV5pTjYHb
	 3dw0N1hH8Ce4it717fW7OW3JgSetDXDcUQoqyZy7Ad4MER9Ax8E+mlpJVnUvDMUuaT
	 Oh5fH8Nfm5A8Ddh+b8PJjbt1U7BeVnSkNNzi4L8KLNTZkCjSf1ytS80ubWjtZFrtAd
	 lATWJgTcJsVM81CJ80HEcvXuOU0vqrLumhv+W+7Q/3w5M4ArHCamN3iDNr42m9jE2L
	 uaYNCrLnIq3/Q==
Message-ID: <829e5a35-1f13-4d6b-a49e-8ab1a4a6d249@kernel.org>
Date: Mon, 23 Dec 2024 14:06:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: migrate to the generic rule for built-in DTB
To: Masahiro Yamada <masahiroy@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20241222001505.2579630-1-masahiroy@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20241222001505.2579630-1-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_140621_681781_25ACB161 
X-CRM114-Status: UNSURE (   6.75  )
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

On 12/21/24 16:15, Masahiro Yamada wrote:
> Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> DTBs") introduced generic support for built-in DTBs.
>
> Select GENERIC_BUILTIN_DTB to use the generic rule.
>
> To keep consistency across architectures, this commit also renames
> CONFIG_ARC_BUILTIN_DTB_NAME to CONFIG_BUILTIN_DTB_NAME.
>
> Now, "nsim_700" is the default value for CONFIG_BUILTIN_DTB_NAME, rather
> than a fallback in case it is empty.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
