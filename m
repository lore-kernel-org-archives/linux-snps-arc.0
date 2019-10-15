Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCD8ECE59E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 22:06:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AD020854
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 22:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhVjSezc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5mFqjgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AD020854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk1U1tt8B2i9ef+iwJKOSIClcTfqc+/BUdztHYgml20=; b=fhVjSezci/bDYe
	3Ure//KULp3CIGznjc1r0yCcrpX8RaR6AZ2NJKIplYcZhNRff/vdb5i/NElKheTgpNd9v8WF95erG
	bk+DkL826pBdVQfWNv5X0ajeLuxOYMzD6/QpxkCXeHqTwfQmCAtdQNyKakkNhKfmeNYGozIWZM/4s
	Se5D5X2iY1KBjqB73nmGgc3oH5ZLpeyT17sfv2FS4T5IxrqEgN8F8C2/DdR3kjZ0ypD53exWTGJrL
	rdMdA0Wgm+iont2YMM/rn1dgfiaME12yxJuYcZCP6Za7gbAdf/Tye5Txe2VSk5BXuwgeyb1i0aWyX
	6xKe/7UPG2g/gkYjwKdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKUxt-0004M5-SD; Tue, 15 Oct 2019 22:06:49 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKUxr-0004LR-83
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 22:06:48 +0000
Received: by mail-pg1-x544.google.com with SMTP id e10so8981376pgd.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2019 15:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dYO7GjWloOND6hSPOAQvEuLC+MRq67dhIYtSI7PDZqA=;
 b=I5mFqjgmw/+rduOfSa7mdjY2+pVAum2a1hPeqtC+2baLDKGIK0Y9kG+jislEeUPrN0
 6DV9KDhYW84DcD4ZOgqof0Ysz/9vf2FbIiivaqgAiZKAxe4MoAamj0nEb47//Jfba8aq
 Lv550R4tE71yNe5+A0HCes9R/NvNAVKkr0bv6F18kU8HdY/9zGDiBSVqe+pQREv5OeAR
 Hx6KWY8JqRZYxAStOvrG9CLt1mzoDHyE7/LFTW786gem9sk42Q+p9sHczjGy/HxahiX7
 E3rpGfWcGXunrav4zcN4dI9ocfCE9TdunrQ2eKXi2VIbtDOfiP4G92GMIPPcraaI04S8
 sXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dYO7GjWloOND6hSPOAQvEuLC+MRq67dhIYtSI7PDZqA=;
 b=NiclB5ioZ8g6FxsgR9OvD0DKrKGvATn4qo45LOjME5GE8/0zeZmsLUZs1L7NyO3nQx
 0VHzW/Vr71scJjWXpMkTTNhg1qXyp1FuPTCQVIC/wUt8Vji42KOyuzV46M6VZz/3XKc/
 9hvRjieGQnGUpriuRGH8nODBRBA0q3MEUQ91qycpiBhFrMIwpUJxnTsrH3gy2kAzr6zO
 khjXUoBdaOnkn6Wg08Tr6hJ31i1Bs2/pxUEW37nkJMMe934lO2c6HMxYhhKm2bGc+NLC
 Iug8P9zSm92Ss+ZAGAd2yzPpOHJUdBIQRZyW5nlbZsfTizMP1PYsasuDYH5VeyG3wINd
 yGwA==
X-Gm-Message-State: APjAAAU+4y5pKDAf+9R3WLO/PdLjG4rs1mtorEbkFh325lgXkGBBExUZ
 AYouVbWAVwGNF9zMBd4yAVE=
X-Google-Smtp-Source: APXvYqxrxRkxDS61JrACgr6FX1z8oQ+rjZqY8ssnNx1gZukRLOwK/xG0kqhV2cKTvjvrk7K9ZLC6NQ==
X-Received: by 2002:a17:90a:6302:: with SMTP id e2mr878823pjj.20.1571177206148; 
 Tue, 15 Oct 2019 15:06:46 -0700 (PDT)
Received: from [192.168.110.119] ([198.182.47.47])
 by smtp.gmail.com with ESMTPSA id o60sm292236pje.21.2019.10.15.15.06.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 15:06:44 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20191015191926.9281-1-vgupta@synopsys.com>
 <20191015191926.9281-2-vgupta@synopsys.com>
 <CAHk-=wi3QC7tj3rmTPg5RmK_ugVKYs-jKqX=TaASWfd73Owaig@mail.gmail.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <a1aee16f-cde7-0bed-e1ab-f94b6268e4ff@gmail.com>
Date: Tue, 15 Oct 2019 15:06:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wi3QC7tj3rmTPg5RmK_ugVKYs-jKqX=TaASWfd73Owaig@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_150647_314932_9D53336C 
X-CRM114-Status: GOOD (  13.35  )
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

On 10/15/19 2:48 PM, Linus Torvalds wrote:
> On Tue, Oct 15, 2019 at 12:19 PM Vineet Gupta
> <Vineet.Gupta1@synopsys.com> wrote:
>> This is a non-functional change anyways since ARC has software page walker
>> with 2 lookup levels (pgd -> pte)
>
> Could we encourage other architectures to do the same, and get rid of
> all uses of __ARCH_USE_5LEVEL_HACK?

IMHO this should have been done at the onset. The actual changes don't seem that
difficult, just need to add the missing p4d calls although I can sympathize with
hassles of coordinating/building/testing/yadi yada cross arch.

OTOH, the [45]LEVEL_HACK seem like a nice way to "fold" the levels: the
skipped/folded level vanishes completely. Among others it does things like

     #define p4d_t	pgd_t	

On ARC 2-level code:

   free_pte_range
	pmd_pgtable(*pmd);

	    ((((((*pmd).pud).pgd))) & PAGE_MASK));	     <-- 5LEVEL_HACK
			vs.
	    ((((((((*pmd).pud).p4d).pgd)))) & PAGE_MASK ));  <-- w/o 5LEVEL_HACK
	
	pmd_clear(pmd);

	    *(pmd)).pud).pgd)))) = 0
			vs.
	    *(pmd)).pud).p4d).pgd)))) = 0


So we may not be able to fix all he historical misgivigs, but this might alleviate
the pain a bit. I'll try to dabble a bit.

Thx for taking a look and te ACKs.
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
