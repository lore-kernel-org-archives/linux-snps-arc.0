Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24B0C19F2D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Aug 2022 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qizeorw0XOaEbmkF63+t90zC+qCcgl3L2DL9nm8VpSM=; b=b0+MaQXKCSGuLm
	dn58+rcwsJ23XjELGhzmwhM36wULdGFDoC+D5NFwN0I5kfV3ZuAeNn5eu+JJbmB2kib1ZKfkcFr2A
	iBr6v0q3Njng77R1jWERiWQw+QTnYGJqDf9qo8eVbKHhFaV9Vi1IeMmAwqcP3lMFVuGoohSf1GvMf
	ONeJqK3+h80V2tDMpVGRzSFKdudGeP/oKMJAaEGAdKmmNlS3Dvee9n7r/O/G8qaicWWjr/3wl5Kb8
	V4yf/vnappCqqdwn7abu5R9KgVuOhUZVmWwt6n3ZEJlX0R+tFNYGVGdCtZ7bTcTFClp+Nzv6tZVNa
	r/ns41P6LPIX3O2qdHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLLpV-0037dW-Ky; Tue, 09 Aug 2022 09:47:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLLpS-0037cD-S7
	for linux-snps-arc@lists.infradead.org; Tue, 09 Aug 2022 09:47:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id f65so10872857pgc.12
        for <linux-snps-arc@lists.infradead.org>; Tue, 09 Aug 2022 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=H2ncUIt9g3r0ICP+2gisvV/bU56Sq8RpyLlL25w33JE=;
        b=LmRtuZsVl4SuOGhaO3aHe3na/6Gyg+zhdMgL1EYgTc54tlqL8iM0J5aaRqM8kJRG12
         8X66/byi4xBpsCeQw9kVwvHfcs6XroDtW7/maSkebMSGYi+olGUNArWR6struKB32yYn
         Wo7kG1W2NOno0uEXGvY2/Gk6ypOCUWia/22FUEYWPk713Ta0h7NGfQ6aNqMaWngFn/ZO
         w4cbTjVgMtdHfBzPenk58w/7ipjArozGO5f2ruX1xbyWIrvKtDRIYXAWXa+E/fsAMbBt
         5pKRdET+opg94fehjRG8MML5+vghRxNSCHPfkvwI7I8Se4AnhQPcAR3dqx2O4XT3XdiR
         ZH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=H2ncUIt9g3r0ICP+2gisvV/bU56Sq8RpyLlL25w33JE=;
        b=SHJMOWJDz5teFN1F0wq4faA/m3BirZU/78RVZxksnO8Jg4z7PoIHzCfWH0zN4xz9Ok
         O9mvzBwa7VsdyonPQ/fy7lU4Y7sW7wUkdWnFL5Cegkhv84dMqmFfj9vbeHIHIfRjOHmR
         c5w+8v+MtuL2v5yLgkFZvxJWvqgjwPgd/KiV+lpML38IArp2Ap7xa/c6AKh6oWEwEJoG
         orGlpHNDxs1IWCsa5nrlCkRfhPjoujJZZZknIwQy+2gCmV4vatAjpWIv8SMJAwZCxdMi
         SZYvKc13yZPtp7aSE7MfV/N95PyNjiGoQRNO9K24ueElVBIYwf4ESzexJwlB9tsF0CJ8
         sYRA==
X-Gm-Message-State: ACgBeo0CO++fXzU+Pe+pqAtSG89dKf8dIIEnZupb+os2pkXmszmNKLYm
	B/NAAuCFQgUQ/aW6HzOk7vGDPonhfNmgCgtPmXQ=
X-Google-Smtp-Source: AA6agR6ZUMSxuZqKDOF76hFepyNSt/BxzSUaKnzNAsqYBDkDfSmEkIKjLBtN59132ytKrD9Q1KjWTbxBTPsEpC4oeUg=
X-Received: by 2002:a05:6a00:138a:b0:52d:979a:b640 with SMTP id
 t10-20020a056a00138a00b0052d979ab640mr22666184pfg.8.1660038432349; Tue, 09
 Aug 2022 02:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com> <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be> <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com> <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
 <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com>
 <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be> <CADvTj4rFeH6m+vq+nrM8O61UJ4d6yyifJ6NdTadxkU-kGvOCMQ@mail.gmail.com>
 <5132079e-acaa-323e-88c2-2237be612159@mind.be>
In-Reply-To: <5132079e-acaa-323e-88c2-2237be612159@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 9 Aug 2022 03:46:59 -0600
Message-ID: <CADvTj4q+UsNLzXwwmS=ThdpG41_R0Qyv6E6HyU2V52_newfe7g@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>, 
	"buildroot@buildroot.org" <buildroot@buildroot.org>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_024714_936919_CC2C1370 
X-CRM114-Status: GOOD (  48.56  )
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

On Mon, Jun 20, 2022 at 12:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/06/2022 11:17, James Hilliard wrote:
> > On Mon, Jun 20, 2022 at 12:45 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 20/06/2022 01:19, James Hilliard wrote:
> >>> On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 16/06/2022 10:11, Shahab Vahedi wrote:
> >>>>> On 6/16/22 01:27, James Hilliard wrote:
> >>>>>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
> >>>>>> <buildroot@buildroot.org> wrote:
> >>>>>>>
> >>>>>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >>>>>>>>
> >>>>>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
> >>>>>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >>>>>>>>
> >>>>>>>>     How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
> >>>>>>>
> >>>>>>> No, I don't do any sort of trickery to build bpftool on my end. The
> >>>>>>> bootstrapping, if becomes available for your configuration, uses clang
> >>>>>>> and only clang. I tried to explain this in v4 of the patch [1], the
> >>>>>>> second paragraph of the commit message.
> >>>>>>
> >>>>>> I think clang/llvm support isn't going to work correctly yet since we only have
> >>>>>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
> >>>>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
> >>>>>>
> >>>>>> Minimum clang/llvm version for libbpf co-re is version 10:
> >>>>>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> >>>>>
> >>>>> You're right about the clang version, but it doesn't have anything to do
> >>>>> with Buildroot's clang. The build process uses the clang that is installed
> >>>>> on the host. For Debian bullseye, that is clang 11.
> >>>>    >
> >>>>> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> >>>>> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
> >>>>
> >>>>
> >>>>     Hm, that smells like we actually want to build host-clang (after updating it
> >>>> to 11.1.0 of course) so that we are sure a known version of clang is used.
> >>>> Possibly with a check-host-clang check to avoid building it if the installed
> >>>> clang is good enough.
> >>>
> >>> Dealing with multiple external clang versions may be a bit tricky and difficult
> >>
> >>    We do it for GCC, so we can do something similar for clang.
> >>
> >>> to test properly, we don't really want to use the system clang/llvm although
> >>> clang/llvm external toolchain support may be desirable here as those could
> >>> be tested by the autobuilders.
> >>
> >>    For GCC, the host toolchain is completely unrelated to the target toolchain.
> >> With clang, it's true that it's possible to use the target compiler for host
> >> builds as well, but don't we still need binutils? So in my mind, there would be
> >> a separate host clang toolchain and target clang toolchain.
> >
> > BPF is kinda weird...for both clang and GCC. It's sorta a separate
> > architecture in
> > the compiler...but is also sorta not architecture specific in what it
> > builds for.
>
>   Ah! I understood from Shahab's message that host-clang was used to build a
> host tool that is then used to build the target package. But it's actually used
> as a cross-compiler then, just with a different target.
>
>
> >>> It would be good to get clang/llvm updated soon as systemd is now using bpf for
> >>> some service security/isolation features that we currently aren't able
> >>> to support
> >>> due to clang/llvm being too old.
> >>
> >>    Unfortunately your series is rather large and has no Reviewed or Acked by
> >> tags... So it tends to languish on patchwork.
> >
> > The tested-by for the v12 series ended up in the wrong thread I think:
> > https://lore.kernel.org/buildroot/BN2P110MB16408DC4537E54EF7ECC7906F21A9@BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM/
>
>   All right, I'll look into it!
>
>
> >>>>     And we probably want a user-visible option to enable co-re then, because it's
> >>>> going to be expensive to build.
> >>>
> >>> We may want to make llvm/clang part of the pre-built toolchains
> >>> eventually, but for
> >>> now I'd say we should just conditionally enable co-re here if we are
> >>> already building
> >>> a clang/llvm toolchain.
> >>
> >>    Although I'm usually in favour of automatic dependencies, in this case I'd say
> >> it's worth adding an explicit config option.
> >>
> >>
> >>> There's some early GCC support for co-re in 12.1 which I was experimenting with
> >>
> >>    But then it would depend on both host and target GCC >= 12...
> >
> > I thought we don't support GCC on the target.
>
>   Yeah, terminology is difficult... With "host gcc" I meant "the gcc that builds
> for the host, i.e. the native gcc" and with "target gcc" I meant "the gcc that
> builds for the target, i.e. the cross-gcc".
>
> > We would essentially have a 2 architecture cross-toolchain(one real
> > target arch, and the
> > BPF virtual architecture compiler/assemblers and such).
>
>
>   Yeah, that makes sense... So the idea is that we build GCC with bpf support,
> similar like how we build it with Fortran support, right?

Well it's a bit different in how we build the toolchain, but it's more
or less used like
a separate language when building packages that need BPF.

I sent an initial series adding BPF support:
https://lore.kernel.org/buildroot/20220809094109.2279598-1-james.hilliard1@gmail.com/

>
>
>   Regards,
>   Arnout
>
> >>> as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
> >>> toolchain BPF support build process is a bit complex however as one needs to
> >>> sorta do a hybrid multitarget build with GCC and binutils since GCC
> >>> treats BPF as
> >>> a separate target(and since GCC along with the binutils GAS assembler
> >>> don't natively
> >>> handle multi-target toolchain builds themselves).
> >>
> >>    Ouch, so we still can't reuse the existing host toolchain for the host parts?
> >> then it doesn't help that much, does it?
> >
> > We can create a GCC toolchain that can target both BPF and the normal target
> > architecture...but it's sorta a strange multiarch style toolchain.
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>>
> >>> I have an experimental branch for that here:
> >>> https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf
> >>>
> >>> I'll try and clean that up a bit once the GCC 12.1 series it is based
> >>> on is merged:
> >>> https://patchwork.ozlabs.org/project/buildroot/list/?series=302389
> >>>
> >>>>
> >>>>     Regards,
> >>>>     Arnout
> >>>>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
