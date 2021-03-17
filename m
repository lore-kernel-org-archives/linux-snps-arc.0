Return-Path: <SRS0=ISwX=IP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D56C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Mar 2021 14:03:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A2964EC4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Mar 2021 14:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A2964EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Dfp1aQnOmGjPoqJgKO4D6n7Hsz7BzYQj2vab4SpmRE=; b=hqpO3cV1PqBtJlXvMToVMnDwn
	TCD3hluzfOX3oOqkcgP052C5I1lTIBnr6TGQepiKiR7vZDhgn8q2lIOgM7HwwXChyzz8teqb40jKc
	wu4xv074bXPqwYW/Xu3kMyajyOk/E2/p1T5SmnY+FzWuvzHVHDR9Mg2i4mx0RvALjfjNpRmfdmZ1v
	hZvGe5eLEMI36yOMun0p2dF/YTH6m1JSgYGeNfNBA/qznxywupNbdxS5Olf5GU9Dp0yO3WG9xFpUG
	BKogz8TgA8ndg+tiRO5JAmUkQj+EshWOEFGdLHwskr53xpkKkhB1OmBNbg2PZl2eYHj33kLjZ9wOL
	Urb60adzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMWlw-003CyL-DO; Wed, 17 Mar 2021 14:03:40 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMWlt-003CxP-46; Wed, 17 Mar 2021 14:03:38 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id p193so40628809yba.4;
 Wed, 17 Mar 2021 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
 b=i2DpCpQM7JeSSiS/pjMxgtMmRWaqyEUnqOkpir3k6hjfU9Oor7nDorySG4w47CoCGd
 HaiLgTyqU0kC8zA/M2kZQM1sH1E1LbWud/WbA8om7HWvSV+BUakqiOwPUeTLcoqCLPGf
 JedwFXQpUMM2xc1N014Ahaw2YTMoAf2cj3FsgDsCKv3ZOzvpAcW8c+eMj3EENF375f8x
 11rayPkdrSyY5YcS7+D3f2mNmy0iI8qzZ8PRIa+NRFehp669D1SyF0qYVVKeD+gzVYK8
 LIsktzMZcnA20N+P0QIhTw/wSHTpN81axxWdN3YKq6VrI5qwWqPf0cj92aOsspj4iCYa
 aQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
 b=ROTI8FxzWnGKgsdJ0hqeHfErh3tuYCejPuzWgFGtU0OzZTumwQunKwTeJXHrngaDjn
 WImvUaaq2rIOAsM9hnLiWUaVPPPgtnFdiKU+f8k/uHyQPfPAB8eowSnHZQLefvfN8JZ0
 AyTj9wAmw4F5OyP2rxPCUaBRwQzhxQ7LFvQjHny6mTrhqogQpsTXsYoMdBJZTlrsIDVN
 urB5abfKIYy/iGZpYe1vm4dToDOs8swqWKztCRC5fhELflGACOXEJO0GOlGokIfqYAYv
 5DprZ1cj9YzbnANtKrdPFJUK7sAsSfGpu0Cml+RqOUUI72GdJU+FJc31tRgvU1JluXDt
 0f+g==
X-Gm-Message-State: AOAM532LGP80a8kcRoApbpWQIsNSsy3FnZAD2tZ8kagfV81G3xXKZc7n
 HwCTly+6yilRKas8jbqVyawPMAzdYjeMQj1m7ao=
X-Google-Smtp-Source: ABdhPJxYwg2QBX1owqFPtrq2F/9pLRU/hzhKTzIOR3dpydN55snYMjquLkj00WQN+8aJP9sdN02xLmqhMTlZQxWC8Dc=
X-Received: by 2002:a25:dad4:: with SMTP id n203mr4746316ybf.233.1615989813490; 
 Wed, 17 Mar 2021 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 17 Mar 2021 17:03:22 +0300
Message-ID: <CADxRZqwFokuZrhA6GFr=whM3s7BqZpzo8yq=TW6YEr=eeEUH0A@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Huacai Chen <chenhuacai@kernel.org>, 
 Jonas Bonn <jonas@southpole.se>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Heiko Carstens <hca@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, Sparc kernel list <sparclinux@vger.kernel.org>, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_140337_244818_E3B0334E 
X-CRM114-Status: UNSURE (   8.65  )
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

On Wed, Mar 17, 2021 at 4:51 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> mem_init_print_info() is called in mem_init() on each architecture,
> and pass NULL argument, so using void argument and move it into mm_init().
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> - Cleanup 'str' line suggested by Christophe and ACK

applied patch (5.12.0-rc3-00020-g1df27313f50a-dirty) over linus.git
and tested boot on a sparc64 virtual machine (ldom) - boots.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
