Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163D8C64E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 15:33:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 678D42080A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 15:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Bzb6cT0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 678D42080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGicUJ2gs4Ym8z9kktFNLWfccJoWsX2pGeBaMiTpkiA=; b=2Bzb6cT0wN4wuPbktf3eKx3a8
	eTyogLR1hNEFtIji9yQ/sf97W5qAuwvnvYJ0vnPlaJcmpDt4oyyMaIKesv0uHUpkV+7HLd8xYbQ+P
	F3UTJkqZGz+Ingq7bqlhlOSJa5Rv3iBzE8nnFHwALsKeodvYpZw6gNETRFpot0zsa2AwfYuKMyZ2f
	go90UHFK4FyXV9g/sTXFDjMC9fUr4bn4CDYKtUC424cZUOQzInBQysDcBvH11ReeVyGKEKCkcWULv
	o3YhdJiS+2iiDXdehS/Drb68oLA0X4qvhxVRfAOZqfQ5vVFOnxyQVSNg7dFp8UwZvrD9diy4BVETo
	ppc51xf/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk7eZ-0003E0-6I; Tue, 01 Dec 2020 15:33:19 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk7eU-0003DR-JB; Tue, 01 Dec 2020 15:33:16 +0000
Received: by mail-ot1-f65.google.com with SMTP id y24so2019271otk.3;
 Tue, 01 Dec 2020 07:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3TYEuLB7a0GZMz9VHnUGScyAuLcS1oGx4ZirLfVhD58=;
 b=XQwkFgm9zkgpJM08ZV3bHiYkmDHiNT8zdFW6BB/WkIYVto/ebCnZdbbPiz7BREfeia
 LoxgQ0nhSUDbxAHDtgL586ozovdqNYE69DxTiJU9g8xFY2AVI5vQ9DKb7GYutVP4J0tX
 UUiVcwWECBh+jrqBBxjnT+iIulIsdr8dM8YIT3wYTewzD2ysVfj6V6gBVmLbFu+/0X1d
 RiQteSufeLz/rvcwHoiALr4cbHZcRFztGI80Lcbf8YYGdkpeoVFTP8znjbFOUzAC0Kib
 SMJT1zIvKSz4Ml2G5TAEPLGxCJIHBgmHXUtUSICv72EHo+6NShMHtGxVjrF2yGUrbjQv
 /6zA==
X-Gm-Message-State: AOAM532Z+/NBP/ThXHMhVp7kySI3azb8P8ZDRh0uNQ9dwgPbDbdHAepl
 VDhRfPm9SkUHN0cI4JCJew61rLmkmVKQNZVHIA8=
X-Google-Smtp-Source: ABdhPJwjl/WrymSGG1q6QSWA4NULJul1vnTn+2DnKqCieAk1A5M/ct7FjmDTX3AX+1wL4kK44UIIt92TTByk+q4tP5g=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr2273458oth.250.1606836793188; 
 Tue, 01 Dec 2020 07:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
 <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
In-Reply-To: <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Dec 2020 16:33:01 +0100
Message-ID: <CAMuHMdWRc8W7U0LKyH9u1hdMuN515PCZiTEJ12FrDaCx-eTdaQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To: Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_103315_238684_78FAD1DD 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Jens,

On Tue, Dec 1, 2020 at 4:03 PM Jens Axboe <axboe@kernel.dk> wrote:
> On 12/1/20 6:56 AM, Mike Rapoport wrote:
> > (added Jens)
> >
> > On Tue, Dec 01, 2020 at 01:16:05PM +0100, John Paul Adrian Glaubitz wrote:
> >> Hi Mike!
> >>
> >> On 12/1/20 1:10 PM, Mike Rapoport wrote:
> >>> On Tue, Dec 01, 2020 at 12:35:09PM +0100, John Paul Adrian Glaubitz wrote:
> >>>> Hi Mike!
> >>>>
> >>>> On 12/1/20 11:29 AM, Mike Rapoport wrote:
> >>>>> These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
> >>>>> with a mirror at https://github.com/hnaz/linux-mm)
> >>>>>
> >>>>> I beleive they will be coming in 5.11.
> >>>>
> >>>> Just pulled from that tree and gave it a try, it actually fails to build:
> >>>>
> >>>>   LDS     arch/ia64/kernel/vmlinux.lds
> >>>>   AS      arch/ia64/kernel/entry.o
> >>>> arch/ia64/kernel/entry.S: Assembler messages:
> >>>> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
> >>>> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
> >>>> arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
> >>>> arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
> >>>>   GEN     usr/initramfs_data.cpio
> >>>> make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
> >>>> make: *** [Makefile:1797: arch/ia64/kernel] Error 2
> >>>> make: *** Waiting for unfinished jobs....
> >>>>   CC      init/do_mounts_initrd.o
> >>>>   SHIPPED usr/initramfs_inc_data
> >>>>   AS      usr/initramfs_data.o
> >>>
> >>> Hmm, it was buidling fine with v5.10-rc2-mmotm-2020-11-07-21-40.
> >>> I'll try to see what could cause this.
> >>>
> >>> Do you build with defconfig or do you use a custom config?
> >>
> >> That's with "localmodconfig", see attached configuration file.
> >
> > Thanks.
> > It seems that the recent addition of TIF_NOTIFY_SIGNAL to ia64 in
> > linux-next caused the issue. Can you please try the below patch?
>
> That's a lot of typos in that patch... I wonder why the buildbot hasn't
> complained about this. Thanks for fixing this up! I'm going to fold this
> into the original to avoid the breakage.

Does lkp@intel.com do ia64 builds? Yes, it builds zx1_defconfig.

Kisskb doesn't seem to build zx1_defconfig, but generic_defconfig.
http://kisskb.ellerman.id.au/kisskb/target/101883/ shows this has been broken
since Oct 30.  Perhaps kisskb build failures are not emailed to the ia64
maintainers, or not acted upon?
(I do receive kisskb build failure emails for m68k)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
