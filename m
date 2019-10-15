Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D44CECE59D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 21:49:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C192064A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 21:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RyoR+Zzi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hzBYiXjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4C192064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0+wurx8ScAxF/omAJUzxT5aoBWXUi+pvCpFQzwTHec=; b=RyoR+Zzig24VaQ
	pcJJvOFKbtV3qTBfxIQhqfv5AtSEilicB3sD6hzt79W96Yrie0GEYjg2S0BZQtcttTvk1565yr0fm
	8IOY8QEYDzNjKFir438h/usqVFp65OHxwwc4FsKvX7cuMSJOqSTMVLTgRs/6AAVjnj1iZxMYvWqRP
	8cXMt7t3nYnbRuuU6RZ8QiAYZMeXie4j8T+wkdwSL6RqgWx21i5aRxs/Ateu3ToMweAripZHUbyYa
	KYpoIKpSJHVOfgpDH3m22C41J71oqQefLcDJuMLPGHGdoIH51hpkkLteY5PyJDcmTsXK+7ylKzL7Y
	ve2aNomzOiEpPs6Z/pGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKUgi-00066q-QZ; Tue, 15 Oct 2019 21:49:04 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKUgg-00065w-BY
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 21:49:03 +0000
Received: by mail-lj1-x243.google.com with SMTP id v24so21826088ljj.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2019 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wItDXbX3LEWoTo1/kp4dk8aeAZ/2xJzKQP/tyONQ97k=;
 b=hzBYiXjPBdQglMHyHwZdH7Hfwgp8qRgeHE6/0plo981vFS0npABggAoHWs92Y0M4j4
 6yInWWbjRDRm/aBcc9LUQovQyVPjXs9u2abaLNMMyRfQw3SRznL+/RbI8WTdojuOz1np
 +b80D6JSR28AZDW+EGzyd7AudQJVj7qyOksd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wItDXbX3LEWoTo1/kp4dk8aeAZ/2xJzKQP/tyONQ97k=;
 b=KRCErq2LoMkrlJzcas/EDpNXjMstH29/dZ5F3FGs4Xig0bpUXy93PKNfGBfzPx7XwI
 S4dCshuszm0IMZKm9eCZVR4bm5MQGGk8HlrKJw4cHoRQwJpVoo8ciQ6A0y0RXPu74VqE
 VvmhqUYLDn/aBQXr4zV10tEJsio7iH7UDQRYf2LKKvV1lKcZ1G6TvfMnuAiqtRsGKBKE
 4xAzH758uCXrju4lpVv5jFsMScdg2OtXf2U6Jy75pAy9odQqUYg5O79KT9S6di2xTB17
 paOHyY5pwik3gel5J/n0QkX0/8PYT8f4LaWX0fHEzSXKkbASA7HQ0ox51oqrNQ4/pRKF
 Ozew==
X-Gm-Message-State: APjAAAXMakF2xTuJqZnG48UDKqd6qdRTl/o3r2a4lwziAPfyvzBpzK44
 7Aonx8TW2HE0KR4TfAR/mz1RLUlqnUs=
X-Google-Smtp-Source: APXvYqzCk4cwXVEn0dtKHvhdst9x3WiajRNPXMags/KLsWAnEqA/c66aqnQymUsBuEHVz/7o4/ok3w==
X-Received: by 2002:a2e:9257:: with SMTP id v23mr22819572ljg.220.1571176140107; 
 Tue, 15 Oct 2019 14:49:00 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id g5sm5327111ljk.22.2019.10.15.14.48.59
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2019 14:48:59 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id t8so15628154lfc.13
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2019 14:48:59 -0700 (PDT)
X-Received: by 2002:a19:5504:: with SMTP id n4mr4137650lfe.106.1571176138790; 
 Tue, 15 Oct 2019 14:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191015191926.9281-1-vgupta@synopsys.com>
 <20191015191926.9281-2-vgupta@synopsys.com>
In-Reply-To: <20191015191926.9281-2-vgupta@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Oct 2019 14:48:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3QC7tj3rmTPg5RmK_ugVKYs-jKqX=TaASWfd73Owaig@mail.gmail.com>
Message-ID: <CAHk-=wi3QC7tj3rmTPg5RmK_ugVKYs-jKqX=TaASWfd73Owaig@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_144902_396379_5C81F950 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2019 at 12:19 PM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
>
> This is a non-functional change anyways since ARC has software page walker
> with 2 lookup levels (pgd -> pte)

Could we encourage other architectures to do the same, and get rid of
all uses of __ARCH_USE_5LEVEL_HACK?

            Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
