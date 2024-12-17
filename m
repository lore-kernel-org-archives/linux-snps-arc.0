Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8165E7717F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Dec 2024 01:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF462z2A25+x+kTF2XhMzpmr3ftr7EFbka+RQ5oKlbY=; b=ekBXvoI+PQapEo
	M7PPUHWkXLjlfYo4PAl0lcQ/QumorbxWYS5Qjt1EWCzx00UfRDJlpVcf20vZCgBiyqDuIkHeQ8WlV
	RLR/Jjet2sBUZGvZ7avwYwV/meAyHg0YnB6v5GOd4nyfUwmxddX13HIaW5+vI+l8kKGtDdFznBu/q
	rycpsYK0C9dMxAxdj2cC0setAPMdz/aK8lTDyi2ePaE9qoBOi+oXXHsJwQXEDY8WPlUOdBoNzFC3F
	7+vE90LDZID68+KLRwSSNkw67gquoAkivmSbfrK4MHAbpgV5h4ZD5gyzHVfTDfom4bNJJXVCdBgja
	ncOtNErO6+6LWPv4oPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNM4l-0000000Bpkv-1p9d;
	Tue, 17 Dec 2024 01:08:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNM4i-0000000Bpi7-1pmn
	for linux-snps-arc@lists.infradead.org;
	Tue, 17 Dec 2024 01:08:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so642416266b.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 16 Dec 2024 17:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1734397713; x=1735002513; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
        b=HA4XLaG1HxS5mtz3VjSKyemmXQP039d98AUGQG7dpBhuEbn/oFJMhvKMP/SHah98xY
         CceuevK3426ELhciWG+HXR/SN2kNnWJeq6+Gb2tDYgo/lGkqynv7Y64LxsRUcoob0isq
         BCsPC1kMgouW2oaBgyaDwCsQTIQnDvCXfwMNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734397713; x=1735002513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
        b=bnYgYKR1Wqecq6+r35QdoLAsrc6lBsDGQAyd7ZOHUZoNON+j789qHrrkyUB/yry3BI
         lMXM8J5qb++QcRJQ4aFCsbBw0mdexZdW9RhyFX9Iut1RHYx4Iv6DySi6uCaXH1sQeLtI
         wse+3DwBJqSxy81QLD8dmLBRzcBt7IAWHGMOQBnj1WGNP5WoFcGlqSsRQ9japLo12cQo
         HDEaKbH3wEc+d0jCNfmJVW4nXhRL+ycCM1N0WbnGanFmdhh8Dhe6PWfjB/Ly7BoslZL8
         LccqgpDZIgvs10DcJ9GSeKoQlgH1ZacvYdHLBpUIKPBFFoE1izTHhdOWCAQ/W0jKhfQG
         UW+g==
X-Forwarded-Encrypted: i=1; AJvYcCVnlmJFjGkqbr30NIPu+fYFr2frfM0us+tEwIomb2SP3AZw7QUOmm4pyYy02PIDtdf+xyn47O03AAUB1j32Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz07L1N7uOF5x+U54e5vwUCZVlMtegBO1dvFtjmrY93xUVH17lS
	fXYHaT9/mVHuOETDmSdVIRFbEVmR/jwXF9rGuUfq2d/m3r+KryS4g62ljgvnNDYTVtxzYOXAdTn
	3zlw=
X-Gm-Gg: ASbGncvl9t2XI02qo65NGVQZnJElVIo9qFK+IKggWiE8F2xqfelnEJLc6GVjSY4WubD
	oT3E1LAtU8GmGJfdKZzo9C7Cx5y0V3HUQGtOgQiLvZi7URR0YyaR1oQHDzIhHP7XM4IMSPJeDqw
	ZiD14BGFbKdFD9hv3y303QLzv86WBOF+UIZJFGb1EyRTnkIASmBWUyJAHec2FCiec86Cwa/SUf6
	Ubl1alQ6KJMEbim1esAwac/zfnt9wtA+s3hunnlqnLB59O7tk72+gri+t7mvaOvRKBIOCc5CKw3
	4u+G5J2Kk8tlJ7xSa9lv95cjLtmB7Ro=
X-Google-Smtp-Source: AGHT+IF6s2XaO/FPibGfdciC/gDH/RoFpejl+EUp9JblY1vsL4UzpuC373gxnxkkAzmFGDB8ZOLfvw==
X-Received: by 2002:a05:6402:354b:b0:5d0:c7a7:ac13 with SMTP id 4fb4d7f45d1cf-5d63c409146mr39163033a12.34.1734397713460;
        Mon, 16 Dec 2024 17:08:33 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad187dsm3839701a12.28.2024.12.16.17.08.30
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 17:08:31 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so642412066b.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 16 Dec 2024 17:08:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtD3eV1UI5iOrnpsCYyAyQrvtIFiaRMHC4FwA2SJWODLeO8xMv9F2xE93JSSCddjBjoHiwHq6hnxaFglkH0Q==@lists.infradead.org
X-Received: by 2002:a05:6402:27d4:b0:5d0:d91d:c197 with SMTP id
 4fb4d7f45d1cf-5d63c3db906mr36599487a12.27.1734397709817; Mon, 16 Dec 2024
 17:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com> <20241213054610.55843-6-laoar.shao@gmail.com>
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Dec 2024 17:08:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, x86@kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_170836_465783_F0AF4B9D 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

On Thu, 12 Dec 2024 at 21:47, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> Since task->comm is guaranteed to be NUL-terminated, we can print it
> directly without the need to copy it into a separate buffer.

So i think we should do the "without copying into a separate buffer"
part of this series, but I do think we should just accept "%s" and
"task->comm".

IOW - getting rid of get_task_comm() is good.

But the "%pTN" pointer format ends up being unnecessary.

          Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
