Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1799C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Dec 2021 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ex3mDr17302muq18sjlTEhhahePAFDQOeWQUufOcjeU=; b=TSClugFw3C8k7T
	u750Zhzukv8QbKDfL19sOPrrb9i+GvLK663fpVZNUAn6Cf/ikDWVUGDVSqNcEx4byRHpov2L2eFCu
	b601SiJSq04u3bQgX89ObdeM/jjedUB1uUFP+JvTPpUKOaiiZaTShoid4fdukZAaQ99BgbJJVLotN
	5rDB5dpRxmdQyRagejD396Xk/I70QcYI2JoBhN9qPppmLqRvZltblf/U7N6+dLRC6fTUziBq4+H5v
	zkTr8ADIlKf3HNGQV4pQ/XvC3D297lokoBSbrgt3arAtIX5n8YNBN+9gJ/t2YnvkWCDDYYbjgJOnZ
	aoY31lclLeFPNgpBA+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZmc-002N08-A6; Wed, 15 Dec 2021 19:17:46 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZmZ-002Mxn-DL
 for linux-snps-arc@lists.infradead.org; Wed, 15 Dec 2021 19:17:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so6712pjc.4
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Dec 2021 11:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MpRIgCk4ZJFF/gJ1HZ9vdVtdls/QLNUpGwB7jCQSxBw=;
 b=Uv+JuA27vFuhLd999/sNMMjAcYN5ZKNg+NcPZi4IQZmlR7NmiI07/NjTkoML9ICt0J
 erOe5NfO0cDBsejWpmdJj5Z0Qb4QWD6ixKdbRGkfHbb4WwXaGx8LmQOtnu0BMwzTRpPn
 8Ps4GO+SWpbfd0MhszStnT3ntE83PeutLQYDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MpRIgCk4ZJFF/gJ1HZ9vdVtdls/QLNUpGwB7jCQSxBw=;
 b=vJVD9XQ6nr3G6d2kgrH8TZtUvR93kTYcLluN/817HhgVb0MNAZfMbnXwwNVZKc3sZT
 Ja3cv6LhuiVhglOpkOwHm1Qzz/QYB3zeS6XgwQjphBltIVTWrF3JeJdrX4QHvNPbDvto
 thonXw3pDTlMtVPigi0TZUrG7W4Hj0lZMHJalFaCyvcMKSU5bcN01ds3IkYoVmLAnv/X
 nLgTmhuF0xGqSPjYL8R9jYMtvRzEwjrck6Ddd3HkqmjdmtUZKR/uAwzQrQqIp7y03Qxa
 dG2jB1ulpmcPSNPQQ//De5DBPdwtOVA1u4wH7e8vL5yoq835zLAseNQ9bQ+DOQczK/2D
 cU8Q==
X-Gm-Message-State: AOAM532V3KO7ibIW81nw5aoUrFpQQPEKtyll0xmziL1eXQsOk+YL0alu
 QIZivX1dslrelLBOY1QLKjMp7llT+BOwfA==
X-Google-Smtp-Source: ABdhPJxQqy4FmTEIwI7XqlNswZgdMWatFHXVHSW2fc4GQRSVKmKS29lary1WxSUz/TQYr33z2muoxA==
X-Received: by 2002:a17:902:f54f:b0:148:a2e8:276c with SMTP id
 h15-20020a170902f54f00b00148a2e8276cmr5725798plf.115.1639595861348; 
 Wed, 15 Dec 2021 11:17:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j1sm3700060pfu.47.2021.12.15.11.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 11:17:41 -0800 (PST)
Date: Wed, 15 Dec 2021 11:17:40 -0800
From: Kees Cook <keescook@chromium.org>
To: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Joe Perches <joe@perches.com>, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] arc: Replace lkml.org links with lore
Message-ID: <202112151117.804C398D1@keescook>
References: <20210210232849.1358703-1-keescook@chromium.org>
 <8d0dd35a-4bc2-6762-3ae9-a0bf38961f5a@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d0dd35a-4bc2-6762-3ae9-a0bf38961f5a@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_111743_496225_16023FA6 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, Feb 15, 2021 at 09:03:54PM -0800, Vineet Gupta wrote:
> On 2/10/21 3:28 PM, Kees Cook wrote:
> > As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
> > links with lore"), replace lkml.org links with lore to better use a
> > single source that's more likely to stay available long-term.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Acked-by: Vineet Gupta <vgupta@synopsys.com>
> 
> Let me know if you want me to pick this up.

Hi!

Oops, sorry, I never replied to this. Yes, can you pick this up please?

Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
