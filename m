Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF81EB64D8
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jun 2023 19:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APDUxgbCXbf0UUmIHHKnYrXWx61itIUiQmUa+16RymI=; b=FQYWq0VZ3QcRVB
	a75yUquJIH+S66JIEdXX7WS3k4Fzm7ZR+kCDX6JDcHVs+vNeysu/e3xK47/sxeYZwccwLKY2935fQ
	YYYi4dccdQkDU3oYMpsntWLIELPCRKSQ9Z4HT9IwHlNRL+zUIDzkjELzkLgl1roLdyb+6WhNmQFDS
	wY7mKU+u2XDShLNiS3UqqEent21cDi3+oR3Z0m6lXlRchNwfOLVXdJBDk3m4djdsDVz9BcZQI/dt7
	lwJOIXeB9FgU/UEBrbNsT+BJjKKeEiuiTT6iajGVmXNka5xTtPC0jXpU88L6k8iTeKSHGtRW9WetR
	xYrOueFb3CqbXkZCjxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPiN-001X5q-1K;
	Thu, 22 Jun 2023 19:11:31 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPiJ-001X4U-2c
	for linux-snps-arc@lists.infradead.org;
	Thu, 22 Jun 2023 19:11:29 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 838203200583;
	Thu, 22 Jun 2023 15:11:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 22 Jun 2023 15:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1687461085; x=1687547485; bh=yyY/dDd3tvUCahRRqoC7g6pyVZrYiHcN7zY
	pSqNwxsw=; b=CCLGmyLWdac+LsnQUf9Qqh1h3zTLhsgQiZmaaqOeysEf0xZDsMW
	u0k9GiqGFJtFW73vHY/cQnHmDHnex6t2v57f6//jd2ICOFco7zinccAvvXziqr89
	NoWptFjJdvo6k/WhKj50xo/mGLocg2jBPot9Uj1tolFlPi2zwwYrjz3ojkUVcmHa
	f3NB4//YtMkG6BiIN12bHN6rayVxb9Z8vN3kJXzgoFFnOBiivcKyFO1CdbCJA8qV
	Sc/WKkxKbceTf1RQNOFHmDGfLWB7zgdNIuZh2VPdLcxAK14LLpo9EFTfFhCDjCQf
	/umvgxCDNyVsz9hHr+lH/mDV+1labBriXaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687461085; x=1687547485; bh=yyY/dDd3tvUCa
	hRRqoC7g6pyVZrYiHcN7zYpSqNwxsw=; b=BysV2FBqN+cX2CP3/Hdt8+oU+aQMW
	cpxrjDIxwLTX2J2JgYl1dmDqXNONwqyLssVK7KLdJY5mb9pQ5m0aZKVJfEhf6nBe
	eP0u7WxUh5GY7y6QSrjpxr+74vE5SUfK1lP7yaUcql1QxocGAhwHu1fYP8BrhB8s
	hS5hVbL9pOME5gmTcM6Gl/nyAeVLGC1uXd6hufq/jRKy5KcFjbVuo68YqTlOXEMG
	vV8ySil/4jeDVCD+qUmHRM9rBevfcc7UuZYXQcF2Y5EvnY+ULg6rGOM258Ycwetc
	qdIv5+XX8ec8D+skmsr3uRQN73NkCDQipQ1G1feEvv2BsbnaICXr4O5Pw==
X-ME-Sender: <xms:25yUZMjefGgtO263i2ESiGguwkf4hdN7ApztZqyf2ae04LfCZ5CEfQ>
    <xme:25yUZFCnqMUokSDuEQX9buwfAbOROtbk4Aacmq5su6h0AYWJAXqxxeTSeWPAy_9po
    bv6rbUF5x3k_vpu2S4>
X-ME-Received: <xmr:25yUZEF1QUT2_OJQQMmtNWCAUfaDYShHwav1jsbWLKsaY1nCMfJEVPtsQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhs
    hhcuvfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqne
    cuggftrfgrthhtvghrnhepvdekleffgfetfeeijedtieehtdeuhfegueejkeevueeileff
    gfduleffjeffuddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjohhshhesjhhoshhhthhr
    ihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:25yUZNS-BprHtfLibC1L6fPHPIxvdS63woeikjb0QkVdH499v5KfSQ>
    <xmx:25yUZJx8BaQ4duPXkGxilgm_nLcws4PuGQxPLyQuYB2wCyAP1TS-4Q>
    <xmx:25yUZL7SAG1c4VWGamr8pJwklFBWASxYwAm10nECwGQB-VIe_Qyzlw>
    <xmx:3ZyUZAmGfx9pivW41mbNoGe3NJDVQWDWg6i20c0LHfYi4fCgsbSBZA>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jun 2023 15:11:22 -0400 (EDT)
Date: Thu, 22 Jun 2023 12:11:21 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] kbuild: make modules_install copy
 modules.builtin(.modinfo)
Message-ID: <ZJSc2QFJq+KIUR+E@localhost>
References: <20230615111743.883891-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615111743.883891-1-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_121128_078145_37236BA1 
X-CRM114-Status: GOOD (  10.15  )
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

On Thu, Jun 15, 2023 at 08:17:43PM +0900, Masahiro Yamada wrote:
> Josh Triplett reports that initramfs-tools needs modules.builtin and
> modules.builtin.modinfo to create a working initramfs for a non-modular
> kernel.
> 
> If this is a general tooling issue not limited to Debian, I think it
> makes sense to change modules_install.
> 
> This commit changes the targets as follows when CONFIG_MODULES=n.
> 
> In-tree builds:
>   make modules          -> no-op
>   make modules_install  -> install modules.builtin(.modinfo)
> 
> External module builds:
>   make modules          -> show error message like before
>   make modules_install  -> show error message like before
> 
> Link: https://lore.kernel.org/lkml/36a4014c73a52af27d930d3ca31d362b60f4461c.1686356364.git.josh@joshtriplett.org/
> Reported-by: Josh Triplett <josh@joshtriplett.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Josh Triplett <josh@joshtriplett.org>
Tested-by: Josh Triplett <josh@joshtriplett.org>

I'll send a followup patch that makes the Debian packaging script use
`make modules_install` unconditionally.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
