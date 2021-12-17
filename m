Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008AFC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Dec 2021 23:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nodIrotAs71pzPxbNoEu/FkiCnQapBqURCSztMw8Uic=; b=lutQpNyWJ11OFx
	jIljxAJaVXjAwHT2g2xlVUw+h4ZoHg/8XpO5eROiK+Ad1MDyPbl+rix9wak9f5wXLJVTo1AE1SVFU
	byqBdIzwHhEeCtwnC+9GpKsG4Ue96kSLBxy6NXg2lXbn/tistqdM/QTUOxxtXS6MmFZF69x0KEOpm
	yR/NXKSHOoZn0+rurLdCaaX8uIQFPSVlp7Bw9epU+Y8dkNBGGvNz0W2ztOMmFfb5R6AhopMowLcew
	WrGLoftzerK2AUKXSRDKKFL27mXTEf+Bb7HLG5TyhmDe8XXT4uHeNJmqz84RbiVakFb6w7NbG3IGv
	x0k5iKKlguS4anUADs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myMPe-00CiUB-Pu; Fri, 17 Dec 2021 23:13:18 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myMPc-00CiTF-60
 for linux-snps-arc@lists.infradead.org; Fri, 17 Dec 2021 23:13:17 +0000
Received: by mail-vk1-xa33.google.com with SMTP id b192so2517903vkf.3
 for <linux-snps-arc@lists.infradead.org>; Fri, 17 Dec 2021 15:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xMXuQ2mw/YMJUNTcLvHlbi5170nrwADHo36ZzSIp49M=;
 b=WOGbcGhDySrtV8K3K4s+4HuRPRSSZkC1WCbFkA2YqX5SyJFwM9mql2f/1wGoLAuv1c
 5kQ/HkOnce/eL6h60HrXRDaAWgWpDN+demDfQkUV+T5sUkzuETFAzXIhQWDWvE55aEVM
 +8Rr5qiFXCdSox2Flz7rDjiZ0UMc1R9oKtvQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xMXuQ2mw/YMJUNTcLvHlbi5170nrwADHo36ZzSIp49M=;
 b=lA/D1S3xuJzvePQPx9hM30+ooDgYAPoCKaBMBKr+hWYVFETiLrXZhtHAWNpfEpjbsi
 LsOChO0YYeCRjy24Q3qwOIriXI9UynU9tODHr920BkzOzpuQgMXLaJODSxCc1XbYMVzB
 p2OUFlazsyZelYJeqDMmWBRlPq8qW3UTCpx5NrHli+7h9WJqI8dQReAVo3/peaQ8fpd9
 XhnCQwASntpCJ/lXnaBhPSfXLDYHrWF8nLoIIf3wYTGeOS19fdNvABmy3Go3v/z9XJDH
 GSQIy38luFc6dE4jk59oaWK2/6738oH0x1OaEUp4B5ovk83d67TEXEKikMZTHx3x8IQR
 OUjg==
X-Gm-Message-State: AOAM533TCmiW6t8gWHTOw+nlKE/UGQFGdf5cr+X0lLoIESrUr3IIeofW
 9XSEOfpH8DO3ivSCaZajTRMhf+PAU7ddXdRbbycaYQ==
X-Google-Smtp-Source: ABdhPJwxlIeHzucLyeUy0XKoKFP161EDsUT9YKHu347gp8HJy6DSC8WO/IDp2FT181MAhnFeTxEi+ojxgtofIlfOAq4=
X-Received: by 2002:ac5:c848:: with SMTP id g8mr1703466vkm.3.1639782791146;
 Fri, 17 Dec 2021 15:13:11 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB540121CBFD12FF39E5AA576CA1179@PH0PR12MB5401.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB540121CBFD12FF39E5AA576CA1179@PH0PR12MB5401.namprd12.prod.outlook.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 17 Dec 2021 16:12:59 -0700
Message-ID: <CAPnjgZ0z18fq7RUuVdkYYZhL57mVM46BMbXwAQayLe8pgBWw6g@mail.gmail.com>
Subject: Re: Broken arc toolchain
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, 
 linux-snps-arc <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_151316_249319_D7474576 
X-CRM114-Status: GOOD (  22.46  )
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

Hi Alexey,

On Sat, 10 Jul 2021 at 16:03, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Tom and Simon,
>
> So there're a couple of things involved indeed.
>
> As Tom correctly mentioned we used to use SNSP pre-built tools for ARC in TravisCI previously. And frankly the reason was we needed something GCC 8.x based while on some other arches such a new GCC triggered extra problems, see https://lists.denx.de/pipermail/u-boot/2018-May/329577.html. So I updated ARC pre-built versions and we kept using it.
> Now, that particular "mcpu" was never added into upstream GCC because we wanted to re-implement it a bit nicer, thus any up-to-date vanilla GCC won't accept it as opposed to tools built from SNPS' GCC port [which has it https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/84a3ee3844f9967a1b6c5923b9da4e6720c1d5bb].
> IIRC "-mcpu=hs4x_rel31" is basically an umbrella option for some options combination based on generic "-mcpu=hs4x" so we may probably update HSDK-4xD flags to be buildable by vanialla GGC.
>
> But anyways the simples short-term solution is to use our pre-built tools, latest of which are avaialble here https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2021.03-release. And for U-Boot elf32 version is what I would suggest to use, so please use https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2021.03-release/arc_gnu_2021.03_prebuilt_elf32_le_linux_install.tar.gz.
>
> Moreover since by default for ARC we use U-Boot built-in libgcc the same one little-endian toolchain might be safely used for building our big-endian configs equally well.
>
> If more info or actions needed, please let me know.

Thanks for the instructions. I was able to make it work.

I hope you can get your toolchain things upstream soon!

Regards,
Simon


>
> -Alexey
>
>
> ________________________________ From: Tom Rini
> Sent: Saturday, July 10, 2021 11:22 PM
> To: Simon Glass
> Cc: U-Boot Mailing List; Alexey Brodkin; Eugeniy Paltsev
> Subject: Re: Broken arc toolchain
>
> On Sat, Jul 10, 2021 at 02:11:30PM -0600, Simon Glass wrote:
>
> > Hi,
> >
> > I see this:
> >
> > $ buildman --fetch-arch arc
> >
> > Downloading toolchain for arch 'arc'
> > Checking: https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/
> > Downloading: https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/x86_64-gcc-9.2.0-nolibc-arc-linux.tar.xz
> >  Unpacking to: /home/sglass/.buildman-toolchains
> > Testing
> >       - looking in
> > '/home/sglass/.buildman-toolchains/gcc-9.2.0-nolibc/arc-linux/.'
> >       - looking in
> > '/home/sglass/.buildman-toolchains/gcc-9.2.0-nolibc/arc-linux/bin'
> >          - found
> > '/home/sglass/.buildman-toolchains/gcc-9.2.0-nolibc/arc-linux/bin/arc-linux-gcc'
> >       - looking in
> > '/home/sglass/.buildman-toolchains/gcc-9.2.0-nolibc/arc-linux/usr/bin'
> > Tool chain test:  OK, arch='arc', priority 5
> >
> > $ buildman -A hsdk_4xd
> > /home/sglass/.buildman-toolchains/gcc-9.2.0-nolibc/arc-linux/bin/arc-linux-
> > $ buildman hsdk_4xd
> > ...
> > arc-linux-gcc: error: unrecognized argument in option '-mcpu=hs4x_rel31
> >
> >
> > Do you have any thoughts on what is wrong, please?
>
> There's two parts.  The first part is I keep forgetting to update
> buildman to fetch the latest toolchains from kernel.org, it should be
> grabbing 11.1.0 now, not 9.2.0.  The second part is that arc, nds32 and
> xtensa have non-standard toolchain locations, see
> tools/docker/Dockerfile for where to fetch.
>
> --
> Tom

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
