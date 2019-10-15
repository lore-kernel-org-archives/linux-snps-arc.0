Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DB3ECE58F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 21:47:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E3A21D7C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 21:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBFLSXhf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eRTA7Y2C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E3A21D7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pThGXYL7IOy6glAzYWVBGMIgJSSXZa/qgfYzhdYh4OA=; b=DBFLSXhfLgPnLh
	/8j2O3F4AtowJocLnMMMdJtRROc6LQiGLL9DadImRkTuKsqxYoJ35rh3/yzwP7eyV/2MPJWIgDQG6
	uyTLZ0F5A0ha6N1WCwXpN5ALkdD+iYTQzIZY9+fyRTmXkAMTMhPE9fB1+wKZpodelmnZACAwyY362
	0u/UfOKQXcJrirW4MGEtkYF4Vgc9Ot6ZB7l2xNVE1MhGPoFkOegYvzqmVNwbf00ujYZVOu2n6gBCV
	blpQkdxnod8xWFxSKT9bIEiRhq1rQ4T1FDsNl+H7MC6/wnY4R969xn5chHTltkeQb59eBBQZXb2LL
	S0u81mhf8V2exRwZjnMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKUf6-0005qy-Ij; Tue, 15 Oct 2019 21:47:24 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKUf4-0005qY-4W
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 21:47:23 +0000
Received: by mail-lf1-x143.google.com with SMTP id q12so15645197lfc.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2019 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKBAZQ4xjT2H3VBhqEDygDjsoO3OrXWHV1qvzKsg6h8=;
 b=eRTA7Y2CR106ubYgppU9AiKB36JGkMp2b525X7AN3j/XcF7eLbUaKXlFv/rViWY6ix
 ZyQP1ASnR5/wN6NVGyHLurSLBElwdONMtqPjyJIbyjjzlfJcbS2XG9xoqv9aty4Tx4RT
 C2KiiZ6vvkn0YO995uPMfi4p9S9yGM/cCoFHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKBAZQ4xjT2H3VBhqEDygDjsoO3OrXWHV1qvzKsg6h8=;
 b=QI3Ywnxs3C/1QFezD4u5f/hdxQdSCbCmvEXaV4YzkShGPSPAs5QDE36943bPXrsPue
 0wjRhO5z1CWrvKxks+zdyT7OJunx0kJSc/n9p5JsPAcXzbJrLmFtjaHL+a/NbUKlEDTZ
 zE831qb6ysjdJarSpY0pfcXX0zwH2BORzk+5R5PGSQYU/1sKdgjrUF63rIjbeN/kJ2Ad
 EeUVHuIATrYeM0NpAaLqmjFGI22xmB1dLGFVwx/WUMDmqkutqek3+Elq9ruQJX/Sr4gs
 v1qz0jV7Q/4PMMlZzTJ3iCChPJHz3aSrgPuuJJErtD55RmbTDpFfyTOjuHftIufGWfkY
 AV4g==
X-Gm-Message-State: APjAAAWtjZVqLx3xQHbCxHWOYiA8/kA0TsZgZ/ziIXa0YbNyvd4hBJXq
 ZBxgwKDMgCPqGJ0NQDByO/kS0uZqHiM=
X-Google-Smtp-Source: APXvYqw6TB1Htz7dTuMfaRDzOZ4yKzJRUqFRqYLCdf/9jhABAgcKjsntDPm7IXIt2NieggnwhU+vvg==
X-Received: by 2002:ac2:54b3:: with SMTP id w19mr221325lfk.66.1571176040071;
 Tue, 15 Oct 2019 14:47:20 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id q21sm5160773lfc.2.2019.10.15.14.47.18
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2019 14:47:19 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id m7so21827218lji.2
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2019 14:47:18 -0700 (PDT)
X-Received: by 2002:a2e:8310:: with SMTP id a16mr18060112ljh.48.1571176038634; 
 Tue, 15 Oct 2019 14:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191015191926.9281-1-vgupta@synopsys.com>
 <20191015191926.9281-4-vgupta@synopsys.com>
In-Reply-To: <20191015191926.9281-4-vgupta@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Oct 2019 14:47:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg470=r9YPMLyJdgr-aLvHSnDOFwFx=Y=_HPAW-aqyFRg@mail.gmail.com>
Message-ID: <CAHk-=wg470=r9YPMLyJdgr-aLvHSnDOFwFx=Y=_HPAW-aqyFRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] asm-generic/tlb: stub out p4d_free_tlb() if nop4d
 ...
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_144722_177224_A6AEE190 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2019 at 12:19 PM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
>
> This came up when removing __ARCH_HAS_5LEVEL_HACK for ARC as code bloat
> from this routine not required in a 2-level paging setup

Similarly acked,

          Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
