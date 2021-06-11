Return-Path: <SRS0=BC9U=LF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241C8C48BE5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 16:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3BEC60FDB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 16:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3BEC60FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC+mRO4wfZm895SNBeut+A9Zv/Sy8xE7lmsK7461rvg=; b=cM4UzAZl8imibI
	J7CuUd2bI29e6Ji2lDcZLUS9rlVxQe57BuxNozgX44Hmq1V49hsQdTxDDBU2xpAcmvoajjausObUM
	gZcgr4kMDV+AMtclRV4FhvxLLYDafiKRtQvaB7Hcy82/1Yd/ee9Yq3ZakUau+jzVpmxgkEanApt0H
	/cJe1H3UsVxnLPmsy9WhYZ2JGbk2fo+wuutU4HQS3wYPZGQ0nJifao47Db21V7qyptcgLc/EHu5BH
	Uu7Y0zIotq28wkziz3aJBLEF7hqwf+3KWbVsv6zG/9CUcCrfEpGiyxMXbfA5ASkU2f2/15KEZnl46
	t0IC8hbkmXK8OTC+CO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkSb-006Akv-FB; Fri, 11 Jun 2021 16:56:45 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkSX-006Ail-9J
 for linux-snps-arc@lists.infradead.org; Fri, 11 Jun 2021 16:56:43 +0000
Received: by mail-ed1-f53.google.com with SMTP id dj8so37905039edb.6
 for <linux-snps-arc@lists.infradead.org>; Fri, 11 Jun 2021 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n1hY53xMjuhNnIumjnt3gOiMR+7b4mSYIwPI8s0eJ5U=;
 b=FnfxAGcDGDFO4LiRhtAsGxFeUKHQDa/PooSWcQWBfgEkidEDy6kAQ2nQXrgaZzDbDj
 n9oQ+4kwQTqo88jJEC7Uj6hmBNqPICoLztM0LqJjmnrU59tniWpoR6rqlckSFlNn9j59
 JAlOW7TceI+/wE4mUjF22RaHTziHErsOh+aM7bJy1uSSAKdmdaEAxjnKA1uHk64Ul6Iw
 uY9wp1bI5vZTdv3Wi8RyOPcCL0IpavKkUv1bw7B/wf2PonkKIHMhFPUEa82Y0xZcUCNk
 0K3kxUrbNpe+p7auYSXvBHv8IR4I051nD6HgesGUtK9uFNL3POxfAtxj66XQTBYA05Sj
 vi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n1hY53xMjuhNnIumjnt3gOiMR+7b4mSYIwPI8s0eJ5U=;
 b=rXrKXla+lnrVMAZ3cg56jwxVE1qTwOOWQkEHxcWRjY82353FyoSsRR7NjJIAaAcc7c
 V6i8JDg/B+lMrjNcWboLBGzPQ+WUudjkU4nLFxomDUMmD4VUhSdc7hhrVxMhrSJwYrbM
 yLiENowhrAYglwRAl6qhbIYEqoB+QYfJIBBQnZmW8THiIs6/0QQGGAfpg3HBFqIpduPO
 qGuKSBzsizwjZl/UYjuWLC2VzprujklbI6yWJw1RgILS/45fow0HRYedzl7friOb1DKa
 bNgB+4x7HB34I+TKtHnBGlohwS1XO1J3DrgAqPfH7FQ/RyENye2iXgV90XxAwXCxp86l
 KIsw==
X-Gm-Message-State: AOAM533PgnmcL31bukRz4mzlxennkrdImeWvQcvDmxA9/iiOqUHNEH3s
 IRIae3hVO4m9Yj+3wunA+7+b1l8jI56zkAhabQ/M0QtmPbVrKA==
X-Google-Smtp-Source: ABdhPJz8fOIm3bN26kxUzkvsSo26ITBYAraOeseoACaVYyJnzna6zO8CEVqSLwf5GgnvbF+1EbCH7k6DK4x8DVuzoOg=
X-Received: by 2002:a05:6402:28a:: with SMTP id
 l10mr4221460edv.365.1623430538380; 
 Fri, 11 Jun 2021 09:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210531201641.2804-1-abrodkin@synopsys.com>
 <20210602210146.GA26712@gmail.com>
 <PH0PR12MB54014FDE72F1682196FEF1C2A13D9@PH0PR12MB5401.namprd12.prod.outlook.com>
 <PH0PR12MB5401FC57FA40A239F8CA20FFA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5401FC57FA40A239F8CA20FFA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Jun 2021 12:55:27 -0400
Message-ID: <CADkTA4MY6iMDr4e+qxJzOimUyzDFVGTjr80W698Xm70WkLEgJQ@mail.gmail.com>
Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
To: abrodkin@synopsys.com
Cc: "linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_095641_357094_782F172A 
X-CRM114-Status: GOOD (  32.61  )
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

On Fri, Jun 11, 2021 at 12:15 PM Alexey Brodkin via
lists.yoctoproject.org <abrodkin=synopsys.com@lists.yoctoproject.org>
wrote:
>
> Hi Bruce,
>
> Looks like you were trying to fix-up an author of https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?h=yocto-5.10&id=b12e322c9f3144e3b18c8723790dc027476b3c70 but mistakenly did it for the next one https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?h=yocto-5.10&id=422f8a09a856800f027bbae98dbab24cf3ae0f25.
>

The author as it comes in on your patches is rejected by the yocto git
servers, so yes, it had to be fixed up. I used your email address, and
yes, it looks like I got the wrong commit on one of them. Congrats on
the free commit! :D

Bruce

> I'm fine with current state of things, but just to let you know ;)
>
> -Alexey
> ________________________________
> From: Alexey Brodkin <abrodkin@synopsys.com>
> Sent: Thursday, June 3, 2021 12:12 AM
> To: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: linux-yocto@lists.yoctoproject.org <linux-yocto@lists.yoctoproject.org>; linux-snps-arc@lists.infradead.org <linux-snps-arc@lists.infradead.org>
> Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
>
> Hi Bruce,
>
> Please pardon my lack of good knowledge here as I don't deal with OE/Yocto very often.
> So what are the options we have here?
>
> Given dependency on the Linux kernel v5.5 where that change ("nsim_hs_defconfig" -> "haps_hs_defconfig") was done I'd say whatever active branches of version above 5.5 exist would be good to get it.
>
> Looking at https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/ I'd think these are: 5.10, 5.13 & "master" branches.
>
> -Alexey
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Thursday, June 3, 2021 12:01 AM
> To: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: linux-yocto@lists.yoctoproject.org <linux-yocto@lists.yoctoproject.org>; linux-snps-arc@lists.infradead.org <linux-snps-arc@lists.infradead.org>; Alexey Brodkin <abrodkin@synopsys.com>
> Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
>
> Looks good to me.
>
> What branches were you targetting for the change ?
>
> Bruce
>
> In message: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
> on 31/05/2021 Alexey Brodkin via lists.yoctoproject.org wrote:
>
> > In v5.5 kernel we merged "nsim_hs" config into "haps_hs", see [1],
> > and from then on we use the same one "haps_hs" for everything simulated:
> > nSIM/QEMU/FPGA.
> >
> > Of important notes:
> >  * We switched from legacy ARC UART to a standard DW UART
> >
> >  * QEMU port for ARC is under review upstream, see [2].
> >    But even today with WIP version from our GitHub fork [3] its possible
> >    to run this image for "hapshs" machine as simple as:
> >    ----------------------------->8------------------------------
> >    $ qemu-system-arc -cpu archs -M virt -nographic -no-reboot -monitor none \
> >      -kernel build/tmp-glibc/deploy/images/hapshs/vmlinux-initramfs-hapshs.bin
> >    ----------------------------->8------------------------------
> >
> > [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1681baa713aa138d3f0f77f05c3de1cd6416c7d6__;!!A4F2R9G_pg!Kky99r2sqXZzDoCmjJ78MNNtcrXGIN8a8ILbgukM-lZ6eweRt8pm63oo9HR2lohj$
> > [2] https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg00458.html__;!!A4F2R9G_pg!Kky99r2sqXZzDoCmjJ78MNNtcrXGIN8a8ILbgukM-lZ6eweRt8pm63oo9GmSrEmD$
> > [3] https://urldefense.com/v3/__https://github.com/foss-for-synopsys-dwc-arc-processors/qemu__;!!A4F2R9G_pg!Kky99r2sqXZzDoCmjJ78MNNtcrXGIN8a8ILbgukM-lZ6eweRt8pm63oo9N20qLr4$
> >
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > ---
> >  .../nsimhs-standard.scc => hapshs/hapshs-standard.scc}       |  4 ++--
> >  bsp/hapshs/hapshs.cfg                                        | 12 ++++++++++++
> >  bsp/{nsimhs/nsimhs.scc => hapshs/hapshs.scc}                 |  2 +-
> >  bsp/nsimhs/nsimhs.cfg                                        | 10 ----------
> >  4 files changed, 15 insertions(+), 13 deletions(-)
> >  rename bsp/{nsimhs/nsimhs-standard.scc => hapshs/hapshs-standard.scc} (72%)
> >  create mode 100644 bsp/hapshs/hapshs.cfg
> >  rename bsp/{nsimhs/nsimhs.scc => hapshs/hapshs.scc} (54%)
> >  delete mode 100644 bsp/nsimhs/nsimhs.cfg
> >
> > diff --git a/bsp/nsimhs/nsimhs-standard.scc b/bsp/hapshs/hapshs-standard.scc
> > similarity index 72%
> > rename from bsp/nsimhs/nsimhs-standard.scc
> > rename to bsp/hapshs/hapshs-standard.scc
> > index 3201ca52..1842b00c 100644
> > --- a/bsp/nsimhs/nsimhs-standard.scc
> > +++ b/bsp/hapshs/hapshs-standard.scc
> > @@ -1,8 +1,8 @@
> >  # SPDX-License-Identifier: MIT
> > -define KMACHINE nsimhs
> > +define KMACHINE hapshs
> >  define KTYPE standard
> >  define KARCH arc
> >
> >  include ktypes/standard/standard.scc
> >
> > -include nsimhs.scc
> > +include hapshs.scc
> > diff --git a/bsp/hapshs/hapshs.cfg b/bsp/hapshs/hapshs.cfg
> > new file mode 100644
> > index 00000000..adcc0531
> > --- /dev/null
> > +++ b/bsp/hapshs/hapshs.cfg
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: MIT
> > +# ARCv2 ISA
> > +CONFIG_ISA_ARCV2=y
> > +
> > +# Serial port
> > +CONFIG_SERIAL_8250=y
> > +CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_DW=y
> > +CONFIG_SERIAL_OF_PLATFORM=y
> > +
> > +# Built-in .dtb
> > +CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
> > diff --git a/bsp/nsimhs/nsimhs.scc b/bsp/hapshs/hapshs.scc
> > similarity index 54%
> > rename from bsp/nsimhs/nsimhs.scc
> > rename to bsp/hapshs/hapshs.scc
> > index 3c1613a6..ea2b8b6c 100644
> > --- a/bsp/nsimhs/nsimhs.scc
> > +++ b/bsp/hapshs/hapshs.scc
> > @@ -1,2 +1,2 @@
> >  # SPDX-License-Identifier: MIT
> > -kconf hardware nsimhs.cfg
> > +kconf hardware hapshs.cfg
> > diff --git a/bsp/nsimhs/nsimhs.cfg b/bsp/nsimhs/nsimhs.cfg
> > deleted file mode 100644
> > index 34580a39..00000000
> > --- a/bsp/nsimhs/nsimhs.cfg
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -# SPDX-License-Identifier: MIT
> > -# ARCv2 ISA
> > -CONFIG_ISA_ARCV2=y
> > -
> > -# Legacy ARC UART
> > -CONFIG_SERIAL_ARC=y
> > -CONFIG_SERIAL_ARC_CONSOLE=y
> > -
> > -# Built-in .dtb
> > -CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs"
> > --
> > 2.16.2
> >
>
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9958): https://lists.yoctoproject.org/g/linux-yocto/message/9958
> Mute This Topic: https://lists.yoctoproject.org/mt/83218216/1050810
> Group Owner: linux-yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/linux-yocto/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
