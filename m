Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F75C11D00
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 08:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB27B208C4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 08:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="No5bekg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB27B208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xq323fBN9f1Uh9Hwnq6w9y3/+1hZwfd4Jo6TicblgX0=; b=No5bekg4Sn3gu5
	7SSXzB6PlUd8fsOUzZf9fJxwYGisiwYM0txPF/9INyaG9YBcobul9u8UAiBewXWzjq92aboHG7+Su
	3iVcnCaO1tSVCvt5A7g31AmY2zP6sBt09REO1YX+Rp+dU8WniNKldAhIJP2ixXLCmU9udaHExY2Tm
	cNj9MkkzCegC4/ZS2UJz3jm8bKEQ4sgIy9gfAlofoS+k62Na+vq28cNil+tVIc/VENqWT4Y51ciWN
	pjVPWX6mEHxzapmU0/KMX9Ak+CklkgmLyFxp5rBHhaqmDn/iw4SvgZxQDBfmyEnPPl5Ck6CyYiBza
	GscYXowrnkCEWSRW42FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4h8V-0002yp-Ei; Thu, 20 Feb 2020 08:24:43 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4h8H-0002gD-HW
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 08:24:31 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M1YlB-1j2E9i3XEx-0038Yr for <linux-snps-arc@lists.infradead.org>; Thu, 20
 Feb 2020 09:24:26 +0100
Received: by mail-qk1-f182.google.com with SMTP id c188so2799743qkg.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 Feb 2020 00:24:25 -0800 (PST)
X-Gm-Message-State: APjAAAWAZb+c1MqUErO0YFFV6PNZ5K+u9VS8Z/TNFDoVPN18rWgsYnLM
 k2Ck+Jsl1t7ZH+Ce9iQR38S3kJ2jnEVId2mPKA0=
X-Google-Smtp-Source: APXvYqyUrdyp8m7I1pzmEWNxqHY4KSjlknkscOTxDzF1emD6ICFdbhEol1yI8AfDJ48GUkFHxsuZ9ARHZ1i6YmcTF1Y=
X-Received: by 2002:a05:620a:909:: with SMTP id
 v9mr26414912qkv.138.1582187064744; 
 Thu, 20 Feb 2020 00:24:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <67f2298c-30ab-1508-4a10-6ee285df7ad1@synopsys.com>
 <CAKmqyKO6u15cDbQQ644GrABi=6WWQsNLiCVLszrmDCdcWBnCPA@mail.gmail.com>
 <c9f11e9e-7c33-0000-e32c-346d425d7c69@synopsys.com> <mvmimk3567z.fsf@suse.de>
 <8239db87-d736-a6e2-913d-c1e5e937688f@synopsys.com>
 <20200220001822.703ee8a1@jawa>
 <de8f8e28-630f-7b87-1a96-6131588a0346@synopsys.com>
 <alpine.DEB.2.21.2002200044040.28780@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2002200044040.28780@digraph.polyomino.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Feb 2020 09:24:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3MTQf_fnEWiGVxzexZzYNQ34h29aNxH_YApmsVzY6OsA@mail.gmail.com>
Message-ID: <CAK8P3a3MTQf_fnEWiGVxzexZzYNQ34h29aNxH_YApmsVzY6OsA@mail.gmail.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
To: Joseph Myers <joseph@codesourcery.com>
X-Provags-ID: V03:K1:hiRTltA+6YkPYosgW+mqDH5BWzZBnRwoQyDzViaTWaMmhEY+VDx
 wz4HWfm1/cGUM/+XijDo+I/n+7ANCNCyOcdStQvBgt0H3l7Ci9KzzhP6SlOqDD8rmgoehNH
 oBdWEiatMhOScaDK/2QeFFY7sgZpGghFb2pn5iJu5BdhZ5HMb4vYNZSzzAk/3Wl76HzyQJZ
 jQIzvpuezAFrO7UsNYH6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1CmWdxtMyPM=:G0M/HrdNr2m3B1kHwL9xLO
 Vz2C4ME/S1NldLo8TdGhlZhjQpVp90d0lHDGJlMr4YIwcG7VZNlNLWL3k+e6BxP9mzANpi0Aq
 ObgCRiSO6KQHVSfHEJl8cBvIznPmPVaB9Eo1TCFEiiV9EHXeEQ5hxCDTlEovIJHUHkeIYSwkO
 epr8BcB4LFJmSmdZNco0EfPcxxQY4t95v4Bt9fo31YzRykwJzZ9JqiAZJVhbyvJET7GV3I3GE
 qdWJ9ssOI1dfxYLFUkp9KFRbZUR1/nyIvlAlVPzqtSP0ALMPOWSZhQTrpXOTtT6og19xSjpkB
 v3sgfn/rC3w/U3NbCbxYrbXICG0IjyA3Fx0q37xLPhS2iWxY5vZpx0xCkIJ241SnyrQbgjgKk
 ebvB0Bg2jO5AGFg9whPgCt/OcD9mv6dX/crr9T2H72iCI2aUG0MRGMrlfvCB/tbG3XWyW5RzO
 dMbayBLdeixAmBNRWDPfA7WOrld9i+nk4E161pqPnPXXEdjsOhV+SIVsz9CkRzjJHlP9jew65
 /8HtLejFIBSeufV2yUClM2x4Rb7kFyKjTRqWXvp4hIBY6y94ePLLW14xYh4ccNQf6mYkUu6XJ
 9yQ1Zfwc/Hi6M9BGmTuvwbDR5e+8/DsogIgh2fON8Xgndex0oKmIzC6qUb+3O2ZvbxfhSZVs6
 Oe4tfTi7XxqivYhaicqzahLl2VnwMhUuRJ3EickLmDpOBDvzyTwcc8Lj76VzrD9S8a1jd9HF3
 CGSe6XDFXReqcaU8CikdE242Rht5Sut1/7kHcI67n4ZzlK53ATCwYwcVixu2Q8jsBD2Ug8ASz
 CqDllaIuCMWGjVlKoxa0dSDCJvbkEjKXUreyMoO+c8ks+hCxKs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_002429_889165_0220260D 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Andreas Schwab <schwab@suse.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 Lukasz Majewski <lukma@denx.de>, "zongbox@gmail.com" <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
 "macro@wdc.com" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 1:46 AM Joseph Myers <joseph@codesourcery.com> wrote:
>
> On Thu, 20 Feb 2020, Vineet Gupta wrote:
>
> > The first 4 will need more work as sym aliasing like
> >       strong_alias (__xstat64, __xstat)
> >
> > will be needed in those ARM files (which in turn use i386).
>
> The situation for Arm is fundamentally different from that for ARC.
>
> For ARC, you only need a single public stat structure (using 64-bit times
> and offsets).
>
> For Arm, a third public stat structure will need to be added alongside the
> existing two, initially used internally in 64-bit-time stat functions that
> aren't exported from glibc, eventually to be used with _TIME_BITS=64 with
> the 64-bit-time stat interfaces exported once all the _TIME_BITS=64
> interfaces are ready.

But surely that structure layout would be the same on ARM and ARC
as well as all other 32-bit architectures with _TIME_BITS=64, right?

What's wrong with having a single implementation for the most
recent set of stat syscalls, with the older variants being only compiled
for architectures that need them to support _TIME_BITS=32 and/or
_FILE_OFFSET_BITS=32?

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
