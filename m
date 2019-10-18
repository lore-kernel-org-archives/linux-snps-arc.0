Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E820CA9ED0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 03:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1253921897
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 03:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+TjTtV2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N5x8bC5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1253921897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3SGUl4UVTnpTxZJouICqAX3+rHj4loFaS3G0ia7Jgk=; b=d+TjTtV2ccCl3X
	9xpbbVFmsHTTkLDGQLsFns80+IZR3iUvDTW7BZqywAeGYSS025j1qxsqd98DPYiIEAcgabyzhFmup
	0yMoV6bctvCLzgRwrIf6OYGz2YY67ohXdtFqfLHo+aI3ZY+31erpuIIbFx/NALbXn+ZKGD+DOnJk0
	mELOa2acQEP83aB1YUXf/rywMQDFAGOBuSU0UsJclnZIXeCKPMVyncSjHccn3wilOfYWd4E0CQUjn
	qq6sCH6587t9pgibuwT3VniuFuRGFID+kNRtwcvFFzbWWhy/SSrWCSwezYYq91VHyOI2Cmoq9Rqsu
	m8QyErj2yTzDFgLTmYyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLJAZ-0002ey-GZ; Fri, 18 Oct 2019 03:43:15 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLJ9f-0001j1-M9
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 03:42:23 +0000
Received: by mail-il1-x141.google.com with SMTP id a5so4230820ilh.6
 for <linux-snps-arc@lists.infradead.org>; Thu, 17 Oct 2019 20:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ofLqnhuaTacSfKe2YQoATYL+HC8rQjiCUNcY3XPivmE=;
 b=N5x8bC5o7w6rADZFh4KHeDpeb6o3Jgm+KphbQhVkPqZz1Fd8E9M3PaWuoBNyLGjNby
 FcCFIu+ox9T9DjhSC9heNZjMQrgm4xMjJ8TFBQCdlE86wvAdlBsUPOrsnGVYu9lKKeHQ
 D7w1xDFzmUYo0NdnoKDfVHfBV9rDMkKr3XHd+n6zCsh3R453pBKlec2RqfraXt+7FOJg
 3/bKBkC2vF8FVFJOQ2O0M59pBjRLRRSRz4XeMXB7o18TKzN8hqr5whm5Tas+OI+iIky7
 4MLLxBvYd+AUGMn4Rl6c+9BDiHaJCgsFf4PgCwD87izM7iHj9N5OArKOuTr8d8G+a9R5
 mQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ofLqnhuaTacSfKe2YQoATYL+HC8rQjiCUNcY3XPivmE=;
 b=TPaBshI65KzIz/KZyI+y0hKlGrYeJpF50S4rxh9PsZCclTYCBwuGPzRnvj93X5lRec
 sVXuI7ApbeGT0eqSGeospjkdzawN9hnoq386siDEXE+3vycuLZruHc+VHVPYxk2y/Y0I
 cA4dxspp1/qt6LUJf9WaWEZzyR1IcuGriNwDKRlDxclHhuCKfAjhbe2ZMKNViaoEXnq9
 iKtztSkOt0CGs1NFH2nGJdspfI9DFa6psS+lCaeuyKFUeBAWA/DUAnr5+LsvxFEx9jk3
 I+ucP5jtFazyoEkXZUVB/19ZMqe/XByE+KuMuP0MpYOqjaohL+3AywnrTV6D2RjJz8Hu
 WqWA==
X-Gm-Message-State: APjAAAVn2ymL8YGIZ5uJ7x+7r95jsSN45qI7YIb2GVQ473pOzJlWhfkt
 JP4FPjTJpEh5U0NTDLsQHs1E2g==
X-Google-Smtp-Source: APXvYqykkUrK0vrBdmDDbwAwwr+5ZePp14K9XbkSbU4CaVjxo7HzjYRIh3HQWncCN26aSDHosD7Fnw==
X-Received: by 2002:a92:9a54:: with SMTP id t81mr8275762ili.197.1571370138242; 
 Thu, 17 Oct 2019 20:42:18 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id d6sm1356657iop.34.2019.10.17.20.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 20:42:16 -0700 (PDT)
Date: Thu, 17 Oct 2019 20:42:14 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/21] riscv: use the generic ioremap code
In-Reply-To: <20191017174554.29840-19-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1910172038040.3156@viisi.sifive.com>
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-19-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_204220_035078_3072A1F1 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 17 Oct 2019, Christoph Hellwig wrote:

> Use the generic ioremap code instead of providing a local version.
> Note that this relies on the asm-generic no-op definition of
> pgprot_noncached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

According to the series introduction E-mail:

https://lore.kernel.org/linux-riscv/20191017174554.29840-1-hch@lst.de/T/#m9ac4010fd725c8c84179fa99aa391a6f701a32de

nothing substantive related to RISC-V or the common code has changed since 
the first version of this series, and this RISC-V-specific patch appears 
to be quite close (if not identical) to the first version of the patch:

https://lore.kernel.org/linux-riscv/alpine.DEB.2.21.9999.1908171421560.4130@viisi.sifive.com/

Thus the Tested-by, Reviewed-by, and Acked-by for RISC-V should all still 
apply:

https://lore.kernel.org/linux-riscv/alpine.DEB.2.21.9999.1908171421560.4130@viisi.sifive.com/


- Paul

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
