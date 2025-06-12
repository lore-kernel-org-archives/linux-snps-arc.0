Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E0C61CE8
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkKkP+noctf8EdH73Q43WEQnHme/eKSqukXMTRKWbNk=; b=oor8hLC8BLY0Iw
	Vwso42E2Ab5KDH2Peheqb0XvsAqlAuZsNRkVeBws8oWfzzN+tcskLD7iRzVUrK04/FdTfVg8dhHt2
	sTBKylpp45bRJ1veDmgzoHvQ2otV9dPWSbIHXuUdjhZN7aMtZE9B60VvwZtZsAZYpVuLu5Wo8YL0F
	wE9lUEDIvgHc8ci6s8JNSWUgHE7pqqkDJm5pkfXh687sI/bRqpARZxzAiccy6M8ewltp9a4x901EF
	L8HVUGnhB17IK4Rg4Pns4/chMSw2SasXgAfMQDIGZ4vB+mtfp3St2sxCapvkzOoJbTJNV/uT86QHI
	7E6FD7UgB6g+rGRdkDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqx-0000000EJdE-0uZ2;
	Thu, 12 Jun 2025 19:44:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjpp-0000000Dmlv-1pQb
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Jun 2025 15:27:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so2476485a12.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Jun 2025 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749742039; x=1750346839; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4Pqtv5A7DN8Mx6FTwFxLJlKUKCl+g5TgC+f5BBxIp8=;
        b=LdOJm/W0A1bQBSQFnNCXiBWZOZMWwIaMvg7RHOnmlPrF+CmzJpRTTq441U6pDB1Fhr
         Hvi6Sa3elNPJFmWVZFdt8/gIwrPQn1oBjJ4NRdyW1mnqdLVzI7BxAvZYhN20jXui3edY
         UhyoyNbwDqP6duEUzNftNPjPcABj+d6sDZyuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742039; x=1750346839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4Pqtv5A7DN8Mx6FTwFxLJlKUKCl+g5TgC+f5BBxIp8=;
        b=j7yWfomEL6LhyHbxKxYv3hvA7orbFj7en2x+6du0fSNSgqu6W4EY/eAHDL/hPQSJhZ
         2+QVH62Egx5mmXewnuyAbLCRfkUda2jWIZ+aS4RW7ZR/2BlWid28EFlKkeiDfqvwdf7C
         FHwOvbzTHT+lBmHQFJ6S64ht7SpVvDpKu+R+9SABjy+vWRsbauL3O7lDJlxZJ4p7xlb7
         L1s5ABUiKd+r0XeSWHd7Qv76qaliSt4tI/K3nO3Vbf+1JYumt9CPg8UZ0b0/o40Ls8V0
         G9YNVZ/JCOI5UIquNVkCvAhWt7WyPqEuXp3a6Nf+0SzI+B/RTWFb0OfIr3dD2TjraS64
         DU3A==
X-Gm-Message-State: AOJu0Yweu523O1F6AX2tWBj9BhqZSaj6K/owUsPGc2PnUbIOwPBmPSOn
	5aafHnmr49jtCKvsN32sdrY0VneqXUnOQSmE82SwrtduFZi5q+2WlJjvXZrJu+jeBvxVdJRUOMm
	5NmkujQ4=
X-Gm-Gg: ASbGncvhgG4Su1KsXF4R3sXsD7P7GtqsG7WiQJB4DxUZ4CUYg0K22+CgvBBFkEUB8gF
	1Sb3IzbstluBgee3JDNTJKuvwAJviZtX3rI2OIw3XXJ9rc9k2UuGYRfyTd/R8sFvS+v2a1pCZnf
	EwHO5sHUjYawsguwuY/r+KvOqWlmrQ0wjpASFxYKeWFTpi5Ug38J/mHt/auIUpVfAneZG3X2t9P
	DHYqkh/+DARjwNRe2whd9aVtZOs00pIFLcstSfcvFylKcSqyhIZJEZ7OSXH5ALpT/30DrB0EHwk
	7pnW8oA8NuqSe9upTtJJHWaLacKSZesIIVk/Ff5RMNX9E67pLKduK8R4Us6dirFMuk4NfC11RU5
	yuVh6nYKwt7b3bVxxmBr+xYwg8PDXmR/UDthn
X-Google-Smtp-Source: AGHT+IE+gN35k8yE94l5VhYY/XwuukoiIOyiR+yZhbcANYgSrMaR73spwoq1Z+gQE+9eDPCeYgSbfg==
X-Received: by 2002:a17:907:c1b:b0:ade:40cb:2517 with SMTP id a640c23a62f3a-adea36d67c8mr408853666b.30.1749742038857;
        Thu, 12 Jun 2025 08:27:18 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadf435eesm147914166b.183.2025.06.12.08.27.17
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:27:18 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso2249305a12.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Jun 2025 08:27:17 -0700 (PDT)
X-Received: by 2002:a05:6402:42d6:b0:608:3b9d:a1b with SMTP id
 4fb4d7f45d1cf-60863ae566emr4109366a12.19.1749742037587; Thu, 12 Jun 2025
 08:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
In-Reply-To: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jun 2025 08:26:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
X-Gm-Features: AX0GCFvnTy6cYDrHALlLp1FFvPxTrHkuO-bgQbsdY4gmWtxJ4h-gyShDoTWTgGY
Message-ID: <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
Subject: Re: [GIT PULL] ARC updates for 6.16
To: Vineet Gupta <vgupta@kernel.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082721_706081_C7200AB1 
X-CRM114-Status: UNSURE (   6.69  )
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

On Wed, 11 Jun 2025 at 20:29, Vineet Gupta <vgupta@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1

So this is signed and I pulled, but your key has expired. And I don't
find a new key on kernel.org or the normal keyservers.

Please don't put expiration dates on your keys and then not refresh
them. Or tell me where to find updated key/.

                  Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
