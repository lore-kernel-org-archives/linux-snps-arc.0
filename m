Return-Path: <SRS0=8txo=NI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8EDC4338F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 18:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8AE261029
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 18:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8AE261029
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzinDK7OT9BJ0Z6ExAXc68TDc9WSTSjKzDproE78w+g=; b=YT6PgISQsrnUEH
	z/RuQ5WjYnnBLWmaW1ftd0YDirW5RL51jEUzUZb1FawX8FWSbu4S+NhFBJn5HccYwD3NOnFXNldbT
	boso5NlZHzfG7ToX7w/Hl8lrkn3i6u0kKeDTtxLFEuYrazX6ISa6DVfzXReVU+FydCV1VPbXDKm6n
	AI3aI+7eVUWmm6MOxGd+5aPJSgxUXpXF0vN+1nlOkl4ylsrnHv2nKNio8t5ArLChVkwzT3zKBJqTH
	+oJfl/bReoPBYzaMF3hZ4602FDYIn6u2VkaPXbShZDpYtFGISS3Gkxp+OC7vkQ9wjBi/dVpzhcQ3V
	xm35kVP6+UHIriDf7dQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG3VK-003CNY-CM; Tue, 17 Aug 2021 18:08:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG3VH-003CMK-9f
 for linux-snps-arc@lists.infradead.org; Tue, 17 Aug 2021 18:08:00 +0000
Received: by mail-lf1-x129.google.com with SMTP id x27so43011315lfu.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 17 Aug 2021 11:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3Ka4koAuO/eyWNzbf7wpZBKsg+7E2Iw97vQbCYohS0=;
 b=NKdK8us0UjF2ppRMH86hdVaNueUfnMBvVo0xnUJrja01i7RDrT+fQkYMpzDYTDWH1r
 tOhyqLud6C5Jbi1f2+ze6/nGP4+XH+hUrEoPYtCZBVdAQ8TQCUIgwe3CQ1a5Tszldu1N
 Vxnnt1qCx7DgsYm68Do9wIUFzF+LFRScwdKcxkj+7rAPI88iIffQuwlpZXkr2LGBTH2J
 5FtOispkpA5ky6OrkrZv3CavGXNnJ5ijzKKwAyV0YM4q1uZARsR3vxX73p4X6RRnGGfo
 vXvqf6VEkUHT5TRk+JvxFP0dXko+A9GmBZdoKJ+n8ky4UDkxIgSKkqo6SJgLb3DqRn5y
 27Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3Ka4koAuO/eyWNzbf7wpZBKsg+7E2Iw97vQbCYohS0=;
 b=sVsEABXicIHhSCaxm3YnPA5Whyoj+kc/aVLA0IlYijw3DvwC6kS6lh2BeO2bPkhDeY
 j06yoC1Umalq1faHvzOUHuA0QJr7De3+S5dDD029t3+5XLKQ1MfbifzN1jTcvdYeqXTZ
 9+QciA+fNl8y2Ds+LQLwYR5qmNo944yJGUQEpxr82UZlrNrKUXF1tvWlbkpfF2TomXZq
 DQylCMN+rhz409j3x8HTUGoAP232HVeYHJAMmvcwWp7V6pzLdPj2xuSmXzIwISNoEi1e
 2Rr0+eiYtwMW8TMOT4+NNqFBsvn2wR6OJNkFqXFQM066bw7GSqPOxC4faUqZXwACH41L
 qqnQ==
X-Gm-Message-State: AOAM531FtRRxQYhe4oUw6E62EClqmvlDGvgK9axtpRmIn0YcJlqzcIyS
 JlaACNO4VuTKgkTPzg4zGELRmpmKBNzniVgIi6Ytcw==
X-Google-Smtp-Source: ABdhPJyRD0Yu6Wccx8j1XxfX9A1nXqv/eybdNeKph2H0pBv/4jnbGUXJS9WI64EHG2MCCnyNynl1F6KGtDwIke3gOMA=
X-Received: by 2002:a05:6512:3041:: with SMTP id
 b1mr3246042lfb.122.1629223676223; 
 Tue, 17 Aug 2021 11:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com>
 <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
In-Reply-To: <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Aug 2021 11:07:45 -0700
Message-ID: <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 clang-built-linux@googlegroups.com, Vineet Gupta <vgupta@kernel.org>, 
 linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_110759_400894_A0C03329 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Aug 16, 2021 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> > cc-option-yn can be replaced with cc-option. ie.
> > Checking for support:
> > ifeq ($(call cc-option-yn,$(FLAG)),y)
> > becomes:
> > ifneq ($(call cc-option,$(FLAG)),)
> >
> > Checking for lack of support:
> > ifeq ($(call cc-option-yn,$(FLAG)),n)
> > becomes:
> > ifeq ($(call cc-option,$(FLAG)),)
> >
> > This allows us to pursue removing cc-option-yn.
> >
> > Cc: Vineet Gupta <vgupta@kernel.org>
> > Cc: linux-snps-arc@lists.infradead.org
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >   arch/arc/Makefile | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> > index c0d87ac2e221..8782a03f24a8 100644
> > --- a/arch/arc/Makefile
> > +++ b/arch/arc/Makefile
> > @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
> >   cflags-y                            += $(tune-mcpu-def-y)
> >   else
> >   tune-mcpu                           := $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> > -tune-mcpu-ok                                 := $(call cc-option-yn, $(tune-mcpu))
> > -ifeq ($(tune-mcpu-ok),y)
> > +ifneq ($(call cc-option,$(tune-mcpu)),)
> >   cflags-y                            += $(tune-mcpu)
>
> Any reason not to just turn this into
>
> cflags-y += $(call cc-option,$(tune-mcpu))
>
> ?

Yes, you'll need to pull up the source; the diff doesn't provide
enough context. tune-mcpu is used in the body of the else branch
hinted at by the diff. PTAL

>
> If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.
>
> >   else
> >   # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> >



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
