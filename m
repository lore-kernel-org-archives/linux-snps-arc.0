Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D942FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 18:34:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C9A461168
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 18:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C9A461168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgMHqPVxR+dAmqMNVPvRVkKXJe/Aub++cHYQUv/wObA=; b=OF6U+PQf5H4xw1WPR3Ah+m7gm
	ut69rUn3zGHMf4roJ5yHDaLFLdSSzVRDp0sD2Ujh4yxelZ0yYzPDlU+aHDdFXhY8Sd1gN+5ZvTlWo
	wxaPBdV4U3m1DAG6LmSz4dWI5hft2nKcAJPinX6FMoQP4rYlk+TISUcale1OnQMJSq0r730W3pfPo
	bP9ecPKCEJruiUFoduxBQkP80ndeuaS4USxt+ZK7R8hG1WgVjUYg9L0kSbDKW7SbDhdK0Mo1gg97O
	e8AGFf2ubAA8OPD2gF8A4A4Rl6KqqiNXW/JFKfPXKkbvJWu4AmUzPybN99kXf3vFkmGYllr952Gj0
	ewZJDJ35g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUD0E-005l9e-Ro; Wed, 07 Apr 2021 18:34:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUD0B-005l7m-DW
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 18:34:09 +0000
Received: by mail-ej1-x62e.google.com with SMTP id hq27so29256733ejc.9
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvBUytbF0u9Y37zhuQWxKu0ki/OoBvG5WSFFefH+HnU=;
 b=FHCq/JDjQtTkfDINVJn1rxZ1/P1FyqYfMr8n1/TEZFe0IzFjhBl+dOEHLXncikAA5r
 dV6XECNRPqOhYfNk2ez89hR+4nyoEZaFEP9sNKfPnTX2lhCOZwfEi3KwXLI3mz8jWYpn
 0R9gsKyD+CvFawdl7fEhN6KoCNk8DZCKyrCSZ2SFAy+oxmWtRsEWUELTpndxKWVeVeCM
 CiERs0t3mSx96rE0wNl4/D4gNSa1zn57zUx46i7weCAdsRqBZ3z9SJwZWjzCsNGq7HC+
 1uWdBSM3qPlz4XvNh9sclWtRvoVveAVfjM/XkE/6Dt++gbDJXQBjspaX9hA9diOGOHv4
 HwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvBUytbF0u9Y37zhuQWxKu0ki/OoBvG5WSFFefH+HnU=;
 b=CJov3XukJV6AaN7Lhrcio642dgs5YBbKMeDSRt6FSzRe/8yDeezsoe+5LnlL0G6KGR
 /rDQTCEUPCci9Bj/JCOIsCWOnfzLwhMNvLC3o7/zIAAIUOiMN/Kt8tEFKULvNVFs1BF3
 GEE3AcLTJjytasaSjyEXYlmD80XL6S8XSwcUPqg34+AL7nbm9bpK29FcXSKDXJEU814X
 ccDAAoJfT5nadn6znj2OuyNZxZtVWUnsC0k4t3rbNjhGUGTIlstBgysxfOfYRstlZ5yb
 4JsAJQQXJAcYExirZU5uuhYOnbb3LsSvVLSxXQTfFC3/IGYs7UKkjDUm7VWQJf5zUW4s
 S43w==
X-Gm-Message-State: AOAM533Lz5HBHszS1EhVSN/eueIMf0p6a3f76OPfQkwgyU2Jxr6KS6bV
 o8Nsf6zD7YxDtS5ZguIX2jS8itj0WXesWIKI92bL7g==
X-Google-Smtp-Source: ABdhPJw4zNAt1B4q/q1dyn6Pnc11aAWnOireH/gSlzzRa4GI1CrkoXBPegbc1FAhMzqxdh5Gg153TLsW8Vxg3KUFBg4=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr5252318ejz.382.1617820437415; 
 Wed, 07 Apr 2021 11:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-7-cupertinomiranda@gmail.com>
 <2d3c797b-74a5-d464-fbbd-5819c88d828d@linaro.org>
In-Reply-To: <2d3c797b-74a5-d464-fbbd-5819c88d828d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 18:33:17 +0000
Message-ID: <CAFEAcA_tpx36QBJtegt_ChySnpYm+rqn5B+gMkuWDXJpUNDrZQ@mail.gmail.com>
Subject: Re: [PATCH 06/27] arc: semfunc.c tcg code generator.
To: Richard Henderson <richard.henderson@linaro.org>
Cc: cupertinomiranda@gmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 shahab@synopsys.com, 
 linux-snps-arc@lists.infradead.org, claziss@synopsys.com, 
 cmiranda@synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_193407_578146_266E946C 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, 7 Apr 2021 at 18:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> > From: Cupertino Miranda<cmiranda@synopsys.com>
> >
> > TCG generator scripts for semfunc.c file.
> >
> > Signed-off-by: Cupertino Miranda<cmiranda@synopsys.com>

> I don't know ruby at all, and don't really know how to evaluate the rest.

Yes; there is a massive hill to climb to justify adding yet another
scripting language to the code base. The strong presumption would
be that this should be a Python script.

I agree that rewriting the .c file is very weird and probably
best avoided.

thanks
-- PMM

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
