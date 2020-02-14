Return-Path: <SRS0=LGfP=4C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BC2C35242
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Feb 2020 22:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E5C2081E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Feb 2020 22:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kg1PDWyc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXtf6rzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E5C2081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0Py7f7kgzwpl2UBHlj8yRjBmRNOXw7NPyG9lA0cnlQ=; b=Kg1PDWycXtxBOz
	3AWq03BqHy/9WbkGkqWp6EjGPtRvYHamNQ4Ebean7vj0yqr3I9zhli9QtcQrvK/KFylV3DjF+NGXR
	ry/uoGiw70vt3AG+07YlACtZr9yVLqlLtRAZnlxuNMb+QFzYcniqu3kZbIGmAtVBQwoRpbxw8wig0
	kAWIGIlefmJDh6jru68sHzeDBpGsia3uA0t8sJAnw0tjyuh79SlzWcA8Tn/pVs6APEQBiRwhXbqXU
	TJ4aitqjHjImvN/UQ56lw18PDQhPqzHb+nj2jeI78l7qz+jygJ+VM3phrkdBaHv+oUCjDXHcvp+eT
	YDUTOIoDAkIsiFrvC1HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2jjP-0003S9-Qn; Fri, 14 Feb 2020 22:46:43 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2jjM-0003Rj-P2
 for linux-snps-arc@lists.infradead.org; Fri, 14 Feb 2020 22:46:42 +0000
Received: by mail-lj1-x244.google.com with SMTP id e18so12372277ljn.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 14 Feb 2020 14:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IfbEgrTyGRI8pFsJz/aER+vpMfQjUSX54i4qNeZ7kmk=;
 b=IXtf6rzozJ26CZqGfkWLD5opMrRqVMK2gZKzT2UJIGzlU+miLoZqKIuFs3fkXf8XRJ
 z0wSRknoqRITxJnbt7AYR/dnsCT7TmMufqYCiYrnSgwAUIZW7PFQ7rpR5wYRlhbE4Gzt
 f5eMy1infNpaYgajyqGLYcKt3X/WgwyoOl7t9c3TJIX9rNCrppEKKxdVj+x0GXXJZcQp
 nnTDkSg89wUrl4OJYFKNmzhUKe0S81LzYgmuumDBE0AH6RLlNg4f00rDF76iaiauIFXW
 5gRs6wj0EYz1/y3q8RCeqCWt2EdjKAKw+3P/aQG/rJgSaNIwFgjhxsqykntzzUS0oPIK
 Uqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IfbEgrTyGRI8pFsJz/aER+vpMfQjUSX54i4qNeZ7kmk=;
 b=ZFZ8DOy9mXo+tu1syYCs+pHQDuqui2tr5dZdbdogNC2qeuTj5ETEQHpz7nxL2S8l8z
 aCKsWa2tHFn269cvsl6eUF7mkWc4e7ZKkt0h2XoJMlx7e5dGwpeNyWrpSWrdP/xN1ubX
 UFYlG+YSq/eNuWUN0XtkH2rMGvechHvfHL9GTGOp9TmLOdKezF5Xejiu1+83Pk5A+rBA
 CJDDJb+zUfhn0xAYoADNfQXrUEq51EDAUgolCzqw35M0FTa1Y7uTXhQlASQEtQxXh1aF
 42oehTOCxqKxt6fELrGeqr4Wa0NTm15dLyqB8FgXEUKGU3HjYufNPEBmhL77IOlILMK1
 NrtA==
X-Gm-Message-State: APjAAAUpbiqIKJmltVYHtfjC2kPtgNm27P1vz8NpTVkcpSCJmW1gdLlg
 YUoPXKEE4mBqQKMuEMOQ6w77dygkBpwrey+NmwY=
X-Google-Smtp-Source: APXvYqwEHMo3/ByJFiro6vFUZ1+oaM46U+tVvefIIWp00DEQjy7C5EH/UZrPt7Fcn81EDrxNZ8T9W+qVaN7nwdLjPrs=
X-Received: by 2002:a2e:a36a:: with SMTP id i10mr3278403ljn.107.1581720398485; 
 Fri, 14 Feb 2020 14:46:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Feb 2020 14:39:19 -0800
Message-ID: <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
To: Joseph Myers <joseph@codesourcery.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_144640_814573_79E975C1 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vineetg76@gmail.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Zong Li <zongbox@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2020 at 5:30 PM Joseph Myers <joseph@codesourcery.com> wrote:
>
> On Tue, 11 Feb 2020, Alistair Francis wrote:
>
> > > > diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> > > > new file mode 100644
> > > > index 0000000000..0da3bdeb5d
> > > > --- /dev/null
> > > > +++ b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> > >
> > > I was hoping newer arches could simply use the asm-generic one ?
> >
> > We need to specify that RV32 uses a 64-bit time_t. The generic ones
> > don't do that for 32-bit arches.
>
> Since it seems we'd like future 32-bit ports of glibc to use 64-bit time
> and offsets, we should make that as easy as possible.
>
> That is, you need an RISC-V-specific bits/timesize.h.  But you shouldn't
> need an RISC-V-specific bits/typesizes.h - rather, make the linux/generic
> one do the right thing for __TIME_T_TYPE based on bits/timesize.h.  And
> have some other header that 32-bit linux/generic ports can use to say
> whether they use the 64-bit offset/stat/statfs interface, that
> bits/typesizes.h can use together with its existing __LP64__ check, and
> make the definitions of __OFF_T_TYPE etc. check that as well, and then you
> shouldn't need an RISC-V-specific bits/typesizes.h - the RISC-V-specific
> headers should be strictly minimal.  (No architecture-specific
> bits/time64.h headers should be needed in any case.)

Ok, I have updated this. I'll send the patch once my "Always use
32-bit time_t for certain syscalls" series is in (the headers are
changed in that series).

Alistair

>
> At some point (or indeed now) we might flip the default for linux/generic
> so the architectures needing an architecture-specific header are only the
> older 32-bit linux/generic architectures that have support for 32-bit
> times and offsets, and the newer ones with no such support don't need such
> a header.
>
> --
> Joseph S. Myers
> joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
