Return-Path: <SRS0=orWf=4K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649A7C35669
	for <linux-snps-arc@archiver.kernel.org>; Sat, 22 Feb 2020 08:43:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3312A208C3
	for <linux-snps-arc@archiver.kernel.org>; Sat, 22 Feb 2020 08:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADAnFD0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3312A208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnEk2+ycOBYff4ah3Fi7tGemfCYoWRWukGKz+VGxIt8=; b=ADAnFD0QBP7c9h
	A/jl4gYfwfXHV8goIfNN1M1N/bD5foYQBw0CR3b9G5dvJpai1nAq/mcoxK2qYwjT4+vknncVi5XoU
	3o85wKeG3nx2YGMHaW/mn3EuDqykpe0IuUy2Ts6nsYGZUASS+U/Pcjf9xTgeCnwsKHw2BYsE1Cyb9
	RfyFKE0NdK7QGJ9eblcfRSqVTcOBsNQaaYPrLyVf2e5ivagjBTX9mjidRtvUELYF7K5F7fRsf7MWk
	ILJycxFQmsZ2l1RXUwUB0W5qP1ZKjHJxqGDcJr/tjTuk28rPQ8e84jq3zmaAzsvs+7CI7MRg14H4u
	FLgToRFklAb8I+M41AlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5QNN-0000Ov-RZ; Sat, 22 Feb 2020 08:43:05 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5QNL-0000OZ-2f
 for linux-snps-arc@lists.infradead.org; Sat, 22 Feb 2020 08:43:05 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mj8a5-1jbTnj0n3N-00fDYM for <linux-snps-arc@lists.infradead.org>; Sat, 22
 Feb 2020 09:42:58 +0100
Received: by mail-qk1-f181.google.com with SMTP id 11so118074qkd.1
 for <linux-snps-arc@lists.infradead.org>; Sat, 22 Feb 2020 00:42:56 -0800 (PST)
X-Gm-Message-State: APjAAAWC/ZKEQ6omJb3ivEhPPzpuc+fjafoizNMUkZkvG0wr1tXKNJ/c
 BxKyU42M3tB6HUDpl9DyE6IJxkSigecCqsDIXkM=
X-Google-Smtp-Source: APXvYqzdf7qDgvBfOyUcK60taKavJhXx5pdJkhD02mhP1sS6incDiD6X7KcZ2ivIxldD7tHZYwjk2o+7tAkrZQlb1/U=
X-Received: by 2002:a05:620a:909:: with SMTP id
 v9mr37452996qkv.138.1582360975994; 
 Sat, 22 Feb 2020 00:42:55 -0800 (PST)
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
In-Reply-To: <20200220103716.2f526933@jawa>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 22 Feb 2020 09:42:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
Message-ID: <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
To: Lukasz Majewski <lukma@denx.de>
X-Provags-ID: V03:K1:ojApY1eGg1I4pAcyCNevWVDv0FkuDGR3liplh1agaU0B8TwHEik
 0ZZrtCA6p9ZzUXcNFkAWji29BGoOoORiGHFp/WPFOzTg0CxqBkN9UVivvMecGemud5tqSwi
 ryjoUNksoUFxPxW0vHizhySZTXqDb2pqU1WCoHqMs82Jj1hz7KlvEZnfcCuFnF07MB4fE9q
 kqNqmYzo7e49bzMpFO11w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W8ncxF8RI1Q=:bBYOdmoaSoF+eCK1NTw1r9
 Zkr+9Y6Wg1nm1tbZKgVFeTZa07KjS7FcuI0BwxhSPhAoVBOdGBL1yNshflK5Av2HiYSmGJPH8
 jjTvthJYHWq83v/wx2GnxZDx3thsL+HhuKiFsJfU7fJmklUtl/MBjPAY9bqrPT6J1A5Ew4icF
 jETBXwzVW6nJphYvsSNFQVwxa2Xx0+SISl9JxEYfs8PzZ6hjSq5rQs4WVQwznzTpeIyeBni0U
 pbS/OQFVf1xjgkeQbY74O7DXLbJKb4ptFygNt1VlFVU8/bc8kMu7HtqXisyTC7IZ4xQQL1F9U
 VvJeh2XyEFASUbdyW0beM06s/K7OTkHlxLlRz0+B7Qq+Ag63JTtKg6OtDuC+sGk4TDuAdlpzd
 MdbUHb0lxXLj0G5f1nIOvlaTR4wnez5E3mEf9ia6AZBRLpYDawT14qc8tYYcPigGnBp3sNvO5
 IqpY6Hy7POLAUPSySWnRZ1dn6Jbuktdin2WNNwP67P9pxVuGYIFM1EACdnpVK0mK1Y9N+2phu
 CoWWPFPMuBPgEyTB3/4Z0iepr+Z7Cl1wtXRmCkB4tbgajoderf4DzynvBP9/5cs9F3+FAGhUX
 yp4V/IVLQZy9g5LpqJYlI5DwzaVveeu9f1QpJr9JQUs32iZy8Fr4d3MdtJNvl5m2VpZ3gju+l
 UWuiOZDFZ3SOpV213JiAw4N+q9B559kvinF/B81GsvCdGzzGXMQobausqVDTEJ7veHa2MBHDn
 h4QEMVxFucGBD4KYzFgSybG25O2HilLcvSx+A/GYwxBbiWKNshkNE5fpc9gD/YWAWvub3DClU
 RzQHrFTsBzE4YlezS+lW640Jus52Ji8PrULHqb6JoJMw+gjrx0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_004303_415169_C9BA5B92 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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
 GNU C Library <libc-alpha@sourceware.org>,
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

On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de> wrote:

> [2] - https://github.com/lmajewski/y2038_glibc/commits/y2038_edge

I tried packaging this into a .deb package for use with rebootstrap, but
ran into a couple of test failures from glibc itself, when testing the i386
version while running on an older x86_64 kernel (4.15):

+---------------------------------------------------------------------+
|     Encountered regressions that don't match expected failures.     |
+---------------------------------------------------------------------+
FAIL: elf/check-localplt
FAIL: nptl/tst-cancel19
FAIL: rt/tst-mqueue2
make: *** [debian/rules.d/build.mk:116:
/home/arnd/glibc-2.31/stamp-dir/check_i386] Error 1

elf/check-localplt complains about the newly added symbols

Extra PLT reference: libc.so: __lutimes64
Extra PLT reference: libc.so: __wait4_time64
Extra PLT reference: libc.so: __setitimer64
Extra PLT reference: libc.so: __utime64
Extra PLT reference: libc.so: __timerfd_gettime64
Extra PLT reference: libc.so: __clock_settime64
Extra PLT reference: libc.so: __utimes64
Extra PLT reference: libc.so: __gettimeofday64
Extra PLT reference: libc.so: __clock_gettime64
Extra PLT reference: libc.so: __futimesat64
Extra PLT reference: libc.so: __clock_getres64
Extra PLT reference: libc.so: __futimes64
Extra PLT reference: libc.so: __futimens64
Extra PLT reference: libc.so: __utimensat64
Extra PLT reference: libc.so: __getrusage64
Extra PLT reference: libc.so: __timespec_get64
Extra PLT reference: libc.so: __getitimer64
Extra PLT reference: libc.so: __ppoll64
Extra PLT reference: libc.so: __timerfd_settime64
Extra PLT reference: libc.so: __clock_nanosleep_time64
Extra PLT reference: libc.so: __sched_rr_get_interval64
Extra PLT reference: libc.so: __settimeofday64
Extra PLT reference: librt.so: __timer_gettime64
Extra PLT reference: librt.so: __mq_timedreceive_time64
Extra PLT reference: librt.so: __mq_timedsend_time64
Extra PLT reference: librt.so: __timer_settime64

which seems a bug in the test suite. The other two get a segfault
that I have not debugged, but I guess this is likely a problem in your
patches. Have you seen the same thing?

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
