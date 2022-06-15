Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8067CC43334
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jun 2022 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jg+fbuesniHO9eu2mEV0nXnW1ujtKGyPpIb3tQKzxO8=; b=a9oRguve+AVYdi
	g7RgeuWNRztJPfH0vYlRQsWJPFnN2mOfgbuJ4HG4jTz3eHkrWe9QrYhWXWwSGJX1f6uiqfW6xOCUm
	pxmN+b+zP3BpEAEwqlG6lDtK100QEo3mxCgQe7eoj8kZ7rwendBCflyHxGy8EdmUzDVhlk6D3YKRL
	70Ae51l/FokOFiA7BjBBboKHXPfmZQRKCL64WUB61eGe/F35FzsWh+vphAa7OS2D/+PIsDMy2Lx6U
	RBNoqal4KIez4H8QI3BnswJVRL22PQAe7ZgZ+ARUc1n4OKfn2x3Zzn3EvXyB/mWmCYhk3HIlBeBxN
	117FApd8aqwGprsJVNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1cQF-00GuCV-Bb; Wed, 15 Jun 2022 23:27:39 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1cQC-00GuAR-5q
	for linux-snps-arc@lists.infradead.org; Wed, 15 Jun 2022 23:27:37 +0000
Received: by mail-oi1-x231.google.com with SMTP id i25so4461055oii.7
        for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jun 2022 16:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HM2LoieUoZENKJf6OlZG4ShMEcNYtOf+SIvV0njyQ7c=;
        b=BidEZ6hXHh/bo+2Yq/906SgH4X9yhuprxDwSm2GnyCL7HeqZ6t1870940Hw76wN4q0
         us1SC9IPa2YUMoMO41STkk4FXC7XLyTt0g5LKj/pyNHSrU95oLMDSeSEIaU8szpgHHmH
         BiaJfV20UEpANRk2qlr0oCrBs1kVULQ7izm/KUXPwyelddKDvouzLt7eXWEwWV1hBFpp
         zyjJh9A3qyAgcSYLVsWN5B1mdIq9JZK8tpykhRBo9ZAdR8mMnwsh+0LD0ioEv7tnYy00
         d2hF4FH4kjDdAgjJ9S/A33IodwP0G7n5Y3oU8Ciz3m3iZTNrWG4c+aJcXhC6VJGV+93t
         P2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HM2LoieUoZENKJf6OlZG4ShMEcNYtOf+SIvV0njyQ7c=;
        b=kKzVulDPGpENVzelCzyNSJg5LsgE8DfOWHd/7Q9ZpINUYYRM3JUVpACt7/gRmFOveb
         EeU1/nq0xkKQ80Cy+LwIEJPXauOS1fLx8x/2sZvnWaTN2Ch2IDSkhz4QV+n+NP/B6bqf
         jEzcdlX2iH6hdB/VIQ/89zYoeViX34Me2+7u0O2wdl/EPO1mWgmrEwwUdHqslvoME5L7
         XwyX6CdNPNyXqzfu8ThuijUsipMKPhsFI2TK07deyNr2I/vkaOnnK5FDtj3/WiOvT2nj
         3txhSch8HrF/qybiwG9DHWYrh83wpxl9c+Y0grcVt9JUo9XdHpREfy4UaeEs/1IPUmxi
         n8Nw==
X-Gm-Message-State: AJIora+hW9R3iriVbV4mBev6HkDXC8rM4lpVaNHvRhVrc1W4RLGFOcjH
	axoZ6GPC0LJLF6LGI/EEtGkx4iV8T05dxT77q+A=
X-Google-Smtp-Source: AGRyM1vXkV0s4xPgViyFsaweOW7RHiLr1nUiYJBYtJisgmh63kGEY6rt9Y+vceNl1x4Ph7umptvgJJDkRmcaR7qkXQU=
X-Received: by 2002:a05:6808:23c6:b0:331:3ab2:6fb9 with SMTP id
 bq6-20020a05680823c600b003313ab26fb9mr1094642oib.200.1655335653525; Wed, 15
 Jun 2022 16:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com> <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be> <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
In-Reply-To: <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Jun 2022 17:27:22 -0600
Message-ID: <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org" <buildroot@buildroot.org>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_162736_239243_8CDFD2B6 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
<buildroot@buildroot.org> wrote:
>
> Hi Arnout,
>
> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >
> > On 14/06/2022 11:31, Shahab Vahedi wrote:
> >> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >
> >  How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>
> No, I don't do any sort of trickery to build bpftool on my end. The
> bootstrapping, if becomes available for your configuration, uses clang
> and only clang. I tried to explain this in v4 of the patch [1], the
> second paragraph of the commit message.

I think clang/llvm support isn't going to work correctly yet since we only have
version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
https://patchwork.ozlabs.org/project/buildroot/list/?series=291585

Minimum clang/llvm version for libbpf co-re is version 10:
https://github.com/libbpf/libbpf#bpf-co-re-compile-once--run-everywhere

>
> [1] [v4,1/1] package/bpftool: revert bpf_cookie patch to allow building
> https://patchwork.ozlabs.org/project/buildroot/patch/29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com/
>
> --
> Shahab
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
