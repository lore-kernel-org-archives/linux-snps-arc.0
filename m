Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC8FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 21:20:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD51F613DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 21:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD51F613DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ryGYLB5XQSnCFoXnpaz07IRcXBeeeBpgMjbLalzayMM=; b=J+smdKRIeE9cj4CAm4LT47dsH
	tOWgPBZmBE6Uas46mhmlH8TfjG/5ue0bzvkjRu8gXeCWvQYzUlfKecgzkKPDrwgg+3t7/kOlFgmMp
	+svgB7ViNOHqHAUsFyIEnI6WHr8UQxIUlP2Zuf8s55LVsmiNaDmbVeQgLSe6kqaCtujqqhM9mZoFj
	YvhSHDvf4u6ZG0n72HdzZSBlUstVmxvmWw6Y1GoI1piqrTDqen3vya8w5XnIPbItGXhm3VzrcWlW0
	NAYL0vT3aywHOAAAU1q+dALW2cWi2srgqxyxycMJcNLYaEtZVHhzThIBUPjJP/D0M2xK5mnJ3yPE1
	n4KXus25g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYxnj-00D4MC-1z; Tue, 20 Apr 2021 21:20:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYxnU-00D4L3-41; Tue, 20 Apr 2021 21:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uNQ4B07ow0uHEA97N3A90TkRt7nsbqDUOE9+zR7Q87E=; b=mVxTYK/Nk8D6jUnyceWhRv1u8J
 8GnhH/GKAIiBtPXHmoNKifPNwJVo1FpZ+QEwMwzANTzoFhXp4wak3aX65FGbB2nm3fGfJU/9t4pZm
 AlxsIHu4tTaM+in4IQFjy4ciW0FNF1bx/te7LxfJGEqXV2qdVMiYCFUkeGDc09ZHnjQwhSYKPNlWH
 yRDGHJRMiigcbik+Gq2jBQw2lp5PtXfUnZzLhl/cn0Zh1r1SYuIakAcexGIkX52y8CqECe2+q8+OM
 Tz6m/zmo2fKC/Kego8pjAVpqvateNShE7e6/+lFOcVPRCJ/ubMCIjGVA+OZx6cwAcHxA7i28RSKSr
 xCylJ9rA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYxnR-00CQaN-Ik; Tue, 20 Apr 2021 21:20:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB250613FC;
 Tue, 20 Apr 2021 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618953637;
 bh=D/HoBu+aWo6sy7+88V9ZJnpot0ZpiBRBCM4AzeXp6I8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pArvFq3Bg0eznwDb5FJ1AJDg4uGehP2ZXKHtXg7aSehY89wKEHnhCX/mVatOV6ryT
 nDf/2gvwWh2BDXh18chg97cOw9UActFB0apxymDDRvGmAtrI+L2MxaIEWgzX7jpw9/
 I6JLRl8kn9AQ6J9IvmQAviE14HNt8N/LqXSJX6Yc8z5xS4zHK7FHiFEETtVwkWVrGB
 ni8KvuVndFviPLslG4RxcSW6KHg6Ja1EsEaatvDzQRx4T0hna0qzuUDlgNWehOQjdA
 mm7h1tAH/Yrc26ZqgFuXReHd0eXJu3ggmg3bvbxA6/Qfv+QEPBu4PF73L18ZgMJocn
 /MnvOs1utGgKw==
Received: by mail-wm1-f43.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so76106wmq.4; 
 Tue, 20 Apr 2021 14:20:36 -0700 (PDT)
X-Gm-Message-State: AOAM531rQw6+p5uzAbTrZ42R3ZjazOXH8wOeAm7NNaJmGrgcVccpxB27
 go6SXXNAQ3wwMeJ9fjNog+iFe9k75Kcz49JOHRs=
X-Google-Smtp-Source: ABdhPJwrEit0y72qRaTuoH/3wg/uStL6F0tnFo57QDj1Zmqkrq7O3+IN+SwFnfTQrVplKgk1AFIl7KVtwhj1AIi6XmY=
X-Received: by 2002:a05:600c:4149:: with SMTP id
 h9mr6135531wmm.43.1618953635407; 
 Tue, 20 Apr 2021 14:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
In-Reply-To: <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 20 Apr 2021 23:20:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
Message-ID: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Matthew Wilcox <willy@infradead.org>, 
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>, 
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_142037_718456_74EE7FB8 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, Apr 20, 2021 at 11:14 PM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On 4/20/21 12:07 AM, Arnd Bergmann wrote:

> >
> > which means that half the 32-bit architectures do this. This may
> > cause more problems when arc and/or microblaze want to support
> > 64-bit kernels and compat mode in the future on their latest hardware,
> > as that means duplicating the x86 specific hacks we have for compat.
> >
> > What is alignof(u64) on 64-bit arc?
>
> $ echo 'int a = __alignof__(long long);' | arc64-linux-gnu-gcc -xc -
> -Wall -S -o - | grep -A1 a: | tail -n 1 | cut -f 3
> 8

Ok, good.

> Yeah ARCv2 alignment of 4 for 64-bit data was a bit of surprise finding
> for me as well. When 64-bit load/stores were initially targeted by the
> internal Metaware compiler (llvm based) they decided to keep alignment
> to 4 still (granted hardware allowed this) and then gcc guys decided to
> follow the same ABI. I only found this by accident :-)
>
> Can you point me to some specifics on the compat issue. For better of
> worse, arc64 does''t have a compat 32-bit mode, so everything is
> 64-on-64 or 32-on-32 (ARC32 flavor of ARCv3)

In that case, there should be no problem for you.

The main issue is with system calls and ioctls that contain a misaligned
struct member like

struct s {
       u32 a;
       u64 b;
};

Passing this structure by reference from a 32-bit user space application
to a 64-bit kernel with different alignment constraints means that the
kernel has to convert the structure layout. See
compat_ioctl_preallocate() in fs/ioctl.c for one such example.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
