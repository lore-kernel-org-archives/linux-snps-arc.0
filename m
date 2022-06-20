Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F5DC43334
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jun 2022 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oTMFUDJ6lgLu5COQsxQg+clKbSd4u8HinWP8vLtjTY=; b=JBNFmYzOH9wmxY
	RUoAXt2vt6bVWatodwMt+9tq8Tu2p1m1tTz1X0N62WnwDyRIoHnUApu6Rsws2cWu+pFKADN5I0819
	NhJigYy+/v+Bz8jMlsPZv5aXA8q4GwFfGwtc6rarlWUpJOvfHRj4WCWyo4iAqZ/1B4KD/1j4BOsf+
	KKpuPaCniWcLsFYVUwybBWiFBU/yzMLfOkkyW3yElXNkXchEgLm6Q1zoMPBNTYR+4NFEWj+kwW8Wn
	jHx69noTxE9Agp0AosA6qmKyvBgU4/kpZmsIvVV6NNO1r293MdzR/eZJKzADmKd7qj6F0x85AAUic
	V25K32guNYGllLvc6uUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3DXW-00H681-C6; Mon, 20 Jun 2022 09:17:46 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3DXT-00H65t-Dq
	for linux-snps-arc@lists.infradead.org; Mon, 20 Jun 2022 09:17:45 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-f2a4c51c45so13479075fac.9
        for <linux-snps-arc@lists.infradead.org>; Mon, 20 Jun 2022 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x1BrivgHBNYg0vk9SrelOPjD2D43XBZVbAlRi7iDmY0=;
        b=hzrpArR5W/qnEphR2D0RdHYDRIsQazHKhEimtDZD+O7zWN69j4hOZw+zHeccy52wdV
         YEfljvrSHJlyJUOWDr3p0wQMZeaTaEtFNlQa42s8JBTFELjdHK6D0uwwppg15ODiVUug
         3bXOf4tXyv+OgpKKa6uXRD+YHGdrXjbTTBpwTMJsQtW0HyOBdW+lQ3DBuMIEJLArhklF
         n46sWLKDh1r5QHwKWmBgz2o9W1ZnZAocWyINxZ1It7MMXJ+jhl1fbKiPnmFqDlQsasXN
         hiCCaPiyHs2zhLBxXQLG43j6JnImz+uItIuv2A9P9dWyxJduE1pc28Jv+T5A3KQ9Z/TB
         XNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x1BrivgHBNYg0vk9SrelOPjD2D43XBZVbAlRi7iDmY0=;
        b=zFrQeFmA4rZjReFznNQUuUFNvSw98ic1nlCEs1Ca2kEghiIFd0yquZYsyYF4SDAF8j
         vPjfPGiwamhs9f9jXGFyaNklAdfwKca+briBlmYSupMlmkmh6aZ9VvNqj3RmJWR6+4K/
         A9a00RDSEBw1sV2meG4t0KIEkiluXkStUXAVbuvO8WF6tEIq9zvpoOVyzw+B2DsjLt4A
         DY7WvnnOhN39GtJ9y30rflUM3/PzZtqPC314z3QKOg5CrdZiWr99jr4x/OLTVogGnNk+
         IzsnSFQXDSjSQoJPk0yKmmoPPL9gh+wFW/gnuPwuJb9NY9LTy/YudnhH4nXjvHsNaoL2
         lLWQ==
X-Gm-Message-State: AJIora/0+3ymUtAmPWl8/I5SxJzCjdF8tRgFKhXH9j634ahOBb5iM1JI
	yM8mj29a4dZ1046y4eSehtPjpzqC1Kh1GA2ddOqa8U9S7OQ=
X-Google-Smtp-Source: AGRyM1uemeO2tDm0+miJsyYl9hEwVRoobW/3jKGUcl7A6xCg4WntSUzZqu9fKonOf+/yWv4R8ygzZb7dqW9b5urQ62A=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr12135132oaa.99.1655716660265; Mon, 20
 Jun 2022 02:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com> <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be> <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com> <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
 <CADvTj4rPGVpbbZTXO9J0NT6PLbT_Q8jDHhDwhH6u0jMDc4aJCg@mail.gmail.com> <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be>
In-Reply-To: <ac05ab10-5b36-619c-3ccc-a619d6c0c0da@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jun 2022 03:17:29 -0600
Message-ID: <CADvTj4rFeH6m+vq+nrM8O61UJ4d6yyifJ6NdTadxkU-kGvOCMQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>, 
	"buildroot@buildroot.org" <buildroot@buildroot.org>, 
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_021743_557249_B0C70015 
X-CRM114-Status: GOOD (  44.33  )
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

On Mon, Jun 20, 2022 at 12:45 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/06/2022 01:19, James Hilliard wrote:
> > On Sun, Jun 19, 2022 at 9:20 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 16/06/2022 10:11, Shahab Vahedi wrote:
> >>> On 6/16/22 01:27, James Hilliard wrote:
> >>>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
> >>>> <buildroot@buildroot.org> wrote:
> >>>>>
> >>>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
> >>>>>>
> >>>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
> >>>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
> >>>>>>
> >>>>>>    How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
> >>>>>
> >>>>> No, I don't do any sort of trickery to build bpftool on my end. The
> >>>>> bootstrapping, if becomes available for your configuration, uses clang
> >>>>> and only clang. I tried to explain this in v4 of the patch [1], the
> >>>>> second paragraph of the commit message.
> >>>>
> >>>> I think clang/llvm support isn't going to work correctly yet since we only have
> >>>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
> >>>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
> >>>>
> >>>> Minimum clang/llvm version for libbpf co-re is version 10:
> >>>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> >>>
> >>> You're right about the clang version, but it doesn't have anything to do
> >>> with Buildroot's clang. The build process uses the clang that is installed
> >>> on the host. For Debian bullseye, that is clang 11.
> >>   >
> >>> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> >>> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.
> >>
> >>
> >>    Hm, that smells like we actually want to build host-clang (after updating it
> >> to 11.1.0 of course) so that we are sure a known version of clang is used.
> >> Possibly with a check-host-clang check to avoid building it if the installed
> >> clang is good enough.
> >
> > Dealing with multiple external clang versions may be a bit tricky and difficult
>
>   We do it for GCC, so we can do something similar for clang.
>
> > to test properly, we don't really want to use the system clang/llvm although
> > clang/llvm external toolchain support may be desirable here as those could
> > be tested by the autobuilders.
>
>   For GCC, the host toolchain is completely unrelated to the target toolchain.
> With clang, it's true that it's possible to use the target compiler for host
> builds as well, but don't we still need binutils? So in my mind, there would be
> a separate host clang toolchain and target clang toolchain.

BPF is kinda weird...for both clang and GCC. It's sorta a separate
architecture in
the compiler...but is also sorta not architecture specific in what it
builds for.

>
>
> > It would be good to get clang/llvm updated soon as systemd is now using bpf for
> > some service security/isolation features that we currently aren't able
> > to support
> > due to clang/llvm being too old.
>
>   Unfortunately your series is rather large and has no Reviewed or Acked by
> tags... So it tends to languish on patchwork.

The tested-by for the v12 series ended up in the wrong thread I think:
https://lore.kernel.org/buildroot/BN2P110MB16408DC4537E54EF7ECC7906F21A9@BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM/

>
>
> >>    And we probably want a user-visible option to enable co-re then, because it's
> >> going to be expensive to build.
> >
> > We may want to make llvm/clang part of the pre-built toolchains
> > eventually, but for
> > now I'd say we should just conditionally enable co-re here if we are
> > already building
> > a clang/llvm toolchain.
>
>   Although I'm usually in favour of automatic dependencies, in this case I'd say
> it's worth adding an explicit config option.
>
>
> > There's some early GCC support for co-re in 12.1 which I was experimenting with
>
>   But then it would depend on both host and target GCC >= 12...

I thought we don't support GCC on the target.

We would essentially have a 2 architecture cross-toolchain(one real
target arch, and the
BPF virtual architecture compiler/assemblers and such).

>
> > as well which may reduce the need for a llvm/clang toolchain for co-re. The GCC
> > toolchain BPF support build process is a bit complex however as one needs to
> > sorta do a hybrid multitarget build with GCC and binutils since GCC
> > treats BPF as
> > a separate target(and since GCC along with the binutils GAS assembler
> > don't natively
> > handle multi-target toolchain builds themselves).
>
>   Ouch, so we still can't reuse the existing host toolchain for the host parts?
> then it doesn't help that much, does it?

We can create a GCC toolchain that can target both BPF and the normal target
architecture...but it's sorta a strange multiarch style toolchain.

>
>   Regards,
>   Arnout
>
> >
> > I have an experimental branch for that here:
> > https://github.com/buildroot/buildroot/compare/master...jameshilliard:ebpf
> >
> > I'll try and clean that up a bit once the GCC 12.1 series it is based
> > on is merged:
> > https://patchwork.ozlabs.org/project/buildroot/list/?series=302389
> >
> >>
> >>    Regards,
> >>    Arnout
> >>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
