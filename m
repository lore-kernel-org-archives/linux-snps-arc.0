Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E63C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:47:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA47861244
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA47861244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3YB2YHzt5FlrCL4Vv58l5s/BfomzQXdtz3Zv3h/6+gU=; b=gcIvznDRE1iR9QguH8PRIWmWE
	3hN70ONaQDOW7/ztpiFnSKKyY5UcMbWPsEpJXR3myzx/UNQriSSrrRbNBUJC5gc57KauZwE/m64ae
	OBeFcWru28PBYX9URm00x4FPb9hciw/KufYI+gort6vEC2/nqGwUdxRjoofc0kIC2FlUggSuQ165J
	aa06XAMHE7RRACcJjbDJXyFOjdBa5E6lGlQTe8zrGVUyn/oc320gqrd2QkRWnH12VSHWvt1uU6guA
	/MaxnijZbvwiLa22OP2JNJ/NYcU+N9VWdISxEKsgIdanZJh5D/zhMZZV2YwXhqJIYwfma6EO/cNWq
	6XrHqI6hQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liX27-00Dx70-Pj; Mon, 17 May 2021 06:47:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liX23-00Dx6a-BM; Mon, 17 May 2021 06:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YpsHgE75xj+T3UIP/VMkPo9F2aZuRvwONejOZwl1FXk=; b=onTXGNAj0zxONAtPkvr/OcL5CH
 R60slY6HAeWPo/tQcn5q38rN3bZDll16pgivLXO0gPjlxnMFEobz+5xhAn4BmA8awgG1fRU9DY99p
 gXVlRAbAh8J+HrvzPc3VICBADUaChC6rc6iqviM8dfsHqadIJI5xkERh9f0fFCa531vwARTSgJSOH
 6MwmPW7dXkTtiSTVy0GH89co0vJ0+kLVhZqBqBamRDb70koAJfBqVzewCZRij1KAouvlhSpvK5Nol
 xUwk+2IvP04uZCiL29trQ8v8Pbv77z954YiE3KvV2kWq9qGKE4ACMTET1D8zR05VOARuv4twfrtA8
 rDzU9qxw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liX20-00DWZb-NS; Mon, 17 May 2021 06:47:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 270D26128B;
 Mon, 17 May 2021 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621234032;
 bh=pMN6O+M8sQ4Rj/zyx2sQy8ks3b4mlNWVU0NXEn+1Tp4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=udvr1+VZ1vu+ehIbXixwtx0wBazcHjD0esq/EvN+f7kI8jiaTkOwJey7z5j9HLcGS
 7grDvd7r5x6/dXjg22Tc6JGuvSInBojF81TaLL3p4+qm2TRZr4l6q2ssJCWgtrJbIt
 b/yGCfMyJd+Xg1i+nGk5iiX3cm2C1hYrQNHIO//zxpRLJTGnWh6b+019jMyRVuTODP
 DtwnQUcRaiTuGt8wL4gql/dF2cv8dL/M/NXP11tF2EXzHGELtzUHZmf/RdLiZCXrHF
 xQxVFvGagUiMeirW4uWfJLAxnc8mpc0VwZK3qW9V5uVKs61R8WbA7jS6nm5xl9S3K3
 6YPJNdeeG1OVQ==
Received: by mail-wr1-f53.google.com with SMTP id d11so5109985wrw.8;
 Sun, 16 May 2021 23:47:12 -0700 (PDT)
X-Gm-Message-State: AOAM530TXVXlj/viSa2cs1FG8ixJFuaULVlIzYdhLHM4mcG2EdKi+yO9
 LjDnByechhNosA97oscE/hP77iPSwA3ISBKLaSQ=
X-Google-Smtp-Source: ABdhPJyrn4xFZhSiNWNYYjvVM2f1w22j28McNwZhsb6mSRFn1AgPXVcsEBX4LdWdWP/IVT2Gb7C9YpHbhQO6YC8l4Aw=
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr11437167wrx.99.1621234030583; 
 Sun, 16 May 2021 23:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210515101803.924427-1-arnd@kernel.org>
 <20210515101803.924427-4-arnd@kernel.org>
 <20210517061635.GA23581@lst.de>
In-Reply-To: <20210517061635.GA23581@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 17 May 2021 08:46:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a30+Y=9GGjP5ec-h6w9ZLqgzm_4YWpmwRimUjv8NdcuFA@mail.gmail.com>
Message-ID: <CAK8P3a30+Y=9GGjP5ec-h6w9ZLqgzm_4YWpmwRimUjv8NdcuFA@mail.gmail.com>
Subject: Re: [PATCH 3/6] [v2] hexagon: use generic strncpy/strnlen from_user
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Sid Manning <sidneym@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_234712_802964_3AF99CC8 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, May 17, 2021 at 8:16 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, May 15, 2021 at 12:18:00PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Most per-architecture versions of these functions are broken in some form,
> > and they are almost certainly slower than the generic code as well.
> >
> > Remove the ones for hexagon and instead use the generic version.
> > This custom version reads the data twice for strncpy() by doing an extra
> > strnlen(), and it apparently lacks a check for user_addr_max().
>
> I'd be tempted to just remove the first paragraph and reword the second
> as:
>
> Remove the hexagon implementation of strncpy/strnlen and instead use the
> generic versions.  The hexago version of strncpy reads the data twice by
> doing an extra strnlen(), and it apparently lacks a check for
> user_addr_max().

Changed to your version now, thanks!

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
