Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9195C5479D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Jan 2023 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMP41VH3ussGfQGeSe+Vy+TSDsL9cKRMhBz+bbRfoaQ=; b=dcq+gZQtO10EPB
	XkTs8PD+zjQyVoFMrYjzych8Yly2df9tcyg4HAUUek5/Renxn1XeHalLCeOylv20AZGHTy8nit3HK
	KCMiOrxzQc3/ppwftFOQqveQCzIwpYWp14jyZEaN/t6GLzd2qJsAmyRNMn9GIL5JALB76ipHQGnO6
	lMaAcbWpXM/cN5/G34G7A1DACUjhR7Obck/UpupOUrQQcJ4GOpYcIetQ5b30m/R+Zo6J12p9luLOt
	Y5XjCJGDF7M4bFS72eD6QNA/qzlhWeYCbNqE0Sj9KoiThYs8sU2G0V0Q8SHaPDgk2mF/nZP/16a6+
	t/eXBhgpwUSaOT1Dh2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEnU6-000NyN-7q; Mon, 09 Jan 2023 08:26:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEnU2-000NxN-N2
	for linux-snps-arc@lists.infradead.org; Mon, 09 Jan 2023 08:26:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so5962652wms.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Jan 2023 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtUHkTRRfiNW5TLc5bwX/ucBfvpI6oGzoNoxA/kdcb4=;
        b=PX/Re6EXO5D5x2aOrBoI7eA99YcH6y0uQW4Vy4O2TGXKH6hdNRvrsHnBZ+Ubcv6tiQ
         TXL+WU+PKwozsVIYHmrowUrubNx4OdxGGBXm6FVfKXw/LCApwYZoSbyIsca39fx+QV1E
         3ZxqQvtEQCEoLV/2KlNULgPiCnKnr+TvOMtU57t0W/50RjnVAUjWgJD4D+dA59AVoKWh
         GEf+f2o1uqAtruBo7es8ttxLoVYaE+bRhLQe3VRGhpiyVNwe01Snp693OaYjzSAdrzV4
         j9VOFaaboM1rMGg1fsBk8OrP0MfGOgOoXRKaV7Ugk8swmNYtUZuiZKCDU98Ui/EnhUWr
         TFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtUHkTRRfiNW5TLc5bwX/ucBfvpI6oGzoNoxA/kdcb4=;
        b=m7eGipO+YG89ugkYVrOq6KnRCA5y9I7u5cOyAqn7qDvRBKSR3BEoMy9fXGyHDTrwhl
         kd1vb6k1BCQWf24djO6LYF3jvPnXFFv7fbCgwIhBHjYXECG57QpeY++uxyD5K/mP5GUb
         kOp/mOEqZiBJHf9LAoVNiUH1QuKD8XRatL9Ebz85mk6ULE5TT7+CHU0vGIJtHe3li3UH
         vufsfrA/KqgbGrLBUDj+EOOWv8HDMB/u9YQyyYaXaNBeWAEB6QTc9Zb0xzn/m+ep3ljM
         x4JpjQznkkqfaKOAWolwEJp7Ft1A5FnhSJx65XTFgTK/6ntVYOcgFdu78mLHpPYW9nM9
         bxOw==
X-Gm-Message-State: AFqh2kqony8wzY3FYNqexVlt7ELdiNtLpek48UkYj/RrXZVf1wPPvsGm
	k4sglraSVAx3bdNk/cwpjcw=
X-Google-Smtp-Source: AMrXdXuAKMUeskJfUuvD8C9z9OcPka00Get8EuUaW0pYUVKXK+LmkvJIxuFXAbNoY9jOuXApvBte+A==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id n2-20020a05600c3b8200b003cf900cde6bmr45739129wms.15.1673252776288;
        Mon, 09 Jan 2023 00:26:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c4b0600b003d9e91cd08dsm5605620wmp.4.2023.01.09.00.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:26:15 -0800 (PST)
Date: Mon, 9 Jan 2023 11:26:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bit_spinlock: Include <asm/processor.h>
Message-ID: <Y7vPnXaUBXPwO0Bj@kadam>
References: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_002618_837766_D0FA32E8 
X-CRM114-Status: GOOD (  13.34  )
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

On Sun, Jan 08, 2023 at 08:04:44PM +0100, Christophe JAILLET wrote:
> In an attempt to simplify some includes in <include/dcache.h>, it
> appeared, when compiling fs/ecryptfs/dentry.c, that <linux/bit_spinlock.h>
> was relying on other includes to get the definition of cpu_relax().
> (see [1])
> 
> It broke on arc.
> 
> Include <asm/processor.h> in <linux/bit_spinlock.h> to fix the issue.
> This will help remove some un-needed includes from <include/dcache.h>.
> 
> [1]: https://lore.kernel.org/all/202301082130.LXMj5qkD-lkp@intel.com/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure who to send this to.
> get_maintainer.pl is of no help, and the file is untouched from a too long
> time.
> 
> Greg? Dan? Any pointer?

Andrew Morton is the maintainer of last resort.  Plus spinlocks seem
like something he would be interested in.  Otherwise Ingo, Peter Z and
the x86 team.

regards,
dan carpenter


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
