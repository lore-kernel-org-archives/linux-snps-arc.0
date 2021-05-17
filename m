Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CD1C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 08:44:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95ABC61184
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 08:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95ABC61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jVWQckB3C2ZXJuTTRN33Ooyy86YTGLWmMHB7LSfNey8=; b=VGosmRG1q9JlfsCdrGwFZqO86
	jKdgiSe2/5H1xzdMAVHJidgY41xTreqwO3Y1cg6iPq966Mff7Qd9Ooq0I4As2gylA12Ltpcw2Dz+Z
	PwcQgiSeVSJnO64RTRqlnvMNVLVCZCSROl3Iq898MyBi6b0PA2GIZMQ149+LZ31bOdfcobDg2yS0G
	MS+hTeDkH5EpGLXA4itTZL11tG369wA/Qs0oE6GO30GT3tW3q2DQ1cdxm8G/l1aVQxdhx4FQub+CD
	/Il7BKmAQn1TvZm3piC3L0AqvzTbElnPo7TZz/rRmhM6D9rpg7/nxyFEBYsj8oxgb+qLIaze0DL+U
	vWykSeDyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liYrG-00EIxS-LJ; Mon, 17 May 2021 08:44:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liYr8-00EIvJ-9C; Mon, 17 May 2021 08:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/tjlZf1KVR0s5D53uDj326IGYvtuxn9ZHeLU8roq3mU=; b=H/5xfieg4snhVX3AsSJfiAzB2E
 qIixBuMAzq4WUqRwMzn+vnhvrfYDIgBDGncLs0rfMCKvTf/etgW9Zjyxt3ZcUoZOyfbQamRqGfZ+5
 2nAtJxWrBy57ZDAHE2dG3NOM5J20br7qPQSe91EoxtD1lO0BHAynRvVP3Fd72yuljcDBsOEKmBMAq
 8j24JEgsP/+ENhGXsVtzGtFKz8chaRQeOBgWdem6DI19FAMTQ2XsWzUWBNjaEogeOIqCCUlJT9S4Q
 y3p+IhNFKuw78Xgs+qtqyEXSO1UXClVxAd6QMZkvv7FkA0z62ZXJbiYgh22xEiRYPKh77kBE9ATZE
 VtCkXtgQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liYr5-00DbqO-TV; Mon, 17 May 2021 08:44:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86E9F61285;
 Mon, 17 May 2021 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621241043;
 bh=pGxJJRkE9qeDtccc/YEcwOP1pJnAulKNh3xYI4CjqcE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VhyR280qktq3Yj7mvUPKACKxoTFcuZgScgzvJHx3l38cArr8+Z1PHUCauN7611dwt
 NPqfUoJoLvybKsWnw5XBfWBnw8Kv/cK+DKuTDCcu6S3genrIH4gyCUDyMru0esHMq3
 IQajegZypqB2swBYx+h3oZex0t4OU4xmY+RiLrkmtgPak2eiVPLgJdWphXaIjg2ZQR
 xazekUTIUzom3w/On/AUGF/4aikSScp4WWIi0uoJhNFKiP0lEpNVnpQ48HG9k3wCGu
 5YN9cseL+gw6iSznh8e4ihyONNGEmrxfyQM2XPKMRSASOUsEWkgPtNFIfn50Tm8Cvs
 7//2tKougJRQA==
Received: by mail-wm1-f44.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so2249399wmf.5; 
 Mon, 17 May 2021 01:44:03 -0700 (PDT)
X-Gm-Message-State: AOAM5311myyIxukP7rtBiHfowGgUFQ4Ocz4AioBFEEz7FQaiQlv5niRn
 tf1T7Zs/qHUTlLO+IcHPeDLrQpN8v8lF2M3k/5U=
X-Google-Smtp-Source: ABdhPJyn3HuFOFAJWNgd1wcrETQpYkMJHnXvEOT0odsuIYz2sA4AdaozgJ+/NI7bT1baIPTv7IRh4lYoa6g98QiwBCo=
X-Received: by 2002:a7b:c446:: with SMTP id l6mr6057480wmi.75.1621241041984;
 Mon, 17 May 2021 01:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210514220942.879805-1-arnd@kernel.org>
 <20210514220942.879805-2-arnd@kernel.org>
 <CAMuHMdXr6gxbJu+otHV=PhoXvM7aoshs_A-SVpTmYw1iDdiqsg@mail.gmail.com>
In-Reply-To: <CAMuHMdXr6gxbJu+otHV=PhoXvM7aoshs_A-SVpTmYw1iDdiqsg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 17 May 2021 10:42:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a02V8k6aGkqtc0A7PiAwhJDCw6yMW=m4nmTmgVbwy316g@mail.gmail.com>
Message-ID: <CAK8P3a02V8k6aGkqtc0A7PiAwhJDCw6yMW=m4nmTmgVbwy316g@mail.gmail.com>
Subject: Re: [PATCH 1/5] asm-generic/uaccess.h: remove
 __strncpy_from_user/__strnlen_user
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Al Viro <viro@zeniv.linux.org.uk>, Vineet Gupta <vgupta@synopsys.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Sid Manning <sidneym@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_014403_990421_3F147357 
X-CRM114-Status: GOOD (  13.54  )
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

On Mon, May 17, 2021 at 9:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Sat, May 15, 2021 at 12:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This is a preparation for changing over architectures to the
> > generic implementation one at a time. As there are no callers
> > of either __strncpy_from_user() or __strnlen_user(), fold these
> > into the strncpy_from_user() strnlen_user() functions to make
>
> ... and ...

Fixed, thanks!

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
