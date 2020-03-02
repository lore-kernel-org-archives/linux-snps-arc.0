Return-Path: <SRS0=u26R=4T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42FAC3F2D4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Mar 2020 08:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6FF246A1
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Mar 2020 08:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hlu53WQH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB6FF246A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7avMMQ4LqPiToTuFufECy/jPoBbBTjLQp06TqcM6ao=; b=hlu53WQHoUvrN7
	422IKsOvvMvXofyKZXi9gzeCEU0mr7RqNDyuYWJg3LdCo6VVw8ygV6/boCsKqHeCwoj95x/BM/tAT
	Xzv+rsjsTgNqa+OaNtD7OxhOnEBnps7izjKyhlrnYiIdPLh0MuHIzT2kw/rQPCDXqRahldrAIwHL9
	W4q43wmzwkfWQFG5uNUjWUw7vim60U8ahuMhHxQ04tu/sqxPjRnX8Zzj3V4t7XbjMMYaoT6iZY6qd
	0knuIIFQzmRnnV78DXmJs5AieO3DUO2vj3B96/OzX4rJO8ASpBRul+cKCQO5F6bJ62TbMlLi/waDg
	Nj5CUMR73uqsZvVO8Fiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8gLo-0001Aq-4G; Mon, 02 Mar 2020 08:22:56 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8gLm-0001AM-2Y; Mon, 02 Mar 2020 08:22:55 +0000
Received: by mail-oi1-f195.google.com with SMTP id i1so9452460oie.8;
 Mon, 02 Mar 2020 00:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNjwUjeyqSUMReZ1hj8pk3fvMoKCAR8VkF8kU/CEAmI=;
 b=gGWGdmCCUVV2NjdtY5+gCUa2PtjQQ0jgU2RZaq3b96JgyQ/M8B6uXA+R1jzjbqh5RH
 QtprIMZ4F8WtRFK2u2vmFiKsbAu7w+fFCEaEl/U8XeN+uVucm4vDdT49wd8sLnyZXEu2
 HkGHTvVkA9z8MW5Tv8XZ8+MebFTy9jpQcmkffo0mtOMRjWXW7v4+WYWcM6o86zmcjXSq
 u1Y3aGe7Ieo9kfIsuaUlWfASTv+WPTQujK6OfhsPwLMBOH5+r65UOykTgPbqNSl4T7Eu
 u3pYQeL8HJAFFFtMdukpJH7HARnuj5H90pq7BVgUbNG5gMA2twe8mv2X9Q/wmr86hkFX
 cezQ==
X-Gm-Message-State: APjAAAVFV7mgsy85L+8LXz1OCrlOH4ijBO8T9Bz1tkWS3jjxEU+i7orv
 7Nmtco/PGxCqxAN6U1H2MxW1Z98OD2mTdLTcJjg=
X-Google-Smtp-Source: APXvYqxOxJxSBMm4mxQtyQaE+vbuwqLPCHyyR1SXxHSga4s6HjiXJaifhzoYpNbqmVOhS7uE1qHfAQr6kjTf+c7mdpQ=
X-Received: by 2002:aca:b4c3:: with SMTP id
 d186mr10506660oif.131.1583137372687; 
 Mon, 02 Mar 2020 00:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2020 09:22:41 +0100
Message-ID: <CAMuHMdUfm0X3cgEDzzF6fs0HQj83OPR=xVjQaT7uVDi2WbtHog@mail.gmail.com>
Subject: Re: [RFC 1/3] mm/vma: Define a default value for VM_DATA_DEFAULT_FLAGS
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_002254_116816_88BC08B5 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Paul Burton <paulburton@kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Mar 2, 2020 at 7:48 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> There are many platforms with exact same value for VM_DATA_DEFAULT_FLAGS
> This creates a default value for VM_DATA_DEFAULT_FLAGS in line with the
> existing VM_STACK_DEFAULT_FLAGS. While here, also define some more macros
> with standard VMA access flag combinations that are used frequently across
> many platforms. Apart from simplification, this reduces code duplication
> as well.

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/page.h       |  3 ---

For m68k:
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
