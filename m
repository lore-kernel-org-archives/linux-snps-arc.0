Return-Path: <SRS0=u+eN=IG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDFEC433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 08:27:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856B9650BB
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 08:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856B9650BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=npJ+47Ibl+fWrKR+DbTMO7IyN1166YuLBbewVe+H9/A=; b=cgIrEi43SegQeh+q9SYN1dker
	oIMdHufvWKshyc41RYWDXHuxEAYSA5Jf49mom86oDbznOBCXHYkaGPvXt0qHjT1pA9y7PGSX+vMXp
	H0iQZFfVi9yur6FZFWabocizMUBpRMnMK1GB6tqTgvChHLTTcmD68aVzFOjnn3v7JFFGG7SdjomML
	LmrC+nWeLLQrJMk5awzEW+5YZtIfphU1M3QPPFCeljy9ce4smnlDZQO6TFtDi+xSapZAAT+XRZuu4
	QtoZPJKRAd9LZvKmHPG+jFcIE4JilCCs7NBsydloMzr6L3T95J7tFAWgCxWK4CSsO/cj/rIK+4ixU
	r1zTV4PTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBEL-00Fvsz-Mp; Mon, 08 Mar 2021 08:27:10 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBEI-00Fvqq-CB; Mon, 08 Mar 2021 08:27:08 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MuDLZ-1lbNnt2YM1-00udkS; Mon, 08 Mar 2021 09:27:00 +0100
Received: by mail-ot1-f49.google.com with SMTP id a17so8434807oto.5;
 Mon, 08 Mar 2021 00:26:54 -0800 (PST)
X-Gm-Message-State: AOAM530UxsVlUTiVQl5MPvfJKLvEiabKivBAJSrHOnVNn0XQfo2Ye58z
 CnDfXRre4eakMmA3L0rB0jqnC6tT50df7Fwxqfw=
X-Google-Smtp-Source: ABdhPJz7WzRENGkqrJauNt4Eu43tE41OHtOy5Pi18b4rc5onlz+3B0QPZSg6kqLhqT6QwccMllOlz9JudYJqhcYI0w4=
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr8386599otb.305.1615192013989; 
 Mon, 08 Mar 2021 00:26:53 -0800 (PST)
MIME-Version: 1.0
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
 <1615185706-24342-7-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1615185706-24342-7-git-send-email-anshuman.khandual@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Mar 2021 09:26:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Jp6wgGWJ9UDoiN5joOYSONaoHoH=S--i=3SQpm_f4JQ@mail.gmail.com>
Message-ID: <CAK8P3a3Jp6wgGWJ9UDoiN5joOYSONaoHoH=S--i=3SQpm_f4JQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux-MM <linux-mm@kvack.org>, linux-s390 <linux-s390@vger.kernel.org>, 
 linux-ia64@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, 
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:Cp1SU3lU41py/TzFUFBYGra9oeeX4Q/iaSSk0mm82sEOHv340mF
 JWfHWi+UkLS1IqrK0DmtCUKa8PHnC6iccNaoH2YAgHUe9pd0WZiw8AEi7bDFdPAh/TS/Fgc
 0GZGi+1iX4qRxXh30CBzc5lJHem1+gTeMxRWjXdtYiM7q9RAvJxrCkodqDacnr/jV3oA7v2
 qAT90zCzLvBe4bxTnnaKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qwze2/z3I2Q=:LSp40QDRWMhz5ioKV/FwKe
 8+aH2H1rlTy4uZHH1fNn2u1Dzq00QsAPTUd4wsLwTBGT3hbgp0p8Q/B/u1GVaheqYUo+dA9Rg
 oB7ih6zTzdVhatJVh0I2Ao8yI9CV7KZQzwNr//SjxOy5qbU5t2LH9z7iFas6t1RbVir0pReEk
 o6zB4I6MepRh94BOWa2DPlUTel5enoLWtQWey2vG2CCrkbYYjJ+ZDiecOR5uAiCRD7/cSFjI+
 I+OPwugf2WuqopqMs2QbpO0Df0YKRwdju6kYwmFRnh/C/kNASL5l/ycZGCHzBu5319NSP7jLv
 H6anE6QOSAWD4Vy6LZ1LDIbAwIt2pMTrbt+A5NH3pWr++Q+j4qt/AUSLGnrtPBo4Fa1e87UJd
 DIDmYyHEYPo4qLkgpNB1FAg3/S61ar/9zrwYv850bpqKZ4Ncxvk244EK62ivj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_082706_594956_9913B263 
X-CRM114-Status: UNSURE (   9.25  )
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

On Mon, Mar 8, 2021 at 7:41 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> HAVE_ARCH_TRANSPARENT_HUGEPAGE has duplicate definitions on platforms that
> subscribe it. Drop these reduntant definitions and instead just select it
> on applicable platforms.
>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
