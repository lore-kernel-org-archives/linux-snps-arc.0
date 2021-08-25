Return-Path: <SRS0=KIIo=NQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B592EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Aug 2021 04:39:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C0D61246
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Aug 2021 04:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68C0D61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NITY3vZHikzuGBRVxWiJL5iIQBuM+rGkEX2j7BzD+Y=; b=G38hRA6ukZgZqu
	vjBmOvXk1lsPW+57R/D7s/ffwouj1eJ8EcxixpI/6pYHgBMDkqHviUlyg1/kC+qNe7Vakb3Y0LBmy
	gwNN29sto9FIJbMNXS5+w8TaUhlHs+TDbBopHOn6cW2hflRvU7ZqXFtWtUsn/U5PkRBzQ8skHBfXH
	gyuhhpwZrrXihJwYv6AL9D1pH3DeYQMX0ceop+10baAJhN2fh4zNC6lo7bsd4qQROt5DvrouVmIyS
	PI9Au7IA47WlhFlbzC8MMaj4HfJPxjRfr4B08q5eD/9HUgGMF6E4qL+yqNhCIrI/UeIrHpjKTA8Hl
	acNUfFispxdn/HmCRrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIkgo-005Toa-UM; Wed, 25 Aug 2021 04:39:02 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIkgj-005To5-D7
 for linux-snps-arc@lists.infradead.org; Wed, 25 Aug 2021 04:39:01 +0000
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 17P4chKv008167
 for <linux-snps-arc@lists.infradead.org>; Wed, 25 Aug 2021 13:38:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17P4chKv008167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1629866323;
 bh=ghMeldz2FSJgsGbHpb2xXDwEpCxBtlcCW3CPZ3H7dro=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HkNK6/PmNTNJWuhaCzJNB+fa3vmdHYLCMvqTl6vbKhsYryZVPFyXgLCH+o019YpsK
 S9C/FlUYCHRCWBjmSCO9Q74ez1zQhnJKWygs9bNxClnGHMv9cm9FfVSLX19MIRFj9Y
 7JO5WmR/PZTVQo1W5sB1cZOvgQ3A6YsuKvFXdVS0fNE26RzrN14nvN7cCnFAEIhX9b
 qVoin2I5sMQmxqpn28LFffWj1docL3f8U3O6iLtL0wm9qAWT6Xewibi0mceztzz9kJ
 CZZ3hDxEm+5umpXCNP/R4JPhYo7JY109mBZWol6uRAnEva7PYxeLLhVJIBlrOMM3V1
 DEabkqQUDRYww==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id w6so13569501plg.9
 for <linux-snps-arc@lists.infradead.org>; Tue, 24 Aug 2021 21:38:43 -0700 (PDT)
X-Gm-Message-State: AOAM532MSXvj4HKqWmIafd2fGeudMCsvZoFJmTeS59ikqQadubEEhkN5
 bs8UvZT4KbESWTeQ51BUOPoA6f3cMZJPyCYFPxI=
X-Google-Smtp-Source: ABdhPJyTggCjmDmxU39Sm+EqceyjjgOcfwdnP+TpuyabKZaRk+8NKLyxCvu59yefd+umqCXUYobMxSUcC/f4uMwGr30=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr36578125plq.71.1629866322644; Tue, 24
 Aug 2021 21:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com>
 <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
 <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
 <8b9bf97a-8f6f-80b9-3bab-32bb525adf9e@kernel.org>
In-Reply-To: <8b9bf97a-8f6f-80b9-3bab-32bb525adf9e@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Aug 2021 13:38:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASN2YmH5kxzx8XMxM5UfJOEc9JJ0AWdKsP8=Fr9wqSN0Q@mail.gmail.com>
Message-ID: <CAK7LNASN2YmH5kxzx8XMxM5UfJOEc9JJ0AWdKsP8=Fr9wqSN0Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Vineet Gupta <vgupta@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_213857_702993_61866D56 
X-CRM114-Status: GOOD (  21.11  )
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

On Wed, Aug 18, 2021 at 10:40 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
>
>
> On 8/17/2021 11:07 AM, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Mon, Aug 16, 2021 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >>
> >> On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> >>> cc-option-yn can be replaced with cc-option. ie.
> >>> Checking for support:
> >>> ifeq ($(call cc-option-yn,$(FLAG)),y)
> >>> becomes:
> >>> ifneq ($(call cc-option,$(FLAG)),)
> >>>
> >>> Checking for lack of support:
> >>> ifeq ($(call cc-option-yn,$(FLAG)),n)
> >>> becomes:
> >>> ifeq ($(call cc-option,$(FLAG)),)
> >>>
> >>> This allows us to pursue removing cc-option-yn.
> >>>
> >>> Cc: Vineet Gupta <vgupta@kernel.org>
> >>> Cc: linux-snps-arc@lists.infradead.org
> >>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >>> ---
> >>>    arch/arc/Makefile | 3 +--
> >>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> >>> index c0d87ac2e221..8782a03f24a8 100644
> >>> --- a/arch/arc/Makefile
> >>> +++ b/arch/arc/Makefile
> >>> @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
> >>>    cflags-y                            += $(tune-mcpu-def-y)
> >>>    else
> >>>    tune-mcpu                           := $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> >>> -tune-mcpu-ok                                 := $(call cc-option-yn, $(tune-mcpu))
> >>> -ifeq ($(tune-mcpu-ok),y)
> >>> +ifneq ($(call cc-option,$(tune-mcpu)),)
> >>>    cflags-y                            += $(tune-mcpu)
> >>
> >> Any reason not to just turn this into
> >>
> >> cflags-y += $(call cc-option,$(tune-mcpu))
> >>
> >> ?
> >
> > Yes, you'll need to pull up the source; the diff doesn't provide
> > enough context. tune-mcpu is used in the body of the else branch
> > hinted at by the diff. PTAL
>
> Ah, fair enough. The warning is a little unconventional but oh well :)
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> >>
> >> If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.
> >>
> >>>    else
> >>>    # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> >>>
> >
> >
> >

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
