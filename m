Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA24C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:52:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1DD24658
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 21:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ns2J7njW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KZsiFFqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A1DD24658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aArY2LTSWxnUvoPh8RCFoz7889fNAtwvyiWzduUFicI=; b=ns2J7njWSHWyB2
	8TxOC//ayH2C0+43gsRuTuegZIbJwp2JgVRJQYTlBKNcOUAxxmegtnYquI3rvK9Qj/qv+94YSLp3b
	chFWYU5XpGxGx60BTG/Prw+rjJF8v2q/m5cf5U8aPYX2eklVt1RKfOPf0ceyWTN8+O1P7DweWq353
	GLtRLraTJnm1L2gjMSFtLNkD4R5vvHUMLgS6Sa2K3aeR8ZuGNbyAC1cSCKe245Uf0BMEKtxWASPS2
	AVEqRpflKvaUVvnPudHJu4/D388Ojg4vaj5sJUnUhNU21UCBvxcX061cvUIwR9R+qyTvjigxpa5yr
	k3fCA44d9coTq6f11a/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irU6b-0000PX-6o; Tue, 14 Jan 2020 21:52:09 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irU3v-00058y-Fm
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 21:49:25 +0000
Received: by mail-lf1-x143.google.com with SMTP id l18so11051146lfc.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 13:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vctch71naqEGLrugWbqoCH3ToLlQlQB3yrVoOl+SPvs=;
 b=KZsiFFqPOkrryEiWdCUg5hoXCgV2OLEIU5JBuDM284Mh6WRn/AjOiD1HtsNJRqviVx
 9kKzxAmtgZreU18bWEW2HXaM6Ao4fNRodAVWs6R4i29I6H6YakNGcUy2JKOXR0tVereO
 66FAx40w7vVtGWNG+UhiUq933mXri6+ihEilQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vctch71naqEGLrugWbqoCH3ToLlQlQB3yrVoOl+SPvs=;
 b=Pdy0V7zkBBLStn8i3af+8WzwdinRJsA3HgVgRF2wVxrIbJjZdIKoI7RnIneqZeFY8N
 K26CN0rD5DwQhFyqKL6jVqsOh7Vy/PuDcxKB9WU+WlwkgX/baU5yWcVxTghZjAb6H/3Y
 ynqvyPGl7FkAeZVqYCqdHvsH3uIOnOIw4pHV/1kr4VVd00+Cyw5yPW+Y1V2WGq+mpRSC
 Du3V88Z0CXeYg8qKqUUJf3YbJQMJ1rvprjhEU8XS0btIcVs+oRpqX6ZlqOnaeWosmkd7
 cJNomaWkU9b4S/PMJCK3ycGN9bRpJR3579VqR7dkvOZtgXX2SZbECcthVSP0rYm8eh1V
 ZePg==
X-Gm-Message-State: APjAAAVxMvDesp9pS8Zlcm/KRADULmIrqPccCmTW6EzLxlrwcFOJVUki
 hTLCLZ0e07EUKh4icnf1eMUyFWycz2w=
X-Google-Smtp-Source: APXvYqxHjEibCQKQNLQkZtdlVoSWloPUVuCqqsvyTt0iTVyNqUSnvkNaoVs/EHKVgQJhWai5B95+zg==
X-Received: by 2002:ac2:52a5:: with SMTP id r5mr2892548lfm.19.1579038560741;
 Tue, 14 Jan 2020 13:49:20 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id i19sm7862386lfj.17.2020.01.14.13.49.19
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 13:49:19 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id y1so11040144lfb.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 13:49:19 -0800 (PST)
X-Received: by 2002:a19:48c5:: with SMTP id v188mr3185145lfa.100.1579038558938; 
 Tue, 14 Jan 2020 13:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-5-vgupta@synopsys.com>
 <CAK8P3a2GUqmcA_q33=20OrK1+cU4f3mCrgci_bO3ho4B5PRODg@mail.gmail.com>
 <3734021d-1756-3a09-6595-14ca58c64bf9@synopsys.com>
In-Reply-To: <3734021d-1756-3a09-6595-14ca58c64bf9@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Jan 2020 13:49:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjX-c9YpPhbQ073UPnTvELNQCN49vqK1yY7JGuHSn5-ew@mail.gmail.com>
Message-ID: <CAHk-=wjX-c9YpPhbQ073UPnTvELNQCN49vqK1yY7JGuHSn5-ew@mail.gmail.com>
Subject: Re: [RFC 4/4] ARC: uaccess: use optimized generic
 __strnlen_user/__strncpy_from_user
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_134923_627610_9576E827 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 1:37 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> On 1/14/20 12:42 PM, Arnd Bergmann wrote:
> >
> > What's wrong with the generic version on little-endian? Any
> > chance you can find a way to make it work as well for you as
> > this copy?
>
> find_zero() by default doesn't use pop count instructions.

Don't you think the generic find_zero() is likely just as fast as the
pop count instruction? On 32-bit, I think it's like a shift and a mask
and a couple of additions.

The 64-bit case has a multiply that is likely expensive unless you
have a good multiplication unit (but what 64-bit architecture
doesn't?), but the generic 32-bit LE code should already be pretty
close to optimal, and it might not be worth it to worry about it.

(The big-endian case is very different, and architectures really can
do much better. But LE allows for bit tricks using the carry chain)

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
