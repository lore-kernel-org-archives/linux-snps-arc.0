Return-Path: <SRS0=PWXp=YO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D882CA9EB5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Oct 2019 08:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A04206C2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Oct 2019 08:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cwU7/aTL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="1m2lTqA9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A04206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Osq9a8GMabwWMM9B14+sqqVthHsGY3AualpYnCARaeM=; b=cwU7/aTLkKjvLIsPkIzaB/DgK
	DHrfzJa94E6jVn0ozGncUvVDA9aqD7UAIi9fPV4EurkSthczaIetZxW62h0xJOUeznD/smxzMtMji
	CmXbMczZeDEhYPr1T0SIJ9UkaBRiKGI0QSAYDJcvNGHSuzzZdBcZJuL/JQZpe6Lw4kbQwIozX4BiK
	A3ROnEx/1WoTwy/nmvBxR9k3m3Q0Yr0rTcVXk4NTfteOELn9HXoRDmmeyUc5TbCvfEwLtScqVDt31
	rwpyh3WQQNMYxCAcQXLqTd31wY2jEQcaOP7e2SfzRYvO8nKPgLkl/M2gHGrOefH4UTH9khbqHsF/p
	z/i+PZ6Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTMD-00061q-N3; Mon, 21 Oct 2019 08:48:05 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTLm-0005QA-9G
 for linux-snps-arc@lists.infradead.org; Mon, 21 Oct 2019 08:47:41 +0000
Received: by mail-lf1-x144.google.com with SMTP id y6so3113180lfj.2
 for <linux-snps-arc@lists.infradead.org>; Mon, 21 Oct 2019 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QXiJynjMNN+K0FoWykKekuEj/OBAnoR2FAHWqATIrfA=;
 b=1m2lTqA9g8pR+gNDKI38Hf1YD7AHOVMKSH+qSD61rfazdteezEy9qc5uu2ptisQ9la
 2LtDIJrwJ7X1O01IGsFjD9Q/tJKUKXCVjQmfmnHyU1gdA5IsuEbNn8xmSiwXeHIxvmk/
 6pVLd5kq52suDJKdMlVESukd4NeWOaLnxEtoHQCsXi6XdP7Fg9uthetLEeVehsgGmwkk
 ja7ACVppObMYfmKfim6MGSHkS3TgOluieW1CYSonwzhW9/htLzCwwZtSsHf1htBxQR70
 GPCtExDc04v5gmZKf1XkxxBDsYhoYYnWBWz0PP+O7PTGn50JCdZZF3jn0h256hnPJzT7
 KjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QXiJynjMNN+K0FoWykKekuEj/OBAnoR2FAHWqATIrfA=;
 b=uRc6lyyiSTED8OfbWb8DeTF54ii78UktdH0SZn+4drb03jVxgZtJpRlIohxd3BY2Gs
 rFUnjx4gT4obEpcDFAXsthat/G+VIcl3oWboOhop3+geWKU5L8p6R3oE0PIsRV45AWMy
 vdW+5oWep1fs3pXc97ZynunYaR3cbaYaiOOhF88mNC8Yg6Iy06Sl/9nCRjlsp7TNCB49
 B65PmUAE5dDTgqnVtXmZAR/XeBCH3/ttfXZPxvy1Fk0+8VdZ9A/fVntZ8+nv7sPJw+jr
 7s/38m0MTWvP/qYqqJ3jHakcYiKygkfXHqFdvzTBBeFbxZrLyPzSc5cN9kqY35LZItJf
 fhkA==
X-Gm-Message-State: APjAAAUTsI4rwKgjejXVdwJsTxrnqb1omaA65JLCnTuDzMY3f5C2Cgum
 PqaLMprkx2lxHv7FzdxpIlIqgA==
X-Google-Smtp-Source: APXvYqylsk8yws60VuLL0ozqdrRuKOuNEAm0brGxK1g45riofpGFYvmXbrn9qDfFdvJfYm2OEK4gUA==
X-Received: by 2002:ac2:4283:: with SMTP id m3mr14587900lfh.41.1571647656443; 
 Mon, 21 Oct 2019 01:47:36 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2d0:74aa:edd9:b20e:81b0:5b8f?
 ([2a00:1fa0:2d0:74aa:edd9:b20e:81b0:5b8f])
 by smtp.gmail.com with ESMTPSA id x76sm12649907ljb.81.2019.10.21.01.47.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:47:35 -0700 (PDT)
Subject: Re: [PATCH 03/21] ia64: rename ioremap_nocache to ioremap_uc
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-4-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <915c9aaa-ea20-7c29-7ee8-5c5f68f7d123@cogentembedded.com>
Date: Mon, 21 Oct 2019 11:47:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017174554.29840-4-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_014738_759558_F1E35736 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello!

On 17.10.2019 20:45, Christoph Hellwig wrote:

> On ia64 ioremap_nocache fails if attributs don't match.  Not other

   Attributes?

> architectures does this, and we plan to get rid of ioremap_nocache.
> So get rid of the special semantics and define ioremap_nocache in
> terms of ioremap as no portable driver could rely on the behavior
> anyway.
> 
> However x86 implements ioremap_uc with a in a similar way as the ia64

    With a what?

> version of ioremap_nocache, so implement that instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/ia64/include/asm/io.h | 6 +++---
>   arch/ia64/mm/ioremap.c     | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/ia64/include/asm/io.h b/arch/ia64/include/asm/io.h
> index 54e70c21352a..fec9df9609ed 100644
> --- a/arch/ia64/include/asm/io.h
> +++ b/arch/ia64/include/asm/io.h
[...]

MBR, Sergei

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
