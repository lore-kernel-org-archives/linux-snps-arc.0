Return-Path: <SRS0=8txo=NI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5716DC432BE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 03:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212A660ED5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 03:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 212A660ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6TO+WQntPO/VCLJo8XwBCUe/OVOrhAUk4jwtcdGs0U=; b=re6d5l90lNeRs1m3b6L7klSG44
	PexziayFpAlnw47pHuNiPxHPQFWrsFH3nx4X6ekUjfz83SuPCCzRLV0dAlorX9OW3uU8QSVwkxtiL
	KVhnmgFRPbIP1fxsau58F8XEN9cA8lbRNSxDhMwA9C0v/n9vJNbhN2yKVApCCU2KbGYUTUNFlsZ2T
	dhoWzh+7ZNVjt7EbpgbzDfl9MkHLHi+Ng2ge2NKsm5iNRJBEBpgRqfVYHsmj/hwVz9r399hj5XBsf
	fhJ26DNceOHvx4h+y5b15zNuWgCH9+9L9SFKtWx9uZpCJ3Wjh7lIBFKDK8jM84MXvReUT53ao8cIZ
	gXezcwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpKe-000t2N-0I; Tue, 17 Aug 2021 03:00:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFoTu-000mkp-NQ
 for linux-snps-arc@lists.infradead.org; Tue, 17 Aug 2021 02:05:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA6960F55;
 Tue, 17 Aug 2021 02:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629165932;
 bh=do4gAw28sO3tGDlWSjexb3s3oGika8l30YwihCaYLzg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PFytUkkd8JPOtJNn2ChtVI4nLYAg7oQQAvg2SVi/hvNPRJ2ZFrpQOX445C4BM/XC4
 FfKf/J5+n7PlrbyQTVaUIIBHvfSZQwGgRfI86MSp7wn6WoG0cdBSGIwPBP2D1MukGL
 SR/WrbO/9A1A/+zrqR+gSoIu7rjepa1DofJlI8jTESH8o2cjM6/LjaMgW1NGFR8lGO
 Cy2FQcQleUuBGj/lNJt3wTp4sb6A39/dg5elXr1y1BA9O2Q1F62RKOYPvLVtI6mxjU
 p9i9r2O0v4Dy5qkd7nfgs21HVDkqkaHCyZcY8ajS/Dyy3hktU4xDFXGh9sx68PA+Yz
 pgL2byqE5kcNg==
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To: Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
Date: Mon, 16 Aug 2021 19:05:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-5-ndesaulniers@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_190534_872614_4FED5AFD 
X-CRM114-Status: GOOD (  13.63  )
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

On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
> 
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
> 
> This allows us to pursue removing cc-option-yn.
> 
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/arc/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index c0d87ac2e221..8782a03f24a8 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
>   cflags-y				+= $(tune-mcpu-def-y)
>   else
>   tune-mcpu				:= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> -tune-mcpu-ok 				:= $(call cc-option-yn, $(tune-mcpu))
> -ifeq ($(tune-mcpu-ok),y)
> +ifneq ($(call cc-option,$(tune-mcpu)),)
>   cflags-y				+= $(tune-mcpu)

Any reason not to just turn this into

cflags-y += $(call cc-option,$(tune-mcpu))

?

If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.

>   else
>   # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
