Return-Path: <SRS0=Bf7c=OU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D763C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 21:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B3F61A71
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 21:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1B3F61A71
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7aYZWELULg0WItxPPVKiECKsIS+i3omlZ1SjxqUrao=; b=IMhTbLklWbUmV0
	fikKiM9LHCeGOPUu1fNU0V25FZny4wjr7pE4z0MwZdH3B6InxXKdFC1LfCbZD6qDVnzpGwCYea19+
	chnpCfoGolT7iU+bTlkbX/3/nD+8gqErDxQ4fX99+QZUf/dsrfXiqZoMafNK1lGWuS4A5FAnVo/sm
	Z/w2iETDGmWCziyFmJ06q/7w9sZOLzfVnfB0EURM6Zd3t8jLcMAJKcTktvB+A/RxhOHr9Wb09JDg5
	J47rYrwLjuA+N85frePWtJwemXKp+u0TkqBo/ax5cFmXgJbv0SouqT5rZ3rZN/vY1qkUm4IXNcZR0
	fgeJbomAaL40ZmDL1Qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW3Z5-00G2K5-D4; Thu, 30 Sep 2021 21:26:03 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW3Z2-00G2Jh-MO
 for linux-snps-arc@lists.infradead.org; Thu, 30 Sep 2021 21:26:02 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id g192so2898705vkf.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 30 Sep 2021 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
 b=BlxMYaM/OWq2QOg73mmSIuZReJqS9WDVJwYpygBxYlCdpjQvMPkG8JUUJuWMEfe7VW
 Kc4xJOkMskHk8O+awxj6C0zYig/iRuEgT85zngr4j5VHau1O2THU+xT3x/AlUo4/mD7V
 wX52wLkXcsoyoK8aKbnCd70Ljj6pEqXvKGjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/TBKn03dF9IntMFcuDE9WlvX4rnNMcxTnYaxfj4f3M=;
 b=Ji/pXvb4GoPRXWxk+nTz8URd0jN/mU7wJy3WDZ5kfYVf5xBZxHf5PyjyCNWZefbhfH
 bOykJOfSWJtKw0dkIeOgdzRwIfHhFcDUgBtMjr/iOfdnE09hKpplqKVPqGYXs7dHLD0+
 UQroOG4Bvs8Zk7+RWX6AWtPdULWEgBhi335sKzMNvGT65CTH8yoiRTtZ7kzdwnnH7BDK
 MILbV4MyskRVXuHi0gIhr/P4BMQ/De2SdRyWUFxm/dTtcDOGsUmlZcsRXRi/RlkB9dPD
 4YGi1LtSnNV89UwPoH//Pf0LsRmk030v27bUmBbSqLpDra4+5T7b9fpowABP7UqzXqN0
 TTXA==
X-Gm-Message-State: AOAM533XQbTmELoxfeeusynOMEx9E2pwbPfdGYzcZjeUCGOByEeIXOgq
 hE+z89DippvRTk1+UzqZMz04mm2HebqVfQY0dEHk3w==
X-Google-Smtp-Source: ABdhPJy53tc1yEk3I2nYq1N8EIWWCvfg2t2lZBCWPcxD6CYK361p/ZQBotWECY22/LtsRRBXESqmfQ==
X-Received: by 2002:a1f:728e:: with SMTP id n136mr6808229vkc.8.1633037158164; 
 Thu, 30 Sep 2021 14:25:58 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id i5sm2514755uab.5.2021.09.30.14.25.57
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 14:25:57 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id u5so2324968uao.13
 for <linux-snps-arc@lists.infradead.org>; Thu, 30 Sep 2021 14:25:57 -0700 (PDT)
X-Received: by 2002:a25:df06:: with SMTP id w6mr1562849ybg.459.1633036849801; 
 Thu, 30 Sep 2021 14:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930185031.18648-1-rppt@kernel.org>
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Sep 2021 14:20:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Message-ID: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Juergen Gross <jgross@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, 
 kasan-dev <kasan-dev@googlegroups.com>, KVM list <kvm@vger.kernel.org>, 
 alpha <linux-alpha@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-efi <linux-efi@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linux-um <linux-um@lists.infradead.org>, linux-usb@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-sparc <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_142600_896769_1BB954B7 
X-CRM114-Status: GOOD (  12.91  )
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

On Thu, Sep 30, 2021 at 11:50 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The first patch is a cleanup of numa_distance allocation in arch_numa I've
> spotted during the conversion.
> The second patch is a fix for Xen memory freeing on some of the error
> paths.

Well, at least patch 2 looks like something that should go into 5.15
and be marked for stable.

Patch 1 looks like a trivial local cleanup, and could go in
immediately. Patch 4 might be in that same category.

The rest look like "next merge window" to me, since they are spread
out and neither bugfixes nor tiny localized cleanups (iow renaming
functions, global resulting search-and-replace things).

So my gut feel is that two (maybe three) of these patches should go in
asap, with three (maybe four) be left for 5.16.

IOW, not trat this as a single series.

Hmm?

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
