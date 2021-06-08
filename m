Return-Path: <SRS0=KZrG=LC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C8DC47082
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 14:54:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C100161183
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 14:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C100161183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftMq/YhOGBFFO7u0VR7OQ0vVMfUvGwN3OVMA3/PAaHI=; b=K4aOr7vCYU1LIl
	WqCWp/Yb2iFotO5cZ09tOLOZfWwg5FJj0P31+jS6x28FrwoZhod6Ejsdwd17HmK/A5t1xPO0zG5mD
	6Ug82cuHWbRfB26I86pc1LSwmmLNocjprkTds5Rf9hoJVO4pR1xssNWth0kb7am3zNmCmpyP1rC8A
	WvVUZW98lP1l1VTPOfq7P0mLxeuHh4xphe31rlXRoyAxTaAmlQjnWl9evSyOZs9Hm2xqZWcoKRawd
	qgdfGzl3CYx1yd7+ykhhEANcSF6khnZgEuIEe5+aFl2BWRfggGITYXCGd7I6TcyiqwC+BHdFx1KZx
	VRU1CWWr01owrb1EAwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqd82-00929S-7J; Tue, 08 Jun 2021 14:54:54 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqd7z-00927s-HM; Tue, 08 Jun 2021 14:54:52 +0000
Received: by mail-vs1-f43.google.com with SMTP id l25so10995849vsb.9;
 Tue, 08 Jun 2021 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AJ2s6Swi7DKePDYPTjpM9W7XfKGuXx2NmxnXLQgYSU=;
 b=rU2pKJ75Y3/QHhh8al8WEHFkA1xcRM5SZMWEuWTFwhfJJj/V+31x/44DQ1/ocvOPg+
 HHLB+cX2JzVE7e8VyhwDv4Qz2FVNR+zh+m0OixPYjyc4fzjuukhztIpMy0r4QCqs9ENM
 rx2wn2LyftAjOv4hRMViR3COc1TqDPy9Jwcq9YGNqCboxfBQc5R+uHuQkEmoWcUMg/uD
 GgTRTBH9LOsD2SMP7YGpIDk7kjlQlU6IpzX1idxEjiKF6VTF7R6q/SsI4HkaBei2kO/c
 foGKHLzxbvnAfZr24OLQ0mXOUtMYfCqu0p3aPHXa31jtaApPg9eDz4MFF332lbCsxpOF
 vhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AJ2s6Swi7DKePDYPTjpM9W7XfKGuXx2NmxnXLQgYSU=;
 b=jsJGAmKB7VuFPKCmGHA6gEst2ZFsoqwbzHvnyrzImptUSlLNluMMPrK6QcWiRx3VXK
 IvNhmUDv5211aDEa4v2r8WmyjkswqTSJfR/3+/fZkiYSNhJHBprQRBLlzInlr9CC8Q7p
 7nG37U9fuOkQ65Hm3uXJmfzHQpLBTQLClwWBzeJtneVdT/FJ+2/XLmFBXMbODvHcecN5
 d4htbI4YKb6IYgSuElnZ7VnlBzCxDKJ6eCJid0TkCSdhGRUPMAjk2SW3FXqG2k0HtknF
 u7ygpL+kiqFzFlLWqCy4C20FA0/JffsRVQnmbImkbGRK9qOs9ys9DTUIzgWi8Pt1+WiJ
 FF/g==
X-Gm-Message-State: AOAM531SjvodA9OErxIZR2cH/T5yc4DzjPy7BendZBPi5a0RREXMa7qm
 j4dBYQmuMmErsaJxfqDLpcgYXH7i2fL7ZbXM/WI=
X-Google-Smtp-Source: ABdhPJyRLWrfWEbRY82WKzbAaqxe+Tz0Rq9l4OoSLSgaPe9ZQ71sH6V/8n9uYyj4peJXY7ySMuwi8lVHUHfIxXWhTlU=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr149235vsp.59.1623164030307;
 Tue, 08 Jun 2021 07:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20210608083418.137226-2-wangkefeng.wang@huawei.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:23:38 +0530
Message-ID: <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
Subject: Re: [PATCH v3 resend 01/15] mm: add setup_initial_init_mm() helper
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
 Linux-MM <linux-mm@kvack.org>, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, 
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
 linux-s390@vger.kernel.org, X86 ML <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_075451_590430_BB8E464B 
X-CRM114-Status: GOOD (  15.88  )
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

On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Add setup_initial_init_mm() helper to setup kernel text,
> data and brk.
>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: openrisc@lists.librecores.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: x86@kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  include/linux/mm.h | 3 +++
>  mm/init-mm.c       | 9 +++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c274f75efcf9..02aa057540b7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -244,6 +244,9 @@ int __add_to_page_cache_locked(struct page *page, struct address_space *mapping,
>
>  #define lru_to_page(head) (list_entry((head)->prev, struct page, lru))
>
> +void setup_initial_init_mm(void *start_code, void *end_code,
> +                          void *end_data, void *brk);
> +

Gentle query -> is there any limitation to add inline functions in
setup_arch() functions ?

>  /*
>   * Linux kernel virtual memory manager primitives.
>   * The idea being to have a "virtual" mm in the same way
> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index 153162669f80..b4a6f38fb51d 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
> @@ -40,3 +40,12 @@ struct mm_struct init_mm = {
>         .cpu_bitmap     = CPU_BITS_NONE,
>         INIT_MM_CONTEXT(init_mm)
>  };
> +
> +void setup_initial_init_mm(void *start_code, void *end_code,
> +                          void *end_data, void *brk)
> +{
> +       init_mm.start_code = (unsigned long)start_code;
> +       init_mm.end_code = (unsigned long)end_code;
> +       init_mm.end_data = (unsigned long)end_data;
> +       init_mm.brk = (unsigned long)brk;
> +}
> --
> 2.26.2
>
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
