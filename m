Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784BCC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 07:52:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD3160232
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 07:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD3160232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1R0+Myvx5ueFuwOJpJKmEskC3igL6BgR/bDpU+FMO84=; b=CYBa7Sbf1LKC+eEgLMbRBukK2
	ihuzTM0MBQter44fH6ua8ZQxrkW+fxbHL/bYDtcVslfiz8WG/G8qHrVdWosKjctBZFX8lkatBLSzP
	oYlnR2QfqhN/buAYDIp17pi7hf6YtvGqsKQbRwt40vAdSlOmVdlkkByVuPwDk6gMmJnk8REMjSdh4
	05Hw1TrH44cg2yCZegLQ6JChB20HG7TCE0nZWn9LVXmhRueAwmWeMxH+C3Un5EQHxfH0utcM0119q
	GsfUUAEvViwWZB6rifLvRlsQMYxMIpLLopK1ACnvx6/6iF3wUnMmNdwJJpIz31Fbzbyx3yBZWFY6k
	Qwo5Y4a1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liY3N-00E6uA-6W; Mon, 17 May 2021 07:52:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liY0n-00E5xb-M5; Mon, 17 May 2021 07:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Wm1leRczzFOwOFaSNT2IC1vyfbeH7BGd9FvIHYCsh/w=; b=o8zAv3vqscu53aJ6D0K4yz+GV3
 3F3DLgxgl5OfvZwIXBpiunxipek4+8O1LcEbmARC+4xugG6paX8n2s5J6iEf60QgLA/0hQYhyb+lg
 vUHo2aeZsfzNHX/gWKYB9OWANHQlzi3ImGEkI1st64ewYktF/btAQ9pPxVIrK/T14IOqCBBdWMfNo
 Qa7kXXXkO4Os8sYWIlvUwb6ynaOn+Bm0jf2RxDv2kpAvZ0w1GCKjqIKJ2pw+/9wJSAiANZP5qKfVb
 OMOkmBbpnYY4Tj8KcZBoMNhfuJhulYf3AsAsHst09F1xUkSpMmEveB6++AICupMSXdT4EIWbz4rQw
 +dMGUy0g==;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liY0l-00DYoX-2i; Mon, 17 May 2021 07:50:00 +0000
Received: by mail-ua1-f54.google.com with SMTP id 20so1805732uaf.12;
 Mon, 17 May 2021 00:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wm1leRczzFOwOFaSNT2IC1vyfbeH7BGd9FvIHYCsh/w=;
 b=HEcd2ofnR30R14KFVuZqV1W6g2wsVx6jRS2dI11k4KWKr6QYP8oe/hXd6FqXL5JJrL
 KEznHbTtY47gaWGB3rojFREtc1fxH0iAOJeBR98Ni6+FTZls92jVZTrEHK0m9NxZljZV
 4QsZVGZAhdBu669t6DjXMkgG1p1pwJw6TSUCZ2dmG4h71wE/6futgOeTVu+tPNWm0td5
 WP5h6d5/+KFO9ZKybJLyObarlPm2CuCNiukIEVCrGVsxm+QhQidJGje5sZkH99ngNsrr
 UzLGEWXn6MK6bcssVO8cpf698KpoK89Wq1DiLVsNrjza8iPNNFvCaGJJI5QxjLYNSHss
 z8uw==
X-Gm-Message-State: AOAM533zwdNaXyDT87ctgX1JWph4FzmjM5Xr1vunU/eVouvmlF+RMpCl
 9xmLIXVpeLGszH3+U0gl56+94LkAXUIUF1NpxmQ=
X-Google-Smtp-Source: ABdhPJxMkbz10U6Jg7YSgioxoN/77aKbpd9YpL153uII/i6U1HGzQThHJEqUHqKW1WMKKAc41kkz+IhZpWsMRXHngY4=
X-Received: by 2002:ab0:f5:: with SMTP id 108mr16323124uaj.106.1621237797742; 
 Mon, 17 May 2021 00:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210514220942.879805-1-arnd@kernel.org>
 <20210514220942.879805-5-arnd@kernel.org>
In-Reply-To: <20210514220942.879805-5-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 May 2021 09:49:45 +0200
Message-ID: <CAMuHMdXPWdNqeeyCuKheOyTT-DSqrhKQyotmY5YBhdbz-VgfwA@mail.gmail.com>
Subject: Re: [PATCH 4/5] asm-generic: uaccess: remove inline
 strncpy_from_user/strnlen_user
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Brian Cain <bcain@codeaurora.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Sid Manning <sidneym@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_004959_141195_EEFACD27 
X-CRM114-Status: GOOD (  17.78  )
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

On Sat, May 15, 2021 at 12:11 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Consolidate the asm-generic implementation with the library version
> that is used everywhere else.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig             |  4 +--

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
