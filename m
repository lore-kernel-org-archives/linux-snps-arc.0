Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE98EC64E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 12:28:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E96206DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 12:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XfOqMXCV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="qhEuwsNE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E96206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UFP+Rh/TqiMgLE3RP0mPVWLUTnu0TBoMKhS5sVG6Dec=; b=XfOqMXCV98Gvp4Pxv9ZOlqACC
	7WxfTdy8zi80oUOEpgAIvxaxJ4Fsw/IWme5Vxfqbgld2uO7TSML+OmkB5zR6fy7T9TI+4pYg6ItNG
	HpGBX1Z05+F7Euoft2FVr4nhu8tHEDgrEVkyxOco3xV3oOItZZaSP/SGQGvJVLVFvyu1tZd7/yhYf
	Gxla78w1RRbFZjSehC3LwChfZFBY0mr6hnJkYqQPx0XZGHMo1XjWW1SWe6AU2dMsJJyugi1KqRhly
	r8IyUiQRzT642LlrPcC3yy4MlBb3EPdu8p/2kYE75pTdrTvajd5alHP6ty3LclTy1ykpYKVcA0wpm
	MFD+KnnGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk4lj-0000w1-KG; Tue, 01 Dec 2020 12:28:31 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk4lg-0000vQ-HK
 for linux-snps-arc@lists.infradead.org; Tue, 01 Dec 2020 12:28:29 +0000
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 0B1CS0mY028068
 for <linux-snps-arc@lists.infradead.org>; Tue, 1 Dec 2020 21:28:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0B1CS0mY028068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1606825681;
 bh=VyWzw1DvMDFjjtA/3/S0sKeLcAuAFNayvwZdG4gboqo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qhEuwsNEJsh33k59vzkl2ot113SesjdpjwuP7bD6IcaxERipfCg9X6ErDprYwwN+X
 k8wXigRtxQXOMyclUxQOudp8m1GR7HRcRLMZOfoXWoPV8YlXQqUPOLHC+q3mIwqF3H
 Ulzb49taRLH1Hf+kSka6hcz1Hp7U+mMCZM/CXlRFV8g1uTxNi2TTF/lGccXFKlwNhA
 ig3orJj69KvJ03v8u3pbzRx8MPjiYmkXpwU4W6tt4IvwnTli/wNhsvJJUCWtcfooPO
 BOSCLevHjDHY0paHbv8rsQWbzfx0J+q1sNHe8x0q0LgEq0TvNowyqZ/r5dljZjduE9
 C9yrM2PqIM0pA==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id e13so967610pfj.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 01 Dec 2020 04:28:00 -0800 (PST)
X-Gm-Message-State: AOAM532BbLtdk//ef5k0fL+M0ndAe5RQ9iiV/nEC/acBHYsQJ0vrjQnX
 0brL+XhuZARmUcHZG64nMijkaH5tOJH3O4FyQAA=
X-Google-Smtp-Source: ABdhPJy+ofSVZ9Ikv2DuaLyZkregh9m//GeneZayHvYZ66OBCRiXI/pmfCGr0AWBTx++jj5S83lXfRAoQ4UqQcfr8IU=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr2070015pgu.175.1606825680148; 
 Tue, 01 Dec 2020 04:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20201121193657.51441-1-masahiroy@kernel.org>
 <01998029-6222-a2d1-9147-1a0dbc7b7e4b@synopsys.com>
In-Reply-To: <01998029-6222-a2d1-9147-1a0dbc7b7e4b@synopsys.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Dec 2020 21:27:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvscBtRU3E3c-3Sy3tw8nTF+sqy5P0FYd_u0Dp8NKmZA@mail.gmail.com>
Message-ID: <CAK7LNASvscBtRU3E3c-3Sy3tw8nTF+sqy5P0FYd_u0Dp8NKmZA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ARC: build: fix various issues in arc boot Makefile
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_072828_916920_0E3212B9 
X-CRM114-Status: GOOD (  13.04  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 1:40 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> Hi Masahiro San,
>
> On 11/21/20 11:36 AM, Masahiro Yamada wrote:
> >
> >
> > Masahiro Yamada (6):
> >    ARC: build: remove non-existing bootpImage from KBUILD_IMAGE
> >    ARC: build: add uImage.lzma to the top-level target
> >    ARC: build: add boot_targets to PHONY
> >    ARC: build: move symlink creation to arch/arc/Makefile to avoid race
> >    ARC: build: remove unneeded extra-y
> >    ARC: build: use $(READELF) instead of hard-coded readelf
> >
> >   arch/arc/Makefile      | 20 +++++++++++++-------
> >   arch/arc/boot/Makefile | 18 ++++--------------
> >   2 files changed, 17 insertions(+), 21 deletions(-)
>
> This LGTM. Do you want me to pick up these via ARC tree ?
>
> Thx,
> -Vineet

Yes, please. Thanks.




-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
