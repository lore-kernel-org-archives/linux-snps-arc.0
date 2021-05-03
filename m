Return-Path: <SRS0=JzVM=J6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1A1C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 May 2021 16:08:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B073611BF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 May 2021 16:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B073611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oTDECn20WDV5+KiDuNEN6LEVvzuZA2dRSfghOytczPc=; b=LYjSbILmdvbDG4Cp5XUHcKgVg
	BvyWLoF3cjIVlWIul8NJLa0n0dQXavZiByfiRuWr//lM/jKn3By+H9aSayljx0epDHwuHRCLhloL6
	63vW5kgsn9IpK6f7hJttjxpysW+5HEfsDmCELUfRpgCN5D+5/eYSj8bveB7HWoQKfLqFmfbH2ttYx
	SeEFI1/v5x66V7Hc1V/sNKGZ9vXVbsw05/EYKsdmTllJhGF2ZyVLrbQ9xw9BcFWGhYTu64WHS3vBo
	epSnfGUKF/fzlg7ZI/Swjq8UMOsaxZTRDyIsjoXYFAZPBGvgR+OdELGf5/tsRNB7ytRc7x08Ivzz7
	/7D4JnBjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldb7g-00EKvX-Qz; Mon, 03 May 2021 16:08:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldb7Y-00EKuJ-1l
 for linux-snps-arc@desiato.infradead.org; Mon, 03 May 2021 16:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4NoG7yaTfr3Ag07IElR2xxPrvYe9hfRf/DNNbGgeRNY=; b=BXCOTY37FqUtqRonDezemFA9pp
 KTxF7e2uAae/D+AHYf7XOwp4sv8kkOVaRgfZU3Jm4mY30Ew1NcvltAvLxLl3zM09XnLe4AU2yci1D
 xF4rXCXd+bjpA4NZhKprgWdrCg4aPpl5cqNlQfXg/CWRPgNlz3luVqr8v02nkw1RVDVeO1cZI8f6f
 EZBUp54FGsWmEsbL3MuMYoQgU7VeFSE1vQ2dgUrYH/iSo2g4RtJtLoRh0oG9kKza0WCI8BFe+s9Zv
 4V+BZLn865v/XC9r1IHG7o1C5pselfYRSq9MgH7fJw5IDVeYj6OFe1En95ZxwLLoNzLkLXBoZ+vBR
 i3ZzIb4g==;
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldb7V-003E0M-7B
 for linux-snps-arc@lists.infradead.org; Mon, 03 May 2021 16:08:30 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N1PPJ-1lY3DV2KNP-012qBF for <linux-snps-arc@lists.infradead.org>; Mon, 03
 May 2021 18:08:26 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so1991637wmi.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 03 May 2021 09:08:26 -0700 (PDT)
X-Gm-Message-State: AOAM530/Nzh7dfnKt+nH8OAdq7cENu4rVR+9WBd3+o6rLZUFT8WPWse+
 gaQOo3oiWaNEA2n7Q0N3PByGLwiAS0PDzaXESYs=
X-Google-Smtp-Source: ABdhPJxYMTQJVWw4WAAd9FKPLJo6XWwuPeyfNnK3keAI5ERAvz63WNcWg2FiOjsFOVj9CWG/OQW083WJQcY7aApQpDg=
X-Received: by 2002:a7b:c846:: with SMTP id c6mr32166374wml.75.1620058106200; 
 Mon, 03 May 2021 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210430111641.1911207-1-schnelle@linux.ibm.com>
In-Reply-To: <20210430111641.1911207-1-schnelle@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 18:07:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3mCujxC0=_cL6Z88Xh2cb=OY_Ct7DVpJNvRn1v9=FhkQ@mail.gmail.com>
Message-ID: <CAK8P3a3mCujxC0=_cL6Z88Xh2cb=OY_Ct7DVpJNvRn1v9=FhkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] asm-generic/io.h: Silence -Wnull-pointer-arithmetic
 warning on PCI_IOBASE
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>
X-Provags-ID: V03:K1:NwmBu4PlKoQwzEoTjDjXClS8Km0eJCrsNLiIIdNST+IuW0mGQMB
 +aLY63AmDH35hNoe82cWqe5pWXxqDDIUiH7ddvNzJr2DBRozm88ExEW9Wcm3254VGYcLNjN
 0MRkMS+aHNrCLDTZcMlnCi354B8tSPIGPjNPRoO7pbuw8b7SUm40hWqJkfSlFBrw7Y9/p+4
 bxbJAtVXvoGeTWWpZOf2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZsedbVVRwWw=:lzKuWHd2g3uluGS1N7lmjX
 o0pZMHajsqJpYCQilU5w3ByA9Cygey/GcciH80Pkq8svSj5aPvJOXJRWqSL/jASJk0nD4PMvu
 r20cIs8bDBsylWJnDCKC37/E0QLUlLAhEYfUweN1AhrujVtfZEEy7tE3SayCmticcxGOoP/he
 1LW3VwJ0XbxN06+KGfvSnrxOoGgYdOee5wXvwx7IKmdFulBJJYfvA1HYXFBQNjn88Zw08Uq4u
 A52AIXt9eKT/64EXzIIeYo3s0TV5d8C3RFMlJM4Su185Sz0dHZcmPKObJVOQHG18AHSDioZAv
 f2qNOAP0gbtCFyFCq99occighPwHfHfb7malZiNn/S1w1jwGQTHrKuPnLSe0054b0GmnGlj8Q
 /zNdIrmKZo2/vszmQteOG+kBbziMQGzR5IN37amL1NNopQtZ2cZfbdrozW/RCtUpRhHXYgYtn
 b8kcAdybz8fhH/UMX2lYTyEtnYBC4qBGxIaPMeG0/C6Zw9aZAeknelWuDuFeD1OSqZZSa/AV0
 egfeJBOt9b3nXd8zR+ObRYRVBtJSoWrRi7bRbdCBi3X6xZncaLcLZGcXTdtHtvbIdSWaxXOuB
 mDqVg1frYw+ewLzEkqI7QhGPSpwOq1SaCt4d+Xy/al6Gl1dW80s3cS6Rn1p0vcl2Baa8BuJkc
 fHKQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_090829_571850_B774FD64 
X-CRM114-Status: GOOD (  19.16  )
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

On Fri, Apr 30, 2021 at 1:16 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>
> From: Niklas Schnelle <niklas@komani.de>
>
> This is version 4 of my attempt to get rid of a clang
> -Wnull-pointer-arithmetic warning for the use of PCI_IOBASE in
> asm-generic/io.h. This was originally found on s390 but should apply to
> all platforms leaving PCI_IOBASE undefined while making use of the inb()
> and friends helpers from asm-generic/io.h.
>
> This applies cleanly and was compile tested on top of v5.12 for the
> previously broken ARC, nds32, h8300 and risc-v architecture
>
> I did boot test this only on x86_64 and s390x the former implements
> inb() itself while the latter would emit a WARN_ONCE() but no drivers
> use inb().

This looks all fine to me, but with the merge window open right now, I
can't add it into linux-next yet, and it wouldn't qualify as a bugfix for 5.13.

Please resend them to me after -rc1 is out so I can merge it for
5.14 through the asm-generic tree.

Please add two small changes to the changelog texts:

- for patch 3, please include a 'Link: tag' to the lore archive of the
  previous discussion, that should cover any questions that people
  may have

- for the risc-v patch, I would suggest explaining that this fixes
  an existing runtime bug, not just a compiler error:
  | This is already broken, as accessing a fixed I/O port number of
  | an ISA device on NOMMU RISC-V would turn into a NULL pointer
  | dereference.
  Feel free to either copy this, or use your own explanation.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
