Return-Path: <SRS0=q9SV=OR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E2FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Sep 2021 15:20:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C7A60EE2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Sep 2021 15:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17C7A60EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GC1WPCqhVE6szJXhc50CEDcjgrbSfrUOwgjfSX9O/U=; b=j8GVfL8UZMcZqq
	onlCHHLSYWaQy8Vly0dPwMzRsPFpa/k3vBYf1A5MVguUTGWpEpjghqzAC8ZD5Gxfn9lVrUS5WBLW1
	nftFFkReAIYH/0o/SRZ7Lb9KYNR2N/Vxagk3MpT5wwNJB5EV091vNntAZHHCmKugD0XuM2gky44Sl
	FDWFLTJUREs4kaHbgWNrvY3iMU3g9HbldIqTwK8ISPmMfDrkcel6flzTVwl8l3nFA/2g8BlzW54WR
	RN9dbaoAwqElKj6w0m3iDhG7g9rbKeS397nctSM9zAlEOjE+UXR0k8c/8GHdIaE+EEWTOcTl2SMT3
	QjWq8X3SoxhS8fuzo0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUsQI-0035kb-KJ; Mon, 27 Sep 2021 15:20:06 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUsQF-0035jO-Lm; Mon, 27 Sep 2021 15:20:05 +0000
Received: by mail-vk1-f181.google.com with SMTP id s137so7079874vke.11;
 Mon, 27 Sep 2021 08:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5wb4ZX9gwgasne0NhWUEprI9AwQOWamOuZRWGphiLM=;
 b=sDiY35mTFSQ2HG8jKxhIb/hCVkiL7s1zY0PtITIC+/PTeldzRmErwiIgIjzyrUNjMD
 wavTXmyX6oIn59SIXVWgz8TCcZt/ism6TKpUwoqk6OjrxUdbX3eeXWIBBcUMZLtkK0z+
 6A9RU9947Xy+BIKhJcjboVjE2lFBMK1bysGm40reD1TIQs2XXSsBHPW7kDu7eE3oFFaM
 SyVshi7Bi1w8toNKhuOGPt90aXoMggRJB3ncSbUWS6vtBSbXZgxYdjFK965TYiZ6Ss0j
 izAbbmhzoVfsbK9pgZnlHhyiDMrV8E8PbQQyGpsdh4vTuurSXy3iUoZwzL3XUNl+zZer
 wbkA==
X-Gm-Message-State: AOAM532srMFT7I6dimYpDaOFkCKZUSFdmxuQhileD5hEJii7gbjrzupJ
 oyIL0kkvzLh1HiHpTOFAB2FaGmCSYqsk5+Z2H9g=
X-Google-Smtp-Source: ABdhPJxj2OeFkxklgcIGHyfFHROJ0kJKH8P7BoepnpioKOsPmd/3DG/ainzZgT/3Vd7Z0PN8a+SyRrxXemz3PM2L1AY=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr572707vkj.11.1632756001800;
 Mon, 27 Sep 2021 08:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-3-david@redhat.com>
In-Reply-To: <20210927150518.8607-3-david@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Sep 2021 17:19:50 +0200
Message-ID: <CAMuHMdWuRtxwRCy-x63s9BkDKk+hkXhEfZYC5pmXomzCuDBrYg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with
 memblock_add_node()
To: David Hildenbrand <david@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>, Jianyong Wu <Jianyong.Wu@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
 Vineet Gupta <vgupta@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>, 
 Arnd Bergmann <arnd@arndb.de>, arcml <linux-snps-arc@lists.infradead.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux MM <linux-mm@kvack.org>, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_082003_739012_D6C57A47 
X-CRM114-Status: GOOD (  20.04  )
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

On Mon, Sep 27, 2021 at 5:05 PM David Hildenbrand <david@redhat.com> wrote:
> We want to specify flags when hotplugging memory. Let's prepare to pass
> flags to memblock_add_node() by adjusting all existing users.
>
> Note that when hotplugging memory the system is already up and running
> and we don't want to add the memory first and apply flags later: it
> should happen within one memblock call.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

>  arch/m68k/mm/mcfmmu.c            | 3 ++-
>  arch/m68k/mm/motorola.c          | 6 ++++--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
