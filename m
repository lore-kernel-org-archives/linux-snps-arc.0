Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF03C11D05
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 16:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E7E207FD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 16:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmELZ33s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E7E207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Mm1P4cg15WHfNI1MWAQRPUmOcZzNUQt7cC5SdszzrU=; b=mmELZ33saq0Erv
	+RvIbDm0TeL5ykbfC6t0sfXKkfT2c22fOJF0dEF43AFD8hauSoTIv4JUaTNUth5kxMg6wuF4zSMIE
	iv3YOBua2bHESq3yihQOapcyQi0Oh4nWL6kiMvJI2E8Cf9S4cs0B1gfdM0SFJpVqZ0ItBeH09t539
	CxUmpuJaVbJ3bckX3Q67sCpY2GlJbKP7ZlG7j+9uo2ZovvHMnzpHsYZ4AhQntk4a8SUGhP5RWD2qF
	hTRcUv0jqc2vcN33mJOFPNU6I0HXe8UGp2LAFsxs/e11gBv2QgpdiaJ6izzp/YRLkHvfz3p8piO70
	gxkENE4uc7UrPy2mSt7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4oNK-0003un-FC; Thu, 20 Feb 2020 16:08:30 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4oNH-0003uF-0Y
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 16:08:28 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MWSJJ-1ixyiZ3RPP-00Xtdw for <linux-snps-arc@lists.infradead.org>; Thu, 20
 Feb 2020 17:08:25 +0100
Received: by mail-qk1-f180.google.com with SMTP id t83so4065511qke.3
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 Feb 2020 08:08:23 -0800 (PST)
X-Gm-Message-State: APjAAAWgDuiyky4NdObGnBHquxzfYBE65VKSGaCEHoMCD6HiKsHeuFT+
 wONkFgoI3d/UOxcFVGETz6lJ6ywkOd4quaM7zgo=
X-Google-Smtp-Source: APXvYqzbNNvJkrxg3nkEs7SdslTS6Bb/YIX7hYpXfww+zL64xDyuZ3JiaIuj+/PMFAUyd5xKjCQr+simzLgSldvqNfY=
X-Received: by 2002:a05:620a:909:: with SMTP id
 v9mr28233691qkv.138.1582214902630; 
 Thu, 20 Feb 2020 08:08:22 -0800 (PST)
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
 <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
 <20200220164245.035e09b1@jawa>
In-Reply-To: <20200220164245.035e09b1@jawa>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Feb 2020 17:08:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2vvuqzLQqrYkyyYBFATDjCpBuR2Zquu-xB2BWmc5GQWA@mail.gmail.com>
Message-ID: <CAK8P3a2vvuqzLQqrYkyyYBFATDjCpBuR2Zquu-xB2BWmc5GQWA@mail.gmail.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
To: Lukasz Majewski <lukma@denx.de>
X-Provags-ID: V03:K1:8AJeuhnTNNnTLeCg/REFxOhnasO/+8/x6bCTx8ZGtzBmc9Vxiwg
 n5nmGy1KbgbxtthPNwpUxeMYAPF/pJe0Or7/qFZdGQgPxklZJ2adZGzHM6ImRWDIQUUHSBa
 o0eAFeXD0oVXBNqmvgCRYECqEQnmHI7cVBKHukDqmrgnEbHPEf0cZDOQ3ZJEG3PVo8SIitR
 p45GHZ1dMqRDwN/Rr2n9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0tESzPArwsI=:bkRkF8zhQ7rpFJeOc3SYmR
 MX0/3lin+bXMLc1FL7F64Pg6/q8xar3Z33yec/rzqa6gSNmLopAn7kQbLfAf9i6Tk0SkRsrL8
 qByhO060kHrHYbfQ4NjHkkraJOa/+fyOKdTj1CLMhNAXqtJLix+N0JSS9MT6Ve0OSxhlcY08h
 PDbjUHWRP8uT0wKJrf6YPXptzuiMFQ6S/tpWZNSyxWPehDk0zz2MOM3gc7zVpPBYmFEpFYYAb
 jHx7Ld0MMFsRVP/Hf4ZFyBDamIl7FluZJyufNSX/NkNJrXqfKxf/ATbuXUOjmBRoa/j6O+g9i
 xWB4DH437xZDYaWpzmmwT7R2OR9m8zPZcUYfDPa+sUJl/kAmewpRH5pTlIRrtDNdgmardQCsM
 lgX3ByNHi5D9Gn87l5tmZr7E6izaQuiUD798CDQx2rIZdMC9bv6pUIOVOjwtBXy7DFjnfiO09
 XTAXZrfKDfb8zLgW1dPE9pAAVZYzj7EcFgMYTkm4VWkq3ZI8KUJX7kgPu1PA0oeDWplf0wUIU
 WByUK3vlQajINa42xnWC58tt0bQfhlU/vY2JrxGp/bd5e9u1o0ErxXztOc3pgW09bLzIKM0Ko
 NyBLmLWDnDchx6l+BYiaLVPqcUlcbwI8Ne/wEIixn/BUbr8EAB5VLL6QqTRa9mKhBm9Qnhe0o
 u6vXt08SswfbAqDpXEt64ehnJ0QY95WGevKlRVkWnaXPaEmYlVc563fFFYQwCYHLucUkWEual
 vZa8Dgd1JsXQvpU+Y4j7xxfb6ayx+HtKkxT5yyLj1phIVAK+AkHVleSP6OISCqjNh3lcliFuG
 aJN1SSA09WvkjIb7n5X1D7Ex3UKKxBV23LU7TLs9CjVIF1QYa4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_080827_361182_89F332E9 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Feb 20, 2020 at 4:42 PM Lukasz Majewski <lukma@denx.de> wrote:
> > On Thu, Feb 20, 2020 at 2:15 PM Lukasz Majewski <lukma@denx.de> wrote:

>
> I do see two approaches here:
>
> 1. In glibc:
>
> When -D_TIME_BITS=64 is set - redirections are enabled for syscall
> wrappers; for example __clock_settime64 is used instead of
> __clock_settime (e.g. sysdeps/unix/sysv/linux/clock_settime).
>
> The latter is guarded by #ifdef __TIMESIZE != 64 so we could change
> mechanically that __clock_settime returns -1 and sets errno to -ENOTSUPP

What I meant is to remove the __clock_settime function from the
library entirely to cause a link failure. I suppose replacing most
"__TIMESIZE != 64" with '0' would do that. Ideally I'd just set
__TIMESIZE to 64, but doing that would make the ABI incompatible
with mainline glibc.

> 2. In kernel - return -ENOTSUPP when clock_settime syscall instead of
> clock_settime64 is invoked.

We already have that with CONFIG_COMPAT_32BIT_TIME, but
at the moment I think that still breaks glibc's usage of __NR_futex,
and a compile-time error is always better than a runtime error,
as it's easier to catch them reliably

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
