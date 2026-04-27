Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F6DFF8867
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2026 21:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQ03w5WMmBQvrXPtgAJP/VaUNWd9sWiM1GzfR277dYE=; b=EwpBPnI89L8fvz
	ydECCxMQ7Wmf1WIgbse4I0+fR55dXq3RKJPlzbBL30ll2XAx6am1s6RNmxgZJJ6q910vAuPSA0sd7
	Y/okklwc0GbA4pC1qwWu4MWmotcdpKVQCxR2aqfxGSxrxg0txSOKe+ECzNCbByJxpB54K9pEvlizW
	oJLFhA+2sHK7XbmxtrbWijKGVnZnzTpbvdKhXt+VZa7GWEKj5hJqgu5E/qJrzdgH7xi6XiCf0M2mX
	zZPKVN58fMu0j/eUdFcEwjDLtID89rwHngD06XPs0VVOLlRg7W2zgI2ybGGLD+1Y3k00Vp+a5zk+G
	rifRJNfIqO69LJGGcsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTg6-00000000Bea-16SA;
	Mon, 27 Apr 2026 21:39:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTg4-00000000BdO-0Mlk
	for linux-snps-arc@lists.infradead.org;
	Mon, 27 Apr 2026 21:39:41 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso14717002a12.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 27 Apr 2026 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777325978; x=1777930778; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=QAUpiBdIA2mC+W/P1k7YutUmngLnXnN05mipHgG6qDRcznLga5FqYmgA7CLQ9yV9Od
         VHVgOT4lHxQJnLexpV7cycmYoWXuqKe3vk1oH0tv+C8DqgW55oALrLf5ANnCCeI6Pt4l
         3L81SUDWF9xjp1gGP6LWSZiq8JT8K6iedBQ8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325978; x=1777930778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=ly2vU5vP91Qr6j4atDTLNYV59NpiEN8aorGqg9d+ebaxkBmxOph8Gz83/8mnGv34jS
         ZrNbzBkt0Fm+Pm175qLahlI8fS+z1Dy78iEsQyMP/nm/zVdq0buMraWoDnk8hrY1lziY
         JCZRpf9Jbg5JKDimqGgrn7mDFM5CB2/OTOyoK/hf21XBq4qHujRqhkFfL77wB1PrBLq6
         1D6NPlFocF79AVMgH8CgYF6cZgiEiM/l7A4ywrwb42KQuZTXG94JJS5GsM/1NiOrcW9/
         jI7hUNEGF6Jqb4/VhybT3CeMUvxpCGiZ6yN0gnu+nnZQvwsqI/Xoew9Q3GYKnoWfYRVN
         lHCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PgkUNU/k5uD/1ZeHPwPmkl+xHe89wvSf43VZMw+WZHUcbPfTYlz+ZbvKqxocT4VrM0UE6cDczn/cITJQznQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk48cW9fe8n60aS1DCEitw+rcP0z5DU68KNHurlCHu0GjoUo4+
	BlfjvL76JljrpUyrPqt0SS6vRk8TE25rql51F6J3yZjh/RfIKMZjmUsdynDKOWzQ90Vcxphl+ox
	l87ll7SnZZQ==
X-Gm-Gg: AeBDieusHDlXhjMgVYoGsz7ow+2CB1ms0Bm6Jtg2DnzESyN6l7T7jvjTsKt92EDOvel
	kwdfqIvl0x3hmTTHeoaCNxz+R7VfOvdhsYBfvT4k2h+60DmnfwcBA78yqeKc0nBYFqxUxkrxJRI
	Yx1ocLLsCSEgR5eQGMEN9fl4yVKO1YY2VIgPHwJT180HnI+gLWePSxDz0BGmVYU8yIg87YOA2Ik
	yZtEuLxV1IcgA4AE52aydu6Hky+9HynMUdpVMJtZaxe1RoVqoX3I/SnG08zDx7is6IbYq6E2Q/m
	szdLJXglL0N7YtMtkvSLGg/jEsnY1YbwYFItiozlOLafT2PYIExAYt3h8gfKLEwjzXBWsAqvof8
	UH/tKKsCE0jvKuxOotFwII8CQgZIReIlTvWgBUuf0c5ds0gNiumocvYv5wVu5Kyi1iGouX2zh78
	j8Sj9VdTV/T6herk60B8d4PMxdeEILuGexTfPeboZVlEKX9GPsSg45ZCUv9Rjxvsh55cKid+6vi
	TEl3yof5IY=
X-Received: by 2002:a05:6402:324e:b0:679:223c:d17a with SMTP id 4fb4d7f45d1cf-679bb08fdf9mr118239a12.16.1777325977922;
        Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b686406asm140970a12.30.2026.04.27.14.39.37
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so18821359a12.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8KJlnrkkqWft1JNKXjokaLQMCXtn5uzl+E2pXEVmuaPcYGJpURucei/U0A1kJEm/XjiZxeL+5rzcooKsWrUA==@lists.infradead.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_143940_135490_4C90BFEC 
X-CRM114-Status: UNSURE (   7.97  )
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

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
