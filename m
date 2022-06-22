Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD87C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Jun 2022 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbdzwpj4xsI10a5MhDZgYNU5qLY31dTi5hnSfMsucug=; b=XXuLZ/ffzrnRdx
	tXHzMOPekjPASPvQEC0I21w43jqazr7GFc2eOdL8SGvRzuPHoIUXiwo3o6wUm4Jv1bJIC6zR9fr6x
	KXh18cCfoLATyV7PrjFIn8R1ceLkbDNVZr1DyhewSFICcc9vkMJrdvQBiINQssK5GJr6vvYF5nWzU
	VyQAB7kVrdqimK9kKaDbZ0yqLSZmzbBIc7RkmwQM/HWebXo00mXQEsKms1fIRff/QTcjTT0Snx/n4
	jQahYdovjwTGwtwhfM+29J7xzTdnfI4eRrrIPvathLYDSQTmqGtjRwNXOoLg7dWVysmGHNTgq1vNz
	tlywCcrJ9ja7O1OhkYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vka-009FsT-Ln; Wed, 22 Jun 2022 08:30:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vkX-009Fqi-E8
	for linux-snps-arc@lists.infradead.org; Wed, 22 Jun 2022 08:30:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso16108670pjk.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 22 Jun 2022 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/QV1xhNLkkz0h8IzzTPXNrpcn+Xxag8bjiRs3XQqgwI=;
        b=LATwNoj2b+xZ/ysjmjybgebbtztcKbrBVf6pDs9mO4SYnm0mM72zHAlgMY8aNuCg2M
         JW7W4tOFgWUElxDKKtswpsV4paSDeKNuARi98OwA44sIydlKhr0f248X6M02bnFzhGMx
         hDKunLaRjfQ06XXPfXhkrzGDUX5koG7H+9uAdb/jF9f7mllS1yPWzgemxzoI6XmpfSkG
         VeBszr33/AZgEK8/Jofo77cIxXuGMV0qB2g9zR/bXpnQKAUI2RUdh8G6QXuBA4w9tuOj
         Pl+AwCXv6ADlJ8vc3CleZ0BhlCMx7H8QiKNJTdrSLKKpUDbcrg5k93ku82KsO6+1+Rp2
         1ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/QV1xhNLkkz0h8IzzTPXNrpcn+Xxag8bjiRs3XQqgwI=;
        b=RMYN2JPxNiYuKvxDKHVhxHEyAxPGUFapWBVQkbpIDV0og/aG7isj6P5MtoL2TaA3LO
         Agevn/aEfB6AZ8VO/h5jLGIgGujHL87huhhkw6q6oVGa/unUN8e+Er1vFKm5WLN0/6Pe
         Zb4I092U6JIf50NMQFIsEe2GaPq+h8OL2hk1DxwUcvH2TKvBNgCNzXslacjN2Da1IA80
         /w48A3c/4L/8vyM6pGrlYh87i6HGs510J5Rb1F+hKmsheqGKZKjoQfV40a9LkWC+IqAY
         Sv3f+/YD7i/BK7AhOAFMr8BrvJj9GeSEBWMbdTDpH57cBVTxc+CU7onNbfnjOBibneUZ
         Bw9A==
X-Gm-Message-State: AJIora9l9MFRc+YReMsyfc/6//lVwjOeFjaeDz0/7BTvBgAhSj/sReru
	fQckyB0YVPpWO9OOKDXhCBQ=
X-Google-Smtp-Source: AGRyM1ufYrno8gPJAyvKy8yX3pcx3oUU8loKpmmQcjf9tglwtJa+BIqirdHI16g3mh6x/A5HjIPhGw==
X-Received: by 2002:a17:90a:eb0c:b0:1ec:c985:bc06 with SMTP id j12-20020a17090aeb0c00b001ecc985bc06mr8666617pjz.30.1655886605864;
        Wed, 22 Jun 2022 01:30:05 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-12.three.co.id. [180.214.233.12])
        by smtp.gmail.com with ESMTPSA id i185-20020a626dc2000000b0051bf9159d2dsm12841354pfc.208.2022.06.22.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:30:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 60590103801; Wed, 22 Jun 2022 15:30:01 +0700 (WIB)
Date: Wed, 22 Jun 2022 15:30:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: vgupta@kernel.org, Julia.Lawall@inria.fr, rdunlap@infradead.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Message-ID: <YrLTCXLrr3HB39lv@debian.me>
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_013009_502260_4B8FC635 
X-CRM114-Status: GOOD (  17.24  )
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

On Wed, Jun 22, 2022 at 04:04:23PM +0800, Jilin Yuan wrote:
> Delete the redundant word 'to'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>  arch/arc/mm/cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> index 5446967ea98d..84fe78c41c37 100644
> --- a/arch/arc/mm/cache.c
> +++ b/arch/arc/mm/cache.c
> @@ -750,7 +750,7 @@ static inline void arc_slc_enable(void)
>   *  -In SMP, if hardware caches are coherent
>   *
>   * There's a corollary case, where kernel READs from a userspace mapped page.
> - * If the U-mapping is not congruent to to K-mapping, former needs flushing.
> + * If the U-mapping is not congruent to K-mapping, former needs flushing.
>   */
>  void flush_dcache_page(struct page *page)
>  {

The patch is OK, but its subject is wrong.

The patch above isn't fixing any syntax errors, but rather minor cleanup.
The subject should have been "Remove duplicate 'to' in the
flush_dcache_page() comment".

I think that this kind of cleanup patches (typofixes) are best done
as part of **actual** work on the code in question (for example
refactoring or fixing build errors).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
