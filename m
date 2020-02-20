Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C21C11D04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 08:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B41324654
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 08:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4fKLFmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B41324654
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEDZ4HA/y9IcozaNHI0R2Lv42e6neCWdNwCPxoUj39g=; b=M4fKLFmhZKJzwS
	B1/ApymYL2xpaHA2A+7TiJ9g38WaxX1baqLwipbah7GA7si+bRrVSJGAPwq8exMHmteLaL6UuL6Hp
	ITT0CSmj0E6g6697ofjlbkCej+Qo7TdWzBPd3xbbviUo92LFBNOovsQvtP857k3kSOcHurZpWyU1m
	O0Xga6x05w1tKShqCO7kuiuj9Nby3LkVw8t544cGV9BrRYV+9M1V4GcpSSbSwG0z42xFNDvctQOXD
	rew+Hiom0MlW6qLNyMoUDO1CsCEJeACCnmxnBMoUcZy4Q101teR6ewgtNoNT3DZZo56yWYK8VB/yz
	DKzDlgbefWvn0VvYWApQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4hFT-0006RV-Aj; Thu, 20 Feb 2020 08:31:55 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4hFQ-0006R3-R8
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 08:31:54 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MJmX3-1il6xo2Qf3-00K9It for <linux-snps-arc@lists.infradead.org>; Thu, 20
 Feb 2020 09:31:49 +0100
Received: by mail-qv1-f52.google.com with SMTP id u10so1518699qvi.2
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 Feb 2020 00:31:49 -0800 (PST)
X-Gm-Message-State: APjAAAX5DpyK7Et5Bl6NJtKvVzrl4tPK1JFQws7UW99B59E/Iuqrahzt
 Los710LcaPzWqk+AkuTun6JBDrn0wNuzwC2BgoU=
X-Google-Smtp-Source: APXvYqy7ZnngAbgepT7/VTUGtPfnOQ7en3v6Ba+/8iX0nJEwzghFzfyDMO3YDIdwFFsgUU9KYjD3O12BMsC4h7jmQKE=
X-Received: by 2002:a0c:f9c7:: with SMTP id j7mr24778834qvo.222.1582187508410; 
 Thu, 20 Feb 2020 00:31:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
In-Reply-To: <20200220001136.2f14236e@jawa>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Feb 2020 09:31:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
Message-ID: <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
To: Lukasz Majewski <lukma@denx.de>
X-Provags-ID: V03:K1:Je1opfioIMToZISlwu3BwAXZm5/rl5v1ref/Cr516FZ/sIa96w6
 coZsj2NtEUzssbQryvFV7qoN2TPwRakdhk9iHNFYpSVBsi4rdIZmaLu7bLoEKFqY72ev2wq
 Hr8/C5qyimv6K4fXshnPkriFWslQEm2UIEpS2SO/XQCpxpw6dL9Th8dI2aPeP2iRFreSyXA
 qheT7+VoS3TtcvybBcsWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a3emEN/BNu4=:ivmQA/Tfc9yZuL6/bD3IrL
 t9XXHFga+3/H1B+vK/E2Io3cAN+VkMW0tG6dkReroagkcF4WAxmVWIhXLksRZRHPqVYEHuUtE
 PHrZ292WSybq0z0lvYG3huh8P2SLoMSTEEBtIJwEqDIItVXBRAUnxRfjxh5ImHJ8T9nntGBaD
 4OZ2gN1SOeDpMTGpXNGfpOjvwujs/PwjVFJEHQTh0GRQZwezjRkf/oi58d8nq4C78CF/+KPKK
 bcrgGNsw4xB5IFP97Iy7gg4LVac1zJHDGosouJRELXdVc0E4BpuVXMgg3X64q/iQQp5LEbX3+
 mBaadtOkq16adTipDEtMlZCY15wDzj6YCjSLYnfRPT5cwaJZFoZQ3EzQUhZyv2BQLPGCu5+ZE
 n604WWKUpgBzsheUKLF2eI0YJYAVJVgIyV0k12PtJNnnop8LaTSJ9cOs3CB/couUL9lsyBL4N
 QoglYKlrWU9TQz4lT+2layl6uh8xgTbro+8+4WzdMzIDtljP/kPqvyVDbzmrN+Q+AUzGewSj8
 /fk2BUAbRxnZXQ5kZa1pmvf1WrbIyiUAGJs8LwAWn266xgElY2a6yDQacJN9i9AdrwUfdu0WO
 3JO3n/mcqmroknKA3TlqsNamE3ORpNkCYAYgXSSeeM5J2qnl+BUDMnP42gAsq2qI7WI2hS5pb
 ig86b35+EsqBbzXHocCIXSzDIzSbL6SSeE2oj+YvziCBF9jJicDlu5/mJFoE55BdGv+ViCKKq
 0AVLxnWC1UKyf/N89zk4WHzxYWqloqsncxq1/UAokgoVm0tyVBiRBlIJW9no7A/MHYK/ZfVtx
 Ymx4rlEFHkB6z50qAX8yiiSh6uQH+7YYWOk0J7EMtMXf8myrD8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_003153_176924_FBB876BC 
X-CRM114-Status: GOOD (  14.25  )
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

On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de> wrote:
> > On 2/14/20 2:39 PM, Alistair Francis wrote:
> > > On Tue, Feb 11, 2020 at 5:30 PM Joseph Myers
> > An the reason this all works on RISCV is that your kernel doesn't
> > define __ARCH_WANT_STAT64 -> lacks __NR_statat64 and instead uses the
> > statx call which does itemized copy and would work fine when copying
> > from 32-bits time (in kernel) to 64-bits container in glibc. Is this
> > is right understanding or am I missing something here.
> >
> > How do I build a latest RISCV 32-bit kernel + userland - do you have
> > a buildroot branch somewhere that I can build / test with qemu ?
>
> Maybe a bit off topic - there is such QEMU and Yocto/OE based test
> sandbox for ARM32:
>
> https://github.com/lmajewski/meta-y2038
>
> (the README provides steps for setup).

(continuing off-topic, with debian-arm and Helmut on Cc)

Would it be possible to take a snapshot of your glibc tree and
start testing this out with debian-rebootstrap [1]?

Are there any glibc issues that prevent it from working correctly,
aside from the exact ABI not being final yet?

        Arnd

[1] https://wiki.debian.org/HelmutGrohne/rebootstrap

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
