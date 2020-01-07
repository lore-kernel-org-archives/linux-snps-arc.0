Return-Path: <SRS0=s6v2=24=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5178C33C8C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 17:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CC22087F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 17:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSH34SUg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CC22087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otDwHjdxxXx1gtCZM6ZydM4i5jquLIYc/Rex3Kzu864=; b=QSH34SUgUo3SDu
	OZ5fe2YzB98i9D4bbJ2LSKWrCgQ63nemo9xxXcijZj5tu4f+jHeYjNHKzEGD52FPCAF4txPxErrqb
	y79FnEdGjlTG6AOTa3YrgMr/RPENkyJGGS7neVNxOEApMYooDU2ySjtsKdhgkEgSpMzt4Cdgsce3o
	omnDVJMHQQ6pt/kq3PjdwtyhRO/qR1M2t3lYmuO+WQbwTpR2YvZsf8wEsOWi6CMiq36S3IBK9qVvj
	5UHyoebx75gMwqTcrC1Xpudojaqx1DvCXvCLE+oEZUpPpIfJcDUscw63hYgVNod1aPkPTWJTSKr0D
	33Ramw4sonap91saY73w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iosLU-0007Xr-Cz; Tue, 07 Jan 2020 17:08:44 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iosLQ-0007XO-SX
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jan 2020 17:08:42 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N32y5-1jpjsP3w4b-013NZh for <linux-snps-arc@lists.infradead.org>; Tue, 07
 Jan 2020 18:08:37 +0100
Received: by mail-qt1-f178.google.com with SMTP id l12so320705qtq.12
 for <linux-snps-arc@lists.infradead.org>; Tue, 07 Jan 2020 09:08:36 -0800 (PST)
X-Gm-Message-State: APjAAAXYoWU/m/HO8lUq/Jnbvhp79VpelWiY61w6Pk6AkNdwL+hBzWTZ
 aZWTMgrsKEvZ2cssGYFpjcV/jegJcCv/6Ep4qQ0=
X-Google-Smtp-Source: APXvYqzRk52Ew2lmsQMfvghk3ylFHcEIR88yL70qbdC0HVK9etbYRWgu7fgyXH4+189J3IyWZY+dkJGnvq1XjVlLM+A=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr335658qka.286.1578416914895; 
 Tue, 07 Jan 2020 09:08:34 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-6-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-6-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:08:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Subject: Re: [RFT 03/13] sh: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:VSOcPbuZrtE9z0G4t6qthjXAXiG2KCwZ1PDwLMYkJy6Sj8ApYSe
 lZvI5krNPhwAKzQOQE/yMgmJrsTCzF/2Gpf91xFTLf8tV5VDrvpznwp5lY4dBefB5wy/ump
 bKFUjHwcyeZFQjABOkO36hOUPUpBCHc8POhBfnfyCEqiwwPlasXBKnnKFixL9WEceeeUYhY
 UXYQQt8PDlrt2Ahr4clHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0gXiqiY6ngg=:E6RWff7mNCNRcH/mlDju0b
 bHDTwXPb4DqSpgWAqoKiroDZB4QAXrut/hZKah0nlTv3YOw5M5uYE0d8p6H+52S/Du08+Aw9Y
 T20j6U0xM6DpdwL+2SZgQOLUhD98U3BzvDh1/JOpsIqhcyERuMhc+UtR0W1xQllhuXIb01lkq
 kZiIonuRayYyOpAQP6KyKtQ7/V9Dp4wGXD2vXeY5rKdw5W4X+45r7Idf5VvcTQ4PBa5bDNzkW
 CjkGbcBgg4YoGy9Whc4AaCTGLC9vCDCyTEmKaIJrn6vYBZelA5w00EhVaa0LYS6ijVc38A3S8
 RHWv+Xe0hB7vAUJNn0SW20MDtIlUnA9Oa8S0A5WNRZ6gRG72vVNog7nIHncQqI+03YnUZYluE
 uipXGznKI2kCAySXLnfI48wildBn9ugklznFXs70BImoggpHF4zl3NaTb/Vo4XWfKjhlOUh9D
 cDPkX+WKDFTNG67JGJ6vtk4IlZ9bUPusZL5a3dLGbuojv6WH5RxOxu5wRe1LQd3Qamj8SfiBW
 OSPgxmRCrUqQecovDsfHc/p/yVzvqkvjsnkgZMXuscs4cJ/uAACAsCDQpVQAqnXs7sxMY2Fds
 TQNBXuhMcWZcspX6Ff1R1f6E+J2JJ3iZNADfT+ZmYmNpepFL/kQ+Ncp667RQtg8wSB7rnjT1I
 qOkiFz3lFdzREwt6erBHSsMwhjGzhQIDmWFwLwd2Juv2dAwtkGpqyEc+WH9uhrHDSEydWwy4t
 y8bgrW50e28dTPCaI1gRh8Kg5VMnFdj6MGCEHYEQ+UhsUGhSvdcUUOFN38daPY+e57qYwyzfB
 VH//O2dR2v563lLH4noQB0xS3GXC+YQpXZAYcwBBgy28hR7YBVsTq/VwrZExFyO4XJRbAvxNs
 C92PARpDBSKEv7NR7pHA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_090841_212670_CDE78ED9 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks good, but I think this has to be done together with the powerpc
version and the header that declares the function, for bisectibility.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
