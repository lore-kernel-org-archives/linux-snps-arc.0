Return-Path: <SRS0=5kko=AK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FF2C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 14:01:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A63923D5A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 14:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KoIyfJis";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsYeoNtN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A63923D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ya/0r0mSnilLJ/RAPZT+GNviE+BifAEAAZ8NxAOhccA=; b=KoIyfJisGQ8dGWzmPP/01ssnH
	OqVnL4kDN1HnLPP41oTDTG//cKLheY200RHY3ySEhmJAZN3R/cxeIpft9doTTIpE6PNMCtZf6vS8Q
	OeNyuCvCEZCAjNpkEgHGlIrQX75uTOTmjeplQtgwgAz+39Q3RZRQAPfA75kAS5zHYVmX7k9TZmpP8
	1dFJ6C/cCe2o/vedqRkk/dJ1kTXgSK87dOKbjVV/6Lzsqz58+K2S9VcL/xqf5aV1DBebyA7xBamBT
	REWZC7GFfvhsFWTlQIzoLA+9Re7bKgifKhRCfauprSCG2lhn4dSg9VwTcw3afR+rYOGJMmuAOUw12
	9vK+n35qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpuLm-0003dW-TK; Mon, 29 Jun 2020 14:01:34 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpuLh-0003cL-EG; Mon, 29 Jun 2020 14:01:30 +0000
Received: by mail-qv1-xf44.google.com with SMTP id di5so2732947qvb.11;
 Mon, 29 Jun 2020 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FrjxWdY/Gjwce8t0JyeJsnYTMhQlskObJO/oLUWzfo=;
 b=KsYeoNtN/hmKD60koJPvKXhY1HT5rh0BdsIymjK2OY+Ah5csm67fWOMInZoSB5MyiF
 z81tpEOU7gbEs2Eu9dK1IU73/ldLFTcOuXQ4NQt1zxjMaUlUH9xpuPmQkDZyG2XpHE5A
 z0rDQ6F3p6odfLFvjQ20/v+vqn3osPhCyUtrTurdqBrAHPO36wwugYL1OqGKXGdazN2M
 p5mNNLqMsIqkd1lea0NNKZvGNZ4NvI4uksXON6N73LrjpsMxdX6M9+heVdl/zTyGvkYj
 tkHXxI8XU7hiVfWyn9RhwdGCF2zdf8eMUPHFh6FNadOyOkvVyTEcnpjW7aa7VVLEWYLN
 vdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FrjxWdY/Gjwce8t0JyeJsnYTMhQlskObJO/oLUWzfo=;
 b=bldrx9R97zz65eteFHckQ3NpK1pd52B28cVw4IwvzdLfsSOyKXDyd3esBNfQcxzCKP
 jJ08K7p2NPhy9wHJyvWkr/a0XefGOshD8BcXK7Ert+XGQ59OxysMpT2enRgR3DxyGrIc
 c1dxq3U4J/aYEtHPU4E1kjTRrNOKRtDaadtFG53eYm5NcEw46sJqxmF2U+ctAfdsd9nx
 D/vdVZI5Z2H52A3P3aYw4KRlpxIE0AZlKzhrUCo9edSPvj52lncsH2h8Mar3Ckt4PNaJ
 TFT4ZbxS2vfvedKXR+630cggAGsh0K4+X2Nnv32FsAJ68U1PIcy32YkZ0gwwRZ0jRGFY
 qRKA==
X-Gm-Message-State: AOAM530U1+27UESa6JoYNjC9hdgsEcS0pbkE/GNIFjXIFua4Sd6FGOw+
 2KaVCQPwZetmld9HxtZWkVurQgdc/Bljpms7ULg=
X-Google-Smtp-Source: ABdhPJwRvnHK4e9FuZZ286EO2eHunvWxUS+jw1hxD70l+wfbFL9aDwHZRKLC21a2KPKCyOwmNUkOhP18WuRSaAVXDjg=
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr8130354qvz.114.1593439286277; 
 Mon, 29 Jun 2020 07:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
From: Pekka Enberg <penberg@gmail.com>
Date: Mon, 29 Jun 2020 17:01:14 +0300
Message-ID: <CAOJsxLE47WP9aMY3nh=E7C1a_esHt=sBFWCnsVA2umZ7TZ6TTA@mail.gmail.com>
Subject: Re: [PATCH 0/8] mm: cleanup usage of <asm/pgalloc.h>
To: Mike Rapoport <rppt@kernel.org>
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
Cc: ia64 <linux-ia64@vger.kernel.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "list@ebiederm.org:DOCUMENTATION <linux-doc@vger.kernel.org>,
 list@ebiederm.org:MEMORY MANAGEMENT <linux-mm@kvack.org>,
 " <linux-arch@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 5:35 PM Mike Rapoport <rppt@kernel.org> wrote:
> Most architectures have very similar versions of pXd_alloc_one() and
> pXd_free_one() for intermediate levels of page table.
> These patches add generic versions of these functions in
> <asm-generic/pgalloc.h> and enable use of the generic functions where
> appropriate.

Very nice cleanup series to the page table code!

FWIW:

Reviewed-by: Pekka Enberg <penberg@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
