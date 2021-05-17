Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA3C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 07:28:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C29561007
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 07:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C29561007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3sIR7rfK+L/7Q5l4Ip1h6ievGsEqopIrGxjuJ6OioBc=; b=O4nkiLqgqvydCavnsSwzRJCvZ
	3/AN+Rq8oqbtJMnuBezm40QDlfqUwObfpfSSFGtKAEnGXKADwUD/aBdrk+e0hEzJBrOewz9tixzus
	ZWNXKOh8kR/eVNQc4ZAy1VZEwUT0qNDzp3M0j3XS8hBmRZG/oDviPAgkfNu5AQNJXDW31LuAGCfJ+
	2B3q5X1DZirWcB9NQTpJ5hHEE5EMn4vCTAKkJAxRCJ6Tb09nRxRdn7QGXA8EWaeuKHpRsjbq2Tv5r
	MgNIixKZNkFybhUgZfaMTtjhoMv0jAuoWCs9o09mtOLg1KlWgBXgdxOAuc53VxOTyQqBMoYO1e7nO
	CA/PBdr2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liXfp-00E2DX-Sa; Mon, 17 May 2021 07:28:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXfh-00E2C7-EV; Mon, 17 May 2021 07:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=p1Fnq4KgeZi4u4hQ6LUZJVm9J+bxvKk61Tbiauusbmw=; b=yqxEgNp2+pRTVjkqHCLm3W7t4x
 X7rJYz+DPCduKiZaY+ZhSslGsAezFW1DEkztreJC9dxCJDfJ0HTKzCms8QmgDAAZbqu7oYGwDp8XT
 8EHceDD4lUsOp0wPiO1KiE5atFi42fro3aDcDvfsSjgAX1jkE+oociG3VUSnzMFvZroy6opEF4YNA
 qw/emSz+0vzKU9XZYB7hbCCu7pAjA0nMlg5CrCRuNGv+DNR70KsTvRPwqgFWm+ICQDHrn/sMjkf6+
 HGaS1p1N3dhCiC78eVJO+LL0Bi2WPDRg24boMY83cCoSm6bcNqdGNi1FMkaXQ8ASNslLgwPKZvVXo
 Vr6mNs4w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXfe-00DXpp-Uo; Mon, 17 May 2021 07:28:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81F2961284;
 Mon, 17 May 2021 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621236490;
 bh=WoQ2Tt9j1s8lZ+rFGz15/N+rcvIN9GuIXZT/n/mvPAI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rz4nCnRs3MKPRjz0dKaFcIG7wjHT6KBRybD6Trvo3cwl2LtMEliatXLWXADfjInf4
 ZurKjK+HSZugMQq4T93FIGYUf91CGscakYmybanqXsxFHKKMCODe6xFeOm9T4yqIKc
 1PaYuHpasSko+WxNDMe/gfVOhwl02LQ7a9Q/twcx9iZj61UkRUvXQRv6inWu6oavnW
 obIpBqlhMQ/9yzY5mvgiJYqKx/MlTHMrtTi9MYZWODtd1l34GSGJWS/BxBmTR6Pumm
 mvZXtZTbU+uaHHN0eAih41AV/xVH950QQXPiSEe7NfGz1XKg22SmkmCmsyEzM+o5W0
 8dyhDgzdQ8Egg==
Received: by mail-wr1-f54.google.com with SMTP id c14so3435778wrx.3;
 Mon, 17 May 2021 00:28:10 -0700 (PDT)
X-Gm-Message-State: AOAM530alMs2Qv8i8oNIB5ZaofBP8TvjJ35WI4ksRwwWLfCYbTPdM3cE
 pp/AIgCfP0ucaQQ++xdqHB0J645LptXp9vAjUn8=
X-Google-Smtp-Source: ABdhPJxk7eLWYGXPzamV742l9EnpMjLM0lyklUBUE5IGJo+cNnB5FKY+yx8/GMxQQ0Oji3ZyvDfH+BybrBLsoLFOZbo=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr74796509wrz.105.1621236489115; 
 Mon, 17 May 2021 00:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210515101803.924427-1-arnd@kernel.org>
 <20210515101803.924427-6-arnd@kernel.org>
 <20210517062018.GC23581@lst.de>
In-Reply-To: <20210517062018.GC23581@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 17 May 2021 09:27:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2eDeSgB76SyzcpmQmV3uR1jwtOjZUoG9UYfDnYAWGyog@mail.gmail.com>
Message-ID: <CAK8P3a2eDeSgB76SyzcpmQmV3uR1jwtOjZUoG9UYfDnYAWGyog@mail.gmail.com>
Subject: Re: [PATCH 5/6] [v2] asm-generic: uaccess: remove inline
 strncpy_from_user/strnlen_user
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
X-CRM114-CacheID: sfid-20210517_002811_061620_D7474DDD 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, May 17, 2021 at 8:20 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, May 15, 2021 at 12:18:02PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Consolidate the asm-generic implementation with the library version
> > that is used everywhere else.
> >
> > These are the three versions for NOMMU kernels,
>
> I don't get the three versions part?

Right, that was confusing. Rewording to

| The inline version is used on three NOMMU architectures and is
| particularly inefficient when it scans the string one byte at a time
| twice. It also lacks a check for user_addr_max(), but this is
| probably ok on NOMMU targets.
|
| Consolidate the asm-generic implementation with the library version
| that is used everywhere else.  This version is generalized enough to
| work efficiently on both MMU and NOMMU targets, and using the
| same code everywhere reduces the potential for subtle bugs.

> > +     select GENERIC_STRNCPY_FROM_USER
> > +     select GENERIC_STRNLEN_USER
>
> Given that most architetures select the generic version I wonder
> if it might be worth to add another patch to invert the logic so
> that architectures with their own implementation need to sekect a symbol.

Done now, using 'CONFIG_ARCH_HAS_{STRNCPY_FROM,STRNLEN}_USER'.

There are still seven or eight architectures that provide their own though.

> > +extern long strncpy_from_user(char *dst, const char __user *src, long count);
> > +extern long strnlen_user(const char __user *src, long n);
>
> No need for the extern here.

Removed.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
