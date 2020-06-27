Return-Path: <SRS0=73lZ=AI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEB9C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 21:23:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A532076E
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 21:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9yWh1/0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrOHe2Al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28A532076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l1ssjmD+rdo1R8eVNu7iuXPyS+O4aWEgSzzo1YH0gXs=; b=d9yWh1/04XfUn1/WLOB3Xx25A
	dRWpFluGpzQhEcuvcxdx9+uPB9gPDCSvRO5a2Y5i+TdoSPEXhp31fYkM+SnZvjR0GXMxtwmHiidRK
	IBibk1HWadbxrB4vlgKtIaGSrhnRFm55MheVPgRuOEd8rq8qc+um43CvT/TN883PxCDzlzCTiMNLr
	pAGAggimYI4J8Cv3p4qNVXFCP8RyC4aCQgCpMgXmFR2O17Eji20RSNcHY+nu/Q3bu0J0nCWqHsAiR
	L0ESfmb77SHfG8HVNLlcacPoYLUhs2YVqN7xUnMf4rWgP8k8i2fioc+b0TguaSFzcqZDV2ut4xsAH
	0/6QeXOKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpIIe-00005n-28; Sat, 27 Jun 2020 21:23:48 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpIIZ-0008W8-LK; Sat, 27 Jun 2020 21:23:44 +0000
Received: by mail-pf1-x443.google.com with SMTP id j1so6205336pfe.4;
 Sat, 27 Jun 2020 14:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
 b=KrOHe2AlaGQ7tV28Vl9qyOQ0elfd8r//wq4xzvB5xDb5jWlg6mXfsKxabi0zi9yPbE
 a3CGp38U8cqw2mebqkt6TnvwzPA6E6KEcgpIj8HCQ1rHyHT3QVxyrownujSHvkYTCVSa
 Gy95rzA2weVyQoDCaBGwSARvG5wXI2h42LYwK1iUZUWKUYeZG14+sFo/aPCYLw2NwZJj
 nBqydL7WFvWCAVkBuzJ2gva+wATslrp9imqMIKL3E0H/YMoAyiaNhBbjIsjfeCv51DOd
 WRdGRRQ8YZYlJSkPBIPY8Mf5k8q0bkdsr138mWgQL9YfzyKrJwEngJSJT/C0ZJyP38ue
 p6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
 b=h9b66iWCIVUd2O+e7wdIcODYz+dGcgg605YYQLi8I7bNvDrtho7OQPIH/EafbszOsV
 catap9wWw3ZuNv3Ih3BywFrgCf6vCjhVb6C2t8O2E/d6R/ornBB51lcm+zHFg2WVz8sa
 6EGmZlfRQ3fXayMfO72tG5OufFcLR7IVm4eS6uXVnXp6kbULpFREhPLZGdcB6QYGhV2+
 YtXEQjdzgpe2OgVOynwOF1v2eOBvILXmQU0wRnNUV+jj3rv+aizqmjrMiMmIQ6h9yyu1
 FdiB1W4j8YmNgzVR6B/yU0flepBlt2akIo4v46Uljd5OdtlNHtjGrVyJI8yxxE+STrdC
 Ib+w==
X-Gm-Message-State: AOAM530KZOo3PB/tn2VSwQ4aSWtnt5dGom4EtZJAMDOX8pIenJIHFPjq
 C29HjlIKeY429yCr+Z/ugFE=
X-Google-Smtp-Source: ABdhPJyLzAtm2TextcgHnw6pDE2t7RidtLOm1t9FNzgTafND17DEExqOaKhxKo2F07v49LSV9JtDbQ==
X-Received: by 2002:a62:e305:: with SMTP id g5mr8523544pfh.115.1593293018476; 
 Sat, 27 Jun 2020 14:23:38 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id mw5sm15217406pjb.27.2020.06.27.14.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 14:23:37 -0700 (PDT)
Date: Sun, 28 Jun 2020 06:23:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/8] opeinrisc: switch to generic version of pte allocation
Message-ID: <20200627212335.GJ1401039@lianli.shorne-pla.net>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-3-rppt@kernel.org>
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
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 05:34:47PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Replace pte_alloc_one(), pte_free() and pte_free_kernel() with the generic
> implementation. The only actual functional change is the addition of
> __GFP_ACCOUT for the allocation of the user page tables.
> 
> The pte_alloc_one_kernel() is kept back because its implementation on
> openrisc is different than the generic one.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thank's for this.

Acked-by: Stafford Horne <shorne@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
