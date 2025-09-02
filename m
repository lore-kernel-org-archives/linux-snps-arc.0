Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE4CA100E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9yH3VFhd/Drssr0mQwpGdiymy8ztO7O7xcxuOg01Zg=; b=2mN5+4Wrr0dHv5
	y2k/Ek7IFpfx/k8r46bzhpT6RxMxdhE7K4C9rbacBQCE/uwVLHeTQ7o9a/iMI//Z2H11WnlnP27ND
	Pxe17lgBPi6Ks1raSR6E/Ice3xHhF9uCKztg7t1RwJXUz1U8GXZlToEnq7AokmNd0JX5eaAvaNKVA
	h4yTHDoaHJa0a7GqnIewAp/CLei9rsfZPveZr/G1DIjHzVieK0ZdycmXUg5pjH7wOer2afXNSaBlu
	9+cS6taPx+BhwwPLHt0qFLLV+JeWKseiJWDfo3aO3GudhzGxaQxFKRE0KNJ9Az5COwwSJGsFRdeBt
	zdJ+P5YHMY4ek6xmsqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj0-000000038nt-2kY2;
	Wed, 03 Sep 2025 01:55:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utaVj-00000002cNg-21qW
	for linux-snps-arc@lists.infradead.org;
	Tue, 02 Sep 2025 23:34:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2489acda3bbso47942855ad.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 02 Sep 2025 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756856038; x=1757460838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gAzJ/mYc64utzpgd4HFHI/h/o1xEjnEqOHUAiimbwZc=;
        b=DTPrtpqGGiW1hUaXpMWfuQOYpXGTc5ZLGWVRri3GknpxGwntpUWG6NObLw8vDgtfxL
         AD3dkLmQst1UowxRsXP2AxDVbDWj9kND2p+vd+3mNvh2XFRqaYcaV1OD8SWn1s1vAV2n
         T48pu1+nPD7Vtzn7lS0CW8EV88nsdNQJvrkxH0FxQbEH5AZyKqc1eAmk06cijNc5Z7Bl
         ZPX2Gee0+SGN47DNSDmLiT1YxpWCvxmCALVHae7o+Y7KewT4yf4NnSUVrMB3Oj+Nlils
         awVTyOnwSTLq9pFhpjYk1U0z2tEPYMQWCbheQXl8AKzf00FSvyeZq6HPdK7kjEdj5rrL
         Uf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756856038; x=1757460838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAzJ/mYc64utzpgd4HFHI/h/o1xEjnEqOHUAiimbwZc=;
        b=tYcGC332ol0Bo2+V8aJ2v/dggVe8n6atRVNEZEAsJjmSwwevC/h7jyyJ2IXMZxLCog
         eF7hkCxSlqcBhgg10Fz50ltGjjYGQOCFf8LU0t+3pxDzqK+rROmkTIS2SY9ax7PHA/dQ
         XaXmmzzGe3Zw15BvSV/3o71Mxi1iTJqKZdSF2QHdoQVDtg8MmloJTHG1EcTh/OvzEoXh
         6IKSop7ahlTkj183frRPlT9dFAAf/GaiXhpUpmFknQJty9B5Kwb3+CD7+jOf/VG7bGBC
         BB9TOl63nc9qrX9e+X8vUCr7r4ANAdTvq3qn7evqANtzbPJtl4doay2rPD4eiEOImB7K
         s2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWIJFlxB5okepnV5bVecHsf/SPsO2XaIKx77pRPMgyos585l29dZBUcphjGV/VORa3vJAV5x+vu2Ml8NGnu8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrCwFMHYh9b8RDVB0EdK3zNoiMwxQCTqiYw5XZ3YBzLvimKmJg
	A9pPpNqTv78XAIjClhWE9+LTLmwan8DW2f0K4l9sgyhHngHaqxju3vRSyfxuUA==
X-Gm-Gg: ASbGncu8RXAkGkqPLAc1M42ehCynz1I478xzSstnsFtV2rod1HHvj4UfEp9Ys4oBG1C
	DpMm5mJeNMEUlvuEB3GlBE/oBen3TzdQNZyeqNYeL8jVsPBphKE3eM8+WP2IThUgR1qVBjOyIDM
	VrZu13k+ahYdDlUrWDuPTwVcZ3YRM0Zt3qAcequOXuTQSS+87ckc4NS62Im8Vt9t2RL5wGtIhka
	Y0P9I/KeVgN4WghqDo7fosTzLAggka1mHZZof8lWm6B+p03PD8TcXKm1lOjlSj2SYX4LFyVH/2C
	TphG9fhaUN0dYBSnsDHoBEqFWKGIrn9sSV6ufnvCquAk+3pwRt/vcndZTql87Zr3+pgM+HF5yq+
	leEL/yBGiWj9YOYD9L7eeDhguJcq0St7Pp5qyPXdub7U=
X-Google-Smtp-Source: AGHT+IFCHMJgNxwzVBuhDPUnqfnXtX/OwqNEFGPPrk3w9dx8T8LeDIovgdyFLLPhOdAAuEUOE8aTtw==
X-Received: by 2002:a17:902:f60a:b0:234:f4da:7eeb with SMTP id d9443c01a7336-249448709abmr175164745ad.7.1756856038045;
        Tue, 02 Sep 2025 16:33:58 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490374412bsm142070755ad.51.2025.09.02.16.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:33:57 -0700 (PDT)
Date: Tue, 2 Sep 2025 19:33:55 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vineet Gupta <vgupta@kernel.org>, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] arc: Fix __fls() const-foldability via
 __builtin_clzl()
Message-ID: <aLd-40v-epEd1mi5@yury>
References: <20250831022352.it.055-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250831022352.it.055-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_163359_533704_A2C12F7E 
X-CRM114-Status: GOOD (  17.52  )
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

On Sat, Aug 30, 2025 at 07:23:53PM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> For arc architecture with CONFIG_ISA_ARCV2=y, the __fls() function
> uses __builtin_arc_fls() which lacks GCC's const attribute, preventing
> compile-time constant folding, and KUnit testing of ffs/fls fails on
> arc[3]. A patch[2] to GCC to solve this has been sent.
> 
> Add a fix for this by handling compile-time constants with the standard
> __builtin_clzl() builtin (which has const attribute) while preserving
> the optimized arc-specific builtin for runtime cases. This has the added
> benefit of skipping runtime calculation of compile-time constant values.
> Even with the GCC bug fixed (which is about "attribute const") this is a
> good change to avoid needless runtime costs, and should be done
> regardless of the state of GCC's bug.
> 
> Build tested ARCH=arc allyesconfig with GCC arc-linux 15.2.0.
> 
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508031025.doWxtzzc-lkp@intel.com/ [3]
> Signed-off-by: Kees Cook <kees@kernel.org>

Applied in bitmap-for-next, thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
