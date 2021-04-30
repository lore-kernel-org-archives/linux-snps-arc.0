Return-Path: <SRS0=2M3J=J3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBB3C433ED
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 22:53:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79CD61289
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 22:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D79CD61289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JK7QSHCgxw1/vDOpKG8LzxFGQ1F/w7OMhyoBAHZmobw=; b=jlaKA7IX6fINFAlhk39yPzuNe
	xfZTYR2ZB5+xLHeAvKnxIk2ZNJb5KVKghbvWQ6d48ndRVJHyq8kCeoiU0TUuaSYN0D0U3ohlLNzwe
	bBjpAFnT9928538CTp92W3MK8ERmW5MD4x2Px9mPtKMfep2cjPmtRfGGpMIX6Oj4IHanZAMqKYRuW
	MJl201eUTLnTMyMZArLaw58Il2GQuxqQkiYAOw+fHpn5BZ7lDtMHkXLyGaG+5mWs5DxnOdYGb+l96
	A9G0TXH6xvu26HmA3YuZP9YF94CITuyLx8psMqoufh5nrIjRBp4O4Bo/lvfRbJ/mT2hdL/M/wpRF6
	dFMrpsoCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcc1D-008q70-DD; Fri, 30 Apr 2021 22:53:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcc0Y-008pzh-Bl
 for linux-snps-arc@desiato.infradead.org; Fri, 30 Apr 2021 22:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/BTgt2rKyo5EHlL4H+FuDoTYjHpqVyUW/BzNOzPQCHM=; b=jF//t9qR/3MprHcrBRPOHo7WIX
 SBrEgtEModLxNitA5qpT/2iPnhaKSn8Ig1lhZZJWGTd9YLg7Cz2fkcXJssKO9fAG8eeCShd4hEX+q
 UoZ3uWUYaR+BKpAe+Z9DqbnlAQMtbnYZSZli6+MC0GneRDe0KKs4FBWNm7l3eEnTMKWBVIIU2Wz2r
 jjHJsEiNrLbHlk2H6D4vAq3sJsCC8Bwx0LDK+S8ACj9jj8m6oviQ+7FI1GWVaNttRqTJh3QWkHtLW
 oLJT5vZF5khfLYGz8CG3sJlVJbLHpB/9Y3HlZDcw4ioZ+80nOnLQONiPsHiKxkMfEhRKF9VGjo3vx
 PTAUXbmg==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcc0V-001jQI-II
 for linux-snps-arc@lists.infradead.org; Fri, 30 Apr 2021 22:53:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id v6so87595ljj.5
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Apr 2021 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/BTgt2rKyo5EHlL4H+FuDoTYjHpqVyUW/BzNOzPQCHM=;
 b=II0RkhMkk8xNobNV4veFb/WsfB9VX4ZY9XWsjhCjMyfKtBl4EX/nT1LOk5O8Wqjc8Y
 RNnxXNucaUDHr3yrtRUSzmTCKAyIqm3DzMtuemPTIxEMTk0DAT5qrV+5HI8EoyOrIxfp
 klKmQfQbyhSdVO9P44IhRZNOgz0BON76ogg2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BTgt2rKyo5EHlL4H+FuDoTYjHpqVyUW/BzNOzPQCHM=;
 b=Dyn/JDNLJ0ul48rkHuqy33De/XW9kEqBO2KBAOwqidrTOA1LRzi2RqkNWx4s/8eLk2
 v5+CxDHBMVVanTA72AQ9e93x4OtAB/ED141h1WTHhs25DjPKTgKhZIl3hlNlSRjld35t
 10zik/r87KfSEDZh1/U+xLCjL7qmQnYsP7V5q9rYQcFlC3j8SwAMH7hKTI0KaGPGxU58
 nPpQvcBNNpQq6SNFixN5M9LIT4ivcedNrQmS/vbKFOvyGFR87RgKtKQnzX8O+bQiauQ0
 rJL0r+T69US+0+gC+jopyVch3WMcJd9zTYAAjQLRyGDHKmmjdRm7m2nThEoMzw/ABR4c
 UzGA==
X-Gm-Message-State: AOAM530X/9eAlP++bFcCOgbwl2RUGUfmerBHoFzHftr0d7CLZqCHq16Z
 YsVyjgn22GVElUgId+SWMU77b2KCfl1YIf5d
X-Google-Smtp-Source: ABdhPJzBjyLGtr7wqq5VyB5URNf9qkFQ5mvd1aGu1am/Fax6wUCl2eqmdExnZ8aMNq0BFt2i9cZ87g==
X-Received: by 2002:a2e:864e:: with SMTP id i14mr5324104ljj.15.1619823189589; 
 Fri, 30 Apr 2021 15:53:09 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id m22sm404333lfh.63.2021.04.30.15.53.08
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 15:53:08 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id a36so70026ljq.8
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Apr 2021 15:53:08 -0700 (PDT)
X-Received: by 2002:a05:651c:44f:: with SMTP id
 g15mr5186411ljg.48.1619823188419; 
 Fri, 30 Apr 2021 15:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com>
 <CAHk-=wjJEgjCYzHZFPxTs01p7FMEHKKqXyqwRVBk6KnvHB1qVA@mail.gmail.com>
 <9538bb7e-a600-2211-6b4d-561b99f1deca@synopsys.com>
In-Reply-To: <9538bb7e-a600-2211-6b4d-561b99f1deca@synopsys.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Apr 2021 15:52:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizZ-HoBJ24TPFawS5zHqT+HcreqfmFRf3Cw4SS0NxV+Q@mail.gmail.com>
Message-ID: <CAHk-=wizZ-HoBJ24TPFawS5zHqT+HcreqfmFRf3Cw4SS0NxV+Q@mail.gmail.com>
Subject: Re: Heads up: gcc miscompiling initramfs zlib decompression code at
 -O3
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jann Horn <jannh@google.com>, 
 lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_155311_633581_0481F974 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, Apr 30, 2021 at 3:44 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> I agree that -O2 is default, but we've had -O3 default for ARC kernel
> forever, since last decade seriously. The reason I turned it on back
> then was upside of 10% performance improvement on select LMBench numbers
> on hardware at the time which for a rookie kernel hacker was yay momemt.
> I can revisit this and see if that is still true.

It would be interesting if you can actually show 10% improvement, and
also pinpoint things in the profile.

I (long long long ago) actually used -O6 for kernel builds as a "give
me everything you have" (I don't think gcc has actually ever done
anything more than O3, but whatever).

In fact, you can find

   Q: What Does gcc -O6 Do?

in some kernel FAQ's from those historical times.

We eventually gave up on it, because it just generated bigger and
slower code, and people got very tired of all the compiler bugs.

               Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
