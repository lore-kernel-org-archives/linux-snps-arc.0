Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5848C11D05
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 14:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986552068F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 14:44:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5Z2ThPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 986552068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDTd7AnsTgKGY5AE3lxa0kpSjXTCDE83BVS1YpaMV88=; b=U5Z2ThPe40Wf81
	K0l9ko2EjMEEDrio0w0/H181QRsFpuCjv+0LGup/NCEUanLZmCzDiHH578Izqf8uG7wqogV0/jkJe
	c36KqHdMXCgY2Qu+WnHGe1hhUgzXJL9JniziClXf3dXii8B9zGl/+VpU339YBXt4AH3zyCSjbYrkN
	a4m73cxL1aSI+rjSPB8trqoCliCssHl1poQDxgr0gHSA9hFNJ0lxczGIew2DocBhnD+RPCOxNZ5Pv
	iKMvlie5GT9AZpyt/ZiJaVKn7M2wbKy6w2UX+7OXouAc0IkIUCJR06ZFf6qDIpMeJb3fh3yvB6cT2
	qhEfitw3A+5DEJtmTUIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4n44-0004m7-Fk; Thu, 20 Feb 2020 14:44:32 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4n41-0004lX-TT
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 14:44:31 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N1M4p-1jSfTd1XQZ-012pi6 for <linux-snps-arc@lists.infradead.org>; Thu, 20
 Feb 2020 15:44:26 +0100
Received: by mail-qt1-f180.google.com with SMTP id i23so3022295qtr.5
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 Feb 2020 06:44:25 -0800 (PST)
X-Gm-Message-State: APjAAAVOftNvaBfPLC1hNclLVLvAMZR/YYMMbRgMQWCICOfNa3bpinix
 D98oOyvoHV2iArU266uwpbMLG/hRtvZwKyFr6ck=
X-Google-Smtp-Source: APXvYqxKyYL+YXzkzoR1MKhZelpjQ1jazGWmMIfXD2GsP1MHuALcepAj4Eft2N2zQ4jiDoP8UUveuHY7FFCwWoAxEZ0=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr26831348qtr.7.1582209864060; 
 Thu, 20 Feb 2020 06:44:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
 <20200220141451.3fa2fc3f@jawa>
In-Reply-To: <20200220141451.3fa2fc3f@jawa>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Feb 2020 15:44:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
Message-ID: <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
To: Lukasz Majewski <lukma@denx.de>
X-Provags-ID: V03:K1:4QlBHFQrrctiU2Ng1uW+DIHKP2147InkZmQulYyx4fOz5cBwgIa
 uaNmqEdp5M69zchx7vCbeJghhm7KAdc9wRRw25pVfWGq3Iv+s6TMKpa08F+OL/jxhZTbgCv
 g2JemNhJeD8+vJUF/EpNjVxJhfsN9uMEHeFOa6U8TMv+kCQKI7Lx8S89hawf/UUbCCuJCjr
 VwCZmbgim4lLSMxA/q2Og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+fQJ0T5keGI=:INgxiEf3/L7LQgFxThBi/K
 WS51xZtH+a7MN/l94cS7jQV/N7QEPRCEIJP3HEtn9cS/dIEd/9koeUmhpczRwqYn5/Qvqs3G2
 XvOvQv7Z2Yi8I7f411eGO0Q4Kc2OvvhFvvJhRRXmwU0Os068lDal5GUtTLUVBOoZVJ2EBA72R
 j9E7LxKzb3s7fXnQhibnV1PsxHEzvlHq6TXIjo8x3WR9TZmjcRzywQj9KWlaFR+ZbY5pJ0Qkq
 jHnYLzdWqeKZW2mDWeJSSoACHuuAaj/uPuGfAKrQ3Txqrn7KXxeXk1kxEqx7wgN64dDm+az4P
 cbP03elYILMkqqyU0he2fsEItfIl12ALVRhrf20mDW/RRPbAj0ZiV4JkqwIJz0zqSi2nGmSbw
 V1boX5GUU20EPetVFp2UG1hMdXUr8LDWIhrP9+Lv/iFBTieclQVbx02aI4LiFVxxUHckHSRXR
 KJIuqZ1813FpEkVbOpPc/I5ubnqJk7ii6rfYeM2vUXWCBCdV6wL5CyioNOadAGAP3wcrxlc54
 ZzuAXNVlTjX+EOvAYza/ANL+ivlZzdbOpWcXdoMLZDoIq83BwmSIfvEdOQOSLqYw/w49hQ6ET
 WaZ8gq99zaX80O+YhNFE0Lzsdqm3y2P+rC+KyXB8tkd6pD+k2Sk9PLqLjd/sfkRZenqVAohHY
 ahHfJcx84xn6QOlcLjxsxm3gyVw9csObW17Oy28U5FvXKUzd7/f5ESTbimk/npWFZy0An/3VK
 62mhxwc1BsIYiMBOF2UL6Yf4l57e+vs0qH6Ap6YYsvp4hr7Lt8QbRnjj80cjyZdnuBSAO6s5X
 HBgvuvivxpIaeynL/m01imEZZx8MT1ebbqVHPYhCnIXNRWr4u0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_064430_250133_319428EF 
X-CRM114-Status: GOOD (  21.96  )
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
Cc: Florian Weimer <fweimer@redhat.com>, Helmut Grohne <helmutg@debian.org>,
 GNU C Library <libc-alpha@sourceware.org>, Viresh Kumar <vireshk@kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 debian-arm@lists.debian.org, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 2:15 PM Lukasz Majewski <lukma@denx.de> wrote:
> > On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de>
> > wrote:
> > > > On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de>
> > > > Are there any glibc issues that prevent it from working
> > > > correctly,
> > >
> > > I think that the glibc wrappers for most important syscalls are now
> > > converted.
> > >
> > > What is missing:
> > >
> > > - NTPL (threads)
> > > - stat
> >
> > Do you mean that code using these will fail to work correctly with
> > -D_TIME_BITS=64 at the moment, or that the interfaces are there
> > but they are not y2038 safe?
>
> For ARM32 (branch [2]):
>
> - Without -D_TIME_BITS=64 defined during compilation (as we do have
>   now) the glibc is fully functional, but when you set date after
>   03:14:08 UTC on 19.01.2038 you will see the date reset (to 1901) in
>   the user space programs (after calling e.g. 'date').

I'd actually consider intentionally breaking this for a Debian bootstrap,
at least initially, so that any application that accidentally gets built without
 -D_TIME_BITS=64 runs into a build or link failure.

> - With -D_TIME_BITS=64 set during compilation - and using branch [2] -
>   syscalls listed in [1] will provide correct date after Y2038 32 bit
>   overflow. Other (i.e. not converted ones) will use overflow date (1901
>   year). The glibc will also be fully functional up till Y2038 overflow.

Ok.

> > > - In-glibc test coverage when -D_TIME_BITS=64 is used. I do have
> > >   some basic tests [4], but this may be not enough.
> >
> > This is probably something where debian-rebootstrap could help,
> > as building and testing more user space packages will excercise
> > additional code paths in glibc as well.
>
> Yes this _could_ help. Do you have any tutorial/howto similar to one
> from [4]?

Not sure, maybe Helmut has some references.

> > There is also some work
> > in Linaro to ensure that LTP tests the low-level syscall interfaces
> > in both the time32 and time64 variants.
>
> Interesting. Is this work now publicly available?

I think this is currently in the planning stage, but once patches
are available, they would be posted to the ltp mailing list. Viresh
should have more details on this.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
