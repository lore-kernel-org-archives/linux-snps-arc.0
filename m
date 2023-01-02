Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D074C4167B
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Jan 2023 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKH2FZEfZT9I3FtAzg7f3Rjob0a0zyyvW/34VbVBvcg=; b=ovGvMY0P9DOr35
	a7RCQ1u9wzxi1Notp6NnkcQ9Fp5BalAJc2xO2eFJWk9VbVLnLavMShCK8zl5BOLTDs4ipdOF6H0ip
	FXuAFe0+MdBWOJiF33beLGccP3x4zw8n7nfoqIWgltqHCHCM0v9agMBz8eklVzpQ/C8EDh2oWcDMf
	f2YOPGKoSOwEaGy+DEUMHYarlHlbfpgtZVg+8Ku/4iQPBFK/1lvDcP8qAS18FyNlneEQmNUZvEVrX
	haUgIE3COUYqSYZlJVI/KDRihLEA5ib4iSRR4OOxjigmGrEp7ZkBbFs29J8ex4zFg70Y01k1wgbG2
	7nl05BPpiF8h8AW4nQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGEW-009QLb-Fx; Mon, 02 Jan 2023 08:31:48 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCGDt-009Q5T-Ke; Mon, 02 Jan 2023 08:31:31 +0000
Received: by mail-qv1-f45.google.com with SMTP id p17so17671670qvn.1;
        Mon, 02 Jan 2023 00:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo2CI5pKv7C2jtNLeQsFhlozXL/lFYNzin08UvE0x2c=;
        b=A50UDwScqjbp3En5+4vsj4ayERQmhYPl17F2Lj0DSnS7gud7RgJCFOhgC17Yqn+xNn
         POBWnlp3+XAGmaktwD/K75mi502ORb0NF22KkZ4vqa7saOfz3B9Ur3GeR9uEtsb2xp3i
         T7VTGVxL18xjOnYEN4v6BI84QGxtlEyT20QudfXra25eBprMMQB/haFLy7OzxC5IOLSn
         S5R2DknzGd2oY2dlJxIFS7bdI+MEsZ8FVuzP7hnmIHyfPgw6CysCBZhgnw0xyiVIsTPE
         UpPbYGwbmBkIgmmaxDyEFwUvTXSc5b14ldrQYuFxQQGYLsgBmKk2EG1whGq/qzKPPE53
         4Qrg==
X-Gm-Message-State: AFqh2krALwabt4MNb2MpzcUUoF1USwjtgsae+htd3BZ6NASv5maWjFqC
	LenIEsggz3oj3QU/JeJ3qB4Pcf/ZvLrrEQ==
X-Google-Smtp-Source: AMrXdXulLr1FP5NwYYwiyFmgYO8SLKMUyYNxh1uv87NJSsSpD20L8COyaXIHNwL4ucLVoCoGaI7Y7A==
X-Received: by 2002:a05:6214:50a:b0:4c7:49b:f6da with SMTP id px10-20020a056214050a00b004c7049bf6damr57292497qvb.1.1672648262021;
        Mon, 02 Jan 2023 00:31:02 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id pj39-20020a05620a1da700b006fa22f0494bsm19852731qkn.117.2023.01.02.00.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 00:31:01 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id g4so29561781ybg.7;
        Mon, 02 Jan 2023 00:31:00 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr2730771ybg.365.1672648260480; Mon, 02
 Jan 2023 00:31:00 -0800 (PST)
MIME-Version: 1.0
References: <78b23407-bdd0-4b1b-bf6e-ecd4c00294ab@app.fastmail.com> <20221229113338.2436892-1-andrzej.hajda@intel.com>
In-Reply-To: <20221229113338.2436892-1-andrzej.hajda@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jan 2023 09:30:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaq9Xg3HrqLo1x5SCuwtJBsczLjWAWmH=23ZtNf_e9hQ@mail.gmail.com>
Message-ID: <CAMuHMdVaq9Xg3HrqLo1x5SCuwtJBsczLjWAWmH=23ZtNf_e9hQ@mail.gmail.com>
Subject: Re: [PATCH v2] arch: rename all internal names __xchg to __arch_xchg
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Mark Rutland <mark.rutland@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_003120_341626_E6D8A58F 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, Dec 29, 2022 at 12:34 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]

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
