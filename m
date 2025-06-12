Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAF3C7114C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Usf8L14Ea8S3Q4/X3SeB+1dGBPrp2ILnEyN0wP1bmRs=; b=3COGfB1NiFxtde
	a+e+rBclixddpLCXKNhgLHKeSsMvDzI4nfUvQQ2HOzM4V++jq0PinNdocMyCf4JqQYriI871Zb7bB
	7T4+Z7l+Xkb0rr3fZ23zhsxdW07MglrB5NL2RExoTbO78Yi/bE7tD4Hd28ry5Rgn54fXoJ4FdNlar
	C7ew81VfkSJCb4L3KR3MinkAqgiXJpWh2jE93HGQWbxp8VQ5Bs827ZPH+o5CMkujjWMZxHaFzr6tH
	6X7IcSTfitC/GHgl7JhqfvztRajZUoBZ7hCyX61wHD1AlvJi8ZVyno+Lvex+t/qdk1/5pliGeVrWh
	BAZrYNlxAcCZXA6+TGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDk-0000000Ewrm-0pLb;
	Fri, 13 Jun 2025 00:24:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlGg-0000000E07U-2osw
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Jun 2025 16:59:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad8a8da2376so211185466b.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Jun 2025 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749747549; x=1750352349; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ex80jzwlOgVUFTxMNEXOHAt7n4bVeajkNSeWUvn3+ms=;
        b=PUl9DN9L80lLbSpyRYetSqD3yfHAALrkRCys156WFDLKT4ej2l+XNOMo1L9VRs9hHd
         E04lo6U+BO2RQul/jwCvkUbZu3kIo4eCbBqmTX3tZEyhp8scF8JKxfndaxmj5X/nU4pm
         mmGFhiGRpZPySyz1iwtWpZsDL9bxfVMWARLkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747549; x=1750352349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex80jzwlOgVUFTxMNEXOHAt7n4bVeajkNSeWUvn3+ms=;
        b=NEKnMjuD1zpiQoiRVOEMmEbqdtbHrC9pVLcch47nN4dRlejeYCbBY3ZY6n424c477A
         /Fm2mA3Z17DCZPKsuVN8AvWIOAUeKTe19wrNCuovBCqMhg8AaohJYL4OZrLPec5glH9H
         UZymq3PSV85tvEOF4wYZji+jBkzOZljirZM5B96TIm7taMRlYD/22jyl7GPyzpY6L3jS
         /KoalqZylyKew3YNsCyFqMbqXUTwD+x5G0Oxu808KNAFnrWuClmsqmsMEcTKzI3zuYja
         t/335Y4kk1KEWGHto6pSsyKhTHmXhjLHm1oAan/+F+Ln+YclxE8zAAAYO01vSGkxmkBR
         Fgfg==
X-Forwarded-Encrypted: i=1; AJvYcCWDft5pWqw8hP0jzm7NKVk+T5JyoUWAYhEL/kCPevlj6lJSCUQ2+rn0nWH4aKZLnEq51kMt0P3LYodZLDZNVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaWo1OF5lroB9fTGe7QLtjZkbYLvYNbom40oafqetswAMmxnXH
	4dlmHJWdIlpMYxe0kwndOrRX8jD0+0oowT7/RTH6lAhIW9Vmg7JYcML4zFEeN9kfDYMn6yw/Xd4
	EQUbU9Ss=
X-Gm-Gg: ASbGncucXTEf8mt3vKzdzXNw0HdQHBQDOeltG5L/NbSO7AWBTVjO5IaprLXH4iinseQ
	h3EXFiULg34Z1+KlgAts3BC8WRBgK+QRis2HxKfSBBocxu+jUY2ya/X1GrmvfJtdkj2llFeLrOM
	kqhnkDh7x+LhmahO0DNJsdIMkDmY0ccVOVhK+LOANFMoow2O3QxO9BsPV6CN0EHh4rvvRs5ZUa7
	UlxEsE4HN/O/2UYoF2JJtpNsbTAWp2uEmIeUnZ82k/TH8fU1fCA3+2KZs4K90i+F3hGLNhDdiYG
	WukRxkLeZHlTpxBvGN0R3I+evuQmxuTXUje5AsFNuDH764ODbmHD/J+ZZGEZ17a3z4S9gH+Gq1q
	8W4yGNeWzjRAiuv+yABZ0voOw9XtkJeWM+Y03
X-Google-Smtp-Source: AGHT+IFDguT+oPcQlqhqkE0ubBaoS0DYEPKEORYklvVeRLJX+Q/UzbM9Z/BpQ2MF7snH0ENoKpHImA==
X-Received: by 2002:a17:906:f5a5:b0:adb:9e8:8f17 with SMTP id a640c23a62f3a-adec5ce91ccmr620166b.52.1749747548861;
        Thu, 12 Jun 2025 09:59:08 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadf46063sm159902666b.185.2025.06.12.09.59.08
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:59:08 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso2095350a12.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Jun 2025 09:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAQz+WrGFR5c+thHOYzLktaylmt42v9OG9NIeeVdSMSYKee5173kgcwr0piHQjtENdCLpMlIGhWWEGQ0VV8Q==@lists.infradead.org
X-Received: by 2002:a05:6402:13c7:b0:607:1c09:b0d6 with SMTP id
 4fb4d7f45d1cf-608af5421bemr484999a12.8.1749747547800; Thu, 12 Jun 2025
 09:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
 <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com> <755cf90e-acf5-46d1-9ac4-2ea06c93e873@linux.dev>
In-Reply-To: <755cf90e-acf5-46d1-9ac4-2ea06c93e873@linux.dev>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jun 2025 09:58:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8J_33JR6oT+7to=k=vryrseuojs0rz5iEW4nVCi=KYA@mail.gmail.com>
X-Gm-Features: AX0GCFuvQ-iioC4hLv32QSaXlIXEQYIhlNNev6EWMYdlFyV35ap_BHw2PN-I5XY
Message-ID: <CAHk-=wg8J_33JR6oT+7to=k=vryrseuojs0rz5iEW4nVCi=KYA@mail.gmail.com>
Subject: Re: [GIT PULL] ARC updates for 6.16
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Vineet Gupta <vgupta@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, 
	lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_095910_828786_C2576BE5 
X-CRM114-Status: UNSURE (   6.12  )
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

On Thu, 12 Jun 2025 at 09:12, Vineet Gupta <vineet.gupta@linux.dev> wrote:
>
> Back when ii had happened I did extend the date on the key and AFAIKR did
> --send-keys to pgp.mit.edu

I don't think pgp.mit.edu even works any more ...

The pgp keyserver situation seems to be better than it was a couple of
years ago, but it's still bad.

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
