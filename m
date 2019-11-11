Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323F9C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 10:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049652190F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 10:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TywOmLIB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049652190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPPxS/DJs5cHLAFuaIbhp7NwRngPLsYHA77MeK6MB9M=; b=TywOmLIBDLUYCU
	UDl095MmRUWZ+dRMC/OPwpHtmuKDop6tykbF8IsBaS/GqmI0WOe772yAoCFe09NsRi/4CsMqCDwMf
	HlviWsZROOqWzEOf+vGIPYk1iPR4d9jwcUxBfqrTW0cR+5wugyutqDt7VSOtohL+nBrrRspkiB4K1
	o7wrMhOK5fL3Hi5zE6QtYdSBejMpCExJ7ckcXRlOWVQBXy2Z7wn6MwFtnp3RA58NFnoRFxqI9IIFt
	91cUxsTMAAFPqCePQaMuOPpNuu4prE8nmuAyBdbiyLyONEqH78TvMHWtegcSrdIL5ZBwnwPCbdxgQ
	XKIz4/EoT6RP3SUTSA6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU6y9-0004Pf-Gr; Mon, 11 Nov 2019 10:30:49 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU6xM-0003ap-Vy; Mon, 11 Nov 2019 10:30:05 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3UEW-1iUfBc1mss-000YWw; Mon, 11 Nov 2019 11:29:58 +0100
Received: by mail-qv1-f51.google.com with SMTP id g18so4639015qvp.8;
 Mon, 11 Nov 2019 02:29:57 -0800 (PST)
X-Gm-Message-State: APjAAAUjEwAjCc5M69LHhRIVCr2eJ1MgMS0kV2SmIlEfSB5aAMbBNU7a
 VrHOGNgjnoVFbLEt9W2ft7K5Z9TPxm0wcduaX1M=
X-Google-Smtp-Source: APXvYqx3dRDA2rmaPEW4UpY0UEoKLtstJlcCKLowXnTab550quUX1o9OqysLm43EJTh/MA4389FmX1Acn21s2dCCBDI=
X-Received: by 2002:a0c:d0e1:: with SMTP id b30mr23068710qvh.197.1573468197026; 
 Mon, 11 Nov 2019 02:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-12-hch@lst.de>
In-Reply-To: <20191029064834.23438-12-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:29:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36-afn--XqG0ddj6VSPCzA_cfZqRxQXDuan7yk8CKg4w@mail.gmail.com>
Message-ID: <CAK8P3a36-afn--XqG0ddj6VSPCzA_cfZqRxQXDuan7yk8CKg4w@mail.gmail.com>
Subject: Re: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:6guaQA4+a+hKpeUEATG/Sr22q5IYJv40VBYTVBT1yunZiRgJ6+m
 c+LVNnZ9gvK2OAor8UrbMtGoxqdZWTsAuThmPlK14PeGRN2JXfDh0BiLueBCYePA1Ktmowr
 Lw9NQiLK7uzem12XxkqbkCyuKyR3gaXLX+jX8uNZLNqIcJbTQsjMdVAICytnncUoG/RDPSR
 0crTAJQDOVPI2WTmWI7Yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o21XpDJ2O9w=:tFdICbnz9uXt5+rCaORVnC
 hymsv8R5uBy1Z9ecNfY51OArhvyMi/eoi2VhD3o1d9WtUvTPz4EgBUGDHgwAFH+a68VabQtIH
 cF4R8X5Cz1QRcxfolEELldYzhZ5lPB9RK0kTocdX/fKA0dy4sGPdFYEUfrDfcQTAF6Qf4awC6
 2VBKZU/Iz8MXNByuCyM3xIRe6j1Qdnf5hcRe3gBLkRyNPC4Si3FleMicuS6D0zOcVWjAjKJND
 SIDcZ37NgDlspul17VO6erpGDZtq04CF19FpgykqtLG8cwnkT+hMXUw1ymvzOyzdEDXbBRKXQ
 hGii7PBjvQ3Mp5JySoAyqPthiR0O6RwW4jJPKxsEVEfzeWhyO8pVpkfPhptaSiAGi6ebkejKk
 XFmZGywz1ny0rLxWLA7F06PU6u9e/7JHBy0NiVyqRFiAWJ/YmY88ZVQSe1Q6PCdxanp+qouVi
 PjchJ167lfQ7I4gMI+vKwkEaH1AVo4NDsWn6cyxQTJoriX3soUFL1pxletLGxec6ypltlEYTI
 paDb6KFUhUtRW2ggLagOPqJNLrAkqf8ke0yXqiGXrcV1I38eludBXQGGn9eVmt2EJXItGQfbK
 G9ZRuHFT1WAqkU++mGET1aiEMkkoqOVhKqdw+D6tLtqs/CD1qbHybm0eNKEv/CX+F5gMlEV+/
 LO4AtH3jKXKGa54Y6faZE+8SxYYSbxB3z03OlGAGPJsiHjfAGPSggxfU8W8qzAMQhaZAbaAMq
 UXDu5qWlILlJmvM+GweYp+GSCPY14PO+UHcvxz46/ht0Tl84s0/J+RsdovE4xwdzdqHxCRTNc
 sfwx/pdBh3RqWEfn+uwqsRbY6tfMSmsL0VBnrXuJq7vAqaKjFltElVAJugpraPtjnjTHKLRMw
 17FnBLMhXtH/yGlF1+XQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_023003_331919_533BDB4F 
X-CRM114-Status: UNSURE (   8.65  )
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2019 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> All MMU-enabled ports have a non-trivial ioremap and should thus provide
> the prototype for their implementation instead of providing a generic
> one unless a different symbol is not defined.  Note that this only
> affects sparc32 nds32 as all others do provide their own version.
>
> Also update the kerneldoc comments in asm-generic/io.h to explain the
> situation around the default ioremap* implementations correctly.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
