Return-Path: <SRS0=/WUS=MP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A060EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Jul 2021 12:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66C1E60E53
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Jul 2021 12:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66C1E60E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLLyqKzy7+EUWdA/eEZmhVntc7cdABfQcMGZFHlfc24=; b=HUNJHGtjYWaDtr
	OfBVd0N+dZtxw/ZGaJWK+HQh0Krg44o3HPiU9TUx9Lvush6nwX0OWDKi0W6qpWg/Y8tG/OJ8JpRfu
	kNLc40Madt9wYGVQw0cubzuiU9cMtg2DLiPaR2jHtPsZ1EUH3t9UhqUG/wUYLa+KTMN4xA3d3lLZn
	STXy1NxAUp3QV+L6bzVbfKTOlZ7zrkYgb5mUXuQ6Tsdvx7ej9wuePUh7X4ZibDhF5Az9O2sap6GQX
	kuwASQj8hLeuuTK9nqspAoZbgSfuWKJfbspmYEwe0IlkoNGLdPFYXmGo1udpmNzBXHx7Es98jNuG6
	czUSaW6dFfwcKMf1EbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6uXk-004f39-V1; Fri, 23 Jul 2021 12:44:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6uXi-004f2n-2z; Fri, 23 Jul 2021 12:44:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3E6260E53;
 Fri, 23 Jul 2021 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627044281;
 bh=I8EG8KvdkCZRoKrlaYWdZuQlSurV1+XMVadCAjX5YV4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M2pSVZdD7rfv4nAotQZCIT3kqMmqDIZUXTkQGbzQjKbUbLnXRNRX5t6n+7Aje+BQ3
 HP0vQr/l8Pe341pKvaIdsuSyQfE4vTij68GuTJyc6/njQljgU+zCiCyLrVxDkqABvM
 gWgoJUO52sJQW5yHNX90ShPI8OsWRXUxEyNxy0vMHSORjVHZpPsOdSaIUTuCzfEFUm
 F8tGCJ8hme00HkMX81R/oOZTh7VwC8rfOqtbOW5lleQ7EmLQUWIR3Gq7x/h4t4rXbM
 OyXfuwU9BDiHhfs5jBPO1n2sHQwz784HcV5gXigVOpMM4MiTOIvxZODA7G2r54SHzS
 b7sHwigSWN34g==
Received: by mail-wm1-f51.google.com with SMTP id
 x14-20020a7bc20e0000b0290249f2904453so4146829wmi.1; 
 Fri, 23 Jul 2021 05:44:41 -0700 (PDT)
X-Gm-Message-State: AOAM532WAHK9HKGaH3ie36mh7PVE9ckey7L7GUKqnnl31guoBR41vJvz
 M7bLJOdoKCUnE0nRAyO800HVQQOI6zsb8IS6KBc=
X-Google-Smtp-Source: ABdhPJybmE1yWKNDIQhUELIEmJrbg4IG3VwSlneVoVTxcOHKvr1IKdvANRWVax10Jjs87DppXb3M6ypgcLHba74gdzk=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr13900636wmh.120.1627044269416; 
 Fri, 23 Jul 2021 05:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-10-arnd@kernel.org>
 <29adc1c164805e355b37d1d4668ebda9fb7fa872.camel@sipsolutions.net>
 <CAK8P3a0xZAHknG8_kc62aaKrKdzD-QwQYHT61_wTbFDYADu-zw@mail.gmail.com>
 <YPnQAksI2+YBivHb@osiris>
In-Reply-To: <YPnQAksI2+YBivHb@osiris>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Jul 2021 14:44:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0VDtatPx93FAa4ZUszZbcHPyX+aQWnZ2aTuL-dHZ_x5A@mail.gmail.com>
Message-ID: <CAK8P3a0VDtatPx93FAa4ZUszZbcHPyX+aQWnZ2aTuL-dHZ_x5A@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] asm-generic: reverse GENERIC_{STRNCPY_FROM,
 STRNLEN}_USER symbols
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, 
 Chris Zankel <chris@zankel.net>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 Jeff Dike <jdike@addtoit.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, 
 Richard Weinberger <richard@nod.at>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-s390 <linux-s390@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_054442_251986_487CA965 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 22, 2021 at 10:07 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> Feel free to add the s390 patch below on top of your series.

Thanks a lot, added now.

> However one question: the strncpy_from_user() prototype now comes everywhere
> without the __must_check attribute. Is there any reason for that?
>
> At least for s390 I want to keep that.

Makes sense, I'll add a patch for that as well.

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
