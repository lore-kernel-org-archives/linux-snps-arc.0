Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9BEC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:48:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F1F6024A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F1F6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xa6ApW+VTBHzhD1CkuYU7LjxWqZFMG/zbOADMFHflfc=; b=qaVQg+XNRHy0rDdU9td/W0IrS
	BvN7EIaLfMUOEGQqLEAE+U80Hy6sBWKJ4QeacsX8BnM9W5CzA3UJAvdbi2QArAAZikkXqhpkdMRuJ
	XhdI01uZaITDKGhGkbmhwh3AoQ2GF2O7Ceg1UlIIRecpA5DtG4W2MDKeseOaq69fCVdRanjbk7wvb
	L9pjN22r+ZV8jmQTQkjM11SccHAYv2HSduUboBarTchfwSsda0qKNktkE6MmKto86iNgMKqU7crRm
	lr8TseGO/m4gNn8qhykF17JCyp2NBlTixnsrqAI4Vzy9ll7KGKR+3TiaFYaQmslx9DUuwypKzxfmC
	AQCocp8TQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liX3c-00DxKh-QZ; Mon, 17 May 2021 06:48:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liX3I-00DxJX-SM; Mon, 17 May 2021 06:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5X3Fk0CQacago1MNgUgPEqXmZVJbIWlNxBHF9IeV6W8=; b=fawW+j91i0nA1IzRYAf8dqhe8M
 ifw1q0S5JPCcoA3zlAnH76oPRufQtTdffyhvdzsmWceFl75pDWAWdxAn0I+qadScUMx/pI+A4xa+U
 ezLPYplfX99aL1FowhmF8zfqazSKW97LqfjdzuTcJha1RpvXojqyZjPSXDfNIs6mZ1imBpCJb4LHu
 uhHbZC4X1Oi2o76jrXtKYxSk0HhmvJ8399/sVOujlXBquTkbGNcrHd+D+EB7UGP/SEovW2YHpmu6M
 c0AO92ZmGqoM14zblBmqd4zwtRB6hW8ClYUdCPQuveqRHYrsKXzSN3B++rcD8a3UBn7GRBLwSySlc
 xuumU2zw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liX3E-00DWcJ-5r; Mon, 17 May 2021 06:48:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7A536128C;
 Mon, 17 May 2021 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621234107;
 bh=XwMg9QqAApvxACMmxOXgBWUrqiIh4WJcvsyjh85BX2s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OJt9dRt9/P1Oeb+0iWbP7PGy1GVoBntHTUDRSoynf/8phrjMncmBI/ggwMFlKlmA4
 uuwdcgFzPVyWcULWZZMV+PDvUGYAtGLZjcJeqxnAGFgXsSTbo1iqNuX9RovAK1NMog
 v5E3xwNbYKKDTqYEhc8XqxdiPvJx8qxsysv0JpQTmDcI5dtqsts3rcOkmicLWGs+LZ
 I3s4EXsVmmEK7pQkyBarkV2O524+ajYdjoiX+3tbSceN1/Ilqa5FIhlDMZxDYnNs2Y
 PSrfMm1aeEIRhIwAaAgAbu/Cnzpc0lWpV5FQ3orgCW60gOeRfFqR8rngxAhVGG2A3o
 DjkPheDPLSvvQ==
Received: by mail-wm1-f47.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so2291806wmk.0; 
 Sun, 16 May 2021 23:48:27 -0700 (PDT)
X-Gm-Message-State: AOAM531NE84MLlW9WRIh8E4pT2R0OTdZ6uXuhL0hJ6lpHIrOv/Jx16kS
 7YTFHByuiAyS49NFcRD1C+g4ya+EsQ+Hp6h+ZTw=
X-Google-Smtp-Source: ABdhPJw5UzE+VLoPtUlE/tArhGvabDH4hlvlXDyeMCoxDrTy/spnQrm/S4VfHzJMMZdGgkigscZIoNK+LsoY0wqM4qk=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr21407803wmj.120.1621234106305; 
 Sun, 16 May 2021 23:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210515101803.924427-1-arnd@kernel.org>
 <20210515101803.924427-5-arnd@kernel.org>
 <20210517061656.GB23581@lst.de>
In-Reply-To: <20210517061656.GB23581@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 17 May 2021 08:47:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a12HtG7GZHikZa73SbKKr9QhDWgi6BcMwM-W=U1bpewGw@mail.gmail.com>
Message-ID: <CAK8P3a12HtG7GZHikZa73SbKKr9QhDWgi6BcMwM-W=U1bpewGw@mail.gmail.com>
Subject: Re: [PATCH 4/6] [v2] arc: use generic strncpy/strnlen from_user
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Sid Manning <sidneym@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_234828_256397_92216894 
X-CRM114-Status: GOOD (  14.37  )
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

On Mon, May 17, 2021 at 8:16 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, May 15, 2021 at 12:18:01PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Most per-architecture versions of these functions are broken
> > in some form, and they are almost certainly slower than the
> > generic code as well.
> >
> > This version is fairly slow because it always does byte accesses
> > even for aligned data, and its checks for user_addr_max() differ
> > from the generic code.
> >
> > Remove the ones for arc and instead use the generic version.
>
> Same comment as for hexaon before.

Changed now.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
