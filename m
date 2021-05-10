Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0885BC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 07:17:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65EAB600CD
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 07:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65EAB600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h+SGwYS5pOuA88ehBq0ue2JSGrFJGuON1WqzKEMJ89s=; b=R9FSKTY0wtOJAU4S9AfqPofHH
	fpl4Jsx5Ze5AlrCw9C6+CUJN8M2qzcWf9wuN23Ej1ix7j9RmS3m121rUbVSUAyVHsBlJuOzTsWkzC
	UTV6x/NV4aT4ChQUQxCZiAwiYRcwHVlSh2zzLNNu6+v4xyyqpt8CY5QbUfhrLpo6sDIDSfLtN2ddX
	UqtRk76FJW4/BNmYpWivR3zxzr7/KXKviWN9nRhn8sQ4qjAls3J+JAQJ9aHz9VF8XIEpNzQ3VfbA9
	BUWZR2I1yXVWNVz4NyhcIfyBQlwSwEWRc5K/L+jHTctjhpcfTB233NkPyDPv9xoCz+OW+q/Tq3lFU
	8rnoxGDEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg0Ap-00DTfl-Ud; Mon, 10 May 2021 07:17:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0An-00DTfH-L1
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 07:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3arv3Gtm0sq0N0PiLaIYUUiRnUGhS6miaX1qW50yJEg=; b=LxPXyn//gD44BujaOnpnBSZiS2
 CPSuzpUEr8HqSh8wO+DRAYgk9gPVAIg6GPNtJ3IHFjKkMAzrWNRNQeudARX8NNUFw9mYlrJR0l0Ky
 9Zgr0I4qqAq99xi75hpxJsmf0WhOTVOGH9XrnENThRSCCUI3JZB+QS42tqDCAIyjoYRLGsDnaacaT
 X/09rLfToMqhBleUS//Km+AatXVOsjTCcMEfbmzvt53Iw6CpKWR15ANEfsWUVCvxJBY+x8qyol69y
 Ek2LjQFwLkAByQkWJue3p+JIe33Ud5LY/GLWknH00s739oJJA2pGCMkHtt7+G5TuthlltkrT1dqmv
 ogdK7mgw==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg0Ak-008Msq-AV
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 07:17:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id c22so17469651edn.7
 for <linux-snps-arc@lists.infradead.org>; Mon, 10 May 2021 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=3arv3Gtm0sq0N0PiLaIYUUiRnUGhS6miaX1qW50yJEg=;
 b=KmiuqHmzH/WtNWU88R8xGD2Zer0OQkinR3wIt/URrTwYl9ykURRZcwXpxwM2q48+6Y
 R2nJ9jgh+pbyB6GCcNpoJs9mdobiHhTwxJ3mFkVDR0jG1Tx/NYhf4GGg8+USgkjzDOat
 siqarNdgnxurcmKWxGcj9qVJ/4EInysND7/yFLEErLlwiHW/zLsTJGuukUG4H8iPs04U
 Z4pCMQ7dGNesqXNgVTuAIVV0/TKDkrMhYL6czwwkEtPfkvHgKbX4Z+63u6lbJFfo5n/D
 r31c0W+zbqrf9M3TzRyiM7DBQ/KNQ4ZZvfLSAzC5wKVjq6yFUZx7B+umvM40Z1OjfPMI
 /2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=3arv3Gtm0sq0N0PiLaIYUUiRnUGhS6miaX1qW50yJEg=;
 b=H2jrpJxYwiFSB9Q3p9who6XWcxiLW1y/An2aK+8i21/iYZ7gK/pE8ukzt8o4XahIej
 nVwxAcWr9Oa0+FVsmkw64it+ak69n2M4Sp4vp9u/CeSKdWOGvg3v3rXpP0yx+KKwq7My
 Al8cm+3/A0SFiNd5QMZkv0SMRiOo3H9IL//gDrbzYG04p6NiJNpgnPjJAybppA6pqjmN
 zuU2DsFQMiAhPDHBZ/dPPOxksjtOjiFyXkOX7rPwf2EGmnSHXGJkMV3ZdFnjVWYN7PB6
 RMP/SMRUPfb6puWExkAykXvN9UxBFpikyhRdez5ezu5IMeFrGM7x3RnOuXpKJ46FXMB5
 kJ6A==
X-Gm-Message-State: AOAM531DX1ECATwYkq322oZs6geeNUzyYpLJ+CwtOQqqh6HoSvPRKAA7
 fJHpco8YREgHfFBHNmMC0sQ=
X-Google-Smtp-Source: ABdhPJyLqPMsYa2P2YPi8sKxITEWjFA0S621HdqJ1JVG6p9asLe4ms/ZWJFBA44hz7zDiquZ/PTXrg==
X-Received: by 2002:a05:6402:406:: with SMTP id
 q6mr25470119edv.110.1620631063954; 
 Mon, 10 May 2021 00:17:43 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 dk13sm10642338edb.34.2021.05.10.00.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 00:17:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1lg0Ag-0006y2-RH; Mon, 10 May 2021 09:17:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vineet Gupta via buildroot <buildroot@busybox.net>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [PATCH v2 1/3] ARC: config: explicit'ify -mcpu for cpu selection
References: <20210507004344.3166099-1-vgupta@synopsys.com>
 <20210507004344.3166099-2-vgupta@synopsys.com>
Date: Mon, 10 May 2021 09:17:42 +0200
In-Reply-To: <20210507004344.3166099-2-vgupta@synopsys.com> (Vineet Gupta via
 buildroot's message of "Thu, 6 May 2021 17:43:42 -0700")
Message-ID: <87im3rt5ux.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_001746_379940_8958752B 
X-CRM114-Status: GOOD (  13.09  )
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

>>>>> "Vineet" == Vineet Gupta via buildroot <buildroot@busybox.net> writes:

 > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
 > ---
 >  arch/Config.in.arc | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
 > index f7a6d920b50d..f84dfab38ae9 100644
 > --- a/arch/Config.in.arc
 > +++ b/arch/Config.in.arc
 > @@ -12,14 +12,14 @@ config BR2_arc770d
 >  	bool "ARC 770D"
 
 >  config BR2_archs38
 > -	bool "ARC HS38"
 > +	bool "ARC HS38 (-mcpu=archs)"

I guess this could be handy for some users, but why are you not doing it
for all variants?

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
