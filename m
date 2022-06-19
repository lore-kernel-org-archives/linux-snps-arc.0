Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826EFC43334
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jun 2022 23:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vnkSGE1Uj7wo5Thk2fmq89UivugU8X0/nS9l2uIO7U=; b=IXryewnqud/Hg3
	IcXPtGXrDSaVvGHmz8zYRG8E7CtbXtZHhFkmZ2QLoLi6puRuAqiNbRaPFk/ELbA4U+FakwagxEpbu
	ugclhqUG25O451Bklbpv7WHBKvC7tm+ojwPzPs1vZZujqHf3rOnE1n47kI+Z0vr/+wPRtEmGfxb9v
	aqFgjg/oLthXTDUyOJME6OPdtewpA3v7O7ySBpOj+dwROfbMpY1chja9NdbfTeDvmvHT/LaEeL3j9
	/sVdD8KoFBtG02qohVst56BpGCqVdprRzOA1vsFz62tohO0DU8x5+mzBBKJearpaD3sBJZ0AsFUfY
	ZlBIpcvJoaz+MvYubZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o34Ca-00FSTr-FR; Sun, 19 Jun 2022 23:19:32 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o34CX-00FSSh-Pd
	for linux-snps-arc@lists.infradead.org; Sun, 19 Jun 2022 23:19:31 +0000
Received: by mail-oi1-x234.google.com with SMTP id bd16so11768825oib.6
        for <linux-snps-arc@lists.infradead.org>; Sun, 19 Jun 2022 16:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rCfiA7JUPLaCN5d4J7iJIfJPgMBlrwhZPe5EldUPCFc=;
        b=oqq45wghGN1ftf+xlpZuAYiXWhAoH/YKGicUTOHuhJQt4HjI8mOY6dB5SmL3z98zdz
         Xf0CvMHne+b/It7r1IdSBXBJE5xOME0OJt4gP4RYu+x3ea8JWRbCOUj2D9uf+np1rgwW
         drHWc2PPhuaLFhlwW9gzPRVshEFQMuxWcIsNgQDMeJpe1Zeg7S1+vZIuuhz9+dPJIWs0
         iLO0tqeBMlJ2XCtQlvw81OIxIv4w1PcBgeWojUc06aDLukg0NNLg6G6V26ikM2SLyF8Z
         lw/EpVd+l2ZJiebguwWoBT7hXqYPsCkvjeyoTjk7U5PDckIYMN5lhTWg+tGhBBHLcIz4
         4vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rCfiA7JUPLaCN5d4J7iJIfJPgMBlrwhZPe5EldUPCFc=;
        b=gS28v8qi9TJmzVgnmV7aPPEotgp8etjPV7EZX7GD3Fezr1Btnpe+wvJTFU2OKhliST
         qqKmSWmRKXGffYE4HhC337FHjpf7Lpegiyp5cFUrRysYDJh0zV9P24LFif2Y+UFE0mEj
         DNEz7Yj/jViuZ4olBXMq1z4o9bv+1nP5lSdlXHMfSGnQVxQ5QSl+U3gA6O/rGLtzdOpe
         wTujZJWfkwRS+U+tvr+b5n6NgoNNkv2psz0pFf3r8Wxtk4ymp/OQOhDK0Q22fJ4P1+r0
         ldTyRdgVIh2J4m+I/Tip31c2sfjDeKDHA46Op0m/rgEAf0aGYZVWLLghKvs31UAMeH+J
         5ukA==
X-Gm-Message-State: AJIora8iWBGs9u6tGJU9/4JRpk2SfSb4x9wW6bLSMX/8aEJBWrfTRgPP
	2gVBGJ4MwxDbEGlhrjXL5LTxgmMjwW0gcHRsnYo=
X-Google-Smtp-Source: AGRyM1vMX/F84Uv5bSF22O4XDz4Qyi2czf349grOHkoNybbRKm/jchk4QmBk3dXKqIYgQOW1e+yvStd2pmldc8cfGGc=
X-Received: by 2002:a05:6808:23c6:b0:331:3ab2:6fb9 with SMTP id
 bq6-20020a05680823c600b003313ab26fb9mr9684052oib.200.1655680768095; Sun, 19
 Jun 2022 16:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com> <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be> <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com> <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
In-Reply-To: <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Jun 2022 17:19:16 -0600
Message-ID: <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>, 
	"buildroot@buildroot.org" <buildroot@buildroot.org>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_161929_876597_8A11431F 
X-CRM114-Status: GOOD (  26.03  )
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

On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 16/06/2022 10:11, Shahab Vahedi wrote:
> > On 6/16/22 01:27, James Hilliard wrote:
> >> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
> >> <buildroot@buildroot.org> wrote:
> >>>
> >>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >>>>
> >>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
> >>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >>>>
> >>>>   How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
> >>>
> >>> No, I don't do any sort of trickery to build bpftool on my end. The
> >>> bootstrapping, if becomes available for your configuration, uses clang
> >>> and only clang. I tried to explain this in v4 of the patch [1], the
> >>> second paragraph of the commit message.
> >>
> >> I think clang/llvm support isn't going to work correctly yet since we only have
> >> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
> >> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
> >>
> >> Minimum clang/llvm version for libbpf co-re is version 10:
> >> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> >
> > You're right about the clang version, but it doesn't have anything to do
> > with Buildroot's clang. The build process uses the clang that is installed
> > on the host. For Debian bullseye, that is clang 11.
>  >
> > To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> > the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
>
>
>   Hm, that smells like we actually want to build host-clang (after updating it
> to 11.1.0 of course) so that we are sure a known version of clang is used.
> Possibly with a check-host-clang check to avoid building it if the installed
> clang is good enough.

Dealing with multiple external clang versions may be a bit tricky and difficult
to test properly, we don't really want to use the system clang/llvm although
clang/llvm external toolchain support may be desirable here as those could
be tested by the autobuilders.

It would be good to get clang/llvm updated soon as systemd is now using bpf for
some service security/isolation features that we currently aren't able
to support
due to clang/llvm being too old.

>
>   And we probably want a user-visible option to enable co-re then, because it's
> going to be expensive to build.

We may want to make llvm/clang part of the pre-built toolchains
eventually, but for
now I'd say we should just conditionally enable co-re here if we are
already building
a clang/llvm toolchain.

There's some early GCC support for co-re in 12.1 which I was experimenting with
as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
toolchain BPF support build process is a bit complex however as one needs to
sorta do a hybrid multitarget build with GCC and binutils since GCC
treats BPF as
a separate target(and since GCC along with the binutils GAS assembler
don't natively
handle multi-target toolchain builds themselves).

I have an experimental branch for that here:
https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf

I'll try and clean that up a bit once the GCC 12.1 series it is based
on is merged:
https://patchwork.ozlabs.org/project/buildroot/list/?series=302389

>
>   Regards,
>   Arnout
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
