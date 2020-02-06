Return-Path: <SRS0=Z+JP=32=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D7AC35247
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 22:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5968D217BA
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Feb 2020 22:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NetiGyif";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIb3M7ta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5968D217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBxiIJ6Z4HBl0nvTtyONaFLWgZngxQqe1bM/NajH+0E=; b=NetiGyif4vXF4e
	7QxxF1ZDyDHq1aT6WnedjSZk4qjfwgxTFcrzh9jzmqOO/t0gLdwkfYRFY55GGqvw+R44W9i1OPePo
	GRH0Sw9N3Kn5GERGbDX6cJ64ptI+nqIooGDvdGpXrb5sE4ZC494XzaleU6LF5f94IA7cBGRDJLM+2
	Vvxst0H+g/sX+NV9E72yL1QM3XjbgOLQpRUGDIeVCqsbso6+aoDey3XC+ZzGB26UENH25RPrmCswX
	XXKv/BZKFDMNFUoQjA6un93OLvnGshCDjflTvYYP0qghxKML6Ck+1mfbY+EBny9PW50buOCJ8bWhM
	IbVmuaY1+HDdmbuRvy2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izpPR-00054l-EB; Thu, 06 Feb 2020 22:14:05 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izpPP-00054Q-9q
 for linux-snps-arc@lists.infradead.org; Thu, 06 Feb 2020 22:14:04 +0000
Received: by mail-lf1-x142.google.com with SMTP id 9so152527lfq.10
 for <linux-snps-arc@lists.infradead.org>; Thu, 06 Feb 2020 14:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCw1AdZGAIrPKt185I5FYjyCg9qM29gCTQNzH+I9VaA=;
 b=BIb3M7tajpgF4VrZQ6gmEGk4nLgGG5pMBdiaqMUsG80lBpLNn42CCf8j8C+d4RPkwI
 iQbC5A3Q+4oxCMS1aiozJnjByJZ3GEiZbE0yEXMA2FGBn2gELtl6wKOvXJQ1cFu1a6q+
 OUIeWYcZUITzePMwN1b8MvtVSU6RBN4wKW+7eN+msTKVY2XtOzCr2AZSMyQh2vUDRgNb
 Du+n+C+UoOL/jRDjvIGCkNpzo7xgbfLeWDsKqo17PYSuOZ+qqfnV63s7bdmnmHIZN/El
 XtTJpOZ6cK3++ji0qPvL0PAUU6gnhzi6w0gR1FnPwGraloz6JAhnYz013UUfI6yW4pru
 6M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCw1AdZGAIrPKt185I5FYjyCg9qM29gCTQNzH+I9VaA=;
 b=Cy+8k+Ul9ITjeJXxal6Sq8wN/igmRvxQn1y5JU7xMUVcPYIlG3sFL7bR/MGr4rcCvQ
 PPXeunb6KjAorSGXNK3ZuLErcl9WeyEeX7OLnvTsfvDanS9Jyz7hdxKo4/cL1+5oY92s
 UGeWv7RN996DHB9L3tpzU70m1QpHRA9AHckaggOjEB6scn4Xwq9KRryHWM4yFGDb5gPk
 3wEbv6jCvpsGYvU6Xor6QkbMDkMDlYnJGpyCfAvSEBLOA9+avckLe/Cj4JNXaFfcm5KU
 fqK0CvntNjLw/bj2LFdcm8r2QT7kG/nTeLK+lFXzamaS9q7Y2U6crb3ThmqGTJTvfg2U
 rZpw==
X-Gm-Message-State: APjAAAWbz9Ov+DNQc1xa7YClgF5ckn1tAVODlpuKT/+kWronUgVn5miD
 JofbM2w9ZuiqW7rJcrA8id4rMs4bBLSAIIb0QVI=
X-Google-Smtp-Source: APXvYqwuWdwhd9nOZORjLSB+7dbx8l3WEEIRT2RJC7T4DcNhfpwY7Od/25pbbj5SrCDB8D4ipgmL+c6+0n5rIvFdiHE=
X-Received: by 2002:a19:23d0:: with SMTP id j199mr2919106lfj.137.1581027240973; 
 Thu, 06 Feb 2020 14:14:00 -0800 (PST)
MIME-Version: 1.0
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
 <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
 <c3e18811-b5ed-2194-ba55-6c5f87f46721@synopsys.com>
 <alpine.DEB.2.21.2001172136520.13033@digraph.polyomino.org.uk>
 <8311a699-183e-6811-cf24-3ad85ff80321@synopsys.com>
 <alpine.DEB.2.21.2002062149360.22384@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2002062149360.22384@digraph.polyomino.org.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Feb 2020 14:06:49 -0800
Message-ID: <CAKmqyKODf8rBqhV708hzMMcdbEZEQrf1T2ABGi-3KLSwWozqNA@mail.gmail.com>
Subject: Re: ARCv2 Public PRM (was Re: [PATCH v2 00/15] glibc port to ARC
 processors)
To: Joseph Myers <joseph@codesourcery.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_141403_345490_796129E9 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Feb 6, 2020 at 1:51 PM Joseph Myers <joseph@codesourcery.com> wrote:
>
> On Thu, 6 Feb 2020, Vineet Gupta wrote:
>
> > >  If
> > > you require Linux 5.1 or later for the port then all or nearly all the
> > > architecture-independent pieces required for a 32-bit port supporting only
> > > 64-bit times should be covered by the RV32 patches, which I think are
> > > quite close to being ready to go into glibc, though you'd need to watch
> > > out for any (new or existing) #ifdef conditionals that might try to use
> > > 32-bit-time syscalls if they exist (which they don't on RV32) - and that
> > > would not prevent supporting older kernel versions later if desired, as
> > > the Y2038 support gets built out (including, in particular, the support
> > > for falling back to 32-bit-time syscalls in functions for 64-bit-time
> > > interfaces).
> >
> > Ok I see patches in flight on the mailing list. Would it make sense for me to
> > start off in parallel with ARC port which will take it's due course of review and
> > rework and in that process upstream y2038 work settles down and I then
> > rebase/switch ARC to that. Or would rather wait for upstream to settle down and
> > then I adjust/post ?
>
> I'd suggest posting patches that are on top of the RV32 ones (maybe
> there's a git tree with RV32 changes to current glibc that could be used),
> and that only support Linux 5.1 and later (so you don't need anything much
> of the Y2038 support beyond what's in the RV32 patches).

Go for it!

My working branch is here:
https://github.com/alistair23/glibc/tree/alistair/rv32.next

My latest RFC branch is here:
https://github.com/alistair23/glibc/tree/alistair/rv32.rfc6

Alistair

>
> --
> Joseph S. Myers
> joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
